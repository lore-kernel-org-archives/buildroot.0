Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A7EC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 10:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE81D41A3A;
	Tue, 14 May 2024 10:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZ0qSg6z6iqk; Tue, 14 May 2024 10:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B5441B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B5441B8B;
	Tue, 14 May 2024 10:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26EFD1BF292
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 10:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC4141736
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 10:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 121ioHr-sDZf for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 10:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42E1D41731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E1D41731
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42E1D41731
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:36:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso1349712566b.3
 for <buildroot@buildroot.org>; Tue, 14 May 2024 03:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715682998; x=1716287798;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbvRg99z8pYziFR+ziEUzEiS5sFwqkJ1nkd35jfKq9g=;
 b=ltnpF3Kv5FxKqa9iGeaAwCJWx30EKtPz2yxOIeYrXmDoxS+wYw/7mBTDO9z6DFDUjD
 T+HaQZsdhX+HozLGSp0I4jEsl1Al+VPvT6AzHhFsYSkbj1qo1ECzISSDwMeZmdMTAEa1
 sa8XsnSjXjW81OEunkc2ZdUsBoxPG2P2MJwB1LKSEfO44zQK44VfbaxMRZlCZqm6PddA
 ZBoi7iHkXe/Fn8IqBP5IPKf4P6mcWKUka5800Q4cxmUQQACTxz8RR6LRgaluyBEhAbu/
 saLODZCiOB5tSUq/Sja6G+SIJzdRHxSfwTXQ1hCQf3qbqBo0jAriRrxiVBB71XiwzJpy
 cuFA==
X-Gm-Message-State: AOJu0YznOMnU61PIy/iLi6fgN6Jnhci0pK+42iyHOFQ0svFoyMMNyqMr
 JmGsfuWaUFFfkY3DWFHDzLYyzRJX1w1lh4juKP5+GDFN+Q/k7fHmLQikpw==
X-Google-Smtp-Source: AGHT+IF5aVysbCqcpNvdi+ODpJpEcj69J3H5PKwn9F7OP8Y3ArMhWG7BOJ3MqpwCb3TfdHoe0gWdfw==
X-Received: by 2002:a17:906:dd7:b0:a59:d5e4:1487 with SMTP id
 a640c23a62f3a-a5a2d5cb6ffmr1184947566b.42.1715682997616; 
 Tue, 14 May 2024 03:36:37 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d532sm717517566b.18.2024.05.14.03.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 03:36:37 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 12:36:29 +0200
Message-Id: <20240514103629.2002634-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715682998; x=1716287798; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zbvRg99z8pYziFR+ziEUzEiS5sFwqkJ1nkd35jfKq9g=;
 b=ndZsH7H8xcA1JFVtDlhZR9XSkHPdggSD3QPuXuvqkIZnh02w2dEMeYctF8k3eNYnFJ
 R10JM29+IMW1Nl0JRKJNkhd1Dc4/VH3vxRcUXTdkGrWAtyWBNsEvjLhUV1IWzT4vMr0U
 621GeU+/zNzYP87muJmlyHHIdm67z22R2EYlfGwD6QgBAcg4AhbYF6xXN1Rb8C7B93CV
 5bK9ou7mg7wq3bKrjdQZyJfYQzdTvN5e8MYj9UWZsa8sdcmpxeOQji+WxLrj27twlVu7
 gXCGxU/xp7cGw2ZKn9Cs8sO40p5ZNpUy3vBFgAIewGBArlMvoj1KlwwpdNcm2yHiNxr8
 2Dpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ndZsH7H8
Subject: [Buildroot] [PATCH 1/1] package/hostapd: drop duplicate
 host-pkgconf dependency
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf already defined as dependency in package ingress.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8981d9247e..5756510e1d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -25,7 +25,7 @@ HOSTAPD_CONFIG_DISABLE =
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
+HOSTAPD_DEPENDENCIES += libopenssl
 HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
