From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 08:28:15 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: remove dead code related to
	host binary stripping
Message-ID: <20130703070347.A7ABA9A158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f6d92d2ce2fee794080505e0c6536b78cf252ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC_STRIP_HOST_BINARIES variable was always defined to 'nope',
which means that the host binaries were never stripped. Get rid of the
corresponding code, which is not in use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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
