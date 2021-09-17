Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B55C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:28:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E45B60FED
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E45B60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=open-music-kontrollers.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E234074A;
	Fri, 17 Sep 2021 13:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOQb8IQ5KAu5; Fri, 17 Sep 2021 13:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0D340744;
	Fri, 17 Sep 2021 13:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63F061BF369
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5041960B8B
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=open-music-kontrollers.ch
 header.b="Lsjo2i08"; dkim=pass (2048-bit key)
 header.d=messagingengine.com header.b="YFHsiz5r"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QmagCzn6MoW for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 13:28:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B72EA60616
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 13:28:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 204843200940
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 09:28:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 09:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 open-music-kontrollers.ch; h=from:to:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm1; bh=rEc9uvXAc4ort
 5w0kV2145Pz+/ZL7IdRaaIxo+EztIU=; b=Lsjo2i08Bx48k1Eo1y0aSqnS+MX72
 qvwP5OtGZ2MbmoWtGPzI6fxLDL1Cx3cdCb/3IaPPZEynObqxZAlt+8urXcj0gq4z
 C687jkZfQWmGXnsc7abz3XuXp3K871GYOqhQDmWTd4V4rsMYWfCagthzww+SwsTD
 RJnZA5JCV8+D33DIx6wq56wkKShcOEbFDlrn992DuLScwMSfuKujFYLh/BEN/VdP
 7cJanQ0G50gO9M8dEPWRRdYxmOpCnizwdHQy/VX/t6qRj/IEA2ZHtZrHWK4sbxOM
 uFQvG5Q8IcxaiRQvE+ju+YgcRsT6tPjgXEzJeFyPQjn0av9aP33oax02A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rEc9uvXAc4ort5w0k
 V2145Pz+/ZL7IdRaaIxo+EztIU=; b=YFHsiz5rop8ZzoAeZoN7lV/7ds0qneYSl
 nFqLAGqF3kjZd4NpR1xIMZU54c1i15hHNoS4rylBj67I0p6526l7pBNQ7TrhGchN
 B4lRwThpgbvzmFW3wcoBob65ibla/LgrIirFeDfT1+HEszas1YMyxgXa6TyY+M6M
 +1Bg5D2blEh/rUtll+VVO34MS9Q94K8FVtsgAjk5wlsPnCwKztVclDoEcUcIrS0p
 O82gJ1y+CwYX5zuCp3CPZPuPQJNL7KcDkeeT6fSLCeVLks4Z/0shMJNpAtVaR4K9
 SUt+hQGAyeGPnkUjFFoZCKf8qeYhFy91HKBoC9uCNSDoNDzmHGC4g==
X-ME-Sender: <xms:BphEYXxkwM-_mdROgkI6ttuJ9J4hFnr34Zw38l-qZUE-mI8vqzOuAA>
 <xme:BphEYfRMeMGEMmQsbXtqkDQx_w-ru5vEFw8uVSwAEFDS72fwqjAdF0x6wzjQku0E7
 eoB-1cDFgHrges>
X-ME-Received: <xmr:BphEYRVUrPVbPuh9j7zdo1Sb5rdt7xkf8u1QYBlO7EAfBpWZqSHj4Z0NpS7WLYkL9U2_NYB6vQAm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepjfgrnhhsphgvthgvrhcurfhorhhtnhgvrhcuoeguvghvsehophgv
 nhdqmhhushhitgdqkhhonhhtrhholhhlvghrshdrtghhqeenucggtffrrghtthgvrhhnpe
 dvheeuleeiieevgffhhfdtheelffeifeduudfhgeekteehvefgtdfhleeikeegieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghvsehoph
 gvnhdqmhhushhitgdqkhhonhhtrhholhhlvghrshdrtghh
X-ME-Proxy: <xmx:BphEYRgXKmx0fPi3FWz5RlxwqAT8ooyjCeBpPJcdDIVKwzoeWTDl7w>
 <xmx:BphEYZApDzXfRDAUEaT_3JNcS1oTy7-EwXmFJkRyU6SukkpqqfwrKQ>
 <xmx:BphEYaKucujyS4R4qtC9l2OIQ3J2QsCM6ORZ36Mq95-j7KKg_-o49A>
 <xmx:BphEYU-qVcMhSj5loMhI5atIC_XATd7uhRe3sv6boTY4hAEORiUoGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Fri, 17 Sep 2021 09:28:38 -0400 (EDT)
From: Hanspeter Portner <dev@open-music-kontrollers.ch>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 15:28:35 +0200
Message-Id: <20210917132835.33227-1-dev@open-music-kontrollers.ch>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] freescale: add support for Image.gz to
 post-image
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

For the i.MX8 often an Image.gz is built. With these changes, if
BR2_LINUX_KERNEL_IMAGEGZ=y, the correct Image.gz file is now put into
the generated image instead of falling back to the non-existent zImage.

Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
---
 board/freescale/common/imx/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 3bb482debd..d36f82917e 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -25,6 +25,8 @@ linux_image()
 		echo "\"uImage\""
 	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
 		echo "\"Image\""
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
+		echo "\"Image.gz\""
 	else
 		echo "\"zImage\""
 	fi
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
