Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C1C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8583B80E0C;
	Mon, 17 Mar 2025 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAcd-NYAo50X; Mon, 17 Mar 2025 21:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E5F80E8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E5F80E8A;
	Mon, 17 Mar 2025 21:36:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7119B12E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B69E80E0C
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmUKUavCJIq4 for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 21:36:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E037810C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E037810C2
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E037810C2
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:36:24 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3d45503af24so41433705ab.2
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 14:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742247383; x=1742852183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49ANkSRJcaQRPtP0+/+3WAabzoLSm7/3pEe4392B7mc=;
 b=gmHLRXW0+kJ2lEI+XHiqb1t2EZ99Bm2/a296QS2IosZpblsNtd5XplSZz4zFFTna6z
 6hPuy1gneQKTZUf+O5rqJRzWb0dewceVtUULC67m4uDTk95gV7YH068cyptUvHWNC6sc
 AKyyWeNLJQZj2gGL4ZcW3c+TxceVQEd0mzUbcDKNaXwbidbBjYVEPAHjo+AMw396/Neb
 lRhUJeI03g9FMAqsXX76soSYfwOW5JIK/YtlyeTvKr3HRH4SkCDI7xLx3ro7kfe4lAqn
 X6QgUi0nUY6lNzrcq71ximQgrA4oHF8aZihnNXo0kixYoLtCbRtmyVVLzc1e2o8fraYR
 DPkA==
X-Gm-Message-State: AOJu0YxXYfAWVZzR/hNxmqlzom3WyMcMGgh27o5BcsuBlNLTyMJCv69r
 W3Y4r0cBeHUsNRPUiu7yODeQUbH2SiH3/WrCoMIFQK0u8nKwBMQ5k6otWQ==
X-Gm-Gg: ASbGnct4Jrajiq28qi91qg+LGDaxxPRvSR/2hZ5YEkpYAO1xiquxfAeZGUZkmODx7mE
 rGDy7vj8zwGRw3e4NbxZF3hzd4nPSOVFNyRYjm+P/MMSG8jqDqFweMtrRMwQEJ+tDhahaY743y5
 MjELYFNvjaUNJ52rkcYfE6vrBzWDiLR5Qktq1KytHyK0Z0lg30GvPanjZJ+TXQANneO5FsKsmrS
 VVleMlL9ZfLSJ3IhN/86KG7qtboxmcfb9knaybNT2dz3p9z9pLWs72cR05jSRO4/Ltthfivboed
 Wje9zImo5qkPsZyGxhFyG2wY+6UYiEEHdSMidlOTsCWPVMH/oHHIXy7TfuNsgGMMNFRCqnjgcBs
 prADNxgkkiCTElf/mKJ4DVzm/TivcH1U=
X-Google-Smtp-Source: AGHT+IEBT3HP9vzGZhAYlUehe81EmROzEKUr+/UapOyZaJgghk7FwcKxKG6kec6OoDXszRz0nbJ4og==
X-Received: by 2002:a05:6e02:338b:b0:3d2:b72d:a507 with SMTP id
 e9e14a558f8ab-3d483a76e9emr164819835ab.19.1742247383098; 
 Mon, 17 Mar 2025 14:36:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263824f30sm2441867173.116.2025.03.17.14.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 14:36:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 15:36:21 -0600
Message-Id: <20250317213621.3044672-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742247383; x=1742852183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=49ANkSRJcaQRPtP0+/+3WAabzoLSm7/3pEe4392B7mc=;
 b=ZeUqX/+xWs2yv+08fTfAkjKd8YPWszUF84JZG+aGHDlroK+NxhI+B5LU4AgUaBiEW+
 OIKALkWSgbnjF8+exzjUkYMwPGiQkM+HhA6ZGkTjqobYQuNwuHlP7b7HzcJdTbEL5Rg4
 T6u6gf54tKAhilMiDW+n2CaOri+AqsUk/2ehwtXl24Zy2CFixz9y2wlZ1yufhnOEz2Du
 B6tH8eKqjWvZTHwXLtkCvjWyK8ve9Tyxoxl6uqqYlalgk5ABifW43A6I4ZRu5ckr5ZBt
 5K/AMfdOdvEtoP7LegsHIKFvPkz4Z1bzNPQ2i1OFlyR51O+Qxcc9JlqIeoEkBw3yEql3
 WNRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZeUqX/+x
Subject: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump to
 version 2.6.1
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
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index 069dad89cf..10d3d5cadc 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  57d956f516c6558674f6248d8ba38321  aiohappyeyeballs-2.4.4.tar.gz
-sha256  5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745  aiohappyeyeballs-2.4.4.tar.gz
+md5  2fa845a1ce2f7730045fa763aa9987f8  aiohappyeyeballs-2.6.1.tar.gz
+sha256  c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558  aiohappyeyeballs-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 9669b04793..8dcc59a77b 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.4
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.6.1
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/7f/55/e4373e888fdacb15563ef6fa9fa8c8252476ea071e96fb46defac9f18bf2
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/26/30/f84a107a9c4331c14b2b586036f40965c128aa4fee4dda5d3d51cb14ad54
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
