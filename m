From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Apr 2021 10:19:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/nut: bump version
Message-ID: <20210403081953.695534-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The last release is five years old. To support newer hardware we bump
the package to latest git master branch. For upstream discussion see
github issue 819.

Removed patches, they were all applied upstream.

Added NUT_PRE_CONFIGURE_HOOKS to fix autoreconf:

configure.ac:1994: error: required file 'scripts/augeas/nutupsconf.aug.in' not found
configure.ac:1994: error: required file 'scripts/devd/nut-usb.conf.in' not found
configure.ac:1994: error: required file 'scripts/udev/nut-usbups.rules.in' not found

because upstream autogen.sh creates additional files:
https://github.com/networkupstools/nut/blob/master/autogen.sh

Configure is not cross-compile friendly:
https://github.com/networkupstools/nut/blob/master/m4/ax_c_pragmas.m4#L574
Add ax_cv__printf_string_null=yes to fix cross build.

Removed configure option --without-hal due to upstream removal of hal
files:
https://github.com/networkupstools/nut/commit/5860c09e85278e597f85d26b3a23be8c80c199e8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - to make use of NUT_AUTORECONF added pre-configure hook (Yann)
      but without the need for host-python
    - removed configure option --without-hal

 ...ze-path-to-gdlib-config-and-net-snmp.patch | 153 ------------------
 .../0002-client-ups-add-missing-include.patch |  29 ----
 ...Add-compatibility-with-openssl-1.1.0.patch |  76 ---------
 ...m4-try-to-find-gd-through-pkg-config.patch | 120 --------------
 package/nut/nut.hash                          |   3 +-
 package/nut/nut.mk                            |  23 ++-
 6 files changed, 17 insertions(+), 387 deletions(-)
 delete mode 100644 package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
 delete mode 100644 package/nut/0002-client-ups-add-missing-include.patch
 delete mode 100644 package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
 delete mode 100644 package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch

