Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A437CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A39540B0A;
	Mon,  1 Apr 2024 13:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MePr90kSaFBe; Mon,  1 Apr 2024 13:13:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD08840B91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD08840B91;
	Mon,  1 Apr 2024 13:13:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E51951BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC2D281EE4
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG3wx5VMwTJX for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0B5181E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B5181E7F
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0B5181E7F
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:13:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516a97b3139so793686e87.2
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977193; x=1712581993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYwHMbJbN/9VsghrbRL/cY3iu7egb/BMsn4X7A1xq2I=;
 b=XuL+vfz47UD7e539THcIVgbDXmq7JlaGUOJ9V2/4ti2QdGVRgvQZx3ORqWzrB9ZUFW
 dTFT7UkrCEM+jLbgJlbWDu0POGgJkS+phIxxCBrW7uv9zZpAc49eN9Yb8xprv6rqlCcM
 Xj2iPBIYjc6o0qIFQSX5mmTZ3owx1g69jZa0be7E1wZprj+DAJ0erKUKnaucWHDy/T48
 MeB91s5sxUqJ9vYuE/Xl4t264sQmh7RCXXrYjI1c7bkDrYr505s0srL3eeFwXZt2lESq
 zRulJKLn/144L4ZubnkKa8OnL0xhUM7xRTXdXjtM57WSlI4EHv2XS97MCkZWKyAsyxdh
 MP9A==
X-Gm-Message-State: AOJu0YyVaMHCh7CbLSvssb813OgRKOqRO0gjym+M9jFgoNLB0tHpIkfV
 BM6nw1j4ORrBw3kk+YAWp6ENz2PmRpW0S6aqgPyE9eJlGGGb3BjVcJdFtXe3
X-Google-Smtp-Source: AGHT+IHVyduRgbSlJXLXkLVMyBiEb67Ph1xwHjq/I2oSG9Kd/j3hXMgmMlD/1xezX6Qtkiv6beS/9g==
X-Received: by 2002:ac2:5e3b:0:b0:513:ec32:aa7b with SMTP id
 o27-20020ac25e3b000000b00513ec32aa7bmr5495325lfg.63.1711977193465; 
 Mon, 01 Apr 2024 06:13:13 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906a00600b00a46d04b6117sm5308984ejy.64.2024.04.01.06.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:13:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:59 +0200
Message-Id: <20240401131300.511245-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401131300.511245-1-francois.perrad@gadz.org>
References: <20240401131300.511245-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977193; x=1712581993; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYwHMbJbN/9VsghrbRL/cY3iu7egb/BMsn4X7A1xq2I=;
 b=W7zJTxLm8sLqPIIh+7fkHwcyG9uMgT0+2avfUgBtX0PQ5RkJ3BQo0KwxQbKbBtQ6nF
 Us0RRQND1tNEOm/lvlIec4Ek5fwYs1oXWacUhjZkRDGRJDs8gtlBfeF5NSODbYqn5Fv4
 uEpnVPz3owU8No5G+IooFRbLiKdFNea6iGcNpQ1SB+nDfJ0OdyDJc3ujjvY7bQEaV+zR
 VkvOG2SA075laVlHEc5flSQw9j3Eat50RnG8jyGQIAj0TymIK8HpfFwWOdo/c9ROP/pZ
 CtpCnSjptT02OlmW69+x7ZVxZOsEh7C/OXchxWs7POKQpfVE3XulE77o64vVntmJ5yEw
 kGyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W7zJTxLm
Subject: [Buildroot] [PATCH 4/5] package/libnpth: bump to version 1.7
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
 package/libnpth/libnpth.hash | 7 +++----
 package/libnpth/libnpth.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index b9f72e077..a140a23f6 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,7 +1,6 @@
-# Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  a9f7adc1b1f6707071d29bfb3338c28b995ca1ce  npth-1.7.tar.bz2
+sha256  8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05  npth-1.7.tar.bz2
 
 # Hash for license file:
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index ecfef863f..dc603b607 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.6
+LIBNPTH_VERSION = 1.7
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
