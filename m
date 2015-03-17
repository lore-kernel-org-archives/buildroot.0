From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 16:32:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/luajit: introducing luajit arch
	supports.
In-Reply-To: <1426606373-11438-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426606373-11438-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1426606373-11438-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS for luajit.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/luajit/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index c505f6a..d71118b 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,10 +1,18 @@
+config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || \
+		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
+		BR2_powerpc || \
+		BR2_arm || \
+		BR2_armeb || \
+		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
-		|| ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
-- 
1.9.1
