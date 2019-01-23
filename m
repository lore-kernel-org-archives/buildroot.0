From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:41:02 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] wireshark: bump to
 version 2.6.4
Message-ID: <20190123151352.9B146849D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1bfd5f7c1278a4cbaf102364e59e4c8cf94cfa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- Remove first patch (inet_pton test removed since version 2.5.0 and
  https://github.com/wireshark/wireshark/commit/12d63c428f973b1f7e04ad58d432d778e2035a9a)
- Remove second patch (already in version, since
  https://github.com/wireshark/wireshark/commit/3761ef378537f6a9e0424f7cbded7e7403ba425c)
- Remove WIRESHARK_AUTORECONF=yes as configure.ac is not patched anymore
- gcrypt is a mandatory dependency since version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/6b84ddee83e70aff944da084129624226b7a32fa
- geoip support has been replaced by maxminddb since version 2.5.0 and
  https://github.com/wireshark/wireshark/commit/a1da75c554881667dd92e11f098630f2d604872b
- Drop includedir "hack", this is not needed anymore and wireshark is
  now installing files in target. With this hack, build fails on:
  wireshark: installs files in /home/fabrice/buildroot/output/target//home/fabrice/buildroot/output
  package/pkg-generic.mk:310: recipe for target '/home/fabrice/buildroot/output/build/wireshark-2.6.4/.stamp_target_installed' failed
- Disable all new optional features

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: keep optional dependencies alphabetic on Config.in name;
         add comment of libgcrypt -> libgpg-error dependency.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 72bafd5e458e2fe22178ae920e6323e7b8f71411)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-do-not-assume-broken-inet_pton-in-case-.patch | 35 ---------------------
 ...androiddump-add-missing-sys-time.h-header.patch | 35 ---------------------
 package/wireshark/Config.in                        |  3 ++
 package/wireshark/wireshark.hash                   |  4 +--
 package/wireshark/wireshark.mk                     | 36 +++++++++-------------
 5 files changed, 19 insertions(+), 94 deletions(-)

diff --git a/package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch b/package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch
deleted file mode 100644
index 1e44ad0942..0000000000
--- a/package/wireshark/0001-configure.ac-do-not-assume-broken-inet_pton-in-case-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25d313275e87dc236e86c0e713cad08ea64253f8 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 8 Sep 2016 10:58:34 +0100
-Subject: [PATCH] configure.ac: do not assume broken inet_pton in case of cross
- compiling
-
-Patch configure.ac to not assume broken inet_pton in case of cross
-compiling.
-
-[Vincent: adapt the patch for 2.2.0]
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c43e366..9672831 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2373,8 +2373,8 @@ int main()
- #endif
- }], [AC_MSG_RESULT(ok);
- have_inet_pton=yes], [AC_MSG_RESULT(broken);
--have_inet_pton=no], [AC_MSG_RESULT([cross compiling, assume it is broken]);
--have_inet_pton=no])],
-+have_inet_pton=no], [AC_MSG_RESULT([cross compiling, assume it is broken... not here]);
-+have_inet_pton=yes])],
- have_inet_pton=no)
- if test "$have_inet_pton" = no; then
-   AC_LIBOBJ(inet_pton)
--- 
-2.7.3
-
diff --git a/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch b/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch
deleted file mode 100644
index ae1198018a..0000000000
--- a/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1ab938e762ee6ebd3211c22ef25a7575e37791c4 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 29 Dec 2016 20:16:53 +0200
-Subject: [PATCH] androiddump: add missing sys/time.h header
-
-struct timeval requires sys/time.h. Fixes the following musl libc build error:
-
-androiddump.c: In function 'useSndTimeout':
-androiddump.c:262:18: error: variable 'socket_timeout' has initializer but incomplete type
-     const struct timeval socket_timeout = {
-                  ^
-
-Change-Id: I52e204f32a012aabea2e54877e564576c072fe08
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://code.wireshark.org/review/19460
----
- extcap/androiddump.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/extcap/androiddump.c b/extcap/androiddump.c
-index 8287c4bb1a76..fab7c10e05cc 100644
---- a/extcap/androiddump.c
-+++ b/extcap/androiddump.c
-@@ -30,6 +30,7 @@
- #include <string.h>
- #include <errno.h>
- #include <time.h>
-+#include <sys/time.h>
- 
- #ifdef HAVE_NETINET_IN_H
- #    include <netinet/in.h>
--- 
-2.11.0
-
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 4d5a2157f2..0cf14f2f84 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Network traffic sniffer and protocol decoder.
@@ -28,5 +30,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 endif # BR2_PACKAGE_WIRESHARK
 
 comment "wireshark needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8b2d7bc985..a0178b9f56 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.17.txt
-sha256 923d39ff9c6df83b9594868542061da33bf330e12526778a8cb3adcf912eebb0  wireshark-2.2.17.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.4.txt
+sha256 a06b007e6343f148b8b93443b2fcfc9bb3204311cd268565d54d1b71660bc861  wireshark-2.6.4.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 421338f0f8..bb0d570391 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,26 +4,26 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.17
-WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
+WIRESHARK_VERSION = 2.6.4
+WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
+WIRESHARK_DEPENDENCIES = host-pkgconf libgcrypt libpcap libglib2
 WIRESHARK_CONF_ENV = \
+	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
-# patch touching configure.ac
-WIRESHARK_AUTORECONF = YES
-
-# wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
-# Work around it by pointing includedir at staging
 WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
 	--enable-static=no \
+	--without-bcg729 \
+	--without-libxml2 \
+	--without-lz4 \
+	--without-nghttp2 \
+	--without-snappy \
 	--with-libsmi=no \
-	--with-pcap=$(STAGING_DIR)/usr \
-	--includedir=$(STAGING_DIR)/usr/include
+	--with-pcap=$(STAGING_DIR)/usr
 
 # wireshark GUI options
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
@@ -62,13 +62,6 @@ else
 WIRESHARK_CONF_OPTS += --without-c-ares
 endif
 
-ifeq ($(BR2_PACKAGE_GEOIP),y)
-WIRESHARK_CONF_OPTS += --with-geoip=$(STAGING_DIR)/usr
-WIRESHARK_DEPENDENCIES += geoip
-else
-WIRESHARK_CONF_OPTS += --without-geoip
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WIRESHARK_CONF_OPTS += --with-gnutls=yes
 WIRESHARK_DEPENDENCIES += gnutls
@@ -76,12 +69,11 @@ else
 WIRESHARK_CONF_OPTS += --with-gnutls=no
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-WIRESHARK_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-WIRESHARK_CONF_OPTS += --with-gcrypt=yes
-WIRESHARK_DEPENDENCIES += libgcrypt
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+WIRESHARK_CONF_OPTS += --with-maxminddb=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += libmaxminddb
 else
-WIRESHARK_CONF_OPTS += --with-gcrypt=no
+WIRESHARK_CONF_OPTS += --without-maxminddb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
