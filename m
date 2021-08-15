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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E65C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F406136A
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89F406136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6002E605AC;
	Sun, 15 Aug 2021 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEnGIJ1DeS_T; Sun, 15 Aug 2021 19:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB7A605D3;
	Sun, 15 Aug 2021 19:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE39A1BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE90605E2
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0s8TfD9zt50 for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54794605AC
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f5so20673850wrm.13
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlLUYBKrNbzlJFTAOVTzbZ+z2sXAgZfVHdF7+DSyNyA=;
 b=pswedoG5awkR9wWftoZEVFPAh3E5hQSqU4OneGFsufFhaN4uvs0NTXapb44HETD0lS
 X3tdkqOdUVUbONMedfN7akFMu7g52yNZn5F6rXcQ+WUvxREHrfD/tLB8mOKXI073YPIx
 Jf8UZhBkuQOSgQtMNNuJezaVVGrcTsYgJedtLkqQPEMXSBj33lC5Cl7H+1mk+r5ZPo+I
 fiZbMVHc3fWYvMvY7qf6GhPvNghDO87HVjaN+W8n0U/xOVmHayxAaOLJ4tEHVOAnNYbU
 XCn+AcMDa7BQxl8EZzRe7n9M5HN58N+2VmKWyx0yqnBMxnHxA/aQd0z0iKoRsuBdCxWp
 sAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlLUYBKrNbzlJFTAOVTzbZ+z2sXAgZfVHdF7+DSyNyA=;
 b=h2My3FW663fgWrcxfm6nU8Pr/Dv5lAr4huoDr9+zCnVztrTB0AOqQnvelfNkt30mIF
 XNasLRhPL7Aqp1V9MiSk+lY0fv/xzuaUw/Zm3MDq6QOq1gg3Wv1jGmzPrp/phiC17ci4
 qcK8E/TU5ZjKLnU2CoZIDeny7KCJIsyJ8ZOup7Ihnc2GEQ5tq8cm0VZ4sEcHoxNOJAa9
 oqrgdEgbCR9+hR5ouDCSd6ChQwC7kIwlKVhgcYy2PlKO1CxeOlBHmS8blaXvd/GZ/NUx
 mKBMMX2ZEyF97vEGflQdOOHl4aJro3j3f7b41aefVSscA+8Nl4Pq3FndHM96WD2F7IDr
 Me2A==
X-Gm-Message-State: AOAM531V483JnuZ9IWiP8odylTbV90+DxqcZbxixk+g5J6dDZUlWoHck
 kwOQLcwdaZjmZz9ntXbGwZxTQMzE9ytAlPue
X-Google-Smtp-Source: ABdhPJy59NNwHGhY5s375f3/jiagBrSWKsHXyjfVCEuCyUXBFztr5o24fKTcYMU+/NXI4S0oVxZpRg==
X-Received: by 2002:a5d:6b92:: with SMTP id n18mr5585112wrx.343.1629057233366; 
 Sun, 15 Aug 2021 12:53:53 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:53 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:39 +0300
Message-Id: <20210815195340.12027-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: depend
 comment on BR2_PACKAGE_PYTHON3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-service-identity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index cac1c06912..ab012347dc 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	  https://pypi.python.org/pypi/service_identity
 
 comment "python-service-identify needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
