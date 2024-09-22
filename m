Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C15CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0FFD40654;
	Sun, 22 Sep 2024 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2W8GRCkV-e1; Sun, 22 Sep 2024 08:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52672405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52672405B0;
	Sun, 22 Sep 2024 08:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82ACD1BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7248380ADD
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbiBXhqgDU-K for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D8B6812AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8B6812AC
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D8B6812AC
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:44:10 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a08c5a2bddso16870135ab.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726994649; x=1727599449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0WWZRtdo1meiey1NI8uBY9UslRkAAn2S/FnAPNcIgo=;
 b=jjoh2QNO2yt+QPpTdXZ5JDUBVO9zkkaDmV2xVBx4qqVZrji1/8xfwfTk/xyfj6A5HX
 c4hSTjglUej7PFqlVm+whs1I+KXDVHTHFjms4PdJy/549zqDHkhnxCEDtaVQlcYiG9cb
 2bZ9jAUMCav7DHCU/d3DChovj4gO2r2RvIud3jWNHEPcqP2H3xZYia+EZNB9Q7Z73fma
 wP0bc6hzg2iXdyr1NlPAWsx04LHfDc9ddMyaasWIoUB9IGWXDpuS6BxxDzq+E7xfKATK
 rwvi/GCItgDB2nQ+1k2yZz3spVxKnzIMd3IAV/a/Yhqkqy/+pxrIkwXc1Q8SzJBKbJf/
 My9w==
X-Gm-Message-State: AOJu0YxaRjo7qS8QeB60+MjOnCnGSvEKXlkwUjmkC47SbdUx0U497Col
 ClVSojL4sz/W8Mlx0ekardYGTpkHyEdiEB0n2KPYq0/J8XASrLHhHuvslg==
X-Google-Smtp-Source: AGHT+IGPTGoZcJIlfFH72KYXQCw1x1Ud8k1YWRF1RtRDGquqk00f0O65bQrt4ccLVpNxVcIOU7vPgw==
X-Received: by 2002:a05:6e02:18cc:b0:3a0:9f96:5bbd with SMTP id
 e9e14a558f8ab-3a0c9d16185mr69216875ab.10.1726994649134; 
 Sun, 22 Sep 2024 01:44:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d4asm4466419173.90.2024.09.22.01.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:44:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:44:06 -0600
Message-Id: <20240922084406.1012789-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922084406.1012789-1-james.hilliard1@gmail.com>
References: <20240922084406.1012789-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726994649; x=1727599449; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0WWZRtdo1meiey1NI8uBY9UslRkAAn2S/FnAPNcIgo=;
 b=KqoJqGF2X/PU8aObrQ+ywY0YhXAgT1Dz4UeTddhdSsKtb6X/ZFhzLYdR3Ui5RxV2sE
 5hx5TPgaRL1J4jqTz/mDz1uQ+NR8kQp12KTUN0DNpQ/Ry0JeR91JAGcD0uvEs7Yi6QH1
 JmjDp57njmqrt+bkOPiJjUDCmxY3Av4x6hd80BZGKKv+mESEMkAUt8/Vm07fhW32gKJt
 UxXlCKwbKXj5jPPMuFnG4ed5Ygt6wIqZ4yyNh1axvagtb09AYfD5YPPOERi3Ox41rSvd
 +/NBhdXyluNb2aVHpNAiPPYkPTvZhPQBBCuoxR9FWqKixgUdbgx5Nbvgx3yGq1yQnGej
 auVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KqoJqGF2
Subject: [Buildroot] [PATCH 2/2] package/python-esptool: bump to version
 4.8.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-argcomplete runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-esptool/Config.in           | 1 +
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 4099957971..5095454aa1 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ESPTOOL
 	bool "python-esptool"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_ARGCOMPLETE # runtime
 	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 490b4e7e9c..0a60fd7235 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  e7f2012cf31cd23f60049b179fb3b53a  esptool-4.7.0.tar.gz
-sha256  01454e69e1ef3601215db83ff2cb1fc79ece67d24b0e5d43d451b410447c4893  esptool-4.7.0.tar.gz
+md5  4bcb7f6f3d2c9b4edb4caa09912f1dfe  esptool-4.8.0.tar.gz
+sha256  f933150b5753e7501024e4d237fe078a77913a0cb7e2f08197ef8d70306b1b53  esptool-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 648748237d..df19daf61e 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.7.0
+PYTHON_ESPTOOL_VERSION = 4.8.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879dee053874a4f955ed1e9ad97275485f51cb4bc2cb4e9b24479
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/d4/c7/b7e4b96a0e7d9b94fe953e1b55b3573bec498bac05f72e61e5a0e979e2c7
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
