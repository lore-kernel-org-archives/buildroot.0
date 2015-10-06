From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  6 Oct 2015 21:51:36 +0200
Subject: [Buildroot] [PATCH v1] Makefile: valgrind needs non-stripped
	dynamic linker library
Message-ID: <1444161096-11419-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following valgrind error (tested on freescale imx6):

valgrind:  Fatal error at startup: a function redirection
valgrind:  which is mandatory for this platform-tool combination
valgrind:  cannot be set up.  Details of the redirection are:
valgrind:
valgrind:  A must-be-redirected function
valgrind:  whose name matches the pattern:      strcmp
valgrind:  in an object with soname matching:   ld-linux-armhf.so.3
valgrind:  was not found whilst processing
valgrind:  symbols from the object with soname: ld-linux-armhf.so.3
valgrind:
valgrind:  Possible fixes: (1, short term): install glibc's debuginfo
valgrind:  package on this machine.  (2, longer term): ask the packagers
valgrind:  for your Linux distribution to please in future ship a non-
valgrind:  stripped ld.so (or whatever the dynamic linker .so is called)
valgrind:  that exports the above-named function using the standard
valgrind:  calling conventions for this platform.  The package you need
valgrind:  to install for fix (1) is called

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 181d446..7f3661f 100644
--- a/Makefile
+++ b/Makefile
@@ -477,11 +477,12 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 # file exclusions:
 # - libpthread.so: a non-stripped libpthread shared library is needed for
 #   proper debugging of pthread programs using gdb.
+# - ld.so: a non-stripped dynamic linker library is needed for valgrind
 # - kernel modules (*.ko): do not function properly when stripped like normal
 #   applications and libraries. Normally kernel modules are already excluded
 #   by the executable permission check above, so the explicit exclusion is only
 #   done for kernel modules with incorrect permissions.
-STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
 
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
 define TOOLCHAIN_ECLIPSE_REGISTER
@@ -594,6 +595,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
+# Valgrind needs non-stripped ld.so
+	find $(TARGET_DIR)/lib -type f -name 'ld-*.so*' | \
+		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
+
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxiliary cache directory
 	# for recent versions of ldconfig
-- 
2.1.4
