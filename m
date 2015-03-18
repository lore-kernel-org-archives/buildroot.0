From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:47:24 -0700
Subject: [Buildroot] [PATCH] package/perf: fix build failures with high
	'make -j' values
Message-ID: <1426715244-25068-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'perf' Makefile is flaky on some kernel versions. It will still parallelize
the build even with 'make -j1' because it explicitly invokes a sub-make with
the correct flags. But the top-level make is not smart enough to handle large
'-j' values.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/perf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 1fcc258..f6591a6 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -22,6 +22,8 @@ PERF_MAKE_FLAGS = \
 	WERROR=0 \
 	ASCIIDOC=
 
+PERF_MAKE_FLAGS += -j1
+
 # The call to backtrace() function fails for ARC, because for some
 # reason the unwinder from libgcc returns early. Thus the usage of
 # backtrace() should be disabled in perf explicitly: at build time
-- 
2.3.3
