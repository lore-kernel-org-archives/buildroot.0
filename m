From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:32:14 +0100
Subject: [Buildroot] [PATCH v2 2/3] graph-depends: add support for excluding
	host packages
In-Reply-To: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453926735-29571-3-git-send-email-thomas.petazzoni@free-electrons.com>
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
 support/scripts/graph-depends | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index cfb4f82..e4a230f 100755
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
@@ -357,11 +358,15 @@ def print_pkg_deps(depth, pkg):
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
+            if d.startswith("host-") and "host" in exclude_list:
+                continue
             add = True
             for p in exclude_list:
                 if fnmatch(d,p):
-- 
2.6.4
