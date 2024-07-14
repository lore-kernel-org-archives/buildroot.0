Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E71FC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE3E8116C;
	Sun, 14 Jul 2024 19:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlpoP2x8CAWd; Sun, 14 Jul 2024 19:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF31B8117B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF31B8117B;
	Sun, 14 Jul 2024 19:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F11D31BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCEEB605E0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fTdRp7hIKa3 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1226063E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB1226063E
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B8D86947; Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:31:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c2e6050cc7cae25dfbae1fb6795e7b21e3362d9
X-Git-Newrev: ca6c896bdd75cf334ac9a02a6dd786415221f55e
X-Patchwork-Hint: ignore
Message-Id: <20240714193812.B3B8D86947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/graph-depends allow for
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca6c896bdd75cf334ac9a02a6dd786415221f55e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current implementation of buildroot depe dependency graphing
either does forward- or reverse-dependency traversal.

This patch enables buildroot to graph forward and reverse dependencies
on the graph for the same package: (Diagram Credit: Yann E. MORIN)

    $ make pkg-d-graph-both-depends

    pkg A -.            .-> pkg E
            \          /
    pkg B ----> pkg D ----> pkg F
            /          \
    pkg C -'            '-> pkg G

In the above example a single graph shows pkg {A,B,C} are needed
by pkg D, and pkg D is a dependency of pkg {E,F,G}.

Makefile help and manual are also updated.

Signed-off-by: Steve Hay <me@stevenhay.com>
[Arnout:
 - remove DEPTH and RDEPTH, their functionality is already covered by
   BR2_GRAPH_DEPS_OPTS;
 - remove --rdepth, it was felt to not add sufficient added value;
 - add the new target to the manual;
 - fix flake8 errors.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                             |  3 ++
 docs/manual/package-make-target.adoc |  4 +++
 package/pkg-generic.mk               |  3 ++
 support/scripts/graph-depends        | 67 +++++++++++++++++++++---------------
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/Makefile b/Makefile
index cd8498edf6..db5244baeb 100644
--- a/Makefile
+++ b/Makefile
@@ -1171,6 +1171,9 @@ help:
 	@echo '                         - Recursively list packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
 	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
+	@echo '  <pkg>-graph-both-depends'
+	@echo '                         - Generate a graph of both <pkg>'\''s forward and'
+	@echo '                           reverse dependencies.
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
diff --git a/docs/manual/package-make-target.adoc b/docs/manual/package-make-target.adoc
index 90a7910e23..7a7ba7f7a0 100644
--- a/docs/manual/package-make-target.adoc
+++ b/docs/manual/package-make-target.adoc
@@ -81,6 +81,10 @@ graphs.
   dependencies (i.e the packages that depend on it, directly or
   indirectly)
 
+| +graph-both-depends+ | Generate a graph of this package in both
+  directions (i.e the packages that depend on it and on which it
+  depends, directly or indirectly)
+
 | +dirclean+        | Remove the whole package build directory
 
 | +reinstall+       | Re-run the install commands
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0d84fc3773..365d6c748d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1042,6 +1042,9 @@ $(1)-graph-depends: graph-depends-requirements
 $(1)-graph-rdepends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--reverse)
 
+$(1)-graph-both-depends: graph-depends-requirements
+	$(call pkg-graph-depends,$(1),--direct --reverse)
+
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
 
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3e3373950f..cda0000c01 100755
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
@@ -199,12 +199,13 @@ def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
 
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
@@ -231,9 +232,12 @@ def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exc
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
@@ -265,9 +269,9 @@ def parse_args():
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
@@ -292,6 +296,9 @@ def main():
             sys.exit(1)
         outfile = open(args.outfile, "w")
 
+    if not args.direct and not args.reverse:
+        args.direct = True
+
     if args.package is None:
         mode = MODE_FULL
         rootpkg = 'all'
@@ -312,13 +319,9 @@ def main():
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
 
@@ -330,23 +333,33 @@ def main():
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
-
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
+                           direct, draw_graph, 0, args.depth, rootpkg, colors)
+
+    if not check_only and draw_graph:
         outfile.write("}\n")
     else:
         outfile.write("\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
