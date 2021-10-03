Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F5EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE7E6187D
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DE7E6187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31ABE84812;
	Sun,  3 Oct 2021 12:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjZJ8g0yCalC; Sun,  3 Oct 2021 12:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E37847FF;
	Sun,  3 Oct 2021 12:40:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF03B1BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D68ED402A2
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkYwhgeBhvWR for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:40:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2F5400F1
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:40:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so5950128wmj.2
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLV+EGeMI5H1jc7bbaA3+A5kqu8Y4s4JC4Ui+wsLRlo=;
 b=WSFkyYeReAnYEE/JxN0D6LmUISIy2uXMNw1CleJkpg4BuZG6zkhCQLaL05Swue7yms
 83OQFDbZSMr3KQdAT/dL+Y74wc0+/e3p2gA3cAo4xmPGr33l26pMroEAJD98sgD15Zv0
 M5On4ZGK+m1QFP6swqHEWNjHxF7dl1MbeYO/3wTUvIpQPfVbHweVmeEaT1NUMPqWfX09
 kHdlds4ubSbi32M2qH6SY5ICM8+DakfHnnu+0Y8/TD5nIKi1/y6vwWimXbGC/cj61897
 YqMda8CUGVFYBIuENTefbWlOo02dGYcSEK+ElwTfnpHxigmNFvZ9UE8z/FR5icYIhnZh
 9D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hLV+EGeMI5H1jc7bbaA3+A5kqu8Y4s4JC4Ui+wsLRlo=;
 b=KcbHDORvR/YKoMkxxLQORe87kpw9P0T1CtyRr81LBjGztJZa+9+YuHJ18xoYQUWNY8
 yhxPxLXQhWfmYERN/2A5M1L3ZWg+4Ew40JSvfKcnme1bPLO+7vnLw8mCwC1Onj7CiBa2
 4CRTskPiTNvXdNmUhefF5hte6RHXgxWJQC6NOWMRIQaFk4SFMQWoUDxL48RTZsDai3Ae
 vecFPOUMfX6pdobyTEpPVpk70F0ep91fCzeJDPGgccpiuTHPRau5NG17gSJel9lgjH0w
 gPFo5L9lK3IFY+ROECvzkdA1KXXggrdpoX4kok+1URGqRTuE9/8PiUX+g3+FOzdGH+as
 B7Sw==
X-Gm-Message-State: AOAM5314Zd6zj3dGgjs16TqlLz18lVPxnkyH70U8I6bPmA97O8uDyAkd
 43jwhe4BmeFCIs66NXtE1TEmoR2FtNk=
X-Google-Smtp-Source: ABdhPJxKK1q8qTu+/gthRXsr7Q307XZ8YnJUnVOqIeQus9/jXKz4rOBSqgyk4Q+xrCsfphHQ9Pmkqw==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr8544016wmh.163.1633264833539; 
 Sun, 03 Oct 2021 05:40:33 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 143sm1258704wma.37.2021.10.03.05.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 05:40:33 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:40:24 +0200
Message-Id: <20211003124027.343390-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] arch/Config.in: disable internal toolchain
 backend for csky
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to remove the gcc fork for csky, first disable
the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1853e26bb4..ab40294ddc 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,6 +77,7 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	# Most variants are supported by gcc-9+, except one that is
 	# handled as a special exception in package/gcc/Config.in.host
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
