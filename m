Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C71C27C76
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 23:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D807404AB;
	Sun, 22 Jan 2023 23:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D807404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Vp9QsV0H_iY; Sun, 22 Jan 2023 23:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DCED401F1;
	Sun, 22 Jan 2023 23:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DCED401F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4301BF3CA
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 23:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF31481E56
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 23:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF31481E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EH50B9pQ78hH for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 23:49:38 +0000 (UTC)
X-Greylist: delayed 00:06:16 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B328581E54
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B328581E54
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 23:49:37 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 222D620265;
 Sun, 22 Jan 2023 18:43:25 -0500 (EST)
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 00:43:08 +0100
Message-Id: <20230122234309.2111129-2-me@stevenhay.com>
In-Reply-To: <20230122234309.2111129-1-me@stevenhay.com>
References: <20230122234309.2111129-1-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674431005;
 bh=tJVeTwnS7SdFDBX+nCvy12ofb+Zm6CFHkQO1aLqUih8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GHE7HQt3jRWGSx4SqDs6rZuMbWIIqnpD8PcC/2woV4K+rNsrKZOGAYOeyX3CLESBE
 Ynhb9rVvncfz2LkhPIs5WlDBZ+sn5W4OyoavWhTZ2DuRPd9MZY1Dv2afMH4vLPjBoz
 Ur2lN7fWmqRVazxXrE/qGONKXuWHGcaNlR4sqDoAroKEbdLx9c/bUt8UsAojMXGMVc
 Nk6b0AeIKyuFOZW7meOTjYaLZdcF5pA4EnlSW2NHVa0YBm4FUH9a0VBrncqv/A4/ks
 my0FFclntO1UCCESgjuPNcsZjEYKARTZEnMtyKo28sq3ZFARHomKD5RsT88x3U3W0q
 PFG5+JKkXZ7uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=GHE7HQt3
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
Cc: Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Steve Hay <me@stevenhay.com>
---
 support/scripts/graph-depends | 55 +++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3e3373950f..91aaf5d867 100755
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
@@ -267,7 +274,7 @@ def parse_args():
                         help="Draw (do not draw) transitive dependencies")
     parser.add_argument("--direct", dest="direct", action='store_true', default=True,
                         help="Draw direct dependencies (the default)")
-    parser.add_argument("--reverse", dest="direct", action='store_false',
+    parser.add_argument("--reverse", dest="reverse", action='store_true', default=False,
                         help="Draw reverse dependencies")
     parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
                         help="Quiet")
@@ -330,21 +337,37 @@ def main():
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
     if draw_graph:
         outfile.write("digraph G {\n")
 
-    print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                   arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
+
+    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
+
+    # forward
+    if args.direct:
+        dict_deps = deps
+        direct = True
+        #arrow_dir = "forward" # hack
+        check_circular_deps(dict_deps)
+        if check_only:
+            sys.exit(0)
+        dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
+        print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
+                       direct, draw_graph, 0, args.depth, rootpkg, colors)
+
+    # reverse
+    if args.reverse:
+        dict_deps = rdeps
+        direct = False
+        #arrow_dir = "back" # hack
+        check_circular_deps(dict_deps)
+        if check_only:
+            sys.exit(0)
+        dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, direct)
+        print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
+                       direct, draw_graph, 0, args.depth, rootpkg, colors)
 
     if draw_graph:
         outfile.write("}\n")
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
