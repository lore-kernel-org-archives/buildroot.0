Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EADC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9F88271A;
	Mon,  4 Apr 2022 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAUf9bc_wMKK; Mon,  4 Apr 2022 19:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B823181AAB;
	Mon,  4 Apr 2022 19:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8101BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8905340984
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsH8N54GX6QX for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B97240977
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EADD082970; Mon,  4 Apr 2022 19:37:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:43:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0ffdb2bdd22432f6f269a43ceaf7f1e51d535b5
X-Git-Newrev: 441bd6c4691bb514e157a1416ce926432086b1ab
X-Patchwork-Hint: ignore
Message-Id: <20220404193732.EADD082970@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstd: fix build with
 gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=441bd6c4691bb514e157a1416ce926432086b1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 0.14.0 in commit a334b9a7668ba412cb2da79b75a019cd89985145 and
https://github.com/RidgeRun/gstd-1.x/commit/e83c94920bb33846ff0642dcf070fc5fd124e4f6:

../libgstd/libgstd.c: In function 'gstd_set_ipc':
../libgstd/libgstd.c:119:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (gint ipc_idx = 0; ipc_idx < num_ipcs; ipc_idx++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/00ad1b8979000aa10a20228c998389bc913cbbd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gstd/gstd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 08a29f26ff..817e9143ae 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -28,6 +28,8 @@ GSTD_CONF_OPTS = \
 	-Dwith-gstd-logstatedir=/var/log/gstd \
 	-Dwith-gstd-systemddir=/usr/lib/systemd/system
 
+GSTD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
 GSTD_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
