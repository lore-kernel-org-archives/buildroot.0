Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AABC25B06
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 02:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212DE83F27;
	Mon, 15 Aug 2022 02:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212DE83F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uA1Dy9pDsQbg; Mon, 15 Aug 2022 02:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA5A83F23;
	Mon, 15 Aug 2022 02:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA5A83F23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE64E1BF37F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 02:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A35AC83F23
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 02:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A35AC83F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axrA310becD6 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 02:22:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501B283F1F
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 501B283F1F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:22:55 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so6929482fac.9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vGRgIEfqKtawAxvglblRFRp77dHGLuF6YDfcIetIn1U=;
 b=vP19GL0Qkor2zAVRWhUTMTTM1V0BOu5uIeGvSpDpHcCEKyra5X7MbW5CA/8hPwfLTO
 HSzQ4djAHDFBv3Q3tv988U4WSPyFJI5g2fwVWnnO8lGQ/cR2in47nSZSReZ2/txX5jBR
 qOy50xe3MZKwYRtDDv9KWS5rkAruKmt40old+ISvXkAokqz/9fTGxytQ6eatyRWWEKzH
 QcPUwMU72lYZZSVDdi/j1J5FBPMMcPL3VePFxYGYqQqf9NVGPV8jh3ijvq1XWmCcTd2N
 VxBrEX0iyoIz4nvNyWQQayA1o8f2lYJ2Kh2ZRGwsmsBY9rVNAWwhB4dLyJvW/24j9sO/
 Fbsg==
X-Gm-Message-State: ACgBeo0dPqrJL8MTt67JRJCyVMt1USPmD0TJdSB16I4U8RwI7++TkgAh
 6GeZ2QUOKSKgugfe7K2RVyqSMonooqk=
X-Google-Smtp-Source: AA6agR71rgtOsRiQ+5S/q3IjMvIx2HQaXdJqiEftTiV+7QEhVgxbLw5sC/Y7FaXqrE429AP8IAjp5w==
X-Received: by 2002:a05:6870:d683:b0:10d:a90:d4a1 with SMTP id
 z3-20020a056870d68300b0010d0a90d4a1mr5750208oap.240.1660530173764; 
 Sun, 14 Aug 2022 19:22:53 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 c16-20020a056830001000b0061cbd18bd18sm1928959otp.45.2022.08.14.19.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 19:22:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:22:45 -0600
Message-Id: <20220815022245.423697-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=vGRgIEfqKtawAxvglblRFRp77dHGLuF6YDfcIetIn1U=;
 b=XMDWZbJy88tMpZW/Ql56vmDBqy0MiJk1L0A7wEIOV3ynBmnQ6ciN9tgIel7m6lJSIE
 ds9ccjOpX9rpJAG1fPO0fLgNpBVxXfMzQgXa3CdPODiVX16LUzjqluHi1t30X+RPAMyS
 gj7lBFutyHlTendZdvVKOLH6PlpEuPAeEvK8DZmGUX/nBE9FGRZQp1SsRjTcrwEtKkTG
 T4tzdqsl+x0jUOSu0JWSrEeSU1ss1+vF6h205es4dN6pIEJuTlNtOrmAdD/jVsPrHURQ
 1WhiDu/LSV/R68RnL53hkgxTNvM1kJ6lm0JXl0RCdqIHy1lwY7Vr7bgbpAfXp1dkm2M+
 n+7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XMDWZbJy
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 2604dd40c4..bf00a5f431 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  1c385169ef87ecc076c1471ccd9efdd60d151d1f5d566f1117ca73ea926f7698  maturin-0.13.1.tar.gz
+sha256  759ce1b8fa1208fc5569055e0b72155d3c5479ce0f31b8d5034feee3cffaa3a6  maturin-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index b92738822e..cc45cb31ff 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.1
+PYTHON_MATURIN_VERSION = 0.13.2
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/9b/a2/9b8377c61a0ded0b9c832343ca4bc1069e07bbcf8f844be6faf4858c7a48
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/2a/51/4794343461971a67a85db5025b7c89928c603957d6b00c9e940bc26a3cb3
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
