Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD26BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:34:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E7E6056B
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90E7E6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6043D814AB;
	Sat,  6 Nov 2021 15:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GextIYpySTAY; Sat,  6 Nov 2021 15:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C559B80F6F;
	Sat,  6 Nov 2021 15:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC1F91BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC6DD60661
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eb89GcNtZuSn for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:34:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BA2160625
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:34:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so18533964wrg.5
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqVHNXsAH1NleDf3d92WtFOZy0lLdmoLWdQjzlV6bV4=;
 b=qbI1tk7Yz2k0lBQEXzeMnCH2RoqC9Mjdc2Aktgz0PoW8IH1fwP8Q2dWytOJMEu4Iam
 Wvf7BX81B7YpMoGurLtQbkRIncuvb8xTipnkObNZe15Bg2RCtLg8iy3fKWHTrhP7xeJi
 HsYLEDune+i1x4krxmbz5HhMw6cxQUxeTo1bYYsRNSEpga7IM954EE5pC+HniHqTVZuX
 6SJiA05Vy2BqD+5V02gnCmG2RG6KAPX9W4PNZKvNNpVtqLx4SiT+Q7QO5y4AxrQq58zQ
 FWcOUndSSJrNaCZnQhQvThwk8wS+q8r/9iWtIq8SLLm5saLiiNoCbHCLM/+JshkHH9/e
 /wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqVHNXsAH1NleDf3d92WtFOZy0lLdmoLWdQjzlV6bV4=;
 b=pAFE3MmKkFT7llLySLRFbX7Y26JnQRrM79PiN/H3PCUvyCiulZwT9+0D2Z9XB8olcz
 ksSn9FrP0FwyiTjODGxba4ZInfSzXNH5xPFvmiOexXdlumlLBXFGEfETCUueH3olcb20
 ukfRvxX+DxafQXxq0Y0buA2izPN7XxkJOJZu2ps6QBZXxOPLX4LUXsP1wMqSahGf5UgE
 HKhxOA3jMKPFZVVSb2SCtJ/jSztcK1qUjpTBh7MgVfHBxa6veNB6I+0KOgoa2SxIQrpR
 HSBD1NSL9bWYQThIn4fKC/no+xk8wj7DRzSh5+WAMtWIXzMgpOcGpygNejCyNWpchz1S
 +XsQ==
X-Gm-Message-State: AOAM530Oh/p7EGcBxxMA/vbVmfn0jXyqu172Wsp09YxK9pfvrjWjGaa4
 CAkN1N44Aj+ddf6lqjU4rmOJy498YT0=
X-Google-Smtp-Source: ABdhPJzZdhggBXCWnAtXLDo9rrAPPk1TZWZ15UcZG3ZP0ZvsEUjhFv4EBjGBiyRSwQPQzgTQkuu8qA==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr81048358wra.138.1636212857124; 
 Sat, 06 Nov 2021 08:34:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h18sm11753253wre.46.2021.11.06.08.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:34:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:32:29 +0100
Message-Id: <20211106153229.3188523-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/armadillo: don't override
 dependencies
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override ARMADILLO_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/armadillo/armadillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index dcac2bf8cd..8661bfd9da 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -17,7 +17,7 @@ ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
 ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
 ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
-ARMADILLO_DEPENDENCIES = openblas
+ARMADILLO_DEPENDENCIES += openblas
 else
 # Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
 # added below.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
