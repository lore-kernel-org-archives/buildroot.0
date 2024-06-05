Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C77C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E99D419B1;
	Wed,  5 Jun 2024 17:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p_XgS_KFVnb; Wed,  5 Jun 2024 17:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4483A4180B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4483A4180B;
	Wed,  5 Jun 2024 17:53:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1E71BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB966110B
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kftx57ZJxYio for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A561610FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A561610FE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A561610FE
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso19229f8f.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610003; x=1718214803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wZRiPMZlVwmxtnXwUijT/mthL0SRbNxRqfZesBf4o4o=;
 b=CBtGKQO7cVt+TDslnypdZMsAyQgtKUJUleABqCzU/I4btCiJWide4DgxFY/hsxcZcE
 GShTpHPfiMiv15odIYC5IYUKyuGjSVNDAm1/lOVPlxF8gEc2ii/agJzj3WAdxw3eiP72
 rP4wLZuq2cL3xxGtx0QqsS5V8DIPJnRmlb9lZvRhMewSi/fkeBRefoMFYex/AVJZZDuQ
 HY1VW9F3jxbvBFgvqZjNZBfTwRk525WIy7O7mxqO8+dxGAvYaB09SwpWKN+254D+YR1Y
 Dj45V9VyfvFGsyE+quDrMdjhZL99zH736nuwjEh0OmxB/ZFwM7MsB2/MQf8UQizsYsLH
 nmpQ==
X-Gm-Message-State: AOJu0YweLGGY/9A72FwSAJXKUzJKfjnJjq1eLxZk64kmxV4vY8ymuHrq
 ju/1oXPc15dLk+3Y/QtXLUFO7fly5CYqXnk/rtvmSFU8MRKJccSrHW//rQ==
X-Google-Smtp-Source: AGHT+IFR8NQIGievM6rbdpBOgJ7+kEqHbBn6X4og4L1+nlBlMvMmrZMkGOyO/yYB7OdLmy3naJTLqA==
X-Received: by 2002:a05:6000:44:b0:357:4b59:18c0 with SMTP id
 ffacd0b85a97d-35ef0dc9b6bmr311583f8f.22.1717610003555; 
 Wed, 05 Jun 2024 10:53:23 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:15 +0200
Message-ID: <4d4d105d0a6ab4998d85ebec807adfe5f56d6496.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610003; x=1718214803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZRiPMZlVwmxtnXwUijT/mthL0SRbNxRqfZesBf4o4o=;
 b=ITlPCb6pGbaFWFL7TZqAz9Nd/LzojWMRarVju92FnvrqQqkQtYuFvANhVd/TZZ8Mgd
 Yt4D2jcgQbgIm1b2wAkmge5e/EaiG7sECuvcHTQmPt4QjaM4m6hGosLGPLpjUp5Wxv+L
 5o4agGq3YcgUhYDieWxvcT8B78vkKVOTC85Jlk7n/C0kqx2xz4XxWiq3TRac8pAMttqM
 mXyL+5Nvgxo5feSI1MMj8zzcGbwjy2jTRkN6onITj8xaOfenJgvMZgJG1u+rg/FDFjgC
 E74T3HObNIpbi9ILh8FwWc8EvZ8kZos50+DT2eVQXjzJGKDpGfg15hNB/vyGE2+ZAD8m
 3ypw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ITlPCb6p
Subject: [Buildroot] [PATCH 03/10 v2] package/cvs: use appropriate TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cvs/cvs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 64c15f16fe..cf9127fc3a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -31,7 +31,7 @@ CVS_CONF_OPTS += --with-external-zlib
 endif
 
 define CVS_BZIP_UNPACK
-	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
 endef
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
