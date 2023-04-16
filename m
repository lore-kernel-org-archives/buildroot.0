Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38C8C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 12:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83CCF84159;
	Sun, 16 Apr 2023 12:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83CCF84159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GaCCoZOzrbPq; Sun, 16 Apr 2023 12:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C153C82152;
	Sun, 16 Apr 2023 12:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C153C82152
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD9661C4134
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EB882102
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97EB882102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVZmFsgnLD2Q for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88548820DC
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88548820DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E14484295; Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 14:32:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4466c206212226da3d68374299989cada8d4542d
X-Git-Newrev: d9228faa4dbda084168e3c83273e651c05b6b08b
X-Patchwork-Hint: ignore
Message-Id: <20230416123430.6E14484295@busybox.osuosl.org>
Subject: [Buildroot] [git commit] doc/manual: add documentation about docker
 registry on gitlab.com
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9228faa4dbda084168e3c83273e651c05b6b08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a paragraph and an example about using the Buildroot image registry
hosted on gtilab.com, for people who want to build their own image based
on the offical one.

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-board-support.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index cd90a5871f..b3a8802452 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -54,3 +54,19 @@ utils/docker-run script and inside it issue these commands:
  $ make +<boardname>_defconfig+
  $ make
 --------------------
+
+By default, Buildroot developers use the official image hosted on the
+https://gitlab.com/buildroot.org/buildroot/container_registry/2395076[gitlab.com
+registry] and it should be convenient for most usage. If you still want
+to build your own docker image, you can base it off the official image
+as the +FROM+ directive of your own _Dockerfile_:
+
+----
+FROM registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+RUN ...
+COPY ...
+----
+
+The current version _YYYYMMDD.HHMM_ can be found in the +.gitlab-ci.yml+
+file at the top of the Buildroot source tree; all past versions are
+listed in the aforementioned registry as well.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
