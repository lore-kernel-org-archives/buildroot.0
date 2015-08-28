From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 10:59:55 +0200
Subject: [Buildroot] [git commit branch/next] libpam-radius-auth: new package
Message-ID: <20150828090015.7069781F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90251cda02acbcda49ba5c267d045e6d09bff066
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - make libpam-radius-auth depend on linux-pam (since it's a
    linux-pam plugin, it needs some header files from linux-pam) by
    adding a "if BR2_PACKAGE_LINUX_PAM...endif" block in
    package/Config.in. This way, we will be grouping all the Linux PAM
    plugins together.
  - Fix the indententation in the Config.in file.
  - Use a better Config.in help text, copy/pasted from the website.
  - Use a tarball instead of github. This allows to remove
    AUTORECONF=YES.
  - Add linux-pam as a dependency.
  - Use $(TARGET_CONFIGURE_OPTS) instead of passing just CC/LD, but
    pass it in the environment rather than as options so that the
    CFLAGS/LDFLAGS added by the package Makefile are still taken into
    account.
  - Use mkdir -p + cp -dpfr instead of $(INSTALL) -D since we are
    copying multiple files.
  - Add a hash file.]

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    4 +++
 package/libpam-radius-auth/Config.in               |    9 ++++++
 package/libpam-radius-auth/libpam-radius-auth.hash |    2 +
 package/libpam-radius-auth/libpam-radius-auth.mk   |   28 ++++++++++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 729df7a..b92dc05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,10 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
+if BR2_PACKAGE_LINUX_PAM
+comment "linux-pam plugins"
+	source "package/libpam-radius-auth/Config.in"
+endif
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
diff --git a/package/libpam-radius-auth/Config.in b/package/libpam-radius-auth/Config.in
new file mode 100644
index 0000000..a0dec14
--- /dev/null
+++ b/package/libpam-radius-auth/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBPAM_RADIUS_AUTH
+	bool "libpam-radius-auth"
+	help
+	  This is the PAM to RADIUS authentication module. It allows
+	  any PAM-capable machine to become a RADIUS client for
+	  authentication and accounting requests. You will need a
+	  RADIUS server to perform the actual authentication.
+
+	  http://freeradius.org/pam_radius_auth/
diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
new file mode 100644
index 0000000..ffd7404
--- /dev/null
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking PGP signature
+sha256	  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305	pam_radius-1.4.0.tar.gz
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
new file mode 100644
index 0000000..42acffd
--- /dev/null
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libpam-radius-auth
+#
+################################################################################
+
+LIBPAM_RADIUS_AUTH_VERSION = 1.4.0
+LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius/
+LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.gz
+LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
+LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
+LIBPAM_RADIUS_AUTH_LICENSE = GPLv2+
+LIBPAM_RADIUS_AUTH_LICENSE_FILES = LICENSE
+# While autoconf is used for configuration, the Makefile is
+# hand-written, so we need to pass CC, LD, CFLAGS at build time.
+LIBPAM_RADIUS_AUTH_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+
+define LIBPAM_RADIUS_AUTH_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/lib/security/
+	cp -dpfr $(@D)/pam_radius_auth.so* $(STAGING_DIR)/lib/security/
+endef
+
+define LIBPAM_RADIUS_AUTH_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/security/
+	cp -dpfr $(@D)/pam_radius_auth.so* $(TARGET_DIR)/lib/security/
+endef
+
+$(eval $(autotools-package))
