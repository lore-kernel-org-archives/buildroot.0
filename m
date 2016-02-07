From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:21:40 +0100
Subject: [Buildroot] [git commit] support/graph-depends: teach it to only
	check dependencies
Message-ID: <20160207222644.9E89180008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90551bfac01a41979ab24ff58bfb80742f8470ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to graph-depends to only do the dependency checks and not
generate the dot program.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d933eaa..efb73d2 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -38,6 +38,8 @@ max_depth = 0
 transitive = True
 
 parser = argparse.ArgumentParser(description="Graph packages dependencies")
+parser.add_argument("--check-only", "-C", dest="check_only", action="store_true", default=False,
+                    help="Only do the dependency checks (circular deps...)")
 parser.add_argument("--outfile", "-o", metavar="OUT_FILE", dest="outfile",
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