diff --git a/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch b/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
deleted file mode 100644
index 308dbb1aa2..0000000000
--- a/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 086b5fa8fe4ba74404e92b5f838263dfcf9f173d Mon Sep 17 00:00:00 2001
-From: Jim Klimov <jim@jimklimov.com>
-Date: Thu, 7 Apr 2016 03:56:51 +0200
-Subject: [PATCH] Allow to customize path to gdlib-config and net-snmp-config
- programs
-
-[yann.morin.1998 at free.fr: backport]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Backported from upstream commit 086b5fa8fe4ba74404e92b5f838263dfcf9f173d
----
- docs/configure.txt         | 14 ++++++++++++++
- m4/nut_check_libgd.m4      | 29 +++++++++++++++++++++++------
- m4/nut_check_libnetsnmp.m4 | 25 +++++++++++++++++++++----
- 3 files changed, 58 insertions(+), 10 deletions(-)
-
-diff --git a/docs/configure.txt b/docs/configure.txt
-index aff82c1..b3b542a 100644
---- a/docs/configure.txt
-+++ b/docs/configure.txt
-@@ -23,6 +23,13 @@ Note that you need to install the libusb development package or files.
- Build and install the SNMP drivers (default: auto-detect)
- Note that you need to install libsnmp development package or files.
- 
-+	--with-net-snmp-config
-+
-+In addition to the `--with-snmp` option above, this one allows to provide
-+a custom program name (in `PATH`) or complete pathname to `net-snmp-config`.
-+This may be needed on build systems which support multiple architectures,
-+or in cases where your distribution names this program differently.
-+
- 	--with-neon
- 
- Build and install the XML drivers (default: auto-detect)
-@@ -335,6 +342,13 @@ NOTE: the --with-gd switches are not necessary if you have gd 2.0.8
- or higher installed properly.  The gdlib-config script will be 
- detected and used by default in that situation.
- 
-+	--with-gdlib-config
-+
-+This option allows to provide a custom program name (in `PATH`) or
-+a complete pathname to `gdlib-config`. This may be needed on build
-+systems which support multiple architectures, or in cases where your
-+distribution names this program differently.
-+
- 	--with-ssl-includes, --with-usb-includes, --with-snmp-includes,
- 	--with-neon-includes, --with-libltdl-includes,
- 	--with-powerman-includes="-I/foo/bar"
-diff --git a/m4/nut_check_libgd.m4 b/m4/nut_check_libgd.m4
-index 01cc882..73f4da7 100644
---- a/m4/nut_check_libgd.m4
-+++ b/m4/nut_check_libgd.m4
-@@ -19,8 +19,25 @@ if test -z "${nut_have_libgd_seen}"; then
- 	LDFLAGS="-L/usr/X11R6/lib"
- 	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
- 
--	AC_MSG_CHECKING(for gd version via gdlib-config)
--	GD_VERSION=`gdlib-config --version 2>/dev/null`
-+	dnl By default seek in PATH
-+	GDLIB_CONFIG=gdlib-config
-+	AC_ARG_WITH(gdlib-config,
-+		AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
-+			[path to program that reports GDLIB configuration]),
-+	[
-+		case "${withval}" in
-+		"") ;;
-+		yes|no)
-+			AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
-+			;;
-+		*)
-+			GDLIB_CONFIG="${withval}"
-+			;;
-+		esac
-+	])
-+
-+	AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
-+	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
- 	if test "$?" != "0" -o -z "${GD_VERSION}"; then
- 		GD_VERSION="none"
- 	fi
-@@ -30,13 +47,13 @@ if test -z "${nut_have_libgd_seen}"; then
- 	none)
- 		;;
- 	2.0.5 | 2.0.6 | 2.0.7)
--		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use gdlib-config script]])
-+		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
- 		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
- 		;;
- 	*)
--		CFLAGS="`gdlib-config --includes 2>/dev/null`"
--		LDFLAGS="`gdlib-config --ldflags 2>/dev/null`"
--		LIBS="`gdlib-config --libs 2>/dev/null`"
-+		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
-+		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
-+		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
- 		;;
- 	esac
- 
-diff --git a/m4/nut_check_libnetsnmp.m4 b/m4/nut_check_libnetsnmp.m4
-index e1c1426..83b2633 100644
---- a/m4/nut_check_libnetsnmp.m4
-+++ b/m4/nut_check_libnetsnmp.m4
-@@ -13,9 +13,26 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
- 	CFLAGS_ORIG="${CFLAGS}"
- 	LIBS_ORIG="${LIBS}"
- 
-+	dnl By default seek in PATH
-+	NET_SNMP_CONFIG=net-snmp-config
-+	AC_ARG_WITH(net-snmp-config,
-+		AS_HELP_STRING([@<:@--with-net-snmp-config=/path/to/net-snmp-config@:>@],
-+			[path to program that reports Net-SNMP configuration]),
-+	[
-+		case "${withval}" in
-+		"") ;;
-+		yes|no)
-+			AC_MSG_ERROR(invalid option --with(out)-net-snmp-config - see docs/configure.txt)
-+			;;
-+		*)
-+			NET_SNMP_CONFIG="${withval}"
-+			;;
-+		esac
-+	])
-+
- 	dnl See which version of the Net-SNMP library (if any) is installed
--	AC_MSG_CHECKING(for Net-SNMP version via net-snmp-config)
--	SNMP_VERSION=`net-snmp-config --version 2>/dev/null`
-+	AC_MSG_CHECKING(for Net-SNMP version via ${NET_SNMP_CONFIG})
-+	SNMP_VERSION=`${NET_SNMP_CONFIG} --version 2>/dev/null`
- 	if test "$?" != "0" -o -z "${SNMP_VERSION}"; then
- 		SNMP_VERSION="none"
- 	fi
-@@ -33,7 +50,7 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
- 			CFLAGS="${withval}"
- 			;;
- 		esac
--	], [CFLAGS="`net-snmp-config --base-cflags 2>/dev/null`"])
-+	], [CFLAGS="`${NET_SNMP_CONFIG} --base-cflags 2>/dev/null`"])
- 	AC_MSG_RESULT([${CFLAGS}])
- 
- 	AC_MSG_CHECKING(for Net-SNMP libs)
-@@ -48,7 +65,7 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
- 			LIBS="${withval}"
- 			;;
- 		esac
--	], [LIBS="`net-snmp-config --libs 2>/dev/null`"])
-+	], [LIBS="`${NET_SNMP_CONFIG} --libs 2>/dev/null`"])
- 	AC_MSG_RESULT([${LIBS}])
- 
- 	dnl Check if the Net-SNMP library is usable
--- 
-2.7.4
-
diff --git a/package/nut/0002-client-ups-add-missing-include.patch b/package/nut/0002-client-ups-add-missing-include.patch
deleted file mode 100644
index 63fdcdcbb4..0000000000
--- a/package/nut/0002-client-ups-add-missing-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From da0969b26ad4bb839bcb88362c8f41aaf0eb8363 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 11 Oct 2016 12:05:36 +0200
-Subject: [PATCH] client/ups: add missing include
-
-struct timeval is declared in sys/time.h, so we need to #include it.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Backported from upstream commit da0969b26ad4bb839bcb88362c8f41aaf0eb8363
----
- clients/upsclient.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/clients/upsclient.c b/clients/upsclient.c
-index 43c0e79..dfadd0d 100644
---- a/clients/upsclient.c
-+++ b/clients/upsclient.c
-@@ -37,6 +37,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <fcntl.h>
-+#include <sys/time.h>
- 
- #include "upsclient.h"
- #include "common.h"
--- 
-2.7.4
-
diff --git a/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
deleted file mode 100644
index 5a0031acd8..0000000000
--- a/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From fcbf18c92918ce5e81d0aab62a7aed5c2245ea4d Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cote2004-github@yahoo.com>
-Date: Fri, 1 Jun 2018 11:17:28 -0300
-Subject: [PATCH] Add compatibility with openssl 1.1.0
-
-Minor adjustments were needed:
-* Openssl 1.1 libs do not need to be initialized.
-* TLSv*_method became TLS_*_method.
-
-Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
-Upstream: https://github.com/networkupstools/nut/pull/558/
-[added check for libressl]
-Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
----
- clients/upsclient.c        | 5 ++++-
- m4/nut_check_libopenssl.m4 | 2 +-
- server/netssl.c            | 7 +++++--
- 3 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/clients/upsclient.c b/clients/upsclient.c
-index b90587b0..053d60fb 100644
---- a/clients/upsclient.c
-+++ b/clients/upsclient.c
-@@ -316,10 +316,13 @@ int upscli_init(int certverify, const char *certpath,
- 	
- #ifdef WITH_OPENSSLdefined(LIBRESSL_VERSION_NUMBER)
- 	
-+# if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	SSL_library_init();
- 	SSL_load_error_strings();
-+#  define TLS_client_method TLSv1_client_method
-+# endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
- 
--	ssl_method = TLSv1_client_method();
-+	ssl_method = TLS_client_method();
- 
- 	if (!ssl_method) {
- 		return 0;
-diff --git a/m4/nut_check_libopenssl.m4 b/m4/nut_check_libopenssl.m4
-index 1b875077..7eb401cd 100644
---- a/m4/nut_check_libopenssl.m4
-+++ b/m4/nut_check_libopenssl.m4
-@@ -58,7 +58,7 @@ if test -z "${nut_have_libopenssl_seen}"; then
- 
- 	dnl check if openssl is usable
- 	AC_CHECK_HEADERS(openssl/ssl.h, [nut_have_openssl=yes], [nut_have_openssl=no], [AC_INCLUDES_DEFAULT])
--	AC_CHECK_FUNCS(SSL_library_init, [], [nut_have_openssl=no])
-+	AC_CHECK_FUNCS(SSL_CTX_new, [], [nut_have_openssl=no])
- 
- 	if test "${nut_have_openssl}" = "yes"; then
- 		nut_with_ssl="yes"
-diff --git a/server/netssl.c b/server/netssl.c
-index c2f40989..0289e296 100644
---- a/server/netssl.c
-+++ b/server/netssl.c
-@@ -387,12 +387,15 @@ void ssl_init(void)
- 
- #ifdef WITH_OPENSSL
- 
-+# if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	SSL_load_error_strings();
- 	SSL_library_init();
-+#  define TLS_server_method TLSv1_server_method
-+# endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
- 
--	if ((ssl_method = TLSv1_server_method()) == NULL) {
-+	if ((ssl_method = TLS_server_method()) == NULL) {
- 		ssl_debug();
--		fatalx(EXIT_FAILURE, "TLSv1_server_method failed");
-+		fatalx(EXIT_FAILURE, "TLS_server_method failed");
- 	}
- 
- 	if ((ssl_ctx = SSL_CTX_new(ssl_method)) == NULL) {
--- 
-2.16.1
-
diff --git a/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch b/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch
deleted file mode 100644
index 3c4a88b47b..0000000000
--- a/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From cb507c44d26d8ae04a0cc3d1c24e79e3bf33ba23 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 29 Jul 2020 22:51:54 +0200
-Subject: [PATCH] nut_check_libgd.m4: try to find gd through pkg-config
-
-gdlib-config has been dropped from version 2.3.0 with
-https://github.com/libgd/libgd/commit/d62f608c7c4a814c70d4ba777725e3e62d9e2cde
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/networkupstools/nut/commit/cb507c44d26d8ae04a0cc3d1c24e79e3bf33ba23]
----
- m4/nut_check_libgd.m4 | 88 ++++++++++++++++++++++++-------------------
- 1 file changed, 50 insertions(+), 38 deletions(-)
-
-diff --git a/m4/nut_check_libgd.m4 b/m4/nut_check_libgd.m4
-index 73f4da76d..c4e96761c 100644
---- a/m4/nut_check_libgd.m4
-+++ b/m4/nut_check_libgd.m4
-@@ -12,50 +12,62 @@ if test -z "${nut_have_libgd_seen}"; then
- 	LDFLAGS_ORIG="${LDFLAGS}"
- 	LIBS_ORIG="${LIBS}"
- 
--	dnl Initial defaults. These are only used if gdlib-config is
--	dnl unusable and the user fails to pass better values in --with
--	dnl arguments
--	CFLAGS=""
--	LDFLAGS="-L/usr/X11R6/lib"
--	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
-+	AC_MSG_CHECKING(for gd version via pkg-config)
-+	GD_VERSION="`pkg-config --silence-errors --modversion gdlib 2>/dev/null`"
-+	if test "$?" = "0" -a -n "${GD_VERSION}"; then
-+		CFLAGS="`pkg-config --silence-errors --cflags gdlib 2>/dev/null`"
-+		LIBS="`pkg-config --silence-errors --libs gdlib 2>/dev/null`"
-+	else
-+		GD_VERSION="none"
-+	fi
-+	AC_MSG_RESULT(${GD_VERSION} found)
- 
--	dnl By default seek in PATH
--	GDLIB_CONFIG=gdlib-config
--	AC_ARG_WITH(gdlib-config,
--		AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
--			[path to program that reports GDLIB configuration]),
--	[
--		case "${withval}" in
--		"") ;;
--		yes|no)
--			AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
-+	if test "${GD_VERSION}" = "none"; then
-+		dnl Initial defaults. These are only used if gdlib-config is
-+		dnl unusable and the user fails to pass better values in --with
-+		dnl arguments
-+		CFLAGS=""
-+		LDFLAGS="-L/usr/X11R6/lib"
-+		LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
-+
-+		dnl By default seek in PATH
-+		GDLIB_CONFIG=gdlib-config
-+		AC_ARG_WITH(gdlib-config,
-+			AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
-+				[path to program that reports GDLIB configuration]),
-+		[
-+			case "${withval}" in
-+			"") ;;
-+			yes|no)
-+				AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
-+				;;
-+			*)
-+				GDLIB_CONFIG="${withval}"
-+				;;
-+			esac
-+		])
-+
-+		AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
-+		GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
-+		if test "$?" != "0" -o -z "${GD_VERSION}"; then
-+			GD_VERSION="none"
-+		fi
-+		AC_MSG_RESULT(${GD_VERSION} found)
-+
-+		case "${GD_VERSION}" in
-+		none)
-+			;;
-+		2.0.5 | 2.0.6 | 2.0.7)
-+			AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
-+			AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
- 			;;
- 		*)
--			GDLIB_CONFIG="${withval}"
-+			CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
-+			LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
-+			LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
- 			;;
- 		esac
--	])
--
--	AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
--	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
--	if test "$?" != "0" -o -z "${GD_VERSION}"; then
--		GD_VERSION="none"
- 	fi
--	AC_MSG_RESULT(${GD_VERSION} found)
--
--	case "${GD_VERSION}" in
--	none)
--		;;
--	2.0.5 | 2.0.6 | 2.0.7)
--		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
--		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
--		;;
--	*)
--		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
--		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
--		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
--		;;
--	esac
- 
- 	dnl Now allow overriding gd settings if the user knows best
- 	AC_MSG_CHECKING(for gd include flags)
diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 0a677bc058..a4e84244b5 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,6 +1,5 @@
-# From http://www.networkupstools.org/source/2.7/nut-2.7.2.tar.gz.sha256
-sha256  980e82918c52d364605c0703a5dcf01f74ad2ef06e3d365949e43b7d406d25a7  nut-2.7.4.tar.gz
 # Locally computed
