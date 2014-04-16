From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:53:57 +0200
Subject: [Buildroot] [git commit] luajit: needs for 32bit archictectures a
	32bit host gcc
Message-ID: <20140416175405.182679C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6e415cc91912a8314ef91abe47396ba5ad49dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 32 bit archictectures the luajit package needs a host compiler
able to generate 32 bit code using the "-m32" option so check if that
option is supported.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fran??ois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 5176cb8..57c9e2d 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -5,6 +5,10 @@ config BR2_PACKAGE_LUAJIT
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
 		   || ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+	# luajit.mk uses the "-m32" compiler option to build 32bit
+	# binaries, so check if that option is supported. See
+	# luajit.mk for details.
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
 	  by Lua 5.1. The virtual machine (VM) is API- and
