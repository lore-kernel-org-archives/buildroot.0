Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC08FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 23:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2FD60BF1;
	Sat,  9 Apr 2022 23:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IChwH06_FAp2; Sat,  9 Apr 2022 23:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4568460AF4;
	Sat,  9 Apr 2022 23:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3C531BF4DB
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 23:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF3984296
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 23:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="E6Jvk/5k";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="ZyYdZshn"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMK0akAPVaTc for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 23:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C59E884291
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 23:06:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4B16B3200E86;
 Sat,  9 Apr 2022 19:06:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 09 Apr 2022 19:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=FJPv9qS3QAp7mNtAol455h6H6nrixXuvZNGY7K
 2e/WY=; b=E6Jvk/5kEWnacxq9pUCrKiTKEDQj5JppAmiNRspupvzRr2QnFbCCLO
 rYxS9rvMEjUxwnPlDLlMNFWjVx4TNwLRaHcDd0JrDGbmDg1ifT4FL22O3omcdW+S
 c2KqVE1Br2kNAoQbt2m0j7GFi3NrveGgs/AAXqKVp3EkY0whKyz7frbpgSsqbpTR
 K17dMNEImyw6jGakU2MeZ29YgEXZAWaE/Xb/4X2DP/7FMqBSTUtqLENBHYvDHVT2
 2sPDsRlz+FHjE0Ffyzsf4MT3w7T6+9/9OFVqLiLF0IXDtx5h5fgO/pHMt6KRiutb
 5RwTk94AujAHffNK7WYrFGnGGMQ9x8SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FJPv9q
 S3QAp7mNtAol455h6H6nrixXuvZNGY7K2e/WY=; b=ZyYdZshn+PsmuaGmLxbKQz
 avkYx0mK1TNut2C4tG/Ty1OlGEZUAgDwdQx/nrHgUeJ7jyVrt6E2j0L8neZ+qE60
 3nZ30l9+x8ZhGVsAUL1ucIH0NtTnbLNIK2rvzafcfWhLGe0311dGBCHGalAtMkwo
 T+zvJ+tzw3ZGpU+onDdCEaeOf1G5CLWFgK26OPX5FtUjI3VCnfO4AWLP7SRg4+sM
 WisVVdD8WuK1/xJU8egwRxgsy3kdPGjXmqZVEE2A8lql/L6KApUTBzJSIVA4WuJi
 cKmlmqsVDaSFYr87j3DqmE4rJ+rYZ/s0klWBAs1s/T85wG4/HYM4tLrmUafe4goQ
 ==
X-ME-Sender: <xms:hxFSYl_NsLeZASUrljb1jdglTolurmfHRUliARpiVvaOCOR8s1zoFA>
 <xme:hxFSYpvnVAzOd5JNObpWwyH3VuDFgSrO-j3qEM59LF48yaBGdQQsM77vhpyVVwUJF
 YHYy-xXRz-qU3aq>
X-ME-Received: <xmr:hxFSYjA3gGxJl3YETLHBiXFl2OCKu-MdPxiWXZ19uQif_9bIjaudcDTcewDmE-Kzs-WKJUguT0CC6y_-GQsWaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukffogggtgfesthejredtredtvdenucfhrhhomhepffgrnhhilhho
 uceomhgrihhlsegusghrghhnrdgthheqnecuggftrfgrthhtvghrnhepteeukefgteehie
 elkeeitdevieeifefgvefggeejkeeuffefvdevhfekteelgffgnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:hxFSYpcLUCmrykmi75t4-ZiAX8MfZuRIfRZ0HCoegIoZ-bvP-Hrwlg>
 <xmx:hxFSYqNd9l5TT_16rPl7Gd9MwASjsjDI5E4GYYfgK_9qPplSrCGPSw>
 <xmx:hxFSYrnsMPTth4r2s4EH3SWBTQLdtzLk5jkQwbHQRgTTv9G2Dfh0Aw>
 <xmx:hxFSYjZcRMT_oq1mpSinTlAAlP_6Su2c7-48Hmbg3EpzDwhe6leBMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Apr 2022 19:06:46 -0400 (EDT)
Date: Sun, 10 Apr 2022 01:06:39 +0200
From: Danilo <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220410010640.1fdc8ada@c3po>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: Add systemd service
 file
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 package/janus-gateway/janus-gateway.mk      |  5 +++++
 package/janus-gateway/janus-gateway.service | 13 +++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/janus-gateway/janus-gateway.service

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 84ca0bc116..381843a0af 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -131,4 +131,9 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-systemd-sockets
 endif

+define JANUS_GATEWAY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/janus-gateway/janus-gateway.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/janus-gateway.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/janus-gateway/janus-gateway.service b/package/janus-gateway/janus-gateway.service
new file mode 100644
index 0000000000..6e6bc7f017
--- /dev/null
+++ b/package/janus-gateway/janus-gateway.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Janus WebRTC Gateway
+Wants=network.target
+StartLimitIntervalSec=0
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/janus
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
--
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
