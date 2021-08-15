Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A22C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 13:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA4D60FC3
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 13:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEA4D60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97A33401BA;
	Sun, 15 Aug 2021 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ttc2y07_wZUt; Sun, 15 Aug 2021 13:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA89F40175;
	Sun, 15 Aug 2021 13:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAD51BF48B
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 13:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AC1480DDE
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 13:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ74HeiQMvLS for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 13:52:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B0980A59
 for <buildroot@busybox.net>; Sun, 15 Aug 2021 13:52:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r6so19949471wrt.4
 for <buildroot@busybox.net>; Sun, 15 Aug 2021 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yEV2M4UUaw4Sfi8CaVysLqrrOqllS1iSbpAO3JTxhjk=;
 b=lhrnohbpskE9Fw4uMiVMrhFi9z/0SCCNCRZtQSxcwbSGJhrA6pC3X4FzY2GZFe0oWt
 TT7qi88pZjVP5HIyH+HSOKuacxXTrOYC+cKKFIIiqp0Cy+eLVeykbaEtRTyh0q2+p/tZ
 rAT4HpV9nvA8MDCjx5XYGpsmKjTiA+3NS9BPFlfoC18G3CteIBEzT3X5Vazd7OzBUiTs
 p6qYLuc4eOQ74SFexCSwjnxVjW8wbWqMY4KkXiVgQ7qiCeoZLY18/2y/xQ6WBtEDKAJD
 JO6q2p130GFc5nPtERkr8hMeo63N3tjaDCqvvAAglYTPi7Je61OPd5Emn5tAJZt+aiIh
 FwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yEV2M4UUaw4Sfi8CaVysLqrrOqllS1iSbpAO3JTxhjk=;
 b=LUbvQBxUEvN0Lu66vmU6nB2SmRvqaIQVxZ0PvpIS5Esh5XImGRUI6WsydCqabSJVrT
 0p/EHedRMobiJDoNrbBGyUvH54VXhxxglbeamQNWTYEs7443ua1drEz0UwPBdjYXHgE8
 XhbQXoTuh8Yn78pX1WFbSJzVTn4E2Ky06uuG3YnSuknnSOi/l5o9KkbUbtj03fIxFRf3
 tCPhVqmxTU0WxTA1FfOEp7ybcRpdtFq8212Pct7v29LP2VMN3dvI9v12hcP1J/ghfZrY
 CUYVHmxMxKMRBh1VGFtXcWB6kiwnKU7POc3CuQnOuqfvKPgbFzDS3HvcgBxPKBq7Py7N
 QrnA==
X-Gm-Message-State: AOAM532aD7/LSEGFiPvgIisMOy1u5o3z6bXHAYHf7Vy8WEuObDo1aUnP
 CobpHvWkdfbZxpLx/HeViYexXynFEPg=
X-Google-Smtp-Source: ABdhPJx6snEkSK121pc5q9zoe9X9kI9qK/lxqKE/vPovhCiO983i3HmdruTMD+mI08jWby3/qbNQOA==
X-Received: by 2002:a05:6000:1808:: with SMTP id
 m8mr13652034wrh.192.1629035576126; 
 Sun, 15 Aug 2021 06:52:56 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id w18sm8783696wrg.68.2021.08.15.06.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 06:52:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 15 Aug 2021 15:52:49 +0200
Message-Id: <20210815135249.231896-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/vsftpd: fix build with libressl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes the following error:
ssl.c: In function 'ssl_init':
ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function); did you mean 'SSL_OP_NO_TLSv1_1'?

in ssl.h (libressl), the definition of SSL_OP_NO_TLSv1_3 is under the condition LIBRESSL_HAS_TLS1_3 or LIBRESSL_INTERNAL

with libopenssl, this definition is unconditional

this issue appears with vsftpd 3.0.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/vsftpd/vsftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8daf07c62..e36ba299c 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -41,7 +41,7 @@ VSFTPD_LIBS += -lpam
 endif
 
 define VSFTPD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -DLIBRESSL_HAS_TLS1_3" \
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
 endef
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
