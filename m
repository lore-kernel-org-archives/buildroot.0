From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jun 2015 00:48:55 +0200
Subject: [Buildroot] [git commit] Makefile: Don't export VERBOSE unless V=1
	(for CMake)
Message-ID: <20150624225746.35E8980F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=307029867b0384446cd74b232b45a7b4f40cf0d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: C??dric Marie <cedric.marie@openmailbox.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
