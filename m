From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:48:56 +0200
Subject: [Buildroot] [git commit] gcc-final: things are no longer installed
	in $(HOST_DIR)/usr
Message-ID: <20170705095036.1F3027FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67f9b36af146a1b4c34fb290e616c0eb4cce0803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index e8d2e18..12f08c8 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -59,18 +59,18 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
 HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
-	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
+	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin
 
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
 ifeq ($(BR2_bfin),y)
@@ -103,9 +103,9 @@ HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
 
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
-	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
-		ln -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \
-			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
+	if [ ! -e $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc ]; then \
+		ln -f $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc \
+			$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
 endef
 
