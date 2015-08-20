From: giovanni.zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Date: Thu, 20 Aug 2015 13:16:26 -0300
Subject: [Buildroot] [PATCH v2] libpam-tacplus: new package
Message-ID: <1440087386-10139-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
---
 Changes v1 -> v2:
   - Using Library instead of Lib (suggested by Ryan Barnett)
   - Improved package description (suggested by Thomas Petazzoni)
   - Added project site to description (suggested by Ryan Barnett)
   - Changed download method (suggested by Ryan Barnett)
   - Added dependency of linux-pam
   - Using LIBPAM_TACPLUS_CONF_ENV instead of LIBPAM_TACPLUS_CONF_OPTS (suggested by Thomas Petazzoni)
---
 package/Config.in                        |  1 +
 package/libpam-tacplus/Config.in         | 10 ++++++++++
 package/libpam-tacplus/libpam-tacplus.mk | 18 ++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/libpam-tacplus/Config.in
 create mode 100644 package/libpam-tacplus/libpam-tacplus.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..9e92023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libpam-tacplus/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
new file mode 100644
index 0000000..1dc40ac
--- /dev/null
+++ b/package/libpam-tacplus/Config.in
@@ -0,0 +1,10 @@
+ config BR2_PACKAGE_LIBPAM_TACPLUS
+        bool "libpam-tacplus"
+        help
+          Library needed to use pam-tacplus.
+          TACACS+ protocol client library and PAM module in C. This PAM
+          module support authentication, authorization (account
+          management) and accounting (session management)performed
+          using TACACS+ protocol designed by Cisco.
+
+          http://sourceforge.net/projects/tacplus/
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
new file mode 100644
index 0000000..11f9e94
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libpam-tacplus
+#
+################################################################################
+
+LIBPAM_TACPLUS_VERSION = 1.3.9
+LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,$(LIBPAM_TACPLUS_VERSION))
+LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
+# Fetching from github, we need to generate the configure script
+LIBPAM_TACPLUS_INSTALL_STAGING = YES
+LIBPAM_TACPLUS_AUTORECONF = YES
+LIBPAM_TACPLUS_CONF_ENV = $(TARGET_CONFIGURE_OPTS)
+LIBPAM_TACPLUS_AUTORECONF_OPTS = -I m4
+LIBPAM_TACPLUS_LICENSE = GPLv2+
+LIBPAM_TACPLUS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
