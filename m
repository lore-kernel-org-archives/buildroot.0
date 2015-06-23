From: =?UTF-8?q?C=C3=A9dric=20Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 23 Jun 2015 23:36:06 +0200
Subject: [Buildroot] [PATCH] Don't export VERBOSE unless V=1 (for CMake)
Message-ID: <1435095367-4223-1-git-send-email-cedric.marie@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake verbose mode is based on VERBOSE environment variable.
* If VERBOSE is exported but empty, only "Dependee ... is newer than
depender ..." messages are shown.
* If VERBOSE is exported and set (whatever the value), all compilation
commands are shown.

VERBOSE is currently systematically exported by Buildroot, even if it
is empty, in the root Makefile, which implies that the "light" verbose
mode - with "Dependee ... is newer than depender ..." messages - is
always enabled.

VERBOSE should only be exported when V=1, which is the standard way to
enable verbose mode in Buildroot.

Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d3f80c4..8eb21d4 100644
--- a/Makefile
+++ b/Makefile
@@ -215,6 +215,7 @@ ifeq ($(KBUILD_VERBOSE),1)
 ifndef VERBOSE
   VERBOSE = 1
 endif
+export VERBOSE
 else
   quiet = quiet_
   Q = @
@@ -228,7 +229,7 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 # kconfig uses CONFIG_SHELL
 CONFIG_SHELL := $(SHELL)
 
-export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
+export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE
 
 ifndef HOSTAR
 HOSTAR := ar
-- 
2.1.4
