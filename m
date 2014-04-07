From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  7 Apr 2014 11:56:50 +0200
Subject: [Buildroot] [PATCH v4 4/4] luajit: needs for 32bit archictectures a
	32bit host gcc
In-Reply-To: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1396864610-8426-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For 32 bit archictectures the luajit package needs a host compiler
able to generate 32 bit code using the "-m32" option so check if that
option is supported.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fran?ois Perrad <francois.perrad@gadz.org>
---
 package/luajit/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 58b1653..d4424bc 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_LUAJIT
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel
+	# luajit.mk uses the "-m32" compiler option to build 32bit
+	# binaries, so check if that option is supported. See
+	# luajit.mk for details.
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
-- 
1.8.3.2
