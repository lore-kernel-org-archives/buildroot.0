From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Apr 2019 12:00:26 +0200
Subject: [Buildroot] [PATCH] package/most: disable parallel build
Message-ID: <20190414100026.17122-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hand-written Makefile is not parallel-build safe: the objs directory
is created in a separate rule, but the rules that create files in that
directory don't depend on it.

Although this relatively simple to fix, upstream clearly doesn't care
about parallel builds so it is likely to break again in the future.
Since most consists of just a dozen source files, just disable parallel
build.

Fixes:
http://autobuild.buildroot.net/results/c7540203a8eadad3f324f0d7e7fe66a526d4a2e9

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Sven Oliver Moll <buildroot@svol.li>
---
 package/most/most.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/most/most.mk b/package/most/most.mk
index d24e67f936..28d82cddf1 100644
--- a/package/most/most.mk
+++ b/package/most/most.mk
@@ -11,6 +11,7 @@ MOST_LICENSE_FILES = COPYING COPYRIGHT
 MOST_DEPENDENCIES = slang
 
 MOST_CONF_OPTS = --with-slang=$(STAGING_DIR)/usr
+MOST_MAKE = $(MAKE1)
 
 define MOST_REMOVE_LOCAL_SLANG_CHECK
 	$(SED) 's/ slangversion / /g' $(@D)/src/Makefile.in
-- 
2.20.1
