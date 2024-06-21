Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A110C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B35644B8D;
	Fri, 21 Jun 2024 16:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcgQBVWHHPuv; Fri, 21 Jun 2024 16:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C55FC44BA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55FC44BA4;
	Fri, 21 Jun 2024 16:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DEFD1BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C0856060E
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8Ck41xv-5W8 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E9E360624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9E360624
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E9E360624
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3658197cdbbso986739f8f.3
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986260; x=1719591060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSC08YRGLTq2d8IJM5gV4/EJwnwuS2yaQzymzNYZxd8=;
 b=P00tNkBR4zxNcnNkoVMq8JHaqC5+LTIYPbSv2XQQJEAop/Esa+wS7VSJolLrMHoMKa
 w56qMhPU7avOSaoPWxMabc15Pp5q0LB91YcyoYhBbWjAlH+fIQ8kLDvkzaStK50pimN4
 hUzTcMak3mpX556Y4GLsB7AMcNZlqTVCAApr+tAaVSe9lu3Uf5x2ca6hlUwnTZ2xeXup
 EGBjpsKqloAGNmkCsUIzN1CraVlvn3Muv3mFOEmme6dydfZ5B0kVKZBfRL8JoG3QmvWo
 aOzn4j1sYtBlT76aYvucWX2y02B61S/71x/kMKjfPxqR46DZqAtJrf9fzoNiIMOjnE3N
 ylRA==
X-Gm-Message-State: AOJu0YzRYJVzDKTw95h4+vWeVkLO1RQbnY53xtq1BGlSk1dOXoe12dEm
 oOEsF5Zk6dZSSUxtma7QInPBc2EDMvfLKpVoFZo4WDB1QCH2vKlu4iMSj8ua0OW21tRwnYm8s5B
 v
X-Google-Smtp-Source: AGHT+IENkSDK32D2GA2ICbhdNZJlM5IdV+gDCFwlFPU46uXwG+UVkQcuuH1zHbOptEdzIBn0+X1jZg==
X-Received: by 2002:a05:6000:1bc1:b0:360:9bf5:1eab with SMTP id
 ffacd0b85a97d-36317c79ff7mr6592911f8f.36.1718986260260; 
 Fri, 21 Jun 2024 09:11:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:11:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:46 +0200
Message-ID: <20240621161049.4085310-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986260; x=1719591060;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSC08YRGLTq2d8IJM5gV4/EJwnwuS2yaQzymzNYZxd8=;
 b=RUeqBtbNIk2MyMHK3fpGp5YVooTfb9+G71oKTnvQ0OqXjdwsuECo6xpZknN0cbal2f
 xNJXIVonPSLDHdftGvxOqUp+FWsYCzt9YyWbf/uc8Y+ev7AqOHCHU4AJYPtjyMm2a77l
 Hbp1H+ilXoredujpjVgQzTiG54gsKTJive9JI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RUeqBtbN
Subject: [Buildroot] [PATCH 3/6] package/libopenssl: use consistent logic
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch expresses the same condition in positive logic, consistent
with what has been coded in other parts of the module and generally
in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 14313a80fe74..ed36fb593dde 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -164,7 +164,7 @@ endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_BIN
 endif
 
-ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
