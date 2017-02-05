From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 15:20:02 +0100
Subject: [Buildroot] [git commit] graph-depends: avoid use of global var
	'rule' in get_depends
Message-ID: <20170205142050.9B8D380285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd8b531d24431141a919daf6c50cca7de8547023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Function get_depends was recently changed to support both normal
dependencies as reverse dependencies, via a global variable 'rule' that
equals 'show-depends' or 'show-rdepends'.

As a subsequent function will extract this function get_depends to a
separate file, the use of globals is problematic.

Instead, pass the global as an argument.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c3c97cb..095619a 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -161,7 +161,7 @@ def get_targets():
 # Execute the "make <pkg>-show-depends" command to get the list of
 # dependencies of a given list of packages, and return the list of
 # dependencies formatted as a Python dictionary.
-def get_depends(pkgs):
+def get_depends(pkgs, rule):
     sys.stderr.write("Getting dependencies for %s\n" % pkgs)
     cmd = ["make", "-s", "--no-print-directory" ]
     for pkg in pkgs:
@@ -204,7 +204,7 @@ def get_all_depends(pkgs):
     if len(filtered_pkgs) == 0:
         return []
 
-    depends = get_depends(filtered_pkgs)
+    depends = get_depends(filtered_pkgs, rule)
 
     deps = set()
     for pkg in filtered_pkgs:
