From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Aug 2013 00:34:45 +0200
Subject: [Buildroot] [git commit] Makefile: fix kernel modules test
Message-ID: <20130825224049.710959B568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f627ebeb79930e00b25eb376554ff2b68cd077c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fde2605765f (Makefile: test before search for kernel modules)
changed the way we strip kernel modules, but it fails when modules aren't
available (as test -d returns with a non zero exit code).

Fix it by including the test -d call in a proper shell conditional.

Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9f0164e..ca7b039 100644
--- a/Makefile
+++ b/Makefile
@@ -476,9 +476,9 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
-	test -d $(TARGET_DIR)/lib/modules && \
+	if test -d $(TARGET_DIR)/lib/modules; then \
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(KSTRIPCMD)
+		xargs -r $(KSTRIPCMD); fi
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
