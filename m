Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EBEEE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369F04093C;
	Mon, 11 Sep 2023 07:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369F04093C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ng153hfZ6IpI; Mon, 11 Sep 2023 07:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1984099B;
	Mon, 11 Sep 2023 07:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D1984099B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6811BF964
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3DA740511
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DA740511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tI77tg9vcbO for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:27:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EB74033A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6EB74033A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D658E86C3A; Mon, 11 Sep 2023 07:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:21:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1ae271d78f137c718aee096a22dff87b3fce2c66
X-Git-Newrev: b7fa53adfd284b75fce69e8b14ee838075425af8
X-Patchwork-Hint: ignore
Message-Id: <20230911072724.D658E86C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mpd: ensure expat
 is enabled when BR2_PACKAGE_MPD_UPNP_NPUPNP=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7fa53adfd284b75fce69e8b14ee838075425af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 6cdb48a0482a093dcdf73d0d748f5435262515ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
