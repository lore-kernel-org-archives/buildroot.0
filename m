Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE8BE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D1E8183D;
	Mon, 23 Dec 2024 14:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgwdqGc4l324; Mon, 23 Dec 2024 14:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E288184F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E288184F;
	Mon, 23 Dec 2024 14:16:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 554C0757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5079B413B7
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Cie5M97rFhz for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2724541376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2724541376
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2724541376
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:16:31 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so362266339f.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734963390; x=1735568190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fAazPJfZsCMk23G+qQQOfVmWaiUVafEC2p4d5JYkydU=;
 b=OleQ05KUmYNl9VlInh846ptcZtXJAF7+Y5iJkUkfQdGKOlgT8/23Hfd2Bu/nQzsufD
 yoftyie/yFEdJXQF3zDYlAySyn5VI37ridLv0ZHdx8k44opN2B3GR+n9ojBxe5Mpvs6p
 qQi3Ni/u7g7noSFV209azaHtf7YVNQVNNyQZ1i9zFYn4wD8XuquYT2Bbao18bwK0lQXX
 saVCl7ewalPF8ymfPKgta13Rrs2DfGDB5k/qspVrUhh5MVyRWnyJAf2I+SihwfKY7ysx
 oFyBrA/v/ej7ZUD+xvFsCQ0Ge2za9XurRy4LpRChcm6zXDkF/rrDp6yay/AiiStey2MO
 /AWw==
X-Gm-Message-State: AOJu0Yy8GNIcwf7t80pxKmKd/9BYLIPAu3rEUxlznQOTzaa+NcL72dhk
 wqheHCdFp6SFKCHcQRSB7VUEgipLFASVLDRrnGlvH1KiA+JPSFFI8d3Kqjq3TOE=
X-Gm-Gg: ASbGncvzJ6BXa/XXRK7stzoeGp0gduxyBPvvw+d9/x2l54GfY/8pXyiY3tzZM4mAqNP
 VkHYukx/AihhWTNQMgNfRQJlD+X+p7QLu7OuA8NG8jfCmAASarb6BPwhcL1bnRoqp9B6BJCASEu
 PfhzIf+fmzzxIcRhnrhSY4OBdlHm9IFvYZldgk8Ck4qi+JdbhUxFzm6XuaNWTIwsVHKpgz7rQd4
 d3LhCFjJ/kF1cJCrKmk4GYLd3FR1pnDVV/SpY60tfgjOOM/8vca0hYyDmWftK2R5g+icBYDLE6g
 10TV90NhnnsaIDMkTBHIsESbO094uf7zdg==
X-Google-Smtp-Source: AGHT+IEAkEy6gKF/CA2qYh6OjHGq1xDalcfaFmGyUFf3eH203Px+xhmrapzDSg7v33fFIgznNIs0mg==
X-Received: by 2002:a05:6602:2cd1:b0:83a:97e7:8bcf with SMTP id
 ca18e2360f4ac-8499e658743mr982105539f.11.1734963390295; 
 Mon, 23 Dec 2024 06:16:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf66f8csm2254239173.51.2024.12.23.06.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:16:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:16:28 -0700
Message-Id: <20241223141628.1710361-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734963390; x=1735568190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fAazPJfZsCMk23G+qQQOfVmWaiUVafEC2p4d5JYkydU=;
 b=IBuyEag0/JUI5niB76E+qOV1Gm8CiGPhmn19HcghXVHgm+IxZ9MpG0gxgROkLtVd08
 s0SpLgLlhsKxHhHu4CzwXvh+T0xbcSUJEyQQmFlxlDwbFjoL3gOyBSMlne45JuiTqiQf
 e1YOFgiFC/G5680/s6ktfrmy1v+USqil2CNeq7F4ri/IM1N4TeujHcebgkYvbP56T8fi
 WXNikVho/fspKQ9sObPjgY1JVOMgP0qmnpcWAfllIpAmyhD3gy17o8zvqxd19nMaCO/3
 sIC7gVfvsIpiK5IOTdFh2rA4uYOtO54PPCesEt2+aIa2O8gtez4tXCMObaFMhZGhGKwD
 r94A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IBuyEag0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump to
 version 2.4.4
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
index 85938c1084..069dad89cf 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  dcc0ba52e3c350f4edc8a8475d1892d6  aiohappyeyeballs-2.4.3.tar.gz
-sha256  75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586  aiohappyeyeballs-2.4.3.tar.gz
+md5  57d956f516c6558674f6248d8ba38321  aiohappyeyeballs-2.4.4.tar.gz
+sha256  5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745  aiohappyeyeballs-2.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 2a2c10fb37..9669b04793 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.4
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/7f/55/e4373e888fdacb15563ef6fa9fa8c8252476ea071e96fb46defac9f18bf2
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
