Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34927C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBFE40D2A;
	Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuyhptKSJPy6; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F8540D34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F8540D34;
	Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DC5114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12AFE409E4;
 Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-yQ4u-ghXGf; Thu, 10 Jul 2025 20:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25FC140111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25FC140111
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25FC140111
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so793356f8f.3
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178981; x=1752783781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mmETXWilRCvPsjWPipo1M2qiOM0RHbWHIFIppDlVYAY=;
 b=XedWSNALgEJpsuhkprxE+GtugTFUTMx1s5OX/MHz/beCBYLRgtLqvvJQ0CtE74u+Y0
 uyaI0LZWM7o/ldb90o24pm3UwjyPOZV22JK7CLUXoHG8A5EUZF8zGLOaEsrO7ryxIcE4
 IHKYLvjsrUna99+gg/0f7/wEV8bipb+FmQcyTspaPxF4Qua23tL5Su49k61JtVleq6bl
 LndAirkodkYZwOvGNFWOjHb6EZbPSSP+qL46QLfbhnIyzs6Voi2d7W8RADJwYFgoxcAb
 AbLzNXfgn/VAq1PAm7oQQn3pXqAFBk9/MCEeNZveDbCbtQW4U0jTxLyfjiOtsjhMY1m+
 Toaw==
X-Gm-Message-State: AOJu0YwHm/6knHnh/5EGU6vjAvpbzH6tgceGs18g7RD1x9hfdp5hr9GC
 NMYYhz1SkLrkWHUUKwKt6YJS/jXhCsDE9I3itoJ4lTsD6ICdOGwtTmz+5iiyRw==
X-Gm-Gg: ASbGncvcj/LWen8MQHSZ/7j+wppLhYYvq5oB7e6Nsh4ClxWAIMpYuaZ3+JwB6ppZ+d3
 i6OqXzkzTo7Txs1tsK2i2b+fQ8ZlpVpW+SKf48ntbWgvKvCJCGJg13bqKjklFASGdohuJPGEDqZ
 F4gd6rT9QilF1WGtUER/B3iG3kkHr/3Zf+1t/LNNB9GVjPiqMLnIKh+qe+bvc6jeWh6oeokQDJD
 NqLs7jRk4dKi5cNjw09wn1ejoJ3eJPJhgnHqBHoCRdWW/bHRMQE9YiEfBVCRZnvV9wJXfXB3Usc
 MclQFlZyLCCzQzaXDmIKWgcfGOB+NM9vPmeAffwEBPUJwwRziAHtJbFhlMtG/QPt4PYljf68
X-Google-Smtp-Source: AGHT+IFWoFZ0OYPRgIs4M2AzpbnkTPkbEElzm7yrRpld5oJRVHaR4eVVZ9BHKdcOqCJzJZsfKZCBWQ==
X-Received: by 2002:a5d:6f1d:0:b0:3a5:88cf:479c with SMTP id
 ffacd0b85a97d-3b5f18dc798mr675671f8f.30.1752178980806; 
 Thu, 10 Jul 2025 13:23:00 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:43 +0200
Message-ID: <197bf27b3fedf1e1cdb624078d52710f32d5dcb7.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178981; x=1752783781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmETXWilRCvPsjWPipo1M2qiOM0RHbWHIFIppDlVYAY=;
 b=Jc3bLLL07UpfjcDn2HLoN5BUM8Ily8lK+bHdWj8lgKZM+9mbfC89X+jSZ/f+tIsXJl
 DYUiaT/iO/Cu4XvohSIxksOmt0CBNWIEmUSJM05MZE2B/dhAbur2JVEY9DQJvU7Lpd0G
 06ZNAjfDdamDGk8BJYoCMye6Q9IsDwllslg0T8LFj87jpccLx7AlSUgaK9PEEliSXQic
 1q5z4ejqwFodJ3ejOuHuLeov8mSCrZQJGdZXadmFqXzBrkUDwqgdCnWKaLiE+gGQJpCh
 kYIYz4aB36F52UJk1QF3ISvVXp7FJq2TQhwff93Yc95MYL+GJcYlmowfR2bpuvEdbYrJ
 vq+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jc3bLLL0
Subject: [Buildroot] [PATCH 01/17 v2] system: reword merged-usr prompt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current prompt is overly verbose, and departs from the usual
terminology used to refer to merged /usr, which, 10 years later [0],
makes it a little bit difficult to find or understand.

Furthermore, we're going to add another similar prompt for merged
/usr/sbin, and there's no way we want to introduce as similarly
convoluted prompt then.

Reword the prompt for the merged /usr option to the explicit "merged
/usr" everyone expects and understands.

[0] see commit c5bd8af65e50 (system: add options for /bin /sbin and
/lib to be symlinks into /usr)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - typos
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index da9e20a35c..1bc8b61f11 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -337,7 +337,7 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	  Support extended attributes handling in device tables
 
 config BR2_ROOTFS_MERGED_USR
-	bool "Use symlinks to /usr for /bin, /sbin and /lib"
+	bool "Merged /usr"
 	help
 	  If you say 'n' here, then /bin, /sbin and /lib and their
 	  counterparts in /usr will be separate directories. This
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
