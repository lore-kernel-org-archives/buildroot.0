From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 19:14:39 +0100
Subject: [Buildroot] [git commit] ljsyscall: remove dependency on some
	architecture
Message-ID: <20150323181457.665EA807E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40bb89c027e2975705250ab5ddf538634d9a881d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ljsyscall is available for all arch supported by LuaJIT.
refactor LJSYSCALL_ARCH : dispatch all arch.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljsyscall/Config.in    |    4 +---
 package/ljsyscall/ljsyscall.mk |    7 ++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index dcbd521..149e71d 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -2,13 +2,11 @@ config BR2_PACKAGE_LJSYSCALL
 	bool "ljsyscall"
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
-	# ljsyscall is only available for some target architectures
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
 	help
 	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
 
 	  http://github.com/justincormack/ljsyscall
 
 comment "ljsyscall needs LuaJIT"
-	depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
+	depends on !BR2_PACKAGE_LUAJIT
 
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index a17da3f..1c6c2c1 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -9,13 +9,18 @@ LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
 
+# dispatch all architectures of LuaJIT
 ifeq ($(BR2_i386),y)
 LJSYSCALL_ARCH = x86
 else ifeq ($(BR2_x86_64),y)
 LJSYSCALL_ARCH = x64
 else ifeq ($(BR2_powerpc),y)
 LJSYSCALL_ARCH = ppc
-else ifeq ($(LJSYSCALL_ARCH),)
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+LJSYSCALL_ARCH = arm
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+LJSYSCALL_ARCH = mips
+else
 LJSYSCALL_ARCH = $(BR2_ARCH)
 endif
 
