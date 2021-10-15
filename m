Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A32C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC94961163
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC94961163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A51A4066B;
	Fri, 15 Oct 2021 05:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-tsbYxxHBvN; Fri, 15 Oct 2021 05:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA5E40581;
	Fri, 15 Oct 2021 05:58:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62B821BF2FB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51EC060780
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSgHLeIOUpam for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 05:58:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D2E560638
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 05:58:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so1813461wmg.3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgGqy/DanjtBMA38GHJ/9DWoOmQTpdQm6oiuzKjzjTs=;
 b=dW4lHONJDDBzq3HTha0Y1sQEjzUKHtOt6y24obeyV5oeUV7euLRSLGr613GBNMKmOf
 skZPNYRCLfNd4Qn/lU9cOOg4qEn1tmvc8sDJ1ljbqhsNcobsokf/SSNmGqEdg7/j9pcn
 MxKvVmx4z54MauIIwqki/MWttJYnWyH85FoI1VIbPzYOPP6qDEFqYmAHRjJnvavbTPmC
 A+ojy1eaQlvHDzPR3U+Q4PkkvPENf8xPZdSARzMhpTr63fTgI8Q9Awbfx4y/Q74D3pGl
 UxIZtXKv6SBru/7/zIRqA5K3sF9tzeJ7qvWRs9D7HlSOG1sdscbY9aHvKeJFW73IYGI+
 G2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgGqy/DanjtBMA38GHJ/9DWoOmQTpdQm6oiuzKjzjTs=;
 b=DKR5BYir2efsvYF8WpKQOAhQeWmvrjlaJwFX6Ty6sbIuVr47U1IzmXJSS6Q0DGyFFT
 PU72EmqN39zUqNOBlAvcWydtnOgsy+sNQKjYGazdBCyldmMQBdsX5nUwud9t33opr3a7
 R0H1d8ZskhLKL27WQXZkBGL1Dt5muXlWi7TpJwKDuihtbkGIdoXaSIb5ZkgcriDn7J30
 fllR4BOf3FM6JWbLVGQ2dnKjt1J9MFcJZIUuPoa1eHEt5uZVHtolItfHpqW2eAkVGjoD
 0Za5YYwxx7+1vJRm10x9I+ZUNga5THjv64YHA6twiSzWtgfzmM/Z0yfMXw2jcv1DWsO8
 T47Q==
X-Gm-Message-State: AOAM5305ihNJzzL0YATN/+SX2UVek4R40DP1wvp2T7/Fbwn2651wwy7U
 wxJkPQIp7MSvV2uW+/EIOXDPH0DwtjE=
X-Google-Smtp-Source: ABdhPJxL6Cl0G6PDLdAh9kK2caxWLf65HPpprRrhDl3quB4cES1ChYIBVMwecrnJhsLLVVGESjONXA==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr10260910wmq.97.1634277483148; 
 Thu, 14 Oct 2021 22:58:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t21sm3708304wmi.19.2021.10.14.22.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 22:58:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 07:56:40 +0200
Message-Id: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/4] package/python-cryptography: add host variant
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f,
python-cryptography depends on python3. So python3-cryptography became
redundant at that point. As python3-cryptography is a host-only package,
while python-cryptography is a python-only package, add a host variant
to python-cryptography to be able to drop python3-cryptography.

While at it, drop host-python3-pip and host-python3-six as these
dependencies are not needed. Indeed, pip was never a dependency of
cryptography and six is not a dependency with python3 and will be
dropped in version 3.4 and
https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 98c65e1528..1d903b03e9 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,5 +14,8 @@ PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
