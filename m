From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 11 Feb 2013 14:30:26 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
Message-ID: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexander Lukichev <alexander.lukichev@espotel.com>

OpenPGM is an open source implementation of the Pragmatic General
Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
It may be required for PGM/EPGM support in ZeroMQ library. This
adds version 5.1.118-1~dfsg of the package, required by
zeromq-2.2.0. It also adds a patch for cross-compilation of
more recent 5.2.121~dfsg version.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 package/Config.in                                  |  1 +
 package/openpgm/Config.in                          | 10 ++++++++++
 .../openpgm-5.1.118-1~dfsg-cross-compile.patch     | 13 ++++++++++++
 .../openpgm-5.2.121~dfsg-cross-compile.patch       | 13 ++++++++++++
 package/openpgm/openpgm.mk                         | 23 ++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/openpgm/Config.in
 create mode 100644 package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch
 create mode 100644 package/openpgm/openpgm-5.2.121~dfsg-cross-compile.patch
 create mode 100644 package/openpgm/openpgm.mk

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..bfaf944 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -524,6 +524,7 @@ source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
 source "package/nss-mdns/Config.in"
+source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
new file mode 100644
index 0000000..e9e5ee6
--- /dev/null
+++ b/package/openpgm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_OPENPGM
+	bool "OpenPGM"
+	help
+	  OpenPGM is an open source implementation of the Pragmatic General
+	  Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
+	  PGM is a reliable and scalable multicast protocol that enables
+	  receivers to detect loss, request retransmission of lost data, or
+	  notify an application of unrecoverable loss.
+
+	  http://code.google.com/p/openpgm/
diff --git a/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch b/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch
new file mode 100644
index 0000000..2e16c0d
--- /dev/null
+++ b/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch
@@ -0,0 +1,13 @@
+diff -uNrp a/configure.ac b/configure.ac
+--- a/configure.ac	2012-11-07 14:19:08.835373674 +0200
++++ b/configure.ac	2012-11-07 14:19:25.481620103 +0200
+@@ -284,7 +284,8 @@ AC_RUN_IFELSE(
+ 	[AC_MSG_RESULT([yes])
+ 		pgm_unaligned_pointers=yes],
+ 	[AC_MSG_RESULT([no])
+-		pgm_unaligned_pointers=no])
++		pgm_unaligned_pointers=no],
++	pgm_unaligned_pointers=yes)
+ AC_MSG_CHECKING([for intrinsic atomic ops])
+ # AC_PREPROC_IFELSE not always portable
+ AC_COMPILE_IFELSE(
diff --git a/package/openpgm/openpgm-5.2.121~dfsg-cross-compile.patch b/package/openpgm/openpgm-5.2.121~dfsg-cross-compile.patch
new file mode 100644
index 0000000..2e16c0d
--- /dev/null
+++ b/package/openpgm/openpgm-5.2.121~dfsg-cross-compile.patch
@@ -0,0 +1,13 @@
+diff -uNrp a/configure.ac b/configure.ac
+--- a/configure.ac	2012-11-07 14:19:08.835373674 +0200
++++ b/configure.ac	2012-11-07 14:19:25.481620103 +0200
+@@ -284,7 +284,8 @@ AC_RUN_IFELSE(
+ 	[AC_MSG_RESULT([yes])
+ 		pgm_unaligned_pointers=yes],
+ 	[AC_MSG_RESULT([no])
+-		pgm_unaligned_pointers=no])
++		pgm_unaligned_pointers=no],
++	pgm_unaligned_pointers=yes)
+ AC_MSG_CHECKING([for intrinsic atomic ops])
+ # AC_PREPROC_IFELSE not always portable
+ AC_COMPILE_IFELSE(
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
new file mode 100644
index 0000000..ed9c041
--- /dev/null
+++ b/package/openpgm/openpgm.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# openpgm
+#
+#############################################################
+
+OPENPGM_VERSION = 5.1.118-1~dfsg
+OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
+OPENPGM_SITE = http://openpgm.googlecode.com/files/
+OPENPGM_INSTALL_STAGING = YES
+OPENPGM_DEPENDENCIES = 
+OPENPGM_AUTORECONF = YES
+OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
+                   ac_cv_file__dev_hpet=no
+
+define OPENPGM_EXTRACT_FIX
+	mv $(@D)/openpgm/pgm/* $(@D)
+	rm -rf $(@D)/openpgm/pgm/
+endef
+
+OPENPGM_POST_EXTRACT_HOOKS += OPENPGM_EXTRACT_FIX
+
+$(eval $(autotools-package))
-- 
1.8.0.1
