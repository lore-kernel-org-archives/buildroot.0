From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 17:04:22 +0200
Subject: [Buildroot] [git commit] whois: new package
Message-ID: <20140625151003.620699C909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2001bf94bf1c23b0b7e5851cf4488971e1cd7b38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: tweak comment, pass _MAKE_OPT to install as suggested by Arnout]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/whois/Config.in |    7 +++++++
 package/whois/whois.mk  |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c46c0ec..dc3d6b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1046,6 +1046,7 @@ endif
 	source "package/vtun/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/wget/Config.in"
+	source "package/whois/Config.in"
 endif
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
diff --git a/package/whois/Config.in b/package/whois/Config.in
new file mode 100644
index 0000000..40b6590
--- /dev/null
+++ b/package/whois/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WHOIS
+	bool "whois"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  Improved whois client.
+
+	  http://www.linux.it/~md/software/
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
new file mode 100644
index 0000000..91450f6
--- /dev/null
+++ b/package/whois/whois.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# whois
+#
+################################################################################
+
+WHOIS_VERSION = 5.1.3
+WHOIS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/w/whois
+WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
+# take precedence over busybox implementation
+WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
+WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+WHOIS_LICENSE = GPLv2+
+WHOIS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+WHOIS_DEPENDENCIES += gettext
+WHOIS_MAKE_OPT += LIBS="-lintl"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+WHOIS_DEPENDENCIES += libiconv
+WHOIS_MAKE_ENV += HAVE_ICONV=1
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+WHOIS_DEPENDENCIES += libidn
+WHOIS_MAKE_ENV += HAVE_LIBIDN=1
+endif
+
+define WHOIS_BUILD_CMDS
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) -C $(@D)
+endef
+
+define WHOIS_INSTALL_TARGET_CMDS
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) \
+		BASEDIR="$(TARGET_DIR)" install -C $(@D)
+endef
+
+$(eval $(generic-package))
