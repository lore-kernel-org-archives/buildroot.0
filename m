From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 22:46:59 +0200
Subject: [Buildroot] [git commit] toolchain: make target gcc a working option
Message-ID: <20110426213743.E36A582A20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=243e4edc748b26f9a713bc268e5b7a6ff7d15956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make target gcc a more usable option.

* Nuke duplicate libgcc_s*.so* in /usr/lib since it confuses target gcc
* Copy *crt*.o files to the target system to unbreak gcc

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 96bebd6..04b21e9 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -550,12 +550,17 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 		cp -f $(HOST_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
 			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
 	fi
+
 	# Make sure we have 'cc'.
 	if [ ! -e $(TARGET_DIR)/usr/bin/cc ]; then \
 		ln -snf gcc $(TARGET_DIR)/usr/bin/cc; \
 	fi
+
+	# Copy C runtime initialization object files
+	cp -f $(STAGING_DIR)/usr/lib/*crt*.o $(TARGET_DIR)/usr/lib
+
 	# These are in /lib, so...
-	#rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
+	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	touch -c $@
 
 gcc_target: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ) binutils $(TARGET_DIR)/usr/bin/gcc
-- 
1.7.3.4
