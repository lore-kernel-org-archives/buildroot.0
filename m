From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:50:24 +0200
Subject: [Buildroot] [git commit] support/graphs: fix comparisons agains None
Message-ID: <20140414205031.134BE9C786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a89f14e0f1c632393d4dc4bf4518de0b79976edc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Samuel said:
    In Python, None is a singleton, and it is recommended to use "is" or
    "is not" for testing them [1].

    [1] http://legacy.python.org/dev/peps/pep-0008/#programming-recommendations

Reported-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-build-time |    6 +++---
 support/scripts/graph-depends    |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 45f9435..8ef065f 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -84,7 +84,7 @@ class Package:
             self.steps_duration[step] = self.steps_end[step] - self.steps_start[step]
 
     def get_duration(self, step=None):
-        if step == None:
+        if step is None:
             duration = 0
             for step in self.steps_duration.keys():
                 duration += self.steps_duration[step]
@@ -278,10 +278,10 @@ if args.alternate_colors:
 else:
     colors = default_colors
 
-if args.type == "histogram" or args.type == None:
+if args.type == "histogram" or args.type is None:
     if args.order == "build" or args.order == "duration" or args.order == "name":
         pkg_histogram(d, args.output, args.order)
-    elif args.order == None:
+    elif args.order is None:
         pkg_histogram(d, args.output, "name")
     else:
         sys.stderr.write("Unknown ordering: %s\n" % args.order)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 4f532ba..e2a5e1e 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -42,13 +42,13 @@ parser.add_argument("--depth", '-d', metavar="DEPTH",
                     help="Limit the dependency graph to DEPTH levels")
 args = parser.parse_args()
 
-if args.package == None:
+if args.package is None:
     mode = FULL_MODE
 else:
     mode = PKG_MODE
     rootpkg = args.package
 
-if args.depth != None:
+if args.depth is not None:
     max_depth = int(args.depth)
 
 allpkgs = []
@@ -130,7 +130,7 @@ def get_all_depends(pkgs):
 
     if len(deps) != 0:
         newdeps = get_all_depends(deps)
-        if newdeps != None:
+        if newdeps is not None:
             dependencies += newdeps
 
     return dependencies
@@ -202,7 +202,7 @@ if mode == FULL_MODE:
         dependencies.append(('all', tg))
         filtered_targets.append(tg)
     deps = get_all_depends(filtered_targets)
-    if deps != None:
+    if deps is not None:
         dependencies += deps
     rootpkg = 'all'
 
