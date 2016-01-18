From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Jan 2016 16:09:35 +0000
Subject: [Buildroot] [PATCH] luvi: build for the right MIPS endianness
Message-ID: <1453133375-54831-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will cause build failures like this one:

[100%] Linking C executable luvi
/home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/5.2.0/../../../../mipsel-buildroot-linux-gnu/bin/ld:
jitted_tmp/src/lua/init.lua_luvi_generated.o: compiled for a big endian
system and target is little endian

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/luvi/luvi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ef1c2e1..d83933e 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -20,8 +20,10 @@ else ifeq ($(BR2_powerpc),y)
 LUVI_TARGET_ARCH = ppc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LUVI_TARGET_ARCH = arm
-else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+else ifeq ($(BR2_mips),y)
 LUVI_TARGET_ARCH = mips
+else ifeq ($(BR2_mipsel),y)
+LUVI_TARGET_ARCH = mipsel
 else
 LUVI_TARGET_ARCH = $(BR2_ARCH)
 endif
-- 
2.4.10
