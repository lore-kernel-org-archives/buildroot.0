Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E05DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BB6416F2;
	Wed,  2 Nov 2022 19:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BB6416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWRwPzjt4NH7; Wed,  2 Nov 2022 19:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27BDA416E5;
	Wed,  2 Nov 2022 19:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BDA416E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C97FF1BF4E7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A551560E64
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A551560E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YF8bBiKWJMpb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BC560758
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85BC560758
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:01:48 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b2so913531iof.12
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9I/d4W4HUG6E9RBQMFBI6Uc8FiKcxYR8Ms8iD4hXUmQ=;
 b=vW5FLtsjU+zrfCGis1TXTU0zDlurxvY0MAk9+OwPZhaCW95VRvn21ewdOiAH+n0R+I
 FgJdntTeA3QtrRDh7ovyg9fRTM4y0BFtkdVimtbRJA4mLvbZ4d3563Stx2ZTavTcqN3Q
 85IPuJOzdAy0uVa3UfCQrzW0fih6h/+ErVnECBDY///JNP8ulCz6LhzBbB6m8oG2heD3
 RG9nnRiWgXVvadsGFhQP15Bqoj/X+i9Veb8X6aG8KoS0I6FFwE6XC8az7qrGeFUdkKc4
 UPHIHeMXLdaWk9iZudB8APgct6nVGT31I+T4Uv8D64xSFDz275HY8s/AbcifG9lAIR0j
 xrMw==
X-Gm-Message-State: ACrzQf1dXz6nNDtIBrao0x1iA1kzWY6EFQazD+o2b7W/8Qxc7iGvfPGZ
 43aCWXeVahMOR9RyeIefyjXDHQ1QPBgFbQ==
X-Google-Smtp-Source: AMsMyM7rGDjeecp8rbJjjsOY49K/hamKA8SMFWInBpmuTkUGytG1pgw8JzVdpD1zPh1uRp4Ky/AKJA==
X-Received: by 2002:a6b:5f0e:0:b0:6ca:4b22:ba30 with SMTP id
 t14-20020a6b5f0e000000b006ca4b22ba30mr16785715iob.51.1667415707049; 
 Wed, 02 Nov 2022 12:01:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05663814ce00b0037108a00c73sm2563513jak.139.2022.11.02.12.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:01:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:01:44 -0600
Message-Id: <20221102190144.2506841-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9I/d4W4HUG6E9RBQMFBI6Uc8FiKcxYR8Ms8iD4hXUmQ=;
 b=NC0oP5pjknu6ok77yuCAF4B9vDaOumqDILi+XmEJu+kNjspnwyJ0ALFG92naxIqaAQ
 EA1ZhbudoENLQ3DrYsCy2CtMzbzymBL5GPT9XCGwsNVSu6LBEEMpYevz7VgjgM/lBiZC
 PBu7Fq2UnNJIqkQTuabQJ2cKJ4+cltdtsap7PpzYhuMDtGwrSqvSWhNENcSq8yIpEH5A
 0pKfEYiAE3KhIXcaQE+S78Hthaxm9Zi5M6jzmcH8SlSXyPm7ekt7Pyc409/cwLrk1eYI
 jG/fjYQVqHuRRFNP4+HDXPCPFBNAqBnPb0mLGzprqGUQuj+9V3zzFS/MZk/fKyYPhebu
 thKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NC0oP5pj
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version 1.26.0
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
 package/python-boto3/python-boto3.hash | 5 +++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 96c03be61c..347acde9b2 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/boto3/json
-sha256  833e67edfb73f2cc22ff27a1c33728686dc90a9e81ba2551f9462ea2d1b04f41  boto3-1.24.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/boto3/json
+md5  17f5f946d79da139fa9fd9b014fe0d99  boto3-1.26.0.tar.gz
+sha256  8f0e4eb5c26f927c09bc03302d38156af578b816f1e4f8ca4f0f734d134b9d4f  boto3-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index c5f9133573..03dc32a08b 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.24.8
+PYTHON_BOTO3_VERSION = 1.26.0
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/60/3b/6fed306341003fd059f402d22747ba33d07b8ac8bfe53dbedb2c6e42ee3b
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/77/18/91af4ff58b26d03af8bf8e0759c4087b77032bdc54199d750905080c669a
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
