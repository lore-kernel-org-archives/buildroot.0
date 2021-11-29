Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B10C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3B1828DF;
	Mon, 29 Nov 2021 07:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfGHC6avWMdA; Mon, 29 Nov 2021 07:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18DC68175E;
	Mon, 29 Nov 2021 07:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6B01BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67344409FE
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3lptP5om_jE for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53B9B409FD
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:21:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so15967279wmj.5
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWXJuCbOAnJkVoX8ySntLH2XCrKKgRAyn9LQcJzSIAo=;
 b=ClySfWig9y6N5fPf/kmsY+FJIiCcmm7opZIFsoO5O7kWXN6phJs0jsFsS7GP7xCjXm
 8bbCMqItd/P2uFYLws9MQOPFHMt9lH6R15k/ZjIeDRvulLqdx1KqS620FvXywgtqymLs
 p83WBhdnaGfXi2+uXzs1X9E9JBajlNv0Ey5NESZrc0gJtwd/IWF5ASO16VIyXNlKz3z2
 a1O/1j6YITfagR2hzaZRqPBjf0YgJ82pqmf8tVpVK97PDd15gmgB6iWR0S1YnjjhtPlz
 EilTQ1u2B+Slxtzpl9ZFkaxJP3wG9CP+FqSIm66tQBFKHbJt0NlI03rclICwUg/PK/w9
 qoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWXJuCbOAnJkVoX8ySntLH2XCrKKgRAyn9LQcJzSIAo=;
 b=kwcv7HQ0QHX+itm92l2e+vIsz9k/Kn43RjHQCc402hgpp6ai1bYFfvyoE50QpQt3I2
 N2OWX/hfos30mf9fWhf9Cz6Cr0TlhOzhUEgQI5zaIsheGvfuhP84M8NryYiqxZsbi9le
 HHbG8h3zPPtIEWiA7Ti9l8vtdVCS/0o+7jAuxUX1cfaF+9udUC921fM0LP6PVIrWcOOe
 zSkVIukDiR0VwoMOJ9295lSvPblhlpZ2mjNknHkjZDnRkFiirWKai1YXT9CvADptm83T
 FMgfDMPxV+XWpQQ7a7Cgvwl3VtZFRdjDcO12ugD+Yc5fGGEKMviyH8lwg6R+OLgQ9lTI
 1tBw==
X-Gm-Message-State: AOAM530i4nI0Vpl3QRqnczA4UFFBgTTUBbp/yfaWVEYcCrA6/zKyqCE8
 XG1BCyY1yM3BA2qGkfJe8HoeEALUpeA=
X-Google-Smtp-Source: ABdhPJwXZiq1hbGrLHgkaoeukbOdjsFbLIvo2kl1m9Gn0kjvsEcPzFuMaB2aCeUYY0LYQxOIzrCrmQ==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr34784183wmk.31.1638170509410; 
 Sun, 28 Nov 2021 23:21:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g16sm7965897wmq.20.2021.11.28.23.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:21:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 08:19:17 +0100
Message-Id: <20211129071917.2177099-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: drop spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
a3883964a3468a226fffe01f69a361621a3819a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/resiprocate/resiprocate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index b31712b41b..58b942465c 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RESIPROCATE_VERSION = 1.12.0
-RESIPROCATE_SITE =  https://www.resiprocate.org/files/pub/reSIProcate/releases
+RESIPROCATE_SITE = https://www.resiprocate.org/files/pub/reSIProcate/releases
 # For complete details see https://www.resiprocate.org/License
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
