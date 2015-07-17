From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 17 Jul 2015 14:46:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/luajit: disable for static build
Message-ID: <1437137197-5278-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

luajit requires dlopen().

Fixes:
http://autobuild.buildroot.net/results/20d/20dfb10198f3688f92208591960192ca08280987/
http://autobuild.buildroot.net/results/c3c/c3cfdf8dfb315bf64caa9ed0f362016111fd93ac/
http://autobuild.buildroot.net/results/8cb/8cbf6207ecf7b254aeccd9ec5c07376a044e1f8f/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luajit/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f6995e2..8ce528b 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_STATIC_LIBS # dlopen
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
@@ -32,3 +33,6 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"
 
 endif
+
+comment "luajit needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.4.6
