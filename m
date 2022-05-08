Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 23:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA5F581916;
	Sun,  8 May 2022 23:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SInqwhDO6Ypi; Sun,  8 May 2022 23:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD3E181902;
	Sun,  8 May 2022 23:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5403B1BF3E3
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5066D40443
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 23:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL4MS055AdkT for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 23:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C58240195
 for <buildroot@buildroot.org>; Sun,  8 May 2022 23:23:53 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so2295433ooj.2
 for <buildroot@buildroot.org>; Sun, 08 May 2022 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDvjDAPRHqDl4/k3U5g90+Fjt29RkO9nPyW99QiUdAE=;
 b=EdebHw7+ZDdrEEVnJ12f4vYvatO3eDeHQR6MRx2l8zAmgJMb90Uh6S4M2JYPyWPeez
 zzs0adWQsUS3X9YNl3C+aD2PIeyyHO3cqgq1hwSYQ9O3ioq0bHdqQNfHe9P4OFTWiT7S
 zy2YUlu27yYL6ksZWXVFbuJ3qrssoVxkdB9Rft+6uMS7UGLKRwydf/SV1XSDjKe2SdN8
 XqTA/byp46uIrg+XmVICR6hKs82djNPdIyDZzOtfOlcctjVG5m17CZb5bmllLjE7esIl
 SrPNpfv5CnlS7OgcVe/3RKkbv/jsXilVwtfdbpBYk/UpCt9NJERK02k2DivWizltOfZZ
 ktBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDvjDAPRHqDl4/k3U5g90+Fjt29RkO9nPyW99QiUdAE=;
 b=MovJtsOTVQQFZGD5lhTF9tInotuw4cq4FE4imniWJ9Yh9IUFqR4cAQsHU/u8kjrcZb
 kuFxNgpEGFZ6iha4fjLwm+o2zdEEV0fI2nGXERFEoNtviX9DiyRzGMv6qeE0zsfWMjO8
 fHcE4C7L64oa7lkNvXGZ2ZjvX3rmR9bgBgdLgE3rGf0/PrGIcSx4+nqDClDCH2UkO1ZL
 /1aILK2kTS2X3H7I/+uTCoZ2C33xfNS497iooYRb8N9z/x0dx7F3KsNumxRZyH+v+BY0
 ZZ7gs9Ih2z2UvB1837Mo7ARpHb2d3AzxSnJXdvloj6mKdVfzCGeZ5XbE31/fswWXAFBB
 h++A==
X-Gm-Message-State: AOAM532alsST/91ksYfdvTSCoaQ+E5H/FBTRimJyHYAIeQVInK2JPF9M
 NbasCkP8hYNuPthYl33rBgFiPPYG1j8=
X-Google-Smtp-Source: ABdhPJy4/DKYUUM3J8gagxAlUjRvcHKSE1PZEOqCqEzmIiQ89z/pT8+HUWWziSCfx5ap+wk3VaiTjQ==
X-Received: by 2002:a4a:4b06:0:b0:35e:e790:1f1e with SMTP id
 q6-20020a4a4b06000000b0035ee7901f1emr4934190ooa.3.1652052232263; 
 Sun, 08 May 2022 16:23:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056870708900b000e686d13875sm3629075oae.15.2022.05.08.16.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 16:23:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 17:23:49 -0600
Message-Id: <20220508232349.1336571-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.4.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set CBOR2_BUILD_C_EXTENSION=1 to ensure c extensions are always built.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 8858fc72d3..6098273aa1 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  a9518fd435d9eafd91063b3bf10d5c5b  cbor2-5.4.2.post1.tar.gz
-sha256  9cf21d59604b9529d7877c8e0342a2ebaae1a07fe8ff5683dc75fec15847c797  cbor2-5.4.2.post1.tar.gz
+md5  358b18e2a96ab96945e33417d5c8cb31  cbor2-5.4.3.tar.gz
+sha256  62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2  cbor2-5.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index dd007217d1..743ae4ef6f 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.2.post1
+PYTHON_CBOR2_VERSION = 5.4.3
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/49/74/2b9f9b76e2831f54d70e177a4e602e72cb86441632d1bcc15be1f04a73f6
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9d/c9/cfa5c35a62642a19c14bf9a12dfbf0ee134466be1f062df2258a2ec2f2f7
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
