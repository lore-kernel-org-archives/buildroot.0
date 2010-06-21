From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: fix make
	<blah>_defconfig
Message-ID: <20100621210811.5AB7B817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2691d80803c96e32d923b0a20708b2dcb9aac20a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure we only pass O=<path> if we were originally called like that,
otherwise we might end up looking for the .config in the wrong place.

Likewise, when changing between using O= or not (or simply running
make <blah>_defconfig in a pristine source tree), we do end up having
a .config, but no .config.cmd. It isn't really critical so just continue
even if we couldn't read it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index ef78de1..c8f211b 100644
--- a/Makefile
+++ b/Makefile
@@ -287,7 +287,7 @@ include package/Makefile.in
 all: world
 
 # In this section, we need .config
-include $(CONFIG_DIR)/.config.cmd
+-include $(CONFIG_DIR)/.config.cmd
 
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
@@ -587,7 +587,11 @@ flush:
 
 %_defconfig: $(TOPDIR)/configs/%_defconfig
 	cp $^ $(CONFIG_DIR)/.config
+ifeq ($(O),output)
+	@$(MAKE) oldconfig
+else
 	@$(MAKE) O=$(O) oldconfig
+endif
 
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
-- 
1.7.1
