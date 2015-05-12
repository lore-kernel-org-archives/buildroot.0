From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Tue, 12 May 2015 10:03:38 +0200
Subject: [Buildroot] [PATCH] jack2: allow to choose the mode to operate jackd
Message-ID: <1431417818-12630-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jack2 allows to use three modes:
- A legacy jackd service alone.
- A DBUS jackd service alone.
- A mixture between the standalone jackd and the DBUS jackd.

This patch adds the possibility to choose between these three modes,
while the legacy jackd was the only option before.

In addition, the jack_control tool is removed when the DBUS jackd is not
available, as this tool is used to control it.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 package/jack2/Config.in | 40 ++++++++++++++++++++++++++++++++++++++++
 package/jack2/jack2.mk  | 22 +++++++++++++++++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index eeeb8daad8bd..26869a7aac1c 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -20,6 +20,46 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
+if BR2_PACKAGE_JACK2
+
+choice
+	prompt "jack2 mode"
+	default BR2_PACKAGE_JACK2_LEGACY
+	help
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+
+config BR2_PACKAGE_JACK2_LEGACY
+	bool "legacy jack2 only"
+	help
+	  Build and use only jackd.
+
+config BR2_PACKAGE_JACK2_DBUS
+	bool "dbus jack2 only"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  Build on use only jackdbus.
+
+config BR2_PACKAGE_JACK2_CLASSIC
+	bool "legacy jack2 and dbus jack2 mixture"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  Build jackd and jackdbus, and allow to use both of
+	  these tools.
+
+endchoice
+
+endif
+
 comment "jack2 needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73328d3fd408..72f2a23d83c0 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -10,12 +10,24 @@ JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
 
+JACK2_CONF_OPTS = --alsa
+
+ifeq ($(BR2_PACKAGE_JACK2_DBUS),y)
+JACK2_DEPENDENCIES += dbus
+JACK2_CONF_OPTS += --dbus
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2_CLASSIC),y)
+JACK2_DEPENDENCIES += dbus
+JACK2_CONF_OPTS += --dbus --classic
+endif
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
 		$(HOST_DIR)/usr/bin/python2 ./waf configure \
 		--prefix=/usr			\
-		--alsa				\
+		$(JACK2_CONF_OPTS)		\
 	)
 endef
 
@@ -33,4 +45,12 @@ define JACK2_INSTALL_STAGING_CMDS
 		install)
 endef
 
+define JACK2_REMOVE_JACK_CONTROL
+	$(RM) -f $(TARGET_DIR)/usr/bin/jack_control
+endef
+
+ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
+JACK2_POST_INSTALL_TARGET_HOOKS += JACK2_REMOVE_JACK_CONTROL
+endif
+
 $(eval $(generic-package))
-- 
2.4.0
