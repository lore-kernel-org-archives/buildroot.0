Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D68C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C878C610E5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C878C610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C0924033A;
	Wed,  6 Oct 2021 16:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aqevPwbUjlc; Wed,  6 Oct 2021 16:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9BB4402C8;
	Wed,  6 Oct 2021 16:12:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7551BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93CDD83AA6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQhK_mavYaIK for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:12:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0CDF83B8B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:12:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so10395278wrv.9
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69by4Z4kCnBZYS4+Aj62f8SFvrbNknuhoKDRTIBL5bI=;
 b=OTWDUrRsfS5y+QTe0fjOWQ3HUxZshQWBPx3JAfgQqDos9/x2m4sMQYXPOYcRgmLRV4
 mjR3OgHmuCFXZG0UYpbhwt4XHjjU+hk1g6l8lMdbTYElThAZWCQCnWs4bifX4tGYT3Md
 5v/12lvEYcQ1EvOsgSRm5mk6hFWSS4I6H2y6s46xWx8hanj6LrTNU9Jf5SfktAnR4Eyx
 bAf661oIrjklriH62/okAoYE252RHFR/JX1AEraJv/my4wNmGN82ZV9ypAXXJ/HdQbcM
 IX6CUtqzCsEJn1SbfhNrx5Ra8dck3GUubH1Vm336vbz5ffwUDoCWcl3xXJPAZSTwm98a
 DfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69by4Z4kCnBZYS4+Aj62f8SFvrbNknuhoKDRTIBL5bI=;
 b=lFTseCsx63sq3bEYhf56nr7CGehYkiyCM85+AX6XqittxkQvDaiNZXFJVifoj+ZObW
 XqsLmpVxiSxgY8MFJpJQ+08iSYpY+JOzNQGpmsK3tOU9J85ZWFu2p5RtM0oVe6tWyEZ5
 Gk2OZBGtafh71CiQcOdgiyjPiGqEcuxuzeRhrvm8oCkkmhqmsPIdo6hCVPPc+ib6/ApT
 GSWGfuCDv5qzWQMDhN0ABqund7vForKapme9NRvt5xJulEImVatpNqvc+XhAG4Fq859O
 7pclFKpV71RK+n+M+Aro2Yv2HuKP15bkSGPFxC3oqaLUQhib0G2FCFMTCs7ii87I827i
 NB3A==
X-Gm-Message-State: AOAM530Bt+xlqZpN/EhYBkxMbhZTqQUKq94yHnsec8kxp8ecyhoND30P
 7Gksi2SgFvaLBJw+znvc8am0nWJKids=
X-Google-Smtp-Source: ABdhPJy37HlCH9QcMa5UidvsOe1dC+KpSHq3mOKQ9nTYDak4O4+RVTnNzZwALRHLlLesgra3bejI1A==
X-Received: by 2002:a05:600c:b55:: with SMTP id
 k21mr5156286wmr.115.1633536718658; 
 Wed, 06 Oct 2021 09:11:58 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:81e4:5e5b:3505:a040])
 by smtp.gmail.com with ESMTPSA id s2sm20350388wrn.77.2021.10.06.09.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:11:58 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 19:11:45 +0300
Message-Id: <20211006161147.19864-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: depend on python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the package realease notes
(https://github.com/oauthlib/oauthlib/releases/tag/v3.1.1),
python2 isn't supported.

All the reverse dependencies are already python3-only.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-oauthlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-oauthlib/Config.in b/package/python-oauthlib/Config.in
index 65016c1d08..0084e7cbd9 100644
--- a/package/python-oauthlib/Config.in
+++ b/package/python-oauthlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_OAUTHLIB
 	bool "python-oauthlib"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A generic, spec-compliant, thorough implementation of the
 	  OAuth request-signing logic.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
