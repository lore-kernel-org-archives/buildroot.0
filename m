Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA2BC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9CFF4013F;
	Mon, 27 Jun 2022 05:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9CFF4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHPgvRH7mbFi; Mon, 27 Jun 2022 05:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 652DE4013E;
	Mon, 27 Jun 2022 05:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 652DE4013E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 325881BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E35D82F20
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E35D82F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeTo7lduprR7 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7642782EBA
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7642782EBA
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:29 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id y18so8484765iof.2
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3pKcr4pXbere26ptVZKwoupn0QENG06dqd8+k9Wb5bY=;
 b=6WScP4zC3jnXRtGaxlUJsSB3Jy6BtJ6whLZw8kBUDh2AsYt4i10mXDqSOnnG1kJ6wW
 nWIuUlUns4XQJoDLrswbj1EFDCd6hf5skJxG3gbjha8J6BUIka6I+UGc+vXad+nn/QFT
 otofeQ6zbrlKrfOa8jY+X+S1KdmgQNhstLgaZgih/xtUFsFYFuE4GypOMv//1OBRCgNV
 OiSj0GAJOnyKbXZSl92iE65h/1ZWDk+NklwCouD+zMJU+0oDL/9fjP/qYuSbq10zcVHw
 jcaXXmkbu/jZIzS7FAau3NxhCEy28rywgZAeOngEW0K22zkXqpMcPuEra+5TruNqQFVB
 gWMw==
X-Gm-Message-State: AJIora/+fM2/SKGHfk1MT3dlpnivIVMOFTbwLr/7AoiPHhFeZ/fePTb6
 AjqqKO/uN2Wo6ssABlb/fwnbQu9MAkA=
X-Google-Smtp-Source: AGRyM1v4eu3ZPuATprLSz6Lj7ajTVw7F4JfT/dl3SouZzY6xOxWdj5uhWfOUqqVCUAuK6dr1AVP0IA==
X-Received: by 2002:a02:c72d:0:b0:339:e768:845a with SMTP id
 h13-20020a02c72d000000b00339e768845amr6785307jao.56.1656308068306; 
 Sun, 26 Jun 2022 22:34:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:12 -0600
Message-Id: <20220627053422.618280-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3pKcr4pXbere26ptVZKwoupn0QENG06dqd8+k9Wb5bY=;
 b=FR+343quTOevChd4GqVReev+qxws5JM4e2txdms9zVF4ERRtskXgE8KFeNhS7Jlj2+
 9FdvSYF5C/qv21ZhCwdJ3Kpyu696GquuvGeCs3EaIsVbdL5GqgcEldHWt8ShvwRPRdB/
 z0B2FWhtbzXb7GS52v0zuBC4HOmQTHIFXBSl4SxTIUj2juz3lL1tGOfoXwdhyEXgok1t
 pfoUitkwUZvBGjzwyJhFt4QBusBbWiBWCpQMBwt3sT3kVT5DB22C5bdIeAhDUbzBI8Qt
 fhYCD8/si8n7KpfkbzmclekY3gyoiwd9NazXTsbTsb0K75CGXyW5TFLc3h6WjW+O9Roc
 E50A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FR+343qu
Subject: [Buildroot] [PATCH 02/12] package/gst1-plugins-base: bump version
 to 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 748d951966..105708f1da 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.1.tar.xz.sha256sum
-sha256  96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204  gst-plugins-base-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.3.tar.xz.sha256sum
+sha256  7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f  gst-plugins-base-1.20.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 766af88e96..c244a0c621 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.20.1
+GST1_PLUGINS_BASE_VERSION = 1.20.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
