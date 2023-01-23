Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FAC25B50
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 23:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C9B60FE1;
	Mon, 23 Jan 2023 23:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C9B60FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxw7BOqu_qB9; Mon, 23 Jan 2023 23:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3120860F36;
	Mon, 23 Jan 2023 23:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3120860F36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F087D1BF332
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 23:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C936560F36
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 23:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C936560F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYyEI9mbgS5m for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 23:12:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A11BA60E85
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A11BA60E85
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 23:12:44 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 2A82B22CC9;
 Mon, 23 Jan 2023 18:12:42 -0500 (EST)
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 00:12:23 +0100
Message-Id: <20230123231224.3772679-2-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674515562;
 bh=Ht9xUivY0lfpOqq9oHiAfshOFoaFfrB3kIIXn3GG6qI=;
 h=From:To:Cc:Subject:Date:From;
 b=A0zJ6mCbuCmXdwpid7zCHbp9qXWAm4QvrKcqBeRFTwi+92I9Bg8WD65EGI9my9jJN
 vcvEQNY78ByfoIWJ8jc//t6DaQDxBPunKvUv17XfmhVdOVd/iApc3spQ0ftIj7FeJM
 nhe7W9QziL/fcUtNJG0TacfZNqOXsxtRNi20rS1ea9I/BdWCbUBP7ZdUEQC0vEOoEz
 /T/P74cLwpws2anVeL2iglO7CmHKp7YZTyDxXwDjt0oW7ByC1P/th7/y8zovpfRjEA
 14AdOWJyC6cmxY0uz9Vi31E3WWmEHVGVuEIXrgtbetUecJNNyVKy6eg7qn3S7+tBCv
 sXY2qc5PQPKQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=A0zJ6mCb
Subject: [Buildroot] [PATCH 2/2] support/scripts/graph-depends allow for
 forward and reverse depends on same graph
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Steve Hay via buildroot <buildroot@buildroot.org>
Reply-To: Steve Hay <me@stevenhay.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current implementation of buildroot depe dependency graphing
either does forward- or reverse-dependency traversal.

This patch enables buildroot to graph forward and reverse dependencies on the
graph for the same package: (Diagram Credit: Yann E. MORRIN)

    $ make pkg-d-graph-both-depends

    pkg A -.            .-> pkg E
            \          /
    pkg B ----> pkg D ----> pkg F
            /          \
    pkg C -'            '-> pkg G

In the above example a single graph shows pkg {A,B,C} are needed
by pkg D, and pkg D is a dependency of pkg {E,F,G}.

The variables DEPTH and RDEPTH can be passed into the graphing functions to
specify the maximum depths of direct and reverse dependencies to control graph
size.

Makefile documentation is also updated.

Signed-off-by: Steve Hay <me@stevenhay.com>

---
Changes v1 -> v2:
  - Enhanced patch description. (Yann)
  - Added Makefile documentation. (Yann)
  - Completed the implementation of graph-both-depends. (Yann)
  - Added ability to control depth of the generated graph.
  - Ensured both forward and reverse dependencies are checked for --check-only case. (Yann)
---
 Makefile                      |  7 ++++
 package/pkg-generic.mk        |  7 +++-
 support/scripts/graph-depends | 69 ++++++++++++++++++++++-------------
 3 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 8517d563d5..e47544fd42 100644
--- a/Makefile
+++ b/Makefile
@@ -1163,7 +1163,14 @@ help:
 	@echo '  <pkg>-show-recursive-rdepends'
 	@echo '                         - Recursively list packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
+	@echo '                             DEPTH, if set on the command line, is used to specify maximum'
+	@echo '                               depth to graph dependencies.'
 	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
+	@echo '                             RDEPTH, if set on the command line, is used to specify maximum'
+	@echo '                               depth to graph reverse dependencies.'
+	@echo '  <pkg>-graph-both-depends'
+	@echo '                         - Generate a graph of both <pkg>'\''s forward and'
+	@echo '                           reverse dependencies. DEPTH and RDEPTH work as described above.'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2f8ba39edf..6ddb304a12 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1031,10 +1031,13 @@ $(1)-show-info:
 	$$(info $$(call clean-json,{ $$(call json-info,$(2)) }))
 
 $(1)-graph-depends: graph-depends-requirements
-	$(call pkg-graph-depends,$(1),--direct)
+	$(call pkg-graph-depends,$(1),--direct --depth $(or $(DEPTH),0))
 
 $(1)-graph-rdepends: graph-depends-requirements
