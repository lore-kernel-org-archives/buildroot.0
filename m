From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 18:57:51 +0100
Subject: [Buildroot] [git commit] graph-depends: use a separate
	TARGET_EXCEPTIONS variable
Message-ID: <20130102200334.4835C9A288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41af66ef393754381778ade4228fef7f1ed3cf52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for more graph-depends improvements, use a
TARGET_EXCEPTIONS list to list all the targets that should be ignored
while building the dependency graph.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c80a65a..d5ef6e0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -150,6 +150,15 @@ def remove_redundant_deps(deps):
         sys.stderr.write("Removing redundant dep all -> %s\n" % dep[1])
     return newdeps
 
+TARGET_EXCEPTIONS = [
+    "target-generic-issue",
+    "target-generic-getty-busybox",
+    "target-generic-do-remount-rw",
+    "target-finalize",
+    "erase-fakeroots",
+    "target-generic-hostname",
+]
+
 # In full mode, start with the result of get_targets() to get the main
 # targets and then use get_all_depends() for each individual target.
 if mode == FULL_MODE:
@@ -158,12 +167,7 @@ if mode == FULL_MODE:
     allpkgs.append('all')
     for tg in targets:
         # Skip uninteresting targets
-        if tg == 'target-generic-issue' or \
-                tg == 'target-generic-getty-busybox' or \
-                tg == 'target-generic-do-remount-rw' or \
-                tg == 'target-finalize' or \
-                tg == 'erase-fakeroots' or \
-                tg == 'target-generic-hostname':
+        if tg in TARGET_EXCEPTIONS:
             continue
         dependencies.append(('all', tg))
         deps = get_all_depends(tg)
