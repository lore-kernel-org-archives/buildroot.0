Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B2C021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DEB409EE;
	Sun, 16 Feb 2025 15:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-4atQFsj0Mp; Sun, 16 Feb 2025 15:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4588409F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4588409F5;
	Sun, 16 Feb 2025 15:35:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1690FDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19305409EE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnOuaW9zUDad for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE9D84095D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9D84095D
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9D84095D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:12 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-4bd367926easo695988137.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720111; x=1740324911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V72jQdSMFrjH89b98JXsV4OFqDYa3v+bu2I7DxWdWy4=;
 b=K8M782rW8aFnZEDtPwMR7wcNpLfk4hVjWzmk3kBtZRPCoLoF7xfH0E5VOvBgHlv3cT
 PeFX2Kq2ZWr5jtc5IFXR9YxLrgBuG3M/DRw3vMrv69Jab4MSDbPTfHzkUfg2ssR68dX+
 cJLZgNyTrbDNa8Dwp/V7/BFyHCcELu7fdzKfHPo23pqfcw04W3CbW0+VwS3GTgQz+KLc
 0hcyLuSvCDm1oXkeJrkY8NxNE3rRpucs0fpnTB2j7t08aerEZbWwISQtJXIJtRYwNm8t
 YQSWUfGBmWh61nVmukmXje1XunBvzPtq7h6Hda+6M9cJhATJApVdWJBQAEkVZiWPcJsx
 QaTg==
X-Gm-Message-State: AOJu0YwFPG/yaTEW2bJvteJZYJTqFMos87r3S6I2mEeD91CZV/6YWs2F
 zMgKA75camJ8X9F+F1yAscY+paEK+VQIX0YUUGc9cTFIFU2M/omzIAvs2Xhg
X-Gm-Gg: ASbGncsy6nAhpfWVshj2BUWw5zKx06bB+L4U4gWszsiQf+BnzVGf7+XElw6ujqd8T1f
 BNMuG2id+4kSnNXHpSqLuEKJ6jrXhb3fhtoa8LXSKHCEz9hk47CYDlY5eBQ2f5uhpHV8Al9Xbd0
 4+zDZb7ohZKjgvnyctbFg42OPVDpdyUABGvN6ZK5MQZrCMPZtNi5MaM37A8WiGBrhV85FMwAvDS
 Z9ydI5g4pKFLBnYOuQPnzu//e5zC5YhGhJfWe5c4Ms+M2GTocBCYR718eeEAPUKW3AJ5WnzMqDo
 bp17sFbGRN0Fn6i8go1cze+ELAq6al9XeV8i
X-Google-Smtp-Source: AGHT+IHo0amMsyV0LVDZd2VhFgk4ExIj1tPx3VQKoJg4LOiCdr3vdw2WOFhKqQqyiR6s04TWUyjn1A==
X-Received: by 2002:a05:6102:f12:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bd3fec0b0cmr3148552137.22.1739720111168; 
 Sun, 16 Feb 2025 07:35:11 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:10 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:40 -0400
Message-ID: <20250216153441.2706067-6-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720111; x=1740324911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V72jQdSMFrjH89b98JXsV4OFqDYa3v+bu2I7DxWdWy4=;
 b=ZMG06+Y+oYozFN01iNaWwvEVDaaSpoFrj+EslCCz35y9mOgcEZIEjZEcHGDCQOzSeB
 qU4lVduPzxFctPoZjfFZI36b4dGJF1A5SmZYNGFL2W5DB+d9wfxyg6DNK52FX+hoFSse
 FMM2fVEEBnf1dgdXrlLGlgJ6Dg12jygWclN6MJ8quNDYp2Jv2y7mGXapXHH4l2d5Bxsu
 T4xS84qkVd3gvV+P73UrnZ86EzuGa5hDig50XxaB6LofREMVqGeWodAtF9X8xH4O9wbA
 AEHZjd09GmVn63tGjYjakZwJxZwXUC4bD9aj97mNLRNDjzLN0rdWDuOK7VJlwkEpTutu
 h4Uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZMG06+Y+
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ChangeLog (concise version):
https://github.com/webmproject/libwebp/blob/main/NEWS

ChangeLog (detailed version):
https://github.com/webmproject/libwebp/blob/main/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index d579356a7c..8d80c72711 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61f873ec69e3be1b99535634340d5bde750b2e4447caa1db9f61be3fd49ab1e5  libwebp-1.4.0.tar.gz
+sha256  7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c  libwebp-1.5.0.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index a4d030948b..83d5506c0f 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.4.0
+WEBP_VERSION = 1.5.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
