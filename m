From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:31:27 +0100
Subject: [Buildroot] [git commit] package/openswan: bump to version 3.0.0
Message-ID: <20210123201155.A6BA08124D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5ec305daf22d015da951549de55927f236276e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Use USE_NOMANINSTALL which is available since version 2.6.52 and
  https://github.com/xelerance/Openswan/commit/9146de03c8c9eb4e55389599ce44aa8f773b2990
- openswan can be built on musl since version 2.6.52.1 and
  https://github.com/xelerance/Openswan/commit/ddb6086c50b5d087ebcabb580914b026aa71200e
- openswan can't be built on uclibc-ng anymore and upstream rejected the
  patch to fix the build failure:
  https://github.com/xelerance/Openswan/pull/453
- Update indentation in hash file (two spaces)

https://github.com/xelerance/Openswan/releases/tag/v3.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openswan/0001-fix-build-with-gcc-10.patch | 49 -----------------------
 package/openswan/Config.in                        |  6 +--
 package/openswan/openswan.hash                    |  6 +--
 package/openswan/openswan.mk                      |  7 ++--
 4 files changed, 10 insertions(+), 58 deletions(-)

diff --git a/package/openswan/0001-fix-build-with-gcc-10.patch b/package/openswan/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index eb474b56aa..0000000000
--- a/package/openswan/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3324d5ab1d00920ea46f453240da1356e0639e98 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 24 Sep 2020 21:55:31 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Define kw_host_list and kw_connaddrfamily_list as extern to avoid the following
-build failure with gcc 10 (which defaults to -fno-common):
-
-/home/peko/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: initiate.o:/home/peko/autobuild/instance-1/output-1/build/openswan-2.6.51.5/include/pluto_constants.h:650: multiple definition of `kw_host_list'; connections.o:/home/peko/autobuild/instance-1/output-1/build/openswan-2.6.51.5/include/pluto_constants.h:650: first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/650fc0046fd063c70e17ce5ebd9592195657434d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/xelerance/Openswan/pull/444]
----
- include/ipsecconf/keywords.h | 2 +-
- include/pluto_constants.h    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/ipsecconf/keywords.h b/include/ipsecconf/keywords.h
-index e32be7968..02e8e073e 100644
---- a/include/ipsecconf/keywords.h
-+++ b/include/ipsecconf/keywords.h
-@@ -314,7 +314,7 @@ struct config_parsed {
-     bool                got_default;
- };
- 
--const struct keyword_enum_values kw_connaddrfamily_list;
-+extern const struct keyword_enum_values kw_connaddrfamily_list;
- 
- extern struct keyword_def ipsec_conf_keywords_v2[];
- extern const int ipsec_conf_keywords_v2_count;
-diff --git a/include/pluto_constants.h b/include/pluto_constants.h
-index c35dd9576..dcbd3b5b4 100644
---- a/include/pluto_constants.h
-+++ b/include/pluto_constants.h
-@@ -665,7 +665,7 @@ enum keyword_host {
-     KH_IPADDR       = LOOSE_ENUM_OTHER,
- };
- /* keyword_name(&kw_host_list, type, buffer[KEYWORD_NAME_BUFLEN]) */
--struct keyword_enum_values kw_host_list;
-+extern struct keyword_enum_values kw_host_list;
- #define KH_ISWILDCARD(type)  ((type) == KH_ANY || (type) == KH_DEFAULTROUTE)
- #define KH_ISKNOWNADDR(type) ((type) == KH_IPADDR || (type)==KH_IFACE)
- 
--- 
-2.28.0
-
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 340686cc50..c71d064daf 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # ns_t_tkey
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
@@ -10,7 +10,7 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a uClibc or glibc toolchain w/ headers >= 3.4"
+comment "openswan needs a glibc or musl toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
-		BR2_TOOLCHAIN_USES_MUSL
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index a9b54dbaf6..574009ebfb 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 4124f4ce970089f301c34b9c48f54b021cf6b2b8813877942337f8022104f70d  openswan-2.6.51.5.tar.gz
-sha256 1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
-sha256 d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
+sha256  69fe7a71e54aaf0ea93b874db4963057c1ff4904b3617b36f2c9be2010c23331  openswan-3.0.0.tar.gz
+sha256  1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
+sha256  d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index aabf7d98c7..6a96e44a92 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.51.5
-OPENSWAN_SITE = https://download.openswan.org/openswan
+OPENSWAN_VERSION = 3.0.0
+OPENSWAN_SITE = $(call github,xelerance,Openswan,v$(OPENSWAN_VERSION))
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
@@ -13,7 +13,8 @@ OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
-	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
+	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
+	USE_NOMANINSTALL=true
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 OPENSWAN_DEPENDENCIES += libcurl
