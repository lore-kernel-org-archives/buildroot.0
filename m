Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D456C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B78461041
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B78461041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C68760622;
	Sat, 25 Sep 2021 21:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yI1SnZq28X27; Sat, 25 Sep 2021 21:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB1A605F9;
	Sat, 25 Sep 2021 21:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF2F01BF33B
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C885E80FF4
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdxWnqM4eSR1 for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 21:24:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC5EE80E5E
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 21:24:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t28so25122203wra.7
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76TlHzEAp59pYur1WOKp2qGOs7FosiswT9ZAym3Il9g=;
 b=mGzTgU/F5TVph5HMBAOP7rRDArWhLB6CRZFo5nRafyv8STZ6/iTVZTaDyffIoG+4M5
 PXit32gkCfF4bsWzVHWmCnPxGuJh37hO81NGTQRbI6ni1MzR3lOI5u6V/il4OczGkoCE
 DQO93LmmdDvnOIHcj+QQFqbuzV3aBO5w6W9AIsxpTEmw99zxjngiHRy/4f7CUqDosWds
 s5KAnR4TVVnTia4OMn62EofDD35pxwGMRycemO/V1Rz5aXd0KKZfYLfJOZG8tb4zX2Wv
 JxcTRhlYwZpC6APJ3YgFTjvWnLHHQ3LxPN+ToVDtEe8BbYc2E7Z4nYKBS0omLJ99tFtr
 7YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=76TlHzEAp59pYur1WOKp2qGOs7FosiswT9ZAym3Il9g=;
 b=rYG1LE+jryJ9dEiS1WLFByW/F5+V9Pq7GYmMkTlbVFOurqXpAtZEmlAv/Hb6xWanTW
 wttvVV+HI0lrzLiO+/r0uajmFM8+g2kzhsGdAYLDln6MZFpVMvw5HKxFjSnxC55G0JbP
 vrq676+zp39NS0MjFpx7K5oTkMjHYjvu3xZxqvfXW8XYszxqrrfS+jl8KX7qS8z5jIdg
 Wx2OGuO8F50LtA+D4+OwxpOJKdK2iIMvD35E04BTrfu4lROdSkUYPxoJxJfMq7rVhqPv
 UxH0ZZ22Kg6HwsDO6/aK2FLVgbOI26DMMxtTpUmhw02di6UEXeHNxpHKhoRJmHFKrzEH
 Bkgg==
X-Gm-Message-State: AOAM532hPGWdWJiqCj8Ucc9vkp1gR5p9bFzM3pT24drOAWgciaIdWhtn
 oXPXU/+PiCHY5JyEEmvbTHbNO46yg14=
X-Google-Smtp-Source: ABdhPJxpoJEZyufoW5/8BddYg691Ktsd69bxESYWgd9eV11yJVmrB7lPtuFQ/k9ab+maFaxkENFheg==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr8860132wms.12.1632605072842; 
 Sat, 25 Sep 2021 14:24:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id j27sm12110933wms.6.2021.09.25.14.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 14:24:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 23:24:11 +0200
Message-Id: <20210925212411.3359812-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index b006f32bfc..6043f96f3a 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ba4b6629c107c27ab526e517bdb105612232f0965a6747f60150e5a04c2fe5a  minizip-3.0.2.tar.gz
+sha256  5f1dd0d38adbe9785cb9c4e6e47738c109d73a0afa86e58c4025ce3e2cc504ed  minizip-3.0.3.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 351aee464c..2d0f63959e 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.2
+MINIZIP_VERSION = 3.0.3
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
