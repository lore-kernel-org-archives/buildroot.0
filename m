Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FACEC83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 10:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80A283DEE;
	Wed, 16 Jul 2025 10:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUllMQExch0r; Wed, 16 Jul 2025 10:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 031CD83DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031CD83DEC;
	Wed, 16 Jul 2025 10:07:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17AFF1514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22F941408
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H6-2u2i6T6f for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 10:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BC7A41024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC7A41024
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BC7A41024
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:07:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso4256573f8f.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 03:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752660439; x=1753265239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYl6eFY0VF3l9+84/o6DjPf3R7n1fm0THIuLhRtfV0s=;
 b=uGkE1PLg5LNKQauGHujTZoeVUkhOXo5cQuB/4PQ5RdTvhL+Ouzd5RSfffdaRlnpopj
 AmODNr+C+D+bFv7B84K5xc27Mgya8OpCs1tNduobu4VAL2u/0LuDFsvd++Kgak8KjLE5
 Sl8VHLzqVAyk4VKnkK6PYZsCnQD6DcgQCFm//0/xY5JckDT52PJ4LAvaEKV7EJJepNoK
 gIBgAZuonQ20bCHTBdlaTT33bMYmp+Li5D87fXOs5msBfo1XzStCK5WSRaNBC4ZYq+2l
 2TCEn6X59czGY7cuD1gADUlMtkeud39sbYLZXeLWM5MH0Lu8/k5VMQunQXWTuX0wf6b7
 KP6A==
X-Gm-Message-State: AOJu0YzN8zJlq96jfAH+4BcuyRE8Xrt08oxabMPuqQfErCPTggzwELST
 BT6zslo6qOVLvC3ydVXOp4FIitlP6CKs5fwk0/58qQ2dZzP3F7FFsG6l+WrQs0KLiVBORFxZzQN
 JGdt5
X-Gm-Gg: ASbGnctA47WnljPEokJVWJqrvxsyJdKjQ9dgrAbdATxyyFq+su62F2lBCd7AZAb4cTd
 +NnP5dxL+GWZCuAd9vgzFbJXtc9z1LFBZtTZGtL8+hT9ysy3aeGRkhQv7n9XUOMzI4NZAMnNcp5
 jlVyKcsl5pBOh4szQn10JjFbHXqXFcqva9+PpAwWWbntXx4gjvcdc5DiZuoN5QsZgX1p0TBlO2O
 iJuR0EaojAIvg3moOS4cIyaDgUPQmG3H6zmS6bsDDnA9Lrhq9zUd7eAXBV0ZshSFgAg/azH6gt6
 3J8b7Rx6HD6CJMSfJTxwoI/kj82621anEd3Sxkoi86ZDp5IcA33t4IiasodQwjZMnB+3myN30oo
 w2UBwzWI4XFCCY9OfWqRMoNy9pdSuGpmWf+Xss3lSmcAlqDDipvByKw/zftNJzee/vO3Z1GGeUd
 doqef781AjYuA6q9/ERyqzSd8jCJMUTK1h
X-Google-Smtp-Source: AGHT+IExKI9g2JJTv3FpvYNP7pqIXKDSvNYY2dNcJjfVNKYQpf7bMdgTESj1wsqbTdf8d5NxXL3PYQ==
X-Received: by 2002:a5d:6f15:0:b0:3a5:3b56:974e with SMTP id
 ffacd0b85a97d-3b60e4c51admr1277935f8f.6.1752660438917; 
 Wed, 16 Jul 2025 03:07:18 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm17612388f8f.60.2025.07.16.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 03:07:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 12:07:11 +0200
Message-ID: <20250716100712.1244865-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752660439; x=1753265239; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYl6eFY0VF3l9+84/o6DjPf3R7n1fm0THIuLhRtfV0s=;
 b=Mkn86sIU2zQ28QMCOiRxNtCFinlXm9ppPC0XvSqtAio++suKlqZE7mUaxwxKgqJIlw
 /tsg0bp8/9PZ5H2wcBigNPefsD/6gMMDmj6G9osKWDuiW5CYT3ntrBaH4uOT5Ziyhym+
 c0XoCpr3I7Occus1bWZHNeqTr1NAfwaFh8DRA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Mkn86sIU
Subject: [Buildroot] [PATCH 1/1] package/gcc/gcc-final.mx: fix CPE
 identification
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the CPE (Common Platform Enumeration) identification in the gcc-final package to ensure proper vulnerability tracking.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 43aea72420..97a64ae2fa 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,6 +12,9 @@ GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
 HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_FINAL_CPE_ID_VENDOR = gnu
+GCC_FINAL_CPE_ID_PRODUCT = gcc
+
 GCC_FINAL_DEPENDENCIES = host-gcc-final
 GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 GCC_FINAL_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
