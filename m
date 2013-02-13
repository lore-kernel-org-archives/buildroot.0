From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Wed, 13 Feb 2013 12:03:41 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
Message-ID: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
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
v3: improved according to community suggestions:
- added Signed-off-by and the reason to the cross-compilation patch;
- specified toolchain requirements in Config.in.

The package can be built without WCHAR but this is supported
only by its SCons and CMake build systems (for development). Autotools
based build system (for releases) does not support this. IPV6 and
thread support requirements are mandatory.

v2: improved according to community suggestions:
- legal information supplied;
- OPENPGM_SUBDIR is used instead of a post extract hook;
- more recent release of the package is used;
- cross-compilation fix uses cached values instead of hard-coded ones.

The last thing has been implemented as recommended in Autoconf manual
(http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Runtime.html#Runtime)
for cross-compilation-friendly runtime tests. Direct caching of
pgm_unaligned_pointers variable produced a warning during autoreconfigure
that said that only variables containing _cv_ were cached, and
ac_cv_lbl_unaligned_fail was already used in Buildroot, so I based the
test on that one and set pgm_unaligned_pointers later from its result.
---
 package/Config.in                           |  1 +
 package/openpgm/Config.in                   | 16 ++++++++++++
 package/openpgm/openpgm-cross-compile.patch | 38 +++++++++++++++++++++++++++++
 package/openpgm/openpgm.mk                  | 18 ++++++++++++++
 4 files changed, 73 insertions(+)
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
index 0000000..1b385a3
--- /dev/null
+++ b/package/openpgm/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OPENPGM
+	bool "openpgm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_WCHAR
+	help
+	  OpenPGM is an open source implementation of the Pragmatic General
+	  Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
+	  PGM is a reliable and scalable multicast protocol that enables
+	  receivers to detect loss, request retransmission of lost data, or
+	  notify an application of unrecoverable loss.
+
+	  http://code.google.com/p/openpgm/
+
+comment "openpgm needs a toolchain with WCHAR, threads and IPv6 support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
diff --git a/package/openpgm/openpgm-cross-compile.patch b/package/openpgm/openpgm-cross-compile.patch
new file mode 100644
index 0000000..07a2449
--- /dev/null
+++ b/package/openpgm/openpgm-cross-compile.patch
@@ -0,0 +1,38 @@
+configure.ac: cross-compilation fix
+
+This patch enables to configure the package when cross-compiling in a way
+recommended by Autoconf manual (see manual for version 2.69, Section 6.6
+Checking Runtime Behavior).
+
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+
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
