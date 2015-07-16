From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Thu, 16 Jul 2015 18:55:17 -0300
Subject: [Buildroot] [PATCH] Makefile: optimize umask setting
In-Reply-To: <20150716225237.367d958a@free-electrons.com>
References: <20150716225237.367d958a@free-electrons.com>
Message-ID: <1437083717-2736-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using make to build multiple targets ("make a b ..."), the makefile
would get called individually for each target, making the build a lot
slower since every Makefile in BR's tree was parsed each time.

Fix this by making every invoked target depend on an "_all" rule, and
doing the real work there, only one time. This is similar to the logic
used in the generated makefile (support/scripts/mkmakefile).

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 531ac5d..f50f767 100644
--- a/Makefile
+++ b/Makefile
@@ -27,13 +27,13 @@
 # Trick for always running with a fixed umask
 UMASK=0022
 ifneq ($(shell umask),$(UMASK))
-.PHONY: all $(MAKECMDGOALS)
+.PHONY: _all
 
-all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory
+$(MAKECMDGOALS): _all
+	@:
 
-$(MAKECMDGOALS):
-	@umask $(UMASK) && $(MAKE) --no-print-directory $@
+_all:
+	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
 
 else # umask
 
-- 
2.1.4
