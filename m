From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  4 Aug 2015 11:57:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/poco: disable for static build
In-Reply-To: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1438682248-29767-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

poco requires dlopen()

Fixes:
http://autobuild.buildroot.net/results/952/952f05efd245ba59991f3c5be02a0572e8b9e544/
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/poco/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 155f098..dfdc8d1 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
@@ -60,8 +61,8 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, threads, C++"
+comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_xtensa)
-- 
2.5.0
