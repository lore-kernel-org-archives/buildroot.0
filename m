Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477F3C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F3041E56;
	Thu, 29 Aug 2024 14:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0soirKxYzsz; Thu, 29 Aug 2024 14:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AFE41E8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9AFE41E8A;
	Thu, 29 Aug 2024 14:51:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83D741BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F42941BB7
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6z4cuRtHWHK for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70E4B41963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E4B41963
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70E4B41963
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37182eee02dso511939f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943051; x=1725547851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxOE7FBmfSbL3ucf4kZCU9U1QOwVibBKi7ZxfRSsQCU=;
 b=FH5VTovES0+j3Kg+wQhqrACs7jZBftebOMd+fZSzb3s7SEoCy3/PIaurKTyvNqU4WD
 ceJvGsme4f7jBLUjdK1Pxl+bfPfT7MO0GIS3Ub5THwTM8JRAs19jvurrlxkXJ/R9T/9L
 PniiqMAhOtMG77el+973VFuwsXPj8YXiftabv6YvtBZ38rzqChUGOFY706a5/7XxGRKN
 j6JJFfDRz9p7Maiwt+K4yUm3geFQTKexyM+jGBp55+Dl6jf+h8fKyr7oanSMK6s0XhlP
 6PpdY5cL8xIGBIv4oOahcpjm+14zT7e0GDbrnNJ1ftLP4fa7s6yqKbvgSJGOHS9AZURn
 +1nw==
X-Gm-Message-State: AOJu0YwhyLmYqwOfoSzStREsRSa1MiX1C7mAeOaQdF8gChbu6xhUfegx
 Lbt5Btq51qeP4kadbC0Me7m6LnlWcz2yuihpLNOo2yLnwcrq27NzhRSfWA==
X-Google-Smtp-Source: AGHT+IFrWk7mJZB8CrWiTVD8WLXvzTXfduPFl3mv0MOx+PASDIF0uwCmWgmvMbXWYEDGugwHRXFImA==
X-Received: by 2002:a5d:6d85:0:b0:371:8327:fdc9 with SMTP id
 ffacd0b85a97d-374a012b0fcmr1829629f8f.11.1724943050846; 
 Thu, 29 Aug 2024 07:50:50 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:50 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:36 +0200
Message-Id: <20240829144940.209964-21-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943051; x=1725547851; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxOE7FBmfSbL3ucf4kZCU9U1QOwVibBKi7ZxfRSsQCU=;
 b=UlZnKRdnItEWEzsgCeEyYY1UBpCbBRwHm4AFs/uLQdpzzX09zvf1/NKtpNmGbFAB5T
 biTtJllwpWwhk9IjZ42KTwymmCCsRxxzoUMLCworRvGvn0mww4Yyvmc5FBUS5zxw6y8i
 j0vwVdEX3ieZIjHzKYML42ei4KAA5OdGv2H9ZJkvZeRqAMf7/go14C4pPl70Bc84aYI/
 bTSC0msMuHFnIpiMuQg5B/b7zQpRQjulO25ZEpUt6guT/aCDS/+pOxrSJnlwdEZuK3mo
 2d//vo9f6FnjdoWz9RVBWWSPS7cs8bA1Y10PzOBzpGLp1D4Mvfg7wZ728ORAkSkv3cey
 rHIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UlZnKRdn
Subject: [Buildroot] [PATCH v2 20/23] package/erlang-p1-sip: bump version to
 1.0.54
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 87c0742bfc..d2e40e8fdc 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  895a143fc90f0222649d103dd524def7fed6665c52600c2bba61e9f69d132372  erlang-p1-sip-1.0.49.tar.gz
+sha256  9336f02ea99cfad359c78c50fdd9c3061aac7b31966abdc3223f56b3ed7cc377  erlang-p1-sip-1.0.54.tar.gz
 sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 45c70e8899..36758b8681 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.49
+ERLANG_P1_SIP_VERSION = 1.0.54
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
