From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:31:07 +0100
Subject: [Buildroot] [PATCH] package/blktrace: do not build in parallel
Message-ID: <1418574667-23018-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile is not parallel safe.

Fixes numerous build failures:
    http://autobuild.buildroot.org/results/c7f/c7f0b22c6d256c75ade223af702c5f29c6c677d8/
    http://autobuild.buildroot.org/results/4ab/4abb0d2590528c634766103ee8ffd648ad5c04d3/
    ...

Look for the message:
    btreplay.o: file not recognized: File truncated

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/blktrace/blktrace.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index 7687ade..8f3dbab 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -10,6 +10,8 @@ BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPLv2+
 BLKTRACE_LICENSE_FILES = COPYING
 
+BLKTRACE_MAKE = $(MAKE1)
+
 define BLKTRACE_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
-- 
1.9.1
