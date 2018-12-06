From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:15:32 +0100
Subject: [Buildroot] [git commit] support/graph-depends: drop legacy
 target-exceptions
Message-ID: <20181206211226.B5F4E8B3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee54bd603bb185f06c2523df2cb911311ea8f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we avoid drawing the dependencies that we call 'target
exceptions', becasue they initially were returned by 'show-targets',
when they in fact were not really packages and thus should not be on
the graph.

However, those two exceptions have no longer been reported in the output
of show-targets since we merged very old initial top-level parallel
build way back in 2014, with commit a24877586a56 (Makefile: add support
for top-level parallel make), where they had been converted into purely
internal rules.

4 years have passed, we can now drop those exceptions from the
graph-depends script.

This concludes the cleanup initiated three years ago with commit
0b32791f0076 (graph-depends: remove absent targets from
TARGET_EXCEPTIONS).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3c091da5e0..3526a51662 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -100,12 +100,6 @@ def pkg_node_name(pkg):
     return "_" + pkg.replace("-", "")
 
 
-TARGET_EXCEPTIONS = [
-    "target-finalize",
-    "target-post-image",
-]
-
-
 # Basic cache for the results of the is_dep() function, in order to
 # optimize the execution time. The cache is a dict of dict of boolean
 # values. The key to the primary dict is "pkg", and the key of the
@@ -384,9 +378,6 @@ def main():
         allpkgs.append('all')
         filtered_targets = []
         for tg in targets:
-            # Skip uninteresting targets
-            if tg in TARGET_EXCEPTIONS:
-                continue
             dependencies.append(('all', tg))
             filtered_targets.append(tg)
         deps = get_all_depends(filtered_targets, get_depends_func)
