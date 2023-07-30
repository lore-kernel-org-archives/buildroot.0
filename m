Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C3EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6CF61020;
	Sun, 30 Jul 2023 21:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6CF61020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecNR0kXvAer4; Sun, 30 Jul 2023 21:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0D06101E;
	Sun, 30 Jul 2023 21:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0D06101E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD431BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76FC881A3B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76FC881A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tkWCJoO8GWC for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6BF681A34
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6BF681A34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94E7B83CF8; Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:24:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93a6c2830d2da73a40edeb83826467672392b62
X-Git-Newrev: d2a9a06092e66111f34e449371872de2d4ccde5b
X-Patchwork-Hint: ignore
Message-Id: <20230730212457.94E7B83CF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: add OpenCSD
 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2a9a06092e66111f34e449371872de2d4ccde5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the Arm CoreSight trace data Decoder support to perf.
See: https://docs.kernel.org/trace/coresight/coresight-perf.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index ee308a85df..65aba2e9fe 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -120,6 +120,13 @@ else
 PERF_MAKE_FLAGS += NO_LZMA=1
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCSD),y)
+PERF_DEPENDENCIES += opencsd
+PERF_MAKE_FLAGS += CORESIGHT=1
+# There is no "else CORESIGHT=0" case, because "perf" Makefile uses
+# bare "ifdef CORESIGHT" constructs.
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
