From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sun, 19 Jun 2016 06:12:06 +0200
Subject: [Buildroot] [PATCH v2] build: fix umask test
Message-ID: <1466309526-31230-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some shells' builtin umask does not print 2 leading 0's for the umask.
Switching to bash is done anyway.
This patch switches to bash before the umask test.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3f5c3d3..78b44c5 100644
--- a/Makefile
+++ b/Makefile
@@ -24,6 +24,11 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
+# we want bash as shell
+SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+	 else if [ -x /bin/bash ]; then echo /bin/bash; \
+	 else echo sh; fi; fi)
+
 # Trick for always running with a fixed umask
 UMASK = 0022
 ifneq ($(shell umask),$(UMASK))
@@ -227,11 +232,6 @@ else
   Q = @
 endif
 
-# we want bash as shell
-SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-	 else if [ -x /bin/bash ]; then echo /bin/bash; \
-	 else echo sh; fi; fi)
-
 # kconfig uses CONFIG_SHELL
 CONFIG_SHELL := $(SHELL)
 
-- 
1.8.5.rc3
