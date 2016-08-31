From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 23:31:41 +0200
Subject: [Buildroot] [git commit] package/luajit: disable for mips{32, 64}r6
Message-ID: <20160831213310.533AE822F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72a2529aae8bcf8560dd1204d6b11e9ec9df81b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LuaJIT does not have support for MIPS Release 6 [1]. If LuaJIT is
invoked with the option `-b -a mips` to save the bytecode for the MIPS
architecture it generates object files with the MIPS32 Release 1
instruction set.

GCC added support for MIPS32R6 in version 5. However, object files for MIPS32R1
cannot be linked with object for MIPS32R6.

That's why building the package luvi fails for MIPS32R6, where object files
created with GCC are linked with object files created with LuaJIT with
the following linker error:

```
linking mips:isa32 module with previous mips:isa32r6 modules
```

Disable LuaJIT for MIPS32 and MIPS64 R6 to fix the build issue with the
luvi package.

Fixes:
http://autobuild.buildroot.net/results/e01/e017671c33314e5bf2d7fc4920f6c0e64a132383/
http://autobuild.buildroot.net/results/35f/35f558453c45a27367e80e9b8cbe3bd2dccbfd54/
http://autobuild.buildroot.net/results/8e0/8e001112b1678f9fb1c198c84184cd6f5fc3d004/

[1] http://www.freelists.org/post/luajit/Support-for-MIPS32r6,1

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 8ce528b..f9285e8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	default y if BR2_i386 || \
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 		BR2_powerpc || BR2_arm || BR2_armeb || \
-		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
+		!BR2_mips_32r6 && !BR2_mips_64r6)
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