+sha256  7129b2df45f9a9df3943f4d09f2b95b5a63d66ca4913431352570206968ca97b  nut-03c3bbe8df9a2caf3c09c120ae7045d35af99b76.tar.gz
 sha256  9f562d0e6be5108a06684dd249686d378abe1653df14b1944e971e084f6751f0  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index ad575310f5..1cb494e5ca 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,17 +4,25 @@
 #
 ################################################################################
 
-NUT_VERSION_MAJOR = 2.7
-NUT_VERSION = $(NUT_VERSION_MAJOR).4
-NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
+NUT_VERSION = 03c3bbe8df9a2caf3c09c120ae7045d35af99b76
+NUT_SITE = $(call github,networkupstools,nut,$(NUT_VERSION))
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_INSTALL_STAGING = YES
-NUT_DEPENDENCIES = host-pkgconf
+NUT_DEPENDENCIES = host-pkgconf host-perl
 
-# Our patch changes m4 macros, so we need to autoreconf
+# From git:
 NUT_AUTORECONF = YES
 
+# Generate files otherwise generated by autogen.sh
+# buildroot does not support augeas, creating an empty file prevents
+# us from adding a dependency to host-python
+define NUT_PREGEN
+	touch $(@D)/scripts/augeas/nutupsconf.aug.in
+	cd $(@D)/tools && PATH=$(BR_PATH) ./nut-usbinfo.pl
+endef
+NUT_PRE_CONFIGURE_HOOKS += NUT_PREGEN
+
 # Race condition in tools generation
 NUT_MAKE = $(MAKE1)
 
@@ -22,8 +30,9 @@ NUT_MAKE = $(MAKE1)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
-	--with-dev \
-	--without-hal
+	--with-dev
+
+NUT_CONF_ENV = ax_cv__printf_string_null=yes
 
 # For uClibc-based toolchains, nut forgets to link with -lm
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.29.2
