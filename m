From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 22:15:25 +0200
Subject: [Buildroot] [git commit] package: add libnspr
Message-ID: <20110707201646.DF90B8A3F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6cfba49169f72d49d4ddfe27a1ed2f90eb3bff6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a package for the Netscape Portable Runtime library.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libnspr/Config.in  |   13 +++++++++++++
 package/libnspr/libnspr.mk |   17 +++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/libnspr/Config.in
 create mode 100644 package/libnspr/libnspr.mk

diff --git a/package/Config.in b/package/Config.in
index b06c669..09aa76a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
+source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
new file mode 100644
index 0000000..53086f0
--- /dev/null
+++ b/package/libnspr/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBNSPR
+	bool "libnspr"
+	depends on BR2_LARGEFILE
+	help
+	  NSPR is the Netscape Portable Runtime library which provides
+	  a platform-neutral API for system level and libc like
+	  functions. The library is used by the Mozilla project as well
+	  as others.
+
+	  http://www.mozilla.org/projects/nspr/
+
+comment "libnspr requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
new file mode 100644
index 0000000..9ba7431
--- /dev/null
+++ b/package/libnspr/libnspr.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libnspr
+#
+#############################################################
+LIBNSPR_VERSION = 4.8.7
+LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
+LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
+LIBNSPR_SUBDIR = mozilla/nsprpub
+LIBNSPR_INSTALL_STAGING = YES
+# Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
+LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
+		   HOST_LDFLAGS="-lc"
+# NSPR mixes up --build and --host
+LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
+
+$(eval $(call AUTOTARGETS,package,libnspr))
-- 
1.7.3.4
