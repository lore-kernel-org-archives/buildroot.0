From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:54 +0200
Subject: [Buildroot] [PATCH 04/23] toolchain/gcc: remove dead code related
	to host binary stripping
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC_STRIP_HOST_BINARIES variable was always defined to 'nope',
which means that the host binaries were never stripped. Get rid of the
corresponding code, which is not in use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 92361e5..79a0125 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -43,7 +43,6 @@ GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
 GCC_CAT:=$(BZCAT)
-GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)
 
 # Branding works on >= 4.3
@@ -472,10 +471,6 @@ $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
 		rmdir "$(STAGING_DIR)/lib64"; \
 		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
 	fi
-	# Strip the host binaries
-ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-*))
-endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
 		ln -snf $(GNU_TARGET_NAME)-gcc \
-- 
1.8.1.2
