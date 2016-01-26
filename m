From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:18:52 +0100
Subject: [Buildroot] [PATCH 1/3] graph-depends: fix handling of "virtual" in
	exclude_list
Message-ID: <1453839534-3912-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The condition to determine if a virtual package should be excluded
from the list due to "virtual" being passed in --exclude is under a
loop iterating over each entry of the exclude_list, but it doesn't use
the iterator of this list.

Indeed, the condition contains:

	"virtual" in exclude_list

which checks automatically if "virtual" was passed in the list. Due to
this, there is no need for this check to be within the "for p in
exclude_list" iteration. This commit fixes that by moving the check
outside of the loop.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fd8ad2f..d09ce38 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -364,10 +364,10 @@ def print_pkg_deps(depth, pkg):
                 if fnmatch(d,p):
                     add = False
                     break
-                if dict_version.get(d) == "virtual" \
-                and "virtual" in exclude_list:
-                    add = False
-                    break
+            if dict_version.get(d) == "virtual" \
+               and "virtual" in exclude_list:
+                add = False
+                break
             if add:
                 print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
                 print_pkg_deps(depth+1, d)
-- 
2.6.4
