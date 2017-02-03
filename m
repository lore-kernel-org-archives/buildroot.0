From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 21:57:42 +0100
Subject: [Buildroot] [PATCH 1/3] graph-depends: avoid use of global var
	'rule' in get_depends
In-Reply-To: <20170203205745.14488-1-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
Message-ID: <20170203205745.14488-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Function get_depends was recently changed to support both normal
dependencies as reverse dependencies, via a global variable 'rule' that
equals 'show-depends' or 'show-rdepends'.

As a subsequent function will extract this function get_depends to a
separate file, the use of globals is problematic.

Instead, pass the global as an argument.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.10.2
