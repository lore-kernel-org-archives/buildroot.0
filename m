From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:48:42 +0200
Subject: [Buildroot] [git commit] build: fix umask test
Message-ID: <20160620205603.1F3747FDBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f4c72c60793ca6ada24ae85c3211b2ab178eb3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some shells' builtin umask does not print 2 leading 0's for the umask.
Switching to bash is done anyway.
This patch switches to bash before the umask test.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
