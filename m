Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97ADCD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 762D840B0C;
	Mon,  1 Apr 2024 13:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYnOaCehkYHf; Mon,  1 Apr 2024 13:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD7740BA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD7740BA0;
	Mon,  1 Apr 2024 13:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E96A21BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AADB81E5F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8mbx5yOTjrQ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D9A181815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9A181815
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D9A181815
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d6fd3cfaceso45244881fa.3
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977194; x=1712581994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxIY4AytLHWxdwhpp3RTgGLqEQbO3nBMD5JvCP54Yb0=;
 b=VCLi3rSu+cr+JKLHvS+AzelAaYTGZ3cbTjMGDDEUtIxaA8sECgLaLJq4spoBeYR9Nr
 +Nw+OYZbt/7Y1LMUdRa8mkhQoRL/5Ys7yX/DHjuwj7jLf0AEIiPIK8oOhSt+VLPhxjIH
 WIPDdh1CxZrH/s/uu8fZZaXNqk+Bg3Y3TenQ0KcuhoLQcj37IzPxWJcFnbN++k7qswIu
 zRitDV1w8QHz6v2Rt8BEEkcVEZ+rzTo4w+y4cYo3tcv/xQuedDHVZaGlcX4GOZPTS6a0
 ZpeuLQnKbCMkkvq6mhdcGGwa2ZC0ESq7CJ7uL2Y26AiNccElMmLSoVtnkWlTISsxd2fn
 XyYA==
X-Gm-Message-State: AOJu0YyvLJl2MzH/56n/oL13anTPoHfQvuuDSp0A3xq39N9vvPH4NDzG
 h4+lvpQex664ZU8meaAvi6qFXwTK2+rTkn+A3avxGN+8hwQ0CeGIy+E8EM1B
X-Google-Smtp-Source: AGHT+IGXiU47TxlX99advkIiRcoJd03ATQ1hxnDopLJeAndg+D2b6ynaQRc+xRTLKStEn7IfBJeyXg==
X-Received: by 2002:a2e:994c:0:b0:2d4:6973:a335 with SMTP id
 r12-20020a2e994c000000b002d46973a335mr7521590ljj.29.1711977194069; 
 Mon, 01 Apr 2024 06:13:14 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906a00600b00a46d04b6117sm5308984ejy.64.2024.04.01.06.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:13:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:13:00 +0200
Message-Id: <20240401131300.511245-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401131300.511245-1-francois.perrad@gadz.org>
References: <20240401131300.511245-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977194; x=1712581994; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxIY4AytLHWxdwhpp3RTgGLqEQbO3nBMD5JvCP54Yb0=;
 b=EJSJOnDpgKACRqWZBtxNclrxwuZeVVSyiJxxrEyKXqMYNGKUL+SpSwoNcYn/FL4FUd
 ir+BGM1D/GszjE8Z9mi3ucYG8nEw2RbbwxKyO9TXNYedTmvquG0d3tGKymTQNRZKP6j6
 P7dNNCYTe9QGYcrmWO4T016scNLuLmQwdw2TegWZ2H4mM8+EnfC+Z/emQAMX17UxzJ+r
 U+f7rs4kqcTxN2rqU8V2o6IVOzI5AVkvGMK7Dm3F3glaPG9dHetnQhfS5ru/nVisNaZL
 MkRbtw4essWUteQvWC7jqmzC7SX4WcIBKOg8Bsouk/eIUQcaXczgkPo369p7M+S10BNi
 Ebig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EJSJOnDp
Subject: [Buildroot] [PATCH 5/5] package/libgpg-error: bump to version 1.48
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgpg-error/libgpg-error.hash | 5 +++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 5c445ba0b..3b3464592 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  94668233fd7bd8e7c0ec5e363134cd53c575da60  libgpg-error-1.47.tar.bz2
-sha256  9e3c670966b96ecc746c28c2c419541e3bcb787d1a73930f5e5f5e1bcbbb9bdb  libgpg-error-1.47.tar.bz2
+sha1  8bdb504750b4da9e7daffa164cf1ed9900671f32  libgpg-error-1.48.tar.bz2
+sha256  89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f  libgpg-error-1.48.tar.bz2
+
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 60e3da9de..3dd0ec94d 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.47
+LIBGPG_ERROR_VERSION = 1.48
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
