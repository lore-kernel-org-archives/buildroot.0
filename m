From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] package/gcc: don't override a variable
Message-ID: <20191027092901.A0C3788C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a940b5f2f307cfd9e87129bc015b249758e4e6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc-final/gcc-final.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 79c88a5d60..30fb87856c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -64,18 +64,16 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
 	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin
 
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
-# check-package OverriddenVariable
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
-endif
-ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
+else ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
-# check-package OverriddenVariable
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
+else
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 endif
 
 ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
