From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:21:17 +0100
Subject: [Buildroot] [git commit] Makefile: valgrind needs non-stripped
	dynamic linker library
Message-ID: <20151217222157.D3CF6825CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1edb4c51dee78d7d26700c037f29558e73d27ee0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Note that we can still strip the dynamic linker, but only strip the
debugging symbols and nothing else.

[Thomas: slightly adjust comment in the code.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8e8514e..dc657d9 100644
--- a/Makefile
+++ b/Makefile
@@ -473,11 +473,12 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
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
@@ -590,6 +591,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
+# Valgrind needs ld.so with enough information, so only strip
+# debugging symbols.
+	find $(TARGET_DIR)/lib -type f -name 'ld-*.so*' | \
+		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
+
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxiliary cache directory
 	# for recent versions of ldconfig
