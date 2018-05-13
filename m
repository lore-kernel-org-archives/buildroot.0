From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 12:34:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/jamvm: move arch dependency to a
 symbol
In-Reply-To: <cover.1526207669.git.yann.morin.1998@free.fr>
References: <cover.1526207669.git.yann.morin.1998@free.fr>
Message-ID: <4d452a6ae8702c3fc1b5422ce7d974abe41722ea.1526207669.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jamvm/Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 57e1a8e6f4..51d5da03b8 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,10 +1,16 @@
+config BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel
+	default y if BR2_powerpc
+
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
+	depends on BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc
-	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
@@ -14,7 +20,6 @@ config BR2_PACKAGE_JAMVM
 	  http://jamvm.sf.net
 
 comment "jamvm needs a toolchain w/ threads, dynamic library"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc
+	depends on BR2_PACKAGE_JAMVM_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.14.1
