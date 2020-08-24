From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:39:58 +0200
Subject: [Buildroot] [git commit branch/next] package/iputils: bump version
 to 20200821
Message-ID: <20200824203317.CFD2E821C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=090bd36a960cb4a2a374bb0b3c9349fcb0cc4824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patch from this version.

Remove USE_CRYPTO related config (configuration was removed in this
release).

tftpd is not built by default since this release, thus explicitly enable it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...meson.build-fix-static-build-with-libidn2.patch | 39 ----------------------
 package/iputils/iputils.hash                       |  4 +--
 package/iputils/iputils.mk                         | 17 ++--------
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch b/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch
deleted file mode 100644
index 851d043784..0000000000
--- a/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5bb4432b8c194620c28a45a069de1b3dad692ac9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 Dec 2019 11:24:12 +0100
-Subject: [PATCH] meson.build: fix static build with libidn2
-
-libidn2 can optionnaly depends on libunistring so use dependency
-function instead of cc.find_library ro retrieve this dependency and
-avoid the following build failure when building statically:
-
-FAILED: ping
-/home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc  -o ping 'ping at exe/ping.c.o' 'ping at exe/ping_common.c.o' 'ping at exe/ping6_common.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group libcommon.a -lm -lcap -lidn2 /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libz.a /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libatomic.a -lpthread /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a -lresolv -Wl,--end-group '-Wl,-rpath,$ORIGIN/' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-1/output-1/build/iputils-20190709/build/
-/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libidn2.a(lookup.o): in function `idn2_lookup_u8':
-lookup.c:(.text+0x7c): undefined reference to `u8_strlen'
-
-Fixes:
- - http://autobuild.buildroot.org/results/82d4738711a009959436fa419bd78c7a9540d33e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/iputils/iputils/pull/245]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 53c65b2..905cb96 100644
---- a/meson.build
-+++ b/meson.build
-@@ -130,7 +130,7 @@ endif
- 
- opt = get_option('USE_IDN')
- if opt == true
--	idn_dep = cc.find_library('idn2', required : false)
-+	idn_dep = dependency('libidn2', required : false)
- 	if idn_dep.found()
- 		add_project_arguments('-DUSE_IDN', language : 'c')
- 		conf.set('USE_IDN', 1,
--- 
-2.24.0
-
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 3630ae8678..11f46bac28 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/s20190709/sha256sum.asc
-sha256 a15720dd741d7538dd2645f9f516d193636ae4300ff7dbc8bfca757bf166490a  iputils-20190709.tar.gz
+# https://github.com/iputils/iputils/releases/download/s20200821/sha256sum.asc
+sha256 f265da0d02dd2259efd8c57a9c2e0c8bb3361abb14639fcffb26707be5783a5b  iputils-20200821.tar.gz
 # Locally computed
 sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
 sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index d09bc58b34..9cc51d1541 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,12 +11,14 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20190709
+IPUTILS_VERSION = 20200821
 IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 IPUTILS_CONF_OPTS += -DUSE_CAP=true
 IPUTILS_DEPENDENCIES += libcap
@@ -31,19 +33,6 @@ else
 IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
 
-ifeq ($(BR2_PACKAGE_NETTLE),y)
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
-IPUTILS_DEPENDENCIES += nettle
-else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=gcrypt
-IPUTILS_DEPENDENCIES += libgcrypt
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=openssl
-IPUTILS_DEPENDENCIES += openssl
-else
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 IPUTILS_DEPENDENCIES += systemd
 endif
