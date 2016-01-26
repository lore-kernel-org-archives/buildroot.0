From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:18:53 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: add support for excluding
	host packages
In-Reply-To: <1453839534-3912-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453839534-3912-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453839534-3912-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like the --stop-on and --exclude options allow to stop on or
exclude virtual packages from the list by passing the "virtual" magic
value, this commit extends the graph-depends logic to support a "host"
magic value for --stop-on and --exclude. This will allow to draw the
graph by stopping on host packages, or by excluding host packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d09ce38..0124de9 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -44,8 +44,9 @@ parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, de
                     help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
 parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
                     help="Do not graph past this package (can be given multiple times)." \
-                       + " Can be a package name or a glob, or" \
-                       + " 'virtual' to stop on virtual packages.")
+                       + " Can be a package name or a glob, " \
+                       + " 'virtual' to stop on virtual packages, or " \
+                       + "'host' to stop on host packages.")
 parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
                     help="Like --stop-on, but do not add PACKAGE to the graph.")
 parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
@@ -357,6 +358,8 @@ def print_pkg_deps(depth, pkg):
             return
     if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
         return
+    if pkg.startswith("host-") and "host" in stop_list:
+        return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
             add = True
@@ -368,6 +371,9 @@ def print_pkg_deps(depth, pkg):
                and "virtual" in exclude_list:
                 add = False
                 break
+            if d.startswith("host-") and "host" in exclude_list:
+                add = False
+                break
             if add:
                 print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
                 print_pkg_deps(depth+1, d)
-- 
2.6.4
