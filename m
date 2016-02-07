From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2016 22:34:28 +0100
Subject: [Buildroot] [PATCH 5/6 v3] support/graph-depends: teach it to only
	check dependencies
In-Reply-To: <cover.1454880734.git.yann.morin.1998@free.fr>
References: <cover.1454880734.git.yann.morin.1998@free.fr>
Message-ID: <b3414ece9fc74306e5674a71371c871c071b6402.1454880734.git.yann.morin.1998@free.fr>
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
index ec32b20..13ddc94 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -38,6 +38,8 @@ max_depth = 0
 transitive = True
 
 parser = argparse.ArgumentParser(description="Graph packages dependencies")
+parser.add_argument("--check-only", "-C", dest="check_only", action="store_true", default=False,
+                    help="Only do the dependency checks (circular deps...)")
 parser.add_argument("--outfile", "-o", metavar="DOT_FILE", dest="outfile",
                     help="File in which to generate the dot representation")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
@@ -62,9 +64,14 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
 
+check_only = args.check_only
+
 if args.outfile is None:
     outfile = sys.stdout
 else:
+    if check_only:
+        sys.stderr.write("don't specify outfile and check-only at the same time\n")
+        sys.exit(1)
     outfile = open(args.outfile, "wb")
 
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
