Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86BEC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 19:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C74D81168;
	Sun, 14 Jul 2024 19:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgzy4FBkEExS; Sun, 14 Jul 2024 19:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895958116B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895958116B;
	Sun, 14 Jul 2024 19:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1ECD1BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF5D76064B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTC7v7j61cxl for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F5D605E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F5D605E0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C6C286944; Sun, 14 Jul 2024 19:38:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:31:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e1b6ab700f575226c2290c6a41db333e0b03a60
X-Git-Newrev: 0c2e6050cc7cae25dfbae1fb6795e7b21e3362d9
X-Patchwork-Hint: ignore
Message-Id: <20240714193812.9C6C286944@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/graph-depends: remove
 global done_deps variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c2e6050cc7cae25dfbae1fb6795e7b21e3362d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having done_deps as a global variable, pass it as an argument
to the print_pkg_deps function. This will allow the recursive search to
be started multiple times.

Signed-off-by: Steve Hay <me@stevenhay.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/graph-depends | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index a66fb28f41..3e3373950f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -197,12 +197,11 @@ def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
     outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
 
-done_deps = []
-
-
 # Print the dependency graph of a package
 def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                   arrow_dir, draw_graph, depth, max_depth, pkg, colors):
+                   arrow_dir, draw_graph, depth, max_depth, pkg, colors, done_deps=None):
+    if done_deps is None:
+        done_deps = []
     if pkg in done_deps:
         return
     done_deps.append(pkg)
@@ -234,7 +233,7 @@ def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exc
                 if draw_graph:
                     outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
                 print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
+                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors, done_deps)
 
 
 def parse_args():
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
