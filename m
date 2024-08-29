Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9DC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101FB41E48;
	Thu, 29 Aug 2024 14:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7Gw84vPhwuc; Thu, 29 Aug 2024 14:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50DA341D94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50DA341D94;
	Thu, 29 Aug 2024 14:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 901BA1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E71E41A6A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7Kxem_Yw0LW for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91C9841A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C9841A8C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C9841A8C
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso6893675e9.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943049; x=1725547849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SqMfqblJIt+EhVoJBzc22Ru5DIUGsw2w+6BLwwpl6AI=;
 b=sFT2vCM8SbepHbs8KAWhcsORGftuWqoaWYfQEG5MzAts8a4XgfUbQ4ur4g2I3SEmcy
 el6X3WTWR855VAKT7Ou6InmDZjM5aLHRQpuLMAUazdhQyhxPMEE73kTG4ocbduRFWHWR
 kuHAOCvqy+7uP8USr/QYIJfT3MuphcqiwErq9XQu6EOEMLEwaM/j0pIy7jE5g2r5COl/
 Rf4EIH+gC/MIoDcrDX4zFssSkv9qMPMLeTyARExTdMvqmtQfRDw5S6Y/u4TXuNlTiBWo
 dPs1noaqOuT2DTVAc4hOqTDSrebduAiyj5nEamjpVNSao5OgX+qdPuy5LCjnwFphPcVo
 d4+A==
X-Gm-Message-State: AOJu0Yx/dhRZ6hQclDA5sAe2tVfBsVLmfIms8xvo2g4Jcis5KYypefgD
 xcOEhYEkQb99V0ylkxXbcZMRymfn971ITAwPpmTM/Qo/fdIda7raZ0WV/w==
X-Google-Smtp-Source: AGHT+IH4Eta8IZFmWkEa3y2vnWpAYv0Ru39ld7hOppeqdD4CKe/zOdxWxBYzPNyDsVaIgk+5vsRiQg==
X-Received: by 2002:a05:6000:1010:b0:371:8d47:c17b with SMTP id
 ffacd0b85a97d-3749b54ce30mr2319041f8f.30.1724943049195; 
 Thu, 29 Aug 2024 07:50:49 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:48 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:35 +0200
Message-Id: <20240829144940.209964-20-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943049; x=1725547849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqMfqblJIt+EhVoJBzc22Ru5DIUGsw2w+6BLwwpl6AI=;
 b=m6JEynS9bTHzwVn+QAZafndean2UO2RyEq0DsPmuhCY9R9EBbNtzFQURSVWkKU2yMx
 uxPEcBC57m2wr1C1XYBblVB4OKc88rK2I2KoPbIOyYLNHuuKrbWastIYD6xh1iC7Scxe
 9/3L5oya1T2cF5zEn1P639/pJcMxEw4XV/e93AwBkr+mcrvYw1hpFEgQvaRQN3SAG4Py
 t3OlJGeAA7psg7L0G72Uygaad8SPPU6mtDs6J6bATveVunHxy8L2vr4WhxIUmEr06kKH
 C+BdspsUrviX3sExUZGjOFJBEKea8j5sOA8GrnVZcTPDF1ekY8rXVlrf5KSNh2hapJmC
 /9IQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m6JEynS9
Subject: [Buildroot] [PATCH v2 19/23] package/erlang-p1-acme: bump version
 to 1.0.23
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
 package/erlang-p1-acme/erlang-p1-acme.hash | 2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index e417d4b181..0894176fbd 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a445b66e76acdf1342eda166344004473bf4f45ad7e7f5ae38fb0333d896eb2d  erlang-p1-acme-1.0.22.tar.gz
+sha256  59a0113022c87afe25a8664fba76739b0ad481e25081599e0b69a098f6d628ed  erlang-p1-acme-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index cb8c7a8a19..5c7c5cc9e9 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.22
+ERLANG_P1_ACME_VERSION = 1.0.23
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
