Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2397CEE322
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57AB440450;
	Wed,  9 Oct 2024 15:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iw2OKTyL8l8; Wed,  9 Oct 2024 15:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106FA40684
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106FA40684;
	Wed,  9 Oct 2024 15:52:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBD281BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB10481080
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1AvAAsfi_jK for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD78581062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD78581062
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD78581062
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:52:31 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a3a3a9e4ffso1112735ab.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728489150; x=1729093950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wNlhpn/IGuK/dLpvWcOadT+3eWnCzcB+D0EQfek0Bk=;
 b=VI2wXNOEp60F4D02od+fjimN17dAXQBHXc+5odcT20mEzR+bPtw9UwX2AlsAYa6S+y
 4YPxsfdKWGhAbZ1Uob+tkvRQPwcjbFwk8FkqJo9y4a3x0XzdAGTdwMhi+Qp6zHsZXikV
 Sk/mEO+ErXmLpYBvynsODz/7EIiXKlzXypy2SHc2ozXSIo21jMfQ+8UPkR+NrxG4myuC
 zi1yT2nP1MdtLximdqM+KsuAmeLFBLmpc0Z2xt/ppdQNMzbvbzM1UP8HDnSLVfiRUZA3
 fPKkFQvpbDPaFLa8ldoMF7zLe0B8Vyh0+M6lrypkEqniTGGLnT3D6XAJS5O3H6P9GS6T
 j+tA==
X-Gm-Message-State: AOJu0YzFJeDYUwmarES6sHm4/z5mujcwc5D5bl86Wo2/nHvX37PiS6aR
 OcJQWky9Z8Uq2uMkthOHEJRT6/KRiYTvUwCX0FacveuxKpPlaNHIFGDfSzRx
X-Google-Smtp-Source: AGHT+IGrgBY3U3Zc4Vw7bK5yU4OKstk6xy5izVvFKb4IGaCWHb5tFG41HiVXZTHAe7jEUtUsMnfW6A==
X-Received: by 2002:a05:6e02:12c1:b0:3a3:637f:1012 with SMTP id
 e9e14a558f8ab-3a3a71e0cc3mr190505ab.12.1728489150539; 
 Wed, 09 Oct 2024 08:52:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb357d5sm2127419173.12.2024.10.09.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:52:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:52:28 -0600
Message-Id: <20241009155228.3787275-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728489150; x=1729093950; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wNlhpn/IGuK/dLpvWcOadT+3eWnCzcB+D0EQfek0Bk=;
 b=FQtMUW7i8FpK07/t56VR4T4uWCpgRS7ceMhJc2hGHOrGp/qqKc578lzd4VIldOVpLF
 1qzVSIgpwufd5LEw/a8h216f0MwWtpBDtOEWDJLYXP2qNm3hb9FnnVCadh2U9qoe5PpG
 TNFxz5GSY5g7N6jzYEeCeRXODgAVe/Pm8+NQjyT5E+dPcsRuhp9i42rHSZAxanuGLfW7
 vHhl4zDRGcEN2O4RXHcRzHqg8R0R+P0QSD0XaYdb6uW1bVaYhSAMvtwQlbrDEIZwVJpp
 CQY4Rsgmf4whG/j2w5/ncLEK3RL4iiRRCtvczkl1eR++gfT0st3iX4OaCjs14+PVot/d
 6zxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FQtMUW7i
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.36
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 4abd9ca4ea..5dc348fc30 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  36c20cc947094f913c16c1109b13fdd3  botocore-1.35.27.tar.gz
-sha256  f68875c26cd57a9d22c0f7a981ecb1636d7ce4d0e35797e04765b53e7bfed3e7  botocore-1.35.27.tar.gz
+md5  5742162ec6e63e7d7ea7ccc7d1f8c0b0  botocore-1.35.36.tar.gz
+sha256  354ec1b766f0029b5d6ff0c45d1a0f9e5007b7d2f3ec89bcdd755b208c5bc797  botocore-1.35.36.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index cc7b9949a2..84a8d43705 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.27
+PYTHON_BOTOCORE_VERSION = 1.35.36
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/7d/b8/ffe0d717da12ff6028466b28d79b0d8f53d64ad7ddd33326fd55860d29ee
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/8d/4f/11d2d314f0bdbe7ff975737d125e1a5357115afe28fcc64f13e68b05ba61
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
