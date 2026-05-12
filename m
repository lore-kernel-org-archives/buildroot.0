Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E864CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 10:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C1040EA1;
	Tue, 12 May 2026 10:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzIAv2f_sGGo; Tue, 12 May 2026 10:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B105940E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778581984;
	bh=S9ANW2YyIy2Ka7z9afJsqvYoac8pgx5/Rzq/opKOu44=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CECvTkwZXaeoiFyJNqv0X4000yMWBlG0qyq9Ttw4q+Jd6hWZSzw/ca2LPtUydNNl3
	 3E9Wdi4FYH2N0UHHGVCTzM/gXQhTGCihlXQ8GtAdzJdbt57qc3wySdlyJC2zTyRz8i
	 Vu45e7vpaPJmy8hoFCDZUUOt8nM0stB9OINHfhrMDp545EH3FvoPcQvkfP85uTt44w
	 fMzGA6UCyAb9/XrisNpt9clJxzU7FIh/Ofz+OHb75FXKfBgDHAZ+riBL3uaYgh2Eqf
	 UtfiRJ7/epkxHkekMKZKtjU2ghlCb3DJwLHFwoWzWCagvSmPNlH5Z0olxZI+g5GPCQ
	 AtjsM+O4NZRhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B105940E91;
	Tue, 12 May 2026 10:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0545615F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF09B82083
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppPzGHIMDeYf for <buildroot@buildroot.org>;
 Tue, 12 May 2026 10:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F153181FFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F153181FFC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F153181FFC
 for <buildroot@busybox.net>; Tue, 12 May 2026 10:33:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso37009435e9.0
 for <buildroot@busybox.net>; Tue, 12 May 2026 03:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778581981; x=1779186781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MziFjXcORd5+JHBPEWcxt0JYRwjetyyD69DuG1XOubQ=;
 b=i1Vrtm2fFvsV1t/46nLlPN4PDVmdqpLjpnF6B8by3SXj3g+ZYVWwrVu4PKeaox3ghm
 b7dHcLnWT0OSbllgnocSCYDvexfQewXtIbHt14gzKIPuzYrqFVVOSe9BL0xWma0bRWip
 465HAL6rNrCAYst/adJjmiD3g0Bc/7a+2Wa2I6Pp2raNIQ3kmLGZCxumlBR269kFQ24/
 Y+3YAWhktGsC8JedH2SEvyyidn/EBpKlcBO+I5eCwL9f7X7dGQLCCfpRt+V0wZU7sroP
 y6LlEazTra4vyAQAmCneiYdnDAdBTgCBo7ZXul5dtsEEXtkZJuSgr/cyG3BnANZHw29J
 jajQ==
X-Gm-Message-State: AOJu0YwM/xiejEsAm1/H0LV/8V+Mc6XfoBfR0tsJ1+nuxWEVVCOqPq40
 hLFmncCpJdfeb3Eap2wHq61B9+aYtq6UXTDveBmiPpk5cxQtvLZbmj+9P5KXYLy4pLNNw90duui
 ifRwWHQ7Y
X-Gm-Gg: Acq92OF9kHNVKNtPpDLpTD7zosrIU8DnAK0C3C/1qOBuox2vjM2J11hArbJPg96z7G0
 59jxmbHikkwXDih3vRCmOcgDtfpMBQbJ13sJvx7Ea1oXEusalmzTWWHMeznnuB+8xAOPDKOtXpF
 T6UTrygzLBGY8pD4gYFRnCVaAvFTz3soys4bXkgfkxNIardMySRX2P+nmfXP2XvJsps+vKN2Uh6
 L9BL7/TDPMrzDMPgHZHG9z1q/o86qTsKIEqWOMslHbC62aLjNRhuiQ5EqIXr6S/qP/Gom7JgE1+
 o3LMc84iNYX2VSibYzrUXaywBdSFp/x06U6cAkvbTaNE4FRNDDqBnXTYr1fmlCFh4VdlidNMMSF
 9aTvM2uTf5v+Rbiw8U5Gk+kTpS6CxGihH8RafmZpq/60f03z8vpxY5Ejbric/rHtKbfB9c7XJrO
 gEf4PNDXPp6JfNECsoz4UmCBJDs015iCUAfgJq/xSNcXr1EZV7iw==
X-Received: by 2002:a05:600c:c08b:b0:48e:51f8:eb39 with SMTP id
 5b1f17b1804b1-48e676c1455mr193099845e9.28.1778581979378; 
 Tue, 12 May 2026 03:32:59 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491304505sm31864499f8f.22.2026.05.12.03.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 03:32:59 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Tue, 12 May 2026 12:32:54 +0200
Message-ID: <20260512103255.311522-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1778581981; x=1779186781; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MziFjXcORd5+JHBPEWcxt0JYRwjetyyD69DuG1XOubQ=;
 b=JELmvBdL7qXdnv4K7FKHJLNmSkFn5St3UltZyzcSdct02C4Af4NISavumjcyD+hNe/
 hLAodrSciPzkxeewc71rxlIT6zHYnAWkhfaHQPmEVsbLljJr3doK4dIVrA1Lq+ZC1D24
 SgO02CF6tIU4oBE4sUhpni7pKi0GzSRmcd5cni5Af95Bl/kt1VTs+s5uE/3lQuRS9TkF
 mz7+2wEHuGF+jqD767eJHCQ17whGHgIP+0QMM2rjdw0NWGxy7NzmABIZ0r8/bQs/kDuA
 PmIzsO2PDKl1F5l+vdG1IImam1qnGBTaCFgMNy4lhmtylxhUmUK73N8SkxBkagYoFlQv
 uR7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=JELmvBdL
Subject: [Buildroot] [PATCH] package/opendoas: fix install mode
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/opendoas/opendoas.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
index 06626508f..f8421e8c7 100644
--- a/package/opendoas/opendoas.mk
+++ b/package/opendoas/opendoas.mk
@@ -50,7 +50,7 @@ define OPENDOAS_BUILD_CMDS
 endef
 
 define OPENDOAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
+	$(INSTALL) -D -m 04755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 	$(OPENDOAS_INSTALL_PAM_CONF)
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
