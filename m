From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 23:06:19 +0200
Subject: [Buildroot] [git commit] Makefile: do not try to strip inexisting
	file when stripping libpthread
Message-ID: <20130902213322.278579B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52e7073a58409ac09b79865a3ae4332cf01edb58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpthread.so has a special stripping condition to preserve parts of
it that are needed for debugging. However, due to the usage of 'xargs'
instead of 'xargs -r', the strip command is executed regardless of
whether a libpthread.so file is found or not. This leads to a big
error message being displayed in static-only builds, because strip is
executed without a file argument. Thanks to the '|| true', the build
continues, but still shows a big error message in the middle, which is
not nice.

By using 'xargs -r', we avoid the strip command from being executed
when 'find' doesn't find any match. We also remove the '|| true' to
catch other real errors.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 3b5d921..09faeba 100644
--- a/Makefile
+++ b/Makefile
@@ -494,7 +494,7 @@ endif
 # I set a breakpoint"
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	find $(TARGET_DIR)/lib -type f -name 'libpthread*.so*' | \
-		xargs $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true
+		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
 	mkdir -p $(TARGET_DIR)/etc
