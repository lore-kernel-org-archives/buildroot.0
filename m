From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:40 +0100
Subject: [Buildroot] [PATCH 5/6 v2] support/graph-depends: teach it to only
	check dependencies
In-Reply-To: <cover.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <c679667576d8f72432fa738dc8103cb256d94112.1453651102.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to graph-depends to only do the dependency checks and not
generate the dot program.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index e872ed4..21b2370 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -38,6 +38,8 @@ max_depth = 0
 transitive = True
 
 parser = argparse.ArgumentParser(description="Graph packages dependencies")
+parser.add_argument("--check-only", "-C", dest="check_only", action="store_true",
+                    help="Only do the dependency checks (circular deps...)")
 parser.add_argument("--output", "-o", metavar="DOT_FILE", dest="dotfile",
                     help="File in which to generate the dot program")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
@@ -62,9 +64,14 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
 
+check_only = args.check_only
+
 if args.dotfile is None:
     outfile = sys.stdout
 else:
+    if check_only:
+        sys.stderr.write("don't specify output file and check-only at the same time\n")
+        sys.exit(1)
     outfile = open(args.dotfile, "wb")
 
 if args.package is None:
@@ -351,6 +358,9 @@ def remove_extra_deps(deps):
     return deps
 
 check_circular_deps(dict_deps)
+if check_only:
+    sys.exit(0)
+
 dict_deps = remove_extra_deps(dict_deps)
 dict_version = get_version([pkg for pkg in allpkgs
                                 if pkg != "all" and not pkg.startswith("root")])
-- 
1.9.1
