Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE78C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 07:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197894175D;
	Tue, 22 Mar 2022 07:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLsQc7pdVnAn; Tue, 22 Mar 2022 07:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B4F4175E;
	Tue, 22 Mar 2022 07:51:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01CAD1BF314
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F12EE40386
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3EChu587fFB for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 07:51:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6DDB400B8
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 07:51:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6AD1584F5B; Tue, 22 Mar 2022 07:42:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 08:50:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 91510a411b0124b278ebe1dc1d650a5f795f9bfa
X-Git-Newrev: 96b346cb56ccf5ef52b29d367db5149d212c45df
X-Patchwork-Hint: ignore
Message-Id: <20220322074218.6AD1584F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/graph-build-time: add support for timeline graphing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96b346cb56ccf5ef52b29d367db5149d212c45df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This commit adds support for a new type of graph, showing the timeline
of a build. It shows, with one line per package, when each of this
package steps started/ended, and therefore allows to see the
sequencing of the package builds.

For a fully serialized build like we have today, this is not super
useful (except to show that everything is serialized), but it becomes
much more useful in the context of top-level parallel build.

We chose to order the graph by the time-of-configure, as it is the
closest to the actual cascade-style of a true dependency graph, which is
tiny bit more complex to achieve properly. The actual result still looks
pretty good.

The graph-build make target is extended to also generate this new
timeline graph.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - sort by start-of-configure time
  - re-use existing colorsets (default or alternate)
  - fix python2isms
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5e8b01afd5d8d8af8f4ce334073df9b15497cf36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                         |  3 ++
 support/scripts/graph-build-time | 63 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 71f8096b71..db2ac30b10 100644
--- a/Makefile
+++ b/Makefile
@@ -873,6 +873,9 @@ graph-build: $(O)/build/build-time.log
 				   --type=pie-$(t) --input=$(<) \
 				   --output=$(GRAPHS_DIR)/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
+	./support/scripts/graph-build-time --type=timeline --input=$(<) \
+		--output=$(GRAPHS_DIR)/build.timeline.$(BR_GRAPH_OUT) \
+		$(if $(BR2_GRAPH_ALT),--alternate-colors)
 
 .PHONY: graph-depends-requirements
 graph-depends-requirements:
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 742c9a7a50..1edc3b3c00 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -241,6 +241,65 @@ def pkg_pie_time_per_step(data, output):
     plt.savefig(output)
 
 
+def pkg_timeline(data, output):
+    start = 0
+    end = 0
+
+    # Find the first timestamp and the last timestamp
+    for p in data:
+        for k, v in p.steps_start.items():
+            if start == 0 or v < start:
+                start = v
+            if end < v:
+                end = v
+
+    # Readjust all timestamps so that 0 is the start of the build
+    # instead of being Epoch
+    for p in data:
+        for k, v in p.steps_start.items():
+            p.steps_start[k] = v - start
+        for k, v in p.steps_end.items():
+            p.steps_end[k] = v - start
+
+    plt.figure()
+
+    i = 0
+    labels_names = []
+    labels_coords = []
+    # put last packages that started to configure last; this does not
+    # give the proper dependency chain, but still provides a good-enough
+    # cascade graph.
+    for p in sorted(data, reverse=True, key=lambda x: x.steps_start['configure']):
+        durations = []
+        facecolors = []
+        for step in steps:
+            if step not in p.steps_start or step not in p.steps_end:
+                continue
+            durations.append((p.steps_start[step],
+                              p.steps_end[step] - p.steps_start[step]))
+            facecolors.append(colors[steps.index(step)])
+        plt.broken_barh(durations, (i, 6), facecolors=facecolors)
+        labels_coords.append(i + 3)
+        labels_names.append(p.name)
+        i += 10
+
+    axes = plt.gcf().gca()
+
+    axes.set_ylim(0, i + 10)
+    axes.set_xlim(0, end - start)
+    axes.set_xlabel('seconds since start')
+    axes.set_yticks(labels_coords)
+    axes.set_yticklabels(labels_names)
+    axes.set_axisbelow(True)
+    axes.grid(True, linewidth=0.2, zorder=-1)
+
+    plt.gcf().subplots_adjust(left=0.2)
+
+    plt.tick_params(axis='y', which='both', labelsize=6)
+    plt.title('Timeline')
+    plt.savefig(output, dpi=300)
+
+
 # Parses the csv file passed on standard input and returns a list of
 # Package objects, filed with the duration of each step and the total
 # duration of the package.
@@ -277,7 +336,7 @@ def read_data(input_file):
 
 parser = argparse.ArgumentParser(description='Draw build time graphs')
 parser.add_argument("--type", '-t', metavar="GRAPH_TYPE",
-                    help="Type of graph (histogram, pie-packages, pie-steps)")
+                    help="Type of graph (histogram, pie-packages, pie-steps, timeline)")
 parser.add_argument("--order", '-O', metavar="GRAPH_ORDER",
                     help="Ordering of packages: build or duration (for histogram only)")
 parser.add_argument("--alternate-colors", '-c', action="store_true",
@@ -307,6 +366,8 @@ elif args.type == "pie-packages":
     pkg_pie_time_per_package(d, args.output)
 elif args.type == "pie-steps":
     pkg_pie_time_per_step(d, args.output)
+elif args.type == "timeline":
+    pkg_timeline(d, args.output)
 else:
     sys.stderr.write("Unknown type: %s\n" % args.type)
     exit(1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
