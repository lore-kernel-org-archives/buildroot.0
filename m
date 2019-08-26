From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:44:27 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: add option
 to change percentage to group in Others
Message-ID: <20190826204924.70DC1846E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9cdabee71378243680ac43b5f1655567483dd1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we group packages that contribute less then 1%, into the
"Other" category.

However, in some cases, there can be a lot of very comparatively small
packages, and they may not exceed this limit, and so only the "Others"
category would be displayed, which is not nice.

Conversely, if there are a lot of packages, most of which only so
slightly exceeding this limit, then we get all of them in the graph,
which is not nice either.

Add a way for the developers to pass a different cut-off limit. As for
the dependency graph which has BR2_GRAPH_DEPS_OPTS, add the environment
variable BR2_GRAPH_SIZE_OPTS to carry those extra option (in preparation
for more to come, later).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Arnout:
 - remove empty base class definition from Config;
 - use parser.error instead of ValueError for invalid argument.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                     |  3 ++-
 docs/manual/common-usage.txt | 12 ++++++++++++
 support/scripts/size-stats   | 19 +++++++++++++++----
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 406efd1ab6..e4aa074e4a 100644
--- a/Makefile
+++ b/Makefile
@@ -892,7 +892,8 @@ graph-size:
 	$(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
 		--graph $(GRAPHS_DIR)/graph-size.$(BR_GRAPH_OUT) \
 		--file-size-csv $(GRAPHS_DIR)/file-size-stats.csv \
-		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv
+		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv \
+		$(BR2_GRAPH_SIZE_OPTS)
 
 .PHONY: check-dependencies
 check-dependencies:
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index e3d7578c85..6a6ec19552 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -102,6 +102,8 @@ to +make+ or set in the environment:
   xref:graph-depends[] for the accepted options
 * +BR2_GRAPH_DOT_OPTS+ is passed verbatim as options to the +dot+ utility to
   draw the dependency graph.
+* +BR2_GRAPH_SIZE_OPTS+ to pass extra options to the size graph; see
+  xref:graph-size[] for the acepted options
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
@@ -278,6 +280,7 @@ only other format supported is PNG:
 BR2_GRAPH_OUT=png make graph-build
 ----------------
 
+[[graph-size]]
 === Graphing the filesystem size contribution of packages
 
 When your target system grows, it is sometimes useful to understand
@@ -314,6 +317,15 @@ Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
 supported to adjust the output file format. See xref:graph-depends[]
 for details about this environment variable.
 
+Additionally, one may set the environment variable +BR2_GRAPH_SIZE_OPTS+
+to further control the generated graph. Accepted options are:
+
+* `--size-limit X`, `-l X`, will group all packages which individual
+  contribution is below `X` percent, to a single entry labelled _Others_
+  in the graph. By default, `X=0.01`, which means packages each
+  contributing less than 1% are grouped under _Others_. Accepted values
+  are in the range `[0.0..1.0]`.
+
 .Note
 The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index eb09e0dc60..d197ac154b 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -33,8 +33,11 @@ except ImportError:
     sys.stderr.write("You need python-matplotlib to generate the size graph\n")
     exit(1)
 
-colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
-          '#0068b5', '#f28e00', '#940084', '#97c000']
+
+class Config:
+    size_limit = 0.01
+    colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
+              '#0068b5', '#f28e00', '#940084', '#97c000']
 
 
 #
@@ -145,7 +148,7 @@ def draw_graph(pkgsize, outputf):
     other_value = 0
     unknown_value = 0
     for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
-        if sz < (total * 0.01):
+        if sz < (total * Config.size_limit):
             other_value += sz
         elif p == "unknown":
             unknown_value = sz
@@ -162,7 +165,7 @@ def draw_graph(pkgsize, outputf):
     plt.figure()
     patches, texts, autotexts = plt.pie(values, labels=labels,
                                         autopct='%1.1f%%', shadow=True,
-                                        colors=colors)
+                                        colors=Config.colors)
     # Reduce text size
     proptease = fm.FontProperties()
     proptease.set_size('xx-small')
@@ -246,8 +249,16 @@ def main():
                         help="CSV output file with file size statistics")
     parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
                         help="CSV output file with package size statistics")
+    parser.add_argument("--size-limit", "-l", type=float,
+                        help='Under this size ratio, files are accounted to ' +
+                             'the generic "Other" package. Default: 0.01 (1%%)')
     args = parser.parse_args()
 
+    if args.size_limit is not None:
+        if args.size_limit < 0.0 or args.size_limit > 1.0:
+            parser.error("--size-limit must be in [0.0..1.0]")
+        Config.size_limit = args.size_limit
+
     # Find out which package installed what files
     pkgdict = build_package_dict(args.builddir)
 
