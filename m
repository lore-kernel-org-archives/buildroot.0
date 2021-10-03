Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F37C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAF361AF9
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EAF361AF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC5641571;
	Sun,  3 Oct 2021 16:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQC0sEynHMr3; Sun,  3 Oct 2021 16:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F6340707;
	Sun,  3 Oct 2021 16:30:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA8351BF59A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA65F60B5B
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBvIgRNyMpRd for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 16:30:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20F9B60B37
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C4A6A8DBF4; Sun,  3 Oct 2021 16:27:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 18:26:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf17dc309fefefdaf2fce572d9f38aa7e9b8a325
X-Git-Newrev: 8b8a8476d3ff435b210bc28d4526e78eb8f6f7ed
X-Patchwork-Hint: ignore
Message-Id: <20211003162747.C4A6A8DBF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: depend on ncurses when
 available
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b8a8476d3ff435b210bc28d4526e78eb8f6f7ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ncursesw is enabled depend on ncurses so that pw-top is built.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6cbe1605f..b88f129055 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -101,6 +101,10 @@ else
 PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PIPEWIRE_DEPENDENCIES += ncurses
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_V4L2),y)
 PIPEWIRE_CONF_OPTS += -Dv4l2=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
