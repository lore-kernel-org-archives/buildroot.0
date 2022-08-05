Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C2C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD2760AF2;
	Fri,  5 Aug 2022 16:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD2760AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5-nOr1RizQ2; Fri,  5 Aug 2022 16:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED4760A89;
	Fri,  5 Aug 2022 16:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED4760A89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534361BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E68B4022F
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E68B4022F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EOyTiGXMjQe for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 459DE40228
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 459DE40228
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3850786EA3; Fri,  5 Aug 2022 16:39:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Aug 2022 18:52:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 416e5fac062df6bcd5bb2872004c750714c7980e
X-Git-Newrev: 230bbfc22068ae607f3706460c85d3a2886b9634
X-Patchwork-Hint: ignore
Message-Id: <20220805163917.3850786EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: add option to build
 seatd-based launcher
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

commit: https://git.buildroot.net/buildroot/commit/?id=230bbfc22068ae607f3706460c85d3a2886b9634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 10, the weston-launch command has been deprecated, and
can only be built with -Ddeprecated-weston-launch=true, which
Buildroot does not do.

So the only launcher currently available is logind, provided by
systemd.

But weston provides an alternate way, based on the seatd daemon. This
commit enables this possibility by adding an optional dependency on
BR2_PACKAGE_SEATD and using -Dlauncher-libseat=true.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 76df9bf2dd..e6c54ee7aa 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -35,6 +35,13 @@ else
 WESTON_CONF_OPTS += -Dlauncher-logind=false
 endif
 
+ifeq ($(BR2_PACKAGE_SEATD),y)
+WESTON_CONF_OPTS += -Dlauncher-libseat=true
+WESTON_DEPENDENCIES += seatd
+else
+WESTON_CONF_OPTS += -Dlauncher-libseat=false
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
