From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Feb 2011 11:19:09 -0300
Subject: [Buildroot] [PATCH 2/2] target gcc: fix recompilation issue
In-Reply-To: <1297347549-647-1-git-send-email-gustavo@zacarias.com.ar>
References: <1297347549-647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1297347549-647-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc_target wants uclibc_target which is now first stage uclibc (not
real, from the NPTL build stage addition).
This triggers gcc-final to be rebuilt (albeit cached) and reinstalled,
thus touching all the stamps around and triggering a rebuild of
gcc_target.
Switch to $(STAMP_DIR)/gcc_libs_target_installed instead so that we only
depend on the last stage of cross gcc being installed to rebuild.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 2c857dc..96bebd6 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -558,7 +558,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	#rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	touch -c $@
 
-gcc_target: uclibc_target $(GCC_TARGET_PREREQ) binutils $(TARGET_DIR)/usr/bin/gcc
+gcc_target: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ) binutils $(TARGET_DIR)/usr/bin/gcc
 
 gcc_target-clean:
 	rm -rf $(GCC_BUILD_DIR4)
-- 
1.7.3.4
