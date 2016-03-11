From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:00:34 +0100
Subject: [Buildroot] [PATCH 1/2 v2] jack2: allow to choose the mode to
	operate jackd
In-Reply-To: <cover.1457719085.git.yann.morin.1998@free.fr>
References: <cover.1457719085.git.yann.morin.1998@free.fr>
Message-ID: <d7d30dc9c5607b4a92327f9025734021c4ea00e3.1457719085.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Antoine T?nart <antoine.tenart@free-electrons.com>

jack2 allows to use three modes:
- A legacy jackd service alone.
- A DBUS jackd service alone.
- A mixture between the standalone jackd and the DBUS jackd.

This patch adds the possibility to choose between these three modes,
while the legacy jackd was the only option before.

In addition, the jack_control tool is removed when the DBUS jackd is not
available, as this tool is used to control it.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
[yann.morin.1998 at free.fr:
  - rebase
  - only use two booleans, not a choice
  - python is a runtime-only dependency
  - use python3 if enabled, fallback to python
  - simplify post-install condition
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - rebased; see commit log  (Yann)
---
 package/jack2/Config.in | 26 ++++++++++++++++++++++++++
 package/jack2/jack2.mk  | 15 +++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 94cb7e0..f144645 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_JACK2
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	# Ensure we get at least one:
+	select BR2_PACKAGE_JACK2_LEGACY if !BR2_PACKAGE_JACK2_DBUS
 	help
 	  JACK Audio Connection Kit (server and example clients).
 
@@ -21,6 +23,30 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
+if BR2_PACKAGE_JACK2
+
+config BR2_PACKAGE_JACK2_LEGACY
+	bool "classic jack2"
+	help
+	  Build and use jackd.
+
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+
+config BR2_PACKAGE_JACK2_DBUS
+	bool "dbus jack2"
+	depends on BR2_USE_WCHAR # dbus-python, python
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Build on use jackdbus.
+
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+
+endif
+
 comment "jack2 needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 81508da..6bea373 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -18,12 +18,27 @@ ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK2_DEPENDENCIES += readline
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
+JACK2_CONF_OPTS += --classic
+else
+define JACK2_REMOVE_JACK_CONTROL
+	$(RM) -f $(TARGET_DIR)/usr/bin/jack_control
+endef
+JACK2_POST_INSTALL_TARGET_HOOKS += JACK2_REMOVE_JACK_CONTROL
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2_DBUS),y)
+JACK2_DEPENDENCIES += dbus
+JACK2_CONF_OPTS += --dbus
+endif
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
 		$(HOST_DIR)/usr/bin/python2 ./waf configure \
 		--prefix=/usr			\
 		--alsa				\
+		$(JACK2_CONF_OPTS)		\
 	)
 endef
 
-- 
1.9.1
