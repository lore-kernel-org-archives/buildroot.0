From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:28:19 +0100
Subject: [Buildroot] [git commit] graph-depends: fix handling of "virtual"
	in exclude_list
Message-ID: <20160208213711.90BCD817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7771bb93b2a2b2b9ef6835785d51fb2bfe1ea584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index efb73d2..fcf3cca 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -403,15 +403,14 @@ def print_pkg_deps(depth, pkg):
         return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
+            if dict_version.get(d) == "virtual" \
+               and "virtual" in exclude_list:
+                continue
             add = True
             for p in exclude_list:
                 if fnmatch(d,p):
                     add = False
                     break
-                if dict_version.get(d) == "virtual" \
-                and "virtual" in exclude_list:
-                    add = False
-                    break
             if add:
                 outfile.write("%s -> %s\n" % (pkg_node_name(pkg), pkg_node_name(d)))
                 print_pkg_deps(depth+1, d)
