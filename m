From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:49 +0200
Subject: [Buildroot] [PATCH 5/9] graph-depends: add option to set the colours
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <7b5c1eaa7b5ccf603eafc46dda6558ec7eb47f16.1402236171.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 support/scripts/graph-depends | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 2b46040..0dafd77 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -42,6 +42,12 @@ parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
                     help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
+parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
+                    default="lightblue,grey,gainsboro",
+                    help="Comma-separated list of the three colours to use" \
+                       + " to draw the top-level package, the target" \
+                       + " packages, and the host packages, in this order." \
+                       + " Defaults to: 'lightblue,grey,gainsboro'")
 parser.add_argument("--transitive", dest="transitive", action='store_true',
                     default=True)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
@@ -58,6 +64,17 @@ max_depth = args.depth
 
 transitive = args.transitive
 
+# Get the colours: we need exactly three colours,
+# so no need not split more than 4
+# We'll let 'dot' validate the colours...
+colours = args.colours.split(',',4)
+if len(colours) != 3:
+    sys.stderr.write("Error: incorrect colour list '%s'\n" % args.colours)
+    sys.exit(1)
+root_colour = colours[0]
+target_colour = colours[1]
+host_colour = colours[2]
+
 allpkgs = []
 
 # Execute the "make show-targets" command to get the list of the main
@@ -250,14 +267,14 @@ def print_attrs(pkg):
     else:
         label = pkg
     if pkg == 'all' or (mode == PKG_MODE and pkg == rootpkg):
-        color = 'lightblue'
+        color = root_colour
     else:
         if pkg.startswith('host') \
         or pkg.startswith('toolchain') \
         or pkg.startswith('rootfs'):
-            color = 'gainsboro'
+            color = host_colour
         else:
-            color = 'grey'
+            color = target_colour
     print "%s [label = \"%s\"]" % (name, label)
     print "%s [color=%s,style=filled]" % (name, color)
 
-- 
1.8.3.2
