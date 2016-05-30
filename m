From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 09:06:35 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
Message-ID: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some shells' builtin umask does not print 2 leading 0's for the umask.
Not doing so would break the comparison.
This patch makes sure that the umask has (at least) 4 digits.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 63502d0..9a36769 100644
--- a/Makefile
+++ b/Makefile
@@ -26,7 +26,7 @@
 
 # Trick for always running with a fixed umask
 UMASK = 0022
-ifneq ($(shell umask),$(UMASK))
+ifneq ($(shell printf "%04o\n" `umask`),$(UMASK))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
