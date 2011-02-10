From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] target gcc: fix recompilation
	issue
Message-ID: <20110210202907.A6E058F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a161016d734b7f50b0468554fd683756f328209
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc_target wants uclibc_target which is now first stage uclibc (not
real, from the NPTL build stage addition).
This triggers gcc-final to be rebuilt (albeit cached) and reinstalled,
thus touching all the stamps around and triggering a rebuild of
gcc_target.
Switch to $(STAMP_DIR)/gcc_libs_target_installed instead so that we only
depend on the last stage of cross gcc being installed to rebuild.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
