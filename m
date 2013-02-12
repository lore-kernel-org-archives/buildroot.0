From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 12 Feb 2013 12:47:31 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <1360666051-16475-1-git-send-email-alexander.lukichev@gmail.com>
References: <1360666051-16475-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <1360666051-16475-2-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexander Lukichev <alexander.lukichev@espotel.com>

OpenPGM is an open source implementation of the Pragmatic General
Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
It is required for PGM/EPGM support in ZeroMQ library.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 package/Config.in                           |  1 +
 package/openpgm/Config.in                   | 10 ++++++++++
 package/openpgm/openpgm-cross-compile.patch | 30 +++++++++++++++++++++++++++++
 package/openpgm/openpgm.mk                  | 18 +++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/openpgm/Config.in
 create mode 100644 package/openpgm/openpgm-cross-compile.patch
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
diff --git a/package/openpgm/openpgm-cross-compile.patch b/package/openpgm/openpgm-cross-compile.patch
new file mode 100644
index 0000000..67fc9cf
--- /dev/null
+++ b/package/openpgm/openpgm-cross-compile.patch
@@ -0,0 +1,30 @@
+--- a/openpgm/pgm/configure.ac	2011-09-27 20:59:08.000000000 +0300
++++ b/openpgm/pgm/configure.ac	2013-02-12 10:33:53.000000000 +0200
+@@ -272,14 +272,19 @@ uint32_t add32_with_carry (uint32_t a, u
+ 	;;
+ esac
+ # ticket spinlock friendly: unaligned pointers & atomic ops (excl. Sun Pro)
+-AC_MSG_CHECKING([for unaligned pointers])
+-AC_RUN_IFELSE(
+-	[AC_LANG_PROGRAM([[char* nezumi = "mouse";]],
+-		[[short x = *(short*)(nezumi + 2)]])],
+-	[AC_MSG_RESULT([yes])
+-		pgm_unaligned_pointers=yes],
+-	[AC_MSG_RESULT([no])
+-		pgm_unaligned_pointers=no])
++AC_CACHE_CHECK([if unaligned access fails], [ac_cv_lbl_unaligned_fail],
++	[AC_RUN_IFELSE(
++		[AC_LANG_PROGRAM([[char* nezumi = "mouse";]],
++			[[short x = *(short*)(nezumi + 2)]])],
++		[ac_cv_lbl_unaligned_fail=no],
++		[ac_cv_lbl_unaligned_fail=yes],
++		[ac_cv_lbl_unaligned_fail=yes])
++	])
++if test "$ac_cv_lbl_unaligned_fail" = yes; then
++	pgm_unaligned_pointers=no
++else
++	pgm_unaligned_pointers=yes
++fi
+ AC_MSG_CHECKING([for intrinsic atomic ops])
+ # AC_PREPROC_IFELSE not always portable
+ AC_COMPILE_IFELSE(
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
new file mode 100644
index 0000000..34c5965
--- /dev/null
+++ b/package/openpgm/openpgm.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# openpgm
+#
+#############################################################
+
+OPENPGM_VERSION = 5.2.121~dfsg
+OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
+OPENPGM_SITE = http://openpgm.googlecode.com/files/
+OPENPGM_LICENSE = LGPLv2.1+
+OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
+OPENPGM_INSTALL_STAGING = YES
+OPENPGM_AUTORECONF = YES
+OPENPGM_SUBDIR = openpgm/pgm/
+OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
+                   ac_cv_file__dev_hpet=no
+
+$(eval $(autotools-package))
-- 
1.8.0.1
