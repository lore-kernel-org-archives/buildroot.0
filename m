From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 25 Jun 2017 13:00:04 +0200
Subject: [Buildroot] [PATCH] systemd: allow to build with uClibc toolchains
Message-ID: <20170625110003.GA8387@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both patches where applied upstream.
We need to disable any systemd parts using either IDN or NSS.
(IDN in getaddrinfo()/getnaminfo())

Tested in qemu-system-arm using defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
All required patches for systemd are included in uClibc-ng 1.0.25.
So no need to rebuild the toolchains.
There might be open issues with some of the systemd parts and I am
willing to fix any uClibc issues when reported back.
---
 .../0004-Make-IDN-support-conditional.patch        | 71 ++++++++++++++++++++++
 ...0005-make-nss-systemd-support-conditional.patch | 59 ++++++++++++++++++
 package/systemd/Config.in                          |  2 +
 package/systemd/systemd.mk                         |  9 +++
 system/Config.in                                   |  6 +-
 5 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 package/systemd/0004-Make-IDN-support-conditional.patch
 create mode 100644 package/systemd/0005-make-nss-systemd-support-conditional.patch

diff --git a/package/systemd/0004-Make-IDN-support-conditional.patch b/package/systemd/0004-Make-IDN-support-conditional.patch
new file mode 100644
index 0000000..29afe9c
--- /dev/null
+++ b/package/systemd/0004-Make-IDN-support-conditional.patch
@@ -0,0 +1,71 @@
+From 6326a143263fc460bbda871d6e74b1d7d2841ea1 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 15 Jun 2017 17:44:59 +0200
+Subject: [PATCH] Make IDN support conditional
+
+[zj: rename HAVE_IDN to ENABLE_IDN]
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ configure.ac            | 10 ++++++++++
+ src/basic/socket-util.c |  9 +++++++--
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a47492d..3e7af76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1050,6 +1050,15 @@ fi
+ AM_CONDITIONAL(HAVE_LIBIDN, [test "$have_libidn" = "yes"])
+ 
+ # ------------------------------------------------------------------------------
++have_idn=no
++AC_ARG_ENABLE(idn, AS_HELP_STRING([--disable-idn], [disable IDN when printing host names]))
++if test "x$enable_idn" != "xno"; then
++        have_idn=yes
++        AC_DEFINE(ENABLE_IDN, [1], [IDN is enabled])
++fi
++AM_CONDITIONAL(ENABLE_IDN, [test "$have_idn" = "yes"])
++
++# ------------------------------------------------------------------------------
+ have_libiptc=no
+ AC_ARG_ENABLE(libiptc, AS_HELP_STRING([--disable-libiptc], [disable optional LIBIPTC support]))
+ if test "x$enable_libiptc" != "xno"; then
+@@ -1742,6 +1751,7 @@ AC_MSG_RESULT([
+         libcurl:                           ${have_libcurl}
+         libidn2:                           ${have_libidn2}
+         libidn:                            ${have_libidn}
++        IDN:                               ${have_idn}
+         libiptc:                           ${have_libiptc}
+         ELFUTILS:                          ${have_elfutils}
+         binfmt:                            ${have_binfmt}
+diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
+index e5847dc..49642c2 100644
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -48,6 +48,12 @@
+ #include "utf8.h"
+ #include "util.h"
+ 
++#ifdef ENABLE_IDN
++#  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
++#else
++#  define IDN_FLAGS 0
++#endif
++
+ int socket_address_parse(SocketAddress *a, const char *s) {
+         char *e, *n;
+         unsigned u;
+@@ -723,8 +729,7 @@ int socknameinfo_pretty(union sockaddr_union *sa, socklen_t salen, char **_ret)
+ 
+         assert(_ret);
+ 
+-        r = getnameinfo(&sa->sa, salen, host, sizeof(host), NULL, 0,
+-                        NI_IDN|NI_IDN_USE_STD3_ASCII_RULES);
++        r = getnameinfo(&sa->sa, salen, host, sizeof(host), NULL, 0, IDN_FLAGS);
+         if (r != 0) {
+                 int saved_errno = errno;
+ 
+-- 
+2.1.4
+
diff --git a/package/systemd/0005-make-nss-systemd-support-conditional.patch b/package/systemd/0005-make-nss-systemd-support-conditional.patch
new file mode 100644
index 0000000..b666b83
--- /dev/null
+++ b/package/systemd/0005-make-nss-systemd-support-conditional.patch
@@ -0,0 +1,59 @@
+From e7e11bbf340f031223b56442b3aa4f4220fed315 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx-github@users.noreply.github.com>
+Date: Sat, 24 Jun 2017 19:30:26 +0200
+Subject: [PATCH] make nss-systemd support conditional (#6155)
+
+This allows the nss-systemd module to be disabled on minimal installations.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+[ Stripped down patch only touching autotool infrastructure ]
+---
+diff --git a/Makefile.am b/Makefile.am
+index 07b425e..4838df6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5280,6 +5280,7 @@ manual_tests += \
+ 	test-nss
+ 
+ # ------------------------------------------------------------------------------
++if ENABLE_NSS_SYSTEMD
+ libnss_systemd_la_SOURCES = \
+ 	src/nss-systemd/nss-systemd.sym \
+ 	src/nss-systemd/nss-systemd.c
+@@ -5299,6 +5300,7 @@ libnss_systemd_la_LIBADD = \
+ 
+ rootlib_LTLIBRARIES += \
+ 	libnss_systemd.la
++endif
+ 
+ # ------------------------------------------------------------------------------
+ if HAVE_MYHOSTNAME
+diff --git a/configure.ac b/configure.ac
+index 90e79d7..379f617 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1059,6 +1059,15 @@ fi
+ AM_CONDITIONAL(ENABLE_IDN, [test "$have_idn" = "yes"])
+ 
+ # ------------------------------------------------------------------------------
++have_nss_systemd=no
++AC_ARG_ENABLE(nss-systemd, AS_HELP_STRING([--disable-nss-systemd], [disable nss-systemd support]))
++if test "x$enable_nss_systemd" != "xno"; then
++        have_nss_systemd=yes
++        AC_DEFINE(ENABLE_NSS_SYSTEMD, [1], [nss-systemd is enabled])
++fi
++AM_CONDITIONAL(ENABLE_NSS_SYSTEMD, [test "$have_nss_systemd" = "yes"])
++
++# ------------------------------------------------------------------------------
+ have_libiptc=no
+ AC_ARG_ENABLE(libiptc, AS_HELP_STRING([--disable-libiptc], [disable optional LIBIPTC support]))
+ if test "x$enable_libiptc" != "xno"; then
+@@ -1801,6 +1810,7 @@ AC_MSG_RESULT([
+         dbus:                              ${have_dbus}
+         glib:                              ${have_glib}
+         nss-myhostname:                    ${have_myhostname}
++        nss-systemd:                       ${have_nss_systemd}
+         hwdb:                              ${enable_hwdb}
+         tpm:                               ${have_tpm}
+         Python:                            ${have_python}
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 478cc10..e1b66f9 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -188,6 +188,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	default y
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
@@ -243,6 +244,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	default y
 	help
 	  systemd-resolved is a system service that provides network
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 153d615..e8731b6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -43,6 +43,15 @@ SYSTEMD_CONF_OPTS += \
 	--with-default-dnssec=no \
 	--without-python
 
+# disable unsupported features using NSS or IDN
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+SYSTEMD_CONF_OPTS += \
+	--disable-resolved \
+	--disable-myhostname \
+	--disable-idn \
+	--disable-nss-systemd
+endif
+
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
 
 # Override paths to a few utilities needed at runtime, to
diff --git a/system/Config.in b/system/Config.in
index b47ae43..dc99b51 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -118,7 +118,7 @@ config BR2_INIT_SYSV
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SSP
@@ -129,8 +129,8 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain, headers >= 3.10"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
+comment "systemd needs a glibc or uClibc toolchain, headers >= 3.10"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC \
 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
 config BR2_INIT_NONE
-- 
2.1.4
