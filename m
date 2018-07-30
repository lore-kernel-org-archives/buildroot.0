From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 14:09:17 +0200
Subject: [Buildroot] [git commit] mariadb: needs dynamic library support
Message-ID: <20180730120340.2F5738A61F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58cb24d883b106e7795c0cdbda906a3c6cbc80ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a static-only configuration, mariadb fails to build because it
tries to build a shared library:

[ 18%] Linking CXX shared module ha_spider.so
output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libstdc++.a(eh_globals.o)(.text.__cxa_get_globals_fast+0x14): R_ARM_TLS_LE32 relocation not permitted in shared object

This is not detected by the autobuilders, because mariadb is part of a
Config.in choice, and such choices are not randomized by our current
testing infrastructure.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mysql/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 278dc73e57..2abf5daecb 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -17,6 +17,7 @@ choice
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
@@ -30,6 +31,10 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
+comment "mariadb needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_ORACLE_MYSQL
 	bool "oracle mysql"
 	select BR2_PACKAGE_NCURSES
