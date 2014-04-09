From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Apr 2014 14:40:55 +0100
Subject: [Buildroot] [PATCH] luajit: Disable for MIPS architecture with
	soft-float
Message-ID: <1397050855-5843-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently luajit is not supported on MIPS soft-float userlands. Upstream
plans to support it in the future:

   http://wiki.luajit.org/Open-Sponsorships#MIPS-Soft-Float-and-Dual-Number-Port

Fixes:

   http://autobuild.buildroot.net/results/d52/d5232a215e9e9aeb40b2e4e353329a27603c79ab/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/luajit/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 58b1653..5176cb8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel
+	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
+		   || ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
-- 
1.7.1
