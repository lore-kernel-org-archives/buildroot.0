From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 20:42:40 +0200
Subject: [Buildroot] [git commit] Makefile: test before search for kernel
	modules
Message-ID: <20130823184231.3C9199B547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fde2605765fd99565ebcde48c5411a69646c2cce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'find $(TARGET_DIR)/lib/modules' used to find and strip kernel
modules fails when no kernel modules have been installed. While the
'|| true' prevents the entire build from failing, there are still some
error messages displayed, which is not nice.

Instead, test if the directory exists before doing the find. We also
remove the '|| true' in order to really abort the build if a
problematic error occurs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6018d63..9f0164e 100644
--- a/Makefile
+++ b/Makefile
@@ -476,8 +476,9 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
-	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(KSTRIPCMD) || true
+	test -d $(TARGET_DIR)/lib/modules && \
+		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
+		xargs -r $(KSTRIPCMD)
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
