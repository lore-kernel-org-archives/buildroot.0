Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA80C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26E5610CB
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F26E5610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF5A6072C;
	Thu, 28 Oct 2021 16:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgQhPTDtcTmr; Thu, 28 Oct 2021 16:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11E18607A9;
	Thu, 28 Oct 2021 16:04:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C278A1BF35D
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A5940343
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P79Le7Hl0I61 for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 16:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66AC5400D8
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 16:04:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s13so3921831wrb.3
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOTXAAnpXT4QwNAlr99vBg1qkeuwk+x0KJY4o8neeWs=;
 b=WGvUfjWWePle9acyqaQ++pwRuY4nB7Ms9lsiMnDIH5DgR3x8nkHJx9eunAEr7p/x2g
 a32Ci6pVqMIZE5KxWVwJW2d4Owdehow3RNguSAzUfS4JAD7gvNGf2YKSoex3WAeP/RN1
 yh0u356d6SwoOc30GJ56LNyHe30f3CeXXq8BcEy23ddEuRCrhlIKCytkQx8SFvpBjo/x
 cudBUo4v4pFYdr/myeHs7pCaZc0BNrToEg/j/0B7ASrU4ZQ+Oph2Dl41CUOwpZ1PM394
 Rx5jGPPJDMcuInWEf8pEmgVNmGyUrQvkT6nvq688+pZRPtqrTVw6iKdbtJlvrBHvp60u
 5mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOTXAAnpXT4QwNAlr99vBg1qkeuwk+x0KJY4o8neeWs=;
 b=wiJo8H/YcOfnKM8DJGBZVVl1IHobnudl1we+ctrTyS0LS7Agz35sk40xQDRTv3y9Yb
 VJCD29FL3mBisMzzTI6fbIODyTGGv8ekeUMET3BS4D1Ry+d7vCdUeU7XL2XcaIX8BOGX
 zSsRnOH9Gp4XZ2e9LT9Lb6EYQTL1ILrvC4Mt2a2i3Ys+CyVkK/fxY2NAG6xJeqRrTORr
 SHHrU6TsqAMaD7yWMACkwEs3NvT+IaGaqw0YHeia3nPb0jGh2Oxj4U70vbhJatHNREBu
 DhuwF98rwpPWt6gv3PDQlAyPA1mYiVCi3iHCHjJs2q74FXXY8x4HNPE+ZBP8ae6QYS+D
 xn4w==
X-Gm-Message-State: AOAM533Co82yUBNPi3tnhZfcwW/GAN6RKefAkR4lrAYzmTY4Hwm6thBg
 MBFcKXmQc8IljOimrSX8R4o79j8LN18=
X-Google-Smtp-Source: ABdhPJzwxQ0rHnZvzGCTtRNVGe67mlRuMSUjGx4RM7KadOIpx6DSKlKO+Hzncuy5n5TP1bS5H7RCjA==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr6704533wrt.57.1635437081089; 
 Thu, 28 Oct 2021 09:04:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id w10sm3331933wrq.88.2021.10.28.09.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:04:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 18:03:06 +0200
Message-Id: <20211028160307.1123157-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/netdata: add libcap optional
 dependency
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcap is an optional dependency which is enabled by default since the
addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 1c20c49dee..d66a9602e2 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -33,6 +33,13 @@ else
 NETDATA_CONF_OPTS += --disable-jsonc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+NETDATA_CONF_OPTS += --with-libcap
+NETDATA_DEPENDENCIES += libcap
+else
+NETDATA_CONF_OPTS += --without-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_NFACCT),y)
 NETDATA_CONF_OPTS += --enable-plugin-nfacct
 NETDATA_DEPENDENCIES += nfacct
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
