Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77387E87843
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F6D40C9E;
	Tue,  3 Feb 2026 15:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMlB29CdhcUo; Tue,  3 Feb 2026 15:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED67940DD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133011;
	bh=wnv7KK3Fc+iN8CKS0Lubw+oSs9XoYtaR8uxFTpRs29Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A4ONg1gv+HsQE3XqxhBhXxRkZitIgRrit/jTeOwj1yzCSJmFnRhZ791NxTSrOVYg1
	 MAe1UYJ+BJcLg9t7lWG2S/Zu2hvKZIntUxDdTWBaVKv/kARR+4lWQWhMnLNs4KKeiT
	 t82CakKsfoFXS5Q5/UtqqboalaHcFDE98H+Oytxi8MhCrzyMqVaYyIMPwV9VltKYVD
	 4Z8bebZ0fMS38SVVxVtDU9n3xsp1PfDqxoEpZh05JTJRgBSxQN9RostyDcr7+ySIKd
	 KYEGU1iyRybJ6iT5BZUS2BDAFaZy3iAQm9jSAgHIQTWTCIUUU1ptdHmnU70G8irCAb
	 +QQcDT27wGUVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED67940DD0;
	Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B612F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF71140D3A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2exKCB2sHCX for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1228940BF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1228940BF7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1228940BF7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso53393495e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133007; x=1770737807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2IcbErHV4zd2nKiMa4dciLSxUxeBs3yuh1xVm+x1TsY=;
 b=t75Z+bj5NiPKYCb1XryVWupZgYYvQDMLuJ7Dwd0dICgEfPxA0ipNHV/3e4m/KeHsOx
 Lf9mJzAiHsru0B+BK8sq5FeozOr6Vz6EWCqhp+Mne2IN/YA1hsTNDLn1DpRCtuU44pJG
 iU/5SAzGkaq+aMlPNgiYN8jpVaMiCvragAAUe7A/xmPlVLAvAaouVPA8s2xQHi4oqjb7
 DskJR584tevcfIXIq0BLJ741eUKMZrxtw7LcNryo1bFOXxipqCVH9CeLgk7c368aj+Qx
 hz6xeH4cePhFN8dsAxc83+m46MqwqrWYJBtWgf2UoFMnttbXuGtgF1DygAaUz2EZhBdQ
 mGtg==
X-Gm-Message-State: AOJu0YwmWqHoxweHJCrvkzAaWRQoJCyybM3oxv2JQWvuP1i0rO4vQAAj
 +cse8zMCbguGyGyBKNZQUHT4e+QyNH0I3/VW0OdGbudZGhrWCZhPvA/X6d3WnIEj
X-Gm-Gg: AZuq6aJkxEj3eAa4YQPFR1B/d6IrHcxguQ1d0z2FxAIazUQB0Y1cd0snYS5pqxKg7mH
 AqHbujuyeZI4GArfXkIJLKo1og7Yeq5tsahdiObEaWp9Mx4qg3laYd5uT5iDpJ16HRyVio84l/X
 032i9zWUJ6A9qYULHWNxLi4Lq1A0Z9AsupdiGFKwLbBRhYHj3OKsCL+5BOBH5Bu1yIQGavh1RJT
 xc28Nyk3mOrUaQ2xuXqIiIjjXkk1URf09P3eMlTEJe1UmBMGs28T9xfq/K94+KJkHZuqgqZETSg
 n3SdZGqvzucan3Bf2yhzwMXx1MmvREEYI1YD8As3oyrardIYf7+DkEJmH+bQ9c8KZTIjUZnzpmx
 Synvy5HRUCvFPyOitJMkuvqyzBzXKtuOUPrSvGvWTH1lWOPmoN2D8Ug16tnQ/fDy+cWsw/5lTV6
 VItNPM0mbr9alTW7RCVjzCS3bwW+9STQ64SxnnIg==
X-Received: by 2002:a05:600c:8b8a:b0:47d:6140:3284 with SMTP id
 5b1f17b1804b1-4830e99572dmr226765e9.37.1770133006693; 
 Tue, 03 Feb 2026 07:36:46 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:15 -0800
Message-ID: <20260203153617.80012-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133007; x=1770737807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IcbErHV4zd2nKiMa4dciLSxUxeBs3yuh1xVm+x1TsY=;
 b=i62IER4oE1CB+fV6Yq3D+lguJ8rRkiLQPBKLQoDQfpc0+nogFRewXXrSjDWphFWr/M
 kkHo00coCF4OQj+maa9zauP8CZi6KNOma2A1TooezRR/OnWg/m63ss+WvoVBE9iXHjP9
 1xccoldwOT4Upqwuuqh6AaFCRumWvgQCi7HEatAcXBnvX4Bquwi1r6PJ545BooXxqamb
 shEVzL7T3Hg8BlJD/hQzUX4ckL5TpSRbYPweRDvHNAnby38769SwtxUuKoePuF5gEulM
 +q9+Q46j9PYYYIsiJ9zBeWkfInaWRH4AWZ+ehTmDyowJJ3fkplS7F21uDuM9PHSOsLPW
 g8Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i62IER4o
Subject: [Buildroot] [PATCH 08/10] package/imx-mkimage: bump to version
 lf-6.12.49-2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 02205def1e..4828c25eaf 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a5654229c063e4e87b5d69f47a4a913ecee51f8a817ae2346a2a407e765ed3b  imx-mkimage-lf-6.6.23-2.0.0.tar.gz
+sha256  2b0ac561798b126959167efd767a7bed7e2cca39665a3201b340b77c91dd5c6d  imx-mkimage-lf-6.12.49-2.2.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index f7396ba1b2..ac64b36ea7 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-6.6.23-2.0.0
+IMX_MKIMAGE_VERSION = lf-6.12.49-2.2.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
