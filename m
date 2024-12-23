Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4BEE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70BF81CA0;
	Mon, 23 Dec 2024 15:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaJ75Pd0UUem; Mon, 23 Dec 2024 15:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B3C81D02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B3C81D02;
	Mon, 23 Dec 2024 15:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4672757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC6981CA0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PThiNdhvt8-4 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE9E981C58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9E981C58
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE9E981C58
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:30:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a77bd62fdeso31124655ab.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734967821; x=1735572621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNVZH+PSmvzfK93OzamcpNzsYCw158+rNDWqE8mlbKM=;
 b=NHgZVPQULsO6b4RkzUgY813VPnPY+cy8XFhEo84/7WXfk83EtJdmxG1EP2Gsgqukfw
 gZ3To/zbJT2huqmShoFXuI58CQhjoNepU9rQyzl6NpNNmXUzYRYYfw9yuH5/Ryn8GZO0
 xwGVmfKzNUwBKHLFk6d5/+S+3TtpJWmVZtdXPSDxxqryAIFO4S6CaLxCFWC0MjjPZLlu
 V8MNJwJd+wVR5Xeoq/O4oywgV+beT2J3D1dNwbZCPKFz3/Q6zCMPtAFAjscXqYqXsRNo
 70bOAG72cX9L0VJsxKeroDUnBmTnROEoFyTJq8Kr+8TJpUnHvFCVkGegLvk34eHNEnI8
 bl9w==
X-Gm-Message-State: AOJu0YyLUHEzlqkSKRzBVbfSdTR/6Og69OYFPRKBz0yytF0xmDtoKAQq
 VZ8Pi2l48gcLdZlliYhNro+GmL8SRrsknTtY1T/tVMif6FfzOrUEuFV9U08zBaM=
X-Gm-Gg: ASbGncuVu/QGamF+nv5kEWpRY3ZbiZcdggEQ2xxCtrRpuvn9NDzQhICroeazkTJCkfm
 Q4zkTqZXiSgv+FpI2H5u2bCNA1OvCs6yhPO1p6knSC+zUriWavix78KkBDkq4GnHz4QKRUvBpLN
 4Rgz1sANplNQx/fy66hx7eHhon5pUn/2BzOcliwMbeL/OOdufQg78uCLS/BIZh7DWPQR34MaT4M
 6tTDHNUgozicMiV3Pb9+KOLv0KC6PgsfulFq8ZI9MTtycgJ59NZoA7hxH7o3IuuimmXbMnBEBMc
 kP4Et3WwKeNcbCernnhcjHs6Pr7LX1daew==
X-Google-Smtp-Source: AGHT+IHgHNoiDP/PhH0LS8nVkH8mHQTmXKwMZpd5F3kiZL4/MD2Pgsnkn8CPgrtC1uxMet5GWygJVQ==
X-Received: by 2002:a05:6e02:20e8:b0:3a7:78a8:1fb4 with SMTP id
 e9e14a558f8ab-3c2d2f47732mr102598575ab.13.1734967821405; 
 Mon, 23 Dec 2024 07:30:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e411e878sm24402355ab.50.2024.12.23.07.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:30:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:30:19 -0700
Message-Id: <20241223153019.1829912-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734967821; x=1735572621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jNVZH+PSmvzfK93OzamcpNzsYCw158+rNDWqE8mlbKM=;
 b=XyE0Zebpx5DQZKnbc1/gFcKLdzPE4ZlixWtv0dNGhEBvnJcwe3+tw977bMEGW3kLNT
 haeMzG1n6lpB1ChyzfdyxMa4FqOMlrdIOdtEQ0xwYyaql3Orn2w3oQ7Uzt981LvbiiMX
 jejwcx5frw88/elWglsZ560ogXc1Kxr2T1nzQW/skyNXrzxPAkNomHegQ8DFijZK0PJS
 3KX/vrX5G5zgkcMJjnTjOZGj2Q5SIns69jVA2zF37HU8S4VAuRf0m+NecCMr+BWn0AQo
 dkBJpKAOs2FHzLQvRzTyW9naLPXmvG+av34D2ya1F4v5ygv9S7pBT6HEP9fsW30Mt/FS
 7OGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XyE0Zebp
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 24.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 5cd15dbed7..ae13fbb552 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  031a41b703d7fc47ec204d0369b68dcd  attrs-24.2.0.tar.gz
-sha256  5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346  attrs-24.2.0.tar.gz
+md5  85dc1d9cca54e0986f429bfd1f2a4987  attrs-24.3.0.tar.gz
+sha256  8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff  attrs-24.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index c0725cf847..97b72df6dd 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 24.2.0
+PYTHON_ATTRS_VERSION = 24.3.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/48/c8/6260f8ccc11f0917360fc0da435c5c9c7504e3db174d5a12a1494887b045
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
