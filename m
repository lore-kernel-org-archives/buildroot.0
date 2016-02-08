From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:29:06 +0100
Subject: [Buildroot] [git commit] graph-depends: add support for excluding
	host packages
Message-ID: <20160208213711.B994A8025F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee8e4c5c250c3562f810d3b6102b9d9e7004082f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like the --stop-on and --exclude options allow to stop on or
exclude virtual packages from the list by passing the "virtual" magic
value, this commit extends the graph-depends logic to support a "host"
magic value for --stop-on and --exclude. This will allow to draw the
graph by stopping on host packages, or by excluding host packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: minor code beautification suggested by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fcf3cca..a00eb9d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -48,8 +48,9 @@ parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, de
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
@@ -401,11 +402,16 @@ def print_pkg_deps(depth, pkg):
             return
     if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
         return
+    if pkg.startswith("host-") and "host" in stop_list:
+        return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
             if dict_version.get(d) == "virtual" \
                and "virtual" in exclude_list:
                 continue
+            if d.startswith("host-") \
+               and "host" in exclude_list:
+                continue
             add = True
             for p in exclude_list:
                 if fnmatch(d,p):
