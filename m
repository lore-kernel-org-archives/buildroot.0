Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA21C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A03F4016A;
	Tue, 11 Jan 2022 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT9ExXQv1Fqq; Tue, 11 Jan 2022 21:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F7E408FE;
	Tue, 11 Jan 2022 21:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69FCC1BF427
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57BC783E68
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDsjsw5lRFez for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6AD583E66
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641935127;
 bh=dX2qcWYYm+64h3htrx5mLP8pNoL1FKTENeGSBGau2hg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Dh1iYgYjpWXalNwOjnMw8Y6sHawRg48Ru3NyGmU5+u/wlvBWjuL1wEAhVzZnqSRqG
 MK19tqNVP7Oabp80SOjiFXU80597yQGH3PY134i2bzQHPGEKWEmqUmJIuRmE/P30o7
 BZoEcW17d67Pmqi9rUwBFheIPiRYO+Eeq4BYSJXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MwwZd-1mA3bw1ewt-00yTOX for <buildroot@buildroot.org>; Tue, 11 Jan 2022
 22:05:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:05:26 +0100
Message-Id: <20220111210526.23536-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:e6fd0e3eaybmcE2sZdz5KJIVO1cx3x9G0KD8oF6SOqrFwaqByLe
 8rsodq5izZv4gk9WTfu3ThFvuN8NlxIrpoU9lbJqMjomqU3yrDVBkYd5lzXdJARtcxd74aU
 lH7CfkzR/SbQq+4JWinctFPYBpFcncR5A7pqRHheMiWN22eUDopCCZ+oAsjGSb2wmbnlp3U
 C/YV+PbKUTgql7Pv3VQEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WQyKRbFrFI8=:PeOPjhEyz9z+sUDXKXALx+
 DbG7H5Kek7Xd5Kn45eQ20VnNiNi+7oBZYzNIWEIkrI6Bhhdz1Mxnga+wDparSctLv6oqQVoqk
 9+NWmMM+6gJ+oZXIn/vexg1v5uMa7FvS/khIcQxiRfSeetKMPHKthMyo+PQP1Lm2W2SgSv0nz
 Qp/vI9yKubonHD2Nbss1w7cGdzLXEHOldFX+3+aeIdEH/XGOVlfchFgHbDqYNIS0Q/0waFy3p
 THZF6CBSzHyMUodBK6RggYhj+q4SE6VNaOR6ylrHE+M7Q8K2S0PyS4+miZGzJ5kaTKabAwDc2
 3C5eaUWqzzqRANtkkjCj146paaP5udNbIqppjk+ulG3eR2KvmmTTgCS/Pl+0K8rwfpGWKtORP
 dXaC2e/nQeZMf1sDEpk64I7+bNkeYzScxo6AkDcqT9aIBFTATFcPZfWebWWXkT7VFP16Sk6sp
 z358dIEO5Ax0XbUTMrYdi6m28tUh0/CqIFKcymRxZQc/eS4ZbBw9maak7iSspQmdh7c7N7Tqr
 0UHeLF7DCWENQssuHNDW/vcbamfturOXfjQqr9yzo4W51LOhsu7SdN601mSZySOXhjabUCHag
 8sv0DPRYUtad0aP6d3neVYVov6S2TYHAkp6lq2/DLBCtM4bApueSEjvx3M+cTHgupelF35W26
 rj6VuGc0w9/10iR5o+InsskLXUF6ZybYejAqSbSJdkUB/ykq87FDuJ4GX3VeSXiMDYWflD8GW
 9ORFU2qO3w+yRC4g/nnF3+JKsfFb6xJ73OyPHwte7X0IY29R0T5BIw2fCayQXT2QxgLxIBz28
 rAkD39vKKxH60tJFsfE82lwuw7NJALXwHza3Spe3Ao4BPYsizJmfGqHsO95Gz+BKCq5O+kpYH
 R2Op0hJWdnPecwRHovYaSbOx5uXK7Nd7agJKzZmdTM4rkSF2vET4OMZeozyxI04cUcq6i5jFy
 K7/blDD31fK5pknoC1uWpCCJWU4NbpvApjjGoVlakk/3e0q6UkBs0IH1+cDwxSf2EgU/d3VKc
 g5bX68A+pDAUbH4XRy9JfIdJEfL9rA7kub0XXWDGDIqU9jNpc/8pMI8VpaQWXCOwlmy4syiqC
 XrJ89IvAkswtp4=
Subject: [Buildroot] [PATCH v1] package/imagemagick: bump version to 7.1.0-19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/ImageMagick/ImageMagick/blob/main/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index b787643fde..278becd2ab 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc454be622724c6224fa6c8230bb9c50191a05fbf05b9c9c25aa3e5497090b83  imagemagick-7.0.11-13.tar.gz
+sha256  385ca5bd8ce9b37e685779c46868171af949265c9db40067c1c4d7442dbc723e  imagemagick-7.1.0-19.tar.gz
 sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a6eaf99887..64a530c6d2 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.11-13
+IMAGEMAGICK_VERSION = 7.1.0-19
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
