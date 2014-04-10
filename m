From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:44:14 +0200
Subject: [Buildroot] [git commit] luajit: Disable for MIPS architecture with
	soft-float
Message-ID: <20140410204504.49F389C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34b4d09d718b0466127d70bb6dedcbd0b5aa288b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently luajit is not supported on MIPS soft-float userlands. Upstream
plans to support it in the future:

   http://wiki.luajit.org/Open-Sponsorships#MIPS-Soft-Float-and-Dual-Number-Port

Fixes:

   http://autobuild.buildroot.net/results/d52/d5232a215e9e9aeb40b2e4e353329a27603c79ab/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
