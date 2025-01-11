Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A1E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 12:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A9261084;
	Sat, 11 Jan 2025 12:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMejYCMGF9ly; Sat, 11 Jan 2025 12:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7753261085
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7753261085;
	Sat, 11 Jan 2025 12:56:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E19950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F96340F32
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y1u0WMNjkKv for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 12:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EEA540F2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EEA540F2E
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EEA540F2E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:56:08 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so13538025ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600167; x=1737204967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LF72WMTCLgSzj3cLJsWO8Bcx4+EfoQC3pxnP1KmrZQA=;
 b=EqOA5IUj8WP2S5FP/WpiJ09vheIJlqk/Wk5Mmn3v0cfwuPZBg9t8YhF/7LVFqdiGL0
 oWvlsNxlK2jRti5O4pjtMeG014+YILPkEafuIStsNxIgOKKJZdYAfwYB63bgwjoZ1PaZ
 cODhrz8bu5b1y0SxrZaheZlBxepsK5jg241lwkmgEPtzn8WERSlguI75aakbk/98Lk8x
 qtvTzUrzkBNCDTmtAnMHTDnzDWsnLuAkGP1QisvZPRPsl4vbHB/rLI2XzaNhFjB2bTDy
 Qz1nW5wFT9NBbnWS/haZ4ZXCjYGv279hb6eXY6WUx3Qz2E8JxxyxLVfbJrEJYvbfTBQC
 GU2w==
X-Gm-Message-State: AOJu0YxPAnWvCRFNcQHlVNLgEKv/IsQygGLQ/u0aFPHdkCj4/7wANzN7
 znKpy+4AFTEGiSQg6RqqNRPErhaPPTznXh9n1Xs4FpDhurCR1+KZEi9CBQU+VzE=
X-Gm-Gg: ASbGncuutUlOEqZNzwXZFlFvoucEfKDMl6w1So2tD8EazX6nNvOZ2sSA9U3JDEC7sTv
 Man+iK+sTIrlgrfOi69p0/Y8txWidYKnDXSuIXJLutTlTxEb8/79/RafV/5VBfuNGTP/Uqbq0oO
 vklqXu9w9CPgQ8jNgPqxzbV9QkJAF0Y9L0vIjYohi6cA0KqLzf/WIb36bWaHeqZflpaByCV6+0d
 9LhH7vXQ6ZDMfDks+jz1tYSR2o1z1ifQOJ6yj/WAfJ7qi4tUYd/tNqEc5F71+PqSn/5QcDuI9OC
 22z2PFMHM3qlb45ETc9MG221Odb+ljM=
X-Google-Smtp-Source: AGHT+IEJYMNGYM0VBEDxBVo4wexIBwVHjckBLf6ByMGTDTaUhyFk2Eflm1Zg7iEU2YxBYbDs44x7MA==
X-Received: by 2002:a05:6e02:1a8f:b0:3cd:c260:9f55 with SMTP id
 e9e14a558f8ab-3ce47570cd3mr74969035ab.4.1736600167077; 
 Sat, 11 Jan 2025 04:56:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b4eabf5sm1509168173.0.2025.01.11.04.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 04:56:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 05:56:05 -0700
Message-Id: <20250111125605.2454307-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736600167; x=1737204967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LF72WMTCLgSzj3cLJsWO8Bcx4+EfoQC3pxnP1KmrZQA=;
 b=M9TqR1qqgBw+O6w9+qvx6eQr+vTC6vkOCoUtBJ3rhRcWnp/DUEDsF8F/oTHFx/2AUH
 ljuzZPg9AuodjGzwwx2G0Q/j+SDRYDqn/N94hlGALxXIUGVE0DM2N1CanvmuWznHYPnO
 mfgHshc84XDDBMp4SlOjF2Z0sLoGNYxOKcOwl04frxLlW7of2wUQyJGaR6Y3azxxfFSU
 pM1MnnUcrWDwKlE5s5R1FghVCeaJ0I8ewG7ts48P60fohj/mQr5y/2klNC/8I/iwvHba
 ZnPjWP6w9EM/V9OOVhyFxSntpPBpbVOv4dCEW9ZG40bFESWPV7ZjOI9XN5SDY19Tpk2Q
 xdHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M9TqR1qq
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.2.0
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
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index effecd8531..cf270a2d3d 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  7b4f094786d1dfc8d011c7649d8ccb97  libusb1-3.1.0.tar.gz
-sha256  4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c  libusb1-3.1.0.tar.gz
+md5  617502b66841e601c28c668c20c1d843  libusb1-3.2.0.tar.gz
+sha256  a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961  libusb1-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 39fd7e40d3..7d68377f51 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.1.0
+PYTHON_LIBUSB1_VERSION = 3.2.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/af/19/53ecbfb96d6832f2272d13b84658c360802fcfff7c0c497ab8f6bf15ac40
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/d9/b7/9e833af6cb52fa2aece1c6a1378667ca0172bead14f63ffccc3cb9862df3
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
