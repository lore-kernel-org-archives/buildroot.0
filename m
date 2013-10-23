From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2013 01:28:01 +0200
Subject: [Buildroot] [PATCH] perf: disable documentation
Message-ID: <1382570881-18589-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf uses asciidoc to generate documentation, but /usr/bin/asciidoc will
try to use buildroot's host-python which doesn't have the required
unicodedata. Recent kernels always try to build the man pages when
installing. To avoid that, define ASCIIDOC as an empty string so the
Makefile can't find the executable and skips the documentation
generation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perf/perf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 120353f..d7898d0 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -19,7 +19,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	DESTDIR=$(TARGET_DIR) \
 	prefix=/usr \
-	WERROR=0
+	WERROR=0 \
+	ASCIIDOC=
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 	PERF_DEPENDENCIES += elfutils
-- 
1.8.4.rc3