-	$(call pkg-graph-depends,$(1),--reverse)
+	$(call pkg-graph-depends,$(1),--reverse --rdepth $(or $(RDEPTH),0))
+
+$(1)-graph-both-depends: graph-depends-requirements
+	$(call pkg-graph-depends,$(1),--direct --reverse --depth $(or $(DEPTH),0) --rdepth $(or $(RDEPTH),0))
 
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3e3373950f..0285afb46d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -159,11 +159,11 @@ def check_circular_deps(deps):
 
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
-def remove_extra_deps(deps, rootpkg, transitive, arrow_dir):
+def remove_extra_deps(deps, rootpkg, transitive, direct):
     # For the direct dependencies, find and eliminate mandatory
     # deps, and add them to the root package. Don't do it for a
     # reverse graph, because mandatory deps are only direct deps.
-    if arrow_dir == "forward":
+    if direct:
         for pkg in list(deps.keys()):
             if not pkg == rootpkg:
                 for d in get_mandatory_deps(pkg, deps):
@@ -197,14 +197,16 @@ def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
     outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
 
+
 # Print the dependency graph of a package
 def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                   arrow_dir, draw_graph, depth, max_depth, pkg, colors, done_deps=None):
+                   direct, draw_graph, depth, max_depth, pkg, colors, done_deps=None):
     if done_deps is None:
         done_deps = []
     if pkg in done_deps:
         return
     done_deps.append(pkg)
+
     if draw_graph:
         print_attrs(outfile, pkg, dict_types[pkg], dict_versions[pkg], depth, colors)
     elif depth != 0:
@@ -231,9 +233,12 @@ def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exc
                     break
             if add:
                 if draw_graph:
-                    outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
+                    if direct:
+                        outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), "forward"))
+                    else:
+                        outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(d), pkg_node_name(pkg), "forward"))
                 print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors, done_deps)
+                               direct, draw_graph, depth + 1, max_depth, d, colors, done_deps)
 
 
 def parse_args():
@@ -246,6 +251,8 @@ def parse_args():
                         help="Graph the dependencies of PACKAGE")
     parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
                         help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
+    parser.add_argument("--rdepth", metavar="RDEPTH", dest="rdepth", type=int, default=0,
+                        help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
     parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
                         help="Do not graph past this package (can be given multiple times)." +
                         " Can be a package name or a glob, " +
@@ -265,9 +272,9 @@ def parse_args():
                         default=False)
     parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                         help="Draw (do not draw) transitive dependencies")
-    parser.add_argument("--direct", dest="direct", action='store_true', default=True,
+    parser.add_argument("--direct", dest="direct", action='store_true', default=False,
                         help="Draw direct dependencies (the default)")
-    parser.add_argument("--reverse", dest="direct", action='store_false',
+    parser.add_argument("--reverse", dest="reverse", action='store_true', default=False,
                         help="Draw reverse dependencies")
     parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
                         help="Quiet")
@@ -292,6 +299,9 @@ def main():
             sys.exit(1)
         outfile = open(args.outfile, "w")
 
+    if not args.direct and not args.reverse: # select default direct if none is specified.
+        args.direct = True
+ 
     if args.package is None:
         mode = MODE_FULL
         rootpkg = 'all'
@@ -312,13 +322,9 @@ def main():
     if args.exclude_mandatory:
         exclude_list += MANDATORY_DEPS
 
-    if args.direct:
-        arrow_dir = "forward"
-    else:
-        if mode == MODE_FULL:
-            logging.error("--reverse needs a package")
-            sys.exit(1)
-        arrow_dir = "back"
+    if args.reverse and mode == MODE_FULL:
+        logging.error("--reverse needs a package")
+        sys.exit(1)
 
     draw_graph = not args.flat_list
 
@@ -330,23 +336,34 @@ def main():
         logging.error("Error: incorrect color list '%s'" % args.colors)
         sys.exit(1)
 
-    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
-    dict_deps = deps if args.direct else rdeps
-
-    check_circular_deps(dict_deps)
-    if check_only:
-        sys.exit(0)
-
-    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, arrow_dir)
 
     # Start printing the graph data
-    if draw_graph:
+    if not check_only and draw_graph:
         outfile.write("digraph G {\n")
 
-    print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                   arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
+    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
 
-    if draw_graph:
+    # forward
+    if args.direct:
+        dict_deps = deps
+        direct = True
+        check_circular_deps(dict_deps)
+        if not check_only:
+            dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
+            print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
+                           direct, draw_graph, 0, args.depth, rootpkg, colors)
+
+    # reverse
+    if args.reverse:
+        dict_deps = rdeps
+        direct = False
+        check_circular_deps(dict_deps)
+        if not check_only:
+            dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
+            print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
+                           direct, draw_graph, 0, args.rdepth, rootpkg, colors)
+
+    if not check_only and draw_graph:
         outfile.write("}\n")
     else:
         outfile.write("\n")
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
