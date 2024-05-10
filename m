Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD375C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950EA42207;
	Fri, 10 May 2024 12:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDPl7z8rNzjP; Fri, 10 May 2024 12:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CA542459
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CA542459;
	Fri, 10 May 2024 12:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9821BF3DC
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B06A615AA
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skmTeoBEsnSx for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=leojrfs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B374A6064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B374A6064F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B374A6064F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:41:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41fc5645bb1so15222505e9.1
 for <buildroot@buildroot.org>; Fri, 10 May 2024 05:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715344872; x=1715949672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fk9OEw3G62kL8kOjGtzfBIRFefix+8+q1pp1yRYw/Eo=;
 b=ZeG2Gx5EkPoVWba5Nba1M7CjC0LAvvzssCMYw+4JxAofS4PMxH+gbkxsjX+CZWTwtj
 T6urpqFD9wUfvcj1cyTk/iebdA99fO82lB2VXo8v1oPceIGoGCeWCr55+DhFp6JqywqA
 WWMmETk3o+ZBjHqg1uwnMSKA4emO3Mir+WmgkW2yWxAPSp9y+dbniX9ztVOuHXeqDmaU
 KGjmgG+Xi5FO1cg49mJ4v0r8O4O7iG3R9JINSbtkF1Nwcg6jhJfVK7k4UGM66IcwBUgc
 zVWc4WuOCQb/ArvfBTsmKtLilIAz0ckLKBwfqFBAwpjWpCj6aWQKGpKmkS8Ws0oe1H/Z
 zCyQ==
X-Gm-Message-State: AOJu0YwCOCR10vR22TPyv2dEao/C5NP5VQVgo3W2PzpfSkYgVh9NF49f
 nbpXRFAjNGvdVEhpjc8bji3MxzG3lrBM5eiIV/xh3gATB+Uylvk6mb5JIFUp
X-Google-Smtp-Source: AGHT+IHlxjdrabw+TVI2gdyf1c5oSkowcyNpiY3Ihpz9YsOwYs2QKDWDqvz7ehmoG43mi1668woyLw==
X-Received: by 2002:a05:600c:560a:b0:41a:5958:d6ac with SMTP id
 5b1f17b1804b1-41feab38f61mr19462305e9.21.1715344871974; 
 Fri, 10 May 2024 05:41:11 -0700 (PDT)
Received: from lima-debdev.. (bl20-30-239.dsl.telepac.pt. [2.81.30.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42003bf579esm11118895e9.43.2024.05.10.05.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 05:41:11 -0700 (PDT)
From: Leo Soares <leojrfs@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 13:41:02 +0100
Message-Id: <20240510124102.2297738-1-leojrfs@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715344872; x=1715949672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fk9OEw3G62kL8kOjGtzfBIRFefix+8+q1pp1yRYw/Eo=;
 b=nE9WfgTbTVFOqGl2pb/odGRb7WBuD9jEGvoVQEHEZfNO7y68rDixVp5DFW8LlVXp2x
 CZhu8f5AK4LrU5/z6uSWanQyPjyqqZ/3zNXX24yFpyzXLr8sUuGj3fCQnbuJvMrje4q4
 M1hIxEHYOcukxF3haN9BQYSORLMQZC5EB3pv7AvSY8vtTHOULpUDM9nW8hyvtfFcmae1
 Q3LPd0//gvY0JzmLFsdwmoVB1miK6I4fE1aRitgWhe4m5zBCNbQHCgazx2+vaU3DqeMX
 pm6LmdKBo17Ha6xZgo60RdkNtkGBxszb6YQAP+fOFPaDyEFtxQo5MrzKFqo4ARH1nD9X
 gf0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nE9WfgTb
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: add staging
 installation
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
Cc: Leo Soares <leojrfs@gmail.com>, Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Install janus to staging directory so that external plugins can be built.

Signed-off-by: Leo Soares <leojrfs@gmail.com>
---
 package/janus-gateway/janus-gateway.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 786bc211d4..0b4db458f6 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -10,6 +10,7 @@ JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
+JANUS_GATEWAY_INSTALL_STAGING = YES
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
