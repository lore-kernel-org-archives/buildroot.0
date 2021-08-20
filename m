Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864C7C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:13:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29EAE60F5E
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29EAE60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C51403BD;
	Fri, 20 Aug 2021 20:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_yi7pyHEYw6; Fri, 20 Aug 2021 20:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0374255F;
	Fri, 20 Aug 2021 20:13:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0612F1BF35A
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BE581AF3
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9zh6sySvDpj for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 20:13:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8912381AEF
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 20:13:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso9831317wmb.2
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ha0aygmdQhA+vzaHVXT3Ohx8vrxFahoWpofLEJjehoY=;
 b=EmB7NxJhWiqe6mQ5GWEDHHbVg7HVWnZX3ytg98FUelB77Gh4iPKujVYGbcWPY7AD+o
 xgeAuWl1zfAiMlU/LZaOwQRvigr6aSzwC+SFr+whl6fO3SwUsmrf8fnYqT7FdrV+8qu8
 ZICmc01hh6sPEvVbVlKdQGOcPNdJ6Lk4kkc+Snc9OvLnkwYBHnt+tppdrSxJxNMiuvYx
 CFjLqd/W6hzagz8YUWEsBcWO5DsNj0XNYvBe9XJl1TMwW/iNSdRo7FLsbMYmpmLZOqhN
 zmaGdOW/Bw9kWWcWy9XX3jQ9TOrhP9hbqiMwYnpXE52Kd50F0uU0CGEhTEODSpHIzq+S
 Zl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ha0aygmdQhA+vzaHVXT3Ohx8vrxFahoWpofLEJjehoY=;
 b=HYBUBp1xWa8oYUV5JoZX0WzCbwajRiZmUR49iKgDA5jvxvwOU3ClJ9FUpikbCTILEr
 7rFy3L7NdmCuWxDsTdjOQUbFRFqrcuqplS7BS8MyrH0zN+xcDhknObKtVDt3iktQMg3x
 NjT3A5YywIipw94eVcrc64D/i9p3K7qTjC1s/m26rZRO4Iq5BYrEExBvTIc77W8x6x5U
 1KeQL5s+gKkmCW0ynKEqcxuegf3RBqZQDHHvpXEnyeYRCx2NLXVMuqey6VIs+tcVmPY5
 aWeokthRlJPhGSXNXfnGXSfLU/dEb1BzZRLf0X9+lIHduXiOaQqtOfpILraVvPn+svsr
 XSlA==
X-Gm-Message-State: AOAM530j7XgqqlJPdfKKklFFcdbCtw1APKzbshs+7rktSFc6E7G+pWaP
 mzZGzIjXKC07s9DXmaX38Y+Jv92Ijke1Xw==
X-Google-Smtp-Source: ABdhPJxSJuqhHq6s/+IrkoZh1Av83MOgsWCZWEVD9cPVWQOA1GETKmDuTLx2JnyC9mQliEODpz/NvQ==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr5033072wmq.88.1629490404482; 
 Fri, 20 Aug 2021 13:13:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id d8sm7303847wrv.20.2021.08.20.13.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 13:13:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 22:13:13 +0200
Message-Id: <20210820201313.953976-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: install polkit.loc to
 HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix added by commit c20d31baf471daeeec50d62cb8baa79bac06fa51 is
incomplete as polkit.loc must also be added to
$(HOST_DIR)/share/gettext/its

Fixes:
 - http://autobuild.buildroot.org/results/170e4802b7b4e8e7dafa95ade549e8fd05e43bfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/polkit.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 23adb534d0..0c12a88601 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -41,11 +41,13 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
-# polkit.its is needed for gvfs and must be installed in $(HOST_DIR)
+# polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
 # and not $(STAGING_DIR)
 define POLKIT_INSTALL_ITS
 	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
 		$(HOST_DIR)/share/gettext/its
+	$(INSTALL) -D -m 644 $(@D)/data/polkit.loc \
+		$(HOST_DIR)/share/gettext/its
 endef
 POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
