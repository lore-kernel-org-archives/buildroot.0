From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 17:06:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssl: bin/openssl depends on
	dynamic linking
Message-ID: <1428851196-16360-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
/home/br/br3/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.8.4/../../../../i586-buildroot-linux-uclibc/bin/ld: cannot find -ldl

using this defconfig

BR2_STATIC_LIBS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_BIN=y

Quoting PROBLEMS:
"We don't have framework to associate -ldl with no-dso, therefore the only
way is to edit Makefile right after ./config no-dso and remove -ldl from
EX_LIBS line."

To not make the build procedure more complicated disable static building of
bin/openssl.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openssl/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index a9990e8..df61c94 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
-- 
1.7.10.4
