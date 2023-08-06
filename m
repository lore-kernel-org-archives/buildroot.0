Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7ABEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBCD440B31;
	Mon, 21 Aug 2023 20:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCD440B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qif90-rUNT_W; Mon, 21 Aug 2023 20:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 327B540BE5;
	Mon, 21 Aug 2023 20:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327B540BE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2FB1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEDBB415A6
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEDBB415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-TMyGP0Z2rD for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E34B4410C5
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34B4410C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2F6186029; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 22:13:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 876a365ea2a1c48477eabfe3ae600a9d48f1b4ab
X-Git-Newrev: 6cdb48a0482a093dcdf73d0d748f5435262515ab
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.D2F6186029@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: ensure expat is
 enabled when BR2_PACKAGE_MPD_UPNP_NPUPNP=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cdb48a0482a093dcdf73d0d748f5435262515ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Just like BR2_PACKAGE_MPD_UPNP_PUPNP needs expat and curl support,
BR2_PACKAGE_MPD_UPNP_NPUPNP also needs expat and curl. curl was
already selected, but not expat. It didn't cause any visible issue, as
BR2_PACKAGE_MPD_UPNP_NPUPNP selects BR2_PACKAGE_LIBNPUPNP, which
itself select BR2_PACKAGE_EXPAT. But as mpd directly checks for the
availability of expat, it makes sense to also select it directly.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[Thomas: extracted from a larger patch at
https://patchwork.ozlabs.org/project/buildroot/patch/20221005091032.3014-5-br015@umbiko.net/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 1 +
 package/mpd/mpd.mk    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f350b7e72a..902a3da779 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -407,6 +407,7 @@ config BR2_PACKAGE_MPD_UPNP_PUPNP
 
 config BR2_PACKAGE_MPD_UPNP_NPUPNP
 	bool "npupnp"
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBNPUPNP
 	select BR2_PACKAGE_MPD_CURL
 	help
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 0205208946..4b737c715c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -312,6 +312,7 @@ MPD_DEPENDENCIES += \
 MPD_CONF_OPTS += -Dupnp=pupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
 MPD_DEPENDENCIES += \
+	expat \
 	libnpupnp
 MPD_CONF_OPTS += -Dupnp=npupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
