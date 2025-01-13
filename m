Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40871C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F408E81036;
	Mon, 13 Jan 2025 18:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aveRustMRZuG; Mon, 13 Jan 2025 18:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026A180D19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 026A180D19;
	Mon, 13 Jan 2025 18:48:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FDC395D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DAC380C26
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11Iig2KFeFKq for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9202780BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9202780BFF
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9202780BFF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:48:19 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3ce7a33ea70so897615ab.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736794098; x=1737398898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FOrw70PCfSvNE5g1WnyOWkNmqZsJf+Nng+wHkTAUWdU=;
 b=pVnGdpegcFnnmBT9WyJok6Lesr0XV3nBlZRkpkIza/HLubFI6wQs+YA5niATIluUMd
 ricFGAkGEcyebAeEcp13MvQ0VCfAZoFC7o6Z24kBENhsqRTqspMygeooXq9BeBlW57B8
 hzNC4PjBiKp1elPs5wMtDY2RM61rvHPtkRVZErrSiVcQtXlRUICg3eTpMbMWJmZe5xK/
 33ZlDnABPEXLyg8gjG5inDg7KMUkYa+8yO5Y3i2dv4nrGJ6OYxyOsIjX8AeX9SWS9gHA
 lf1fSXRtZDl+NGg+0lOY8R5rcPX7H6bU4cCkymOShmQ8AwuOL7keVZPQBKaABBW6JUza
 oJxw==
X-Gm-Message-State: AOJu0Yw37ZmR93TJwoqLYEchiAo2giO32xbGY1y55aviFoGpRYwj7o8V
 EVTzfmckA/8JF9EOP1nV1xJGg6zIR0SstL0m4qkZOU68p+s9KmVkJdp9HRVJWyo=
X-Gm-Gg: ASbGncvHx2crbeCYoA6lAqFlEqa/6XkhN9GnG058aIjcUKbPt9G9+yXBeo5sUUxiZ46
 iE/bkRF1shatM0YT9cZMAlnidgkwoKUcOPcOQ/kQxCjAUTUWXT45LWWnkDXFOBFIHTFpBoWHvtU
 FsEQmFIGR8da65EDWQVpTPTynAnRK9zW3qrcOSJ3C69jazV6jm2+ptnZrOkuYH6Eshb6BEk2MRq
 5y1I7ZP6eoz43IM6Tm38A8oNHk6PpnKagpu7u4ALwJeHVeFev2k8ICxHkEtpR5uoHXNw5gha2Ad
 pNKofwoU2b5Ret9nmmetnZC6jr3non4=
X-Google-Smtp-Source: AGHT+IHNInU+KutPBmSL7exs5oqgGfA2rR1igQcrwX6gywE3V4v8R7wSPfETuFtb7iuwLijvpoJifg==
X-Received: by 2002:a05:6e02:1c8d:b0:3a7:be5e:e22d with SMTP id
 e9e14a558f8ab-3ce3a9a50a5mr163938395ab.2.1736794098377; 
 Mon, 13 Jan 2025 10:48:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717843sm2891175173.111.2025.01.13.10.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:48:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:48:15 -0700
Message-Id: <20250113184815.3023660-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736794098; x=1737398898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FOrw70PCfSvNE5g1WnyOWkNmqZsJf+Nng+wHkTAUWdU=;
 b=T0MjyC3md8NAKCWeafz06VaGAAZn6uj5ZK3zLQdtVJSFs3onKixK7tYfbhWIshlKyn
 LcaEjZbFVt+sGDccIxCcxcBZsD4Kd65s8f2iJ2FqpbCoV+ddicIjgNsiExQyFb2x2wUD
 ubZaPjnxrShg196vvT4Nrc1ixIdMUUkhLLXiGCBp0SFHb9AvhpTv2RH2xT+IASUbOeH6
 mH9o5/md0ky/Y1kO1GxPzjVFzFtyW0aggx1X5ou0gJiVM4VbVU1oOFfyi0RiJYPFx1Lx
 bTY1VwL7CBj/1/NYlANU7y1tct+xaCRjXXA1/3Q+zu0DYtCwuBS5+8G0z865bp2DX0T+
 4kEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T0MjyC3m
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.69.0
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
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 5784e4758c..685336584a 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  f1e17b3bf215880d87fb8d853bd5dc4c  grpcio-1.67.1.tar.gz
-sha256  3dc2ed4cabea4dc14d5e708c2b426205956077cc5de419b4d4079315017e9732  grpcio-1.67.1.tar.gz
+md5  397e8c15a8b474e664225927a7a5fff6  grpcio-1.69.0.tar.gz
+sha256  936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5  grpcio-1.69.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index ed854b5098..81f4b1fe0c 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.67.1
+PYTHON_GRPCIO_VERSION = 1.69.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/20/53/d9282a66a5db45981499190b77790570617a604a38f3d103d0400974aeb5
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/e4/87/06a145284cbe86c91ca517fe6b57be5efbb733c0d6374b407f0992054d18
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
