From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Sat,  9 May 2015 17:25:33 -0300
Subject: [Buildroot] [PATCH 1/1] Makefile: Handle whitespace when stripping
	.ko
Message-ID: <1431203133-17961-1-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible to end up with a path containing spaces if the kernel
localversion contains spaces.
Be it good practice or not, there are third party vendors which
distribute kernel configuration files for reference platforms which have
quoted strings containing whitespaces in the localversion.

There was already a fix to handle paths with whitespaces or other
special characters when running strip, which consists of using the find
-print0 and xargs -0 pair of arguments, but the kernel module stripping
wasn't included in the fix.
This commit includes the same fix to the kernel module stripping line.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 282c7ea..b0e6915 100644
--- a/Makefile
+++ b/Makefile
@@ -562,8 +562,8 @@ endif
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
-		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(KSTRIPCMD); fi
+		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' -print0 | \
+		xargs -0 -r $(KSTRIPCMD); fi
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
-- 
1.9.1
