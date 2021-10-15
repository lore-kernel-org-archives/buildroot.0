Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6A7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 00:39:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808E161056
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 00:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 808E161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A21B60838;
	Fri, 15 Oct 2021 00:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtdq0WqqKYKl; Fri, 15 Oct 2021 00:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA5860823;
	Fri, 15 Oct 2021 00:39:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0FAA1BF2A2
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 00:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE85E80E54
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 00:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jn7sZLq9iDl for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 00:39:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7B080E4E
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 00:39:16 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id y1so5296591plk.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 17:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2/TI6NivVKhUr1no4MAg1l5Up2bDEsBO5su2bQ3Fvk=;
 b=chw8dzYWnwP0ns/KKidUYcbXhbd07oe0Nk2hCGvItGlykZN60n9Trcc1a0cUbr6+mH
 oXKFl8JwTwwBdlR1Vte0FW4qMBf3xd8rYtpB4DM8Hj7OvN2+6+es4ObSsSWk8oiUABgW
 wS9i/rsjTqQQP0jnAIt2TCC20xooNcZyPwoZhC1HE/96xpJ06bL0pBHji2oPusv9jLzL
 W0nY3e4vrhsRUY5tAt2kLqQn5HywJ7xEjQ5X6jutW/QNK6r/KXmYJpRyIXcIB0XG50zg
 Nn5bdMfq60vEWOtWsgzDKIfxkdGf2XshyptuD4Hw1I5McvcZiBA3doMdtu/vqqta2aVu
 o5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2/TI6NivVKhUr1no4MAg1l5Up2bDEsBO5su2bQ3Fvk=;
 b=L/3xKF3zRVPY03yMTX5qM6WtrDw1Sdm811aDswkcC+iPKs6MxhJ/5UqIj4fI2HHs1n
 SG5Pt1KN6zbtm78YfY3GR4RZfUon2DXL9S96KP0r37MPWAM5E+sbKN0F2G0XdVHK68bZ
 jQBo/Wkoi/apLFrZKERBDYqlIWNLdr5EOT1gYZykchXcmj43RzshX6yGsfi4HnBt2wIG
 g3MG/DvunvIudZqln6rd+rcCZM0aNw9QBqgtZBhw6wplC/G4J1AxazqVtK1HBkJdpmC/
 RkMK8J8/q474l+juNVaK0mnOfqXhzbdTX6MpKz3P3/JK2R20s/dCnENJceOv5frwwZY2
 71pw==
X-Gm-Message-State: AOAM530O+BDq0qnhNzM+SqsvdHZ21NZGSnKbWsh1BU8+JSpGpmfNdSDF
 +nEO4X6AlhPzPZ+aifwofkggX4S0lUo=
X-Google-Smtp-Source: ABdhPJzCw9w8JqrU+5GcUsVnYX/2vsDUWQa0egNOpOJriQzg3iL1Zpm2I2q3ekCNt8HRmI0l8CRG4A==
X-Received: by 2002:a17:90b:4a8d:: with SMTP id
 lp13mr9991061pjb.32.1634258355493; 
 Thu, 14 Oct 2021 17:39:15 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id n202sm3514699pfd.160.2021.10.14.17.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 17:39:15 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 17:39:09 -0700
Message-Id: <20211015003909.2009551-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: depend on host-python3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

webkitgtk builds without issue using host-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/webkitgtk/webkitgtk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 87aeffea45..a3db249ae6 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
-WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
+WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
