Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C4DC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755C860596;
	Mon, 17 Feb 2025 11:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZItozb3Spnbw; Mon, 17 Feb 2025 11:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5B5605DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5B5605DA;
	Mon, 17 Feb 2025 11:43:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDCBADE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0DF8605DB
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EeXgVolKAt9 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9E3C6058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E3C6058D
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9E3C6058D
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:43:12 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3d284b9734fso18377885ab.2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792592; x=1740397392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLGyp5zrxh4295m0ETeooPnMKXWix/mPFc9fRyuMpB0=;
 b=vVDLKi+YLfuD2JOkvZg6Ky9Ac6ZhoizhH4WVQDnlhJrIrcnXvQN+A37bT9I4huFPQt
 7cKPCYnL5B50nwSGPCi17lG9GDOvKG/GxR0E6RkCsrj/ziI1/tjyuysEpoXIO8VjTnvn
 HPbzPZSBPcGGoOdvrX5XTLpX9JfEeeCUcIoN3nGyg7Ic8Opxx+2r7vG2sKxdjMgALOoA
 fqGfqUgUbicVw50tr0utKu47goR1vEjVHHJknAhTtaM8si3Tz1a/N5y4A5373ArQ99vD
 QyAIt4U/RI6/7PNsj/O3X9Jb57i4Fg9H0Bh004NiH+buJtEuFAUMckxawkPf6UBO9aoN
 FMFQ==
X-Gm-Message-State: AOJu0YweKQggv5OWG9aMOqrHmIAZkxFeu5aARyIqOX+5Rr6ImU9TldjC
 uxLndyzed6RX9LThi5FaRfy6zs/mg5F0/vBcx8aPP2yI+DJsx5pjud9eew==
X-Gm-Gg: ASbGncvQDolPS9jRwHzyHitLS0Co7P1i4YOXRqoQtdaOvWe0mqro8hXMw/hHCVzyE5d
 aojP+jzyFHdzpzapHcmg+Hc8IxWL/HQCst+ZmRLyv/rfdEn8C8V+lD3F3uV7/vG0kJr/MVB2jsx
 GmTz/LMxbd+UFgZSd/wSRmEx2AmleW00sP8iASp+18kcG9RdmAcv5Cmxou+baFcyYuf2s66A2Cm
 iPPWFTjsIORmwAZQYUyckhsr2FGIlzsG9/T5UMaFF44ekHnz61yJRykld6o8PkWt0GH7PdjLPd+
 ncKvmQMncKgfrLquIdz8IVEE9hJ20pKuA5j0ju9tOL3KVHiVTlCj9YMPdw1DlP7N+A==
X-Google-Smtp-Source: AGHT+IGsV2Z2nkuakss1pSuTKK6lu4XC3uHzuOQnJ3sFjamUn5BYeyRbrJ2wtCKQnsfl0ErSTst2Mw==
X-Received: by 2002:a05:6e02:1489:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d280917ac6mr75945285ab.13.1739792591739; 
 Mon, 17 Feb 2025 03:43:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ee89b4cfbcsm973252173.94.2025.02.17.03.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:43:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:43:08 -0700
Message-Id: <20250217114308.1878756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739792592; x=1740397392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLGyp5zrxh4295m0ETeooPnMKXWix/mPFc9fRyuMpB0=;
 b=FjTIY3QN0/UP2/P7n07mlP0FlxSsN3G+3fl0sJr4LQ+VA/eOwKcMy138A5VV8j5+p2
 fnGuxRgqJfibuuVbdjoQQ1gHo535HSlFnWstFxZ6KyEKGdVVUgGUsLy+H+iz9S0aEW+X
 oanMvhiePpdRw4A+aVMG2klb3RlPPkK2+Ly3oxIAsqEyzZ3QWCiztw1Z00Dgmo04Zlzt
 NOy7eqn+1vhtw+li5yLi3xDZsxxdc5bq5YR7SusTpAwTBR7Ca6lRuaywfEtu8oztYMBO
 RMFKeChPljjT/ADoA1W2Y176L8PZegulRLYPYcOqzVAFOiEUv+Rg0dAb27OpvDi5lWhg
 SeoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FjTIY3QN
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.8
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index ec6e6ecd97..a241937ce5 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  294d889a46608f0a7d614f463aa3d2ce  fastapi-0.115.7.tar.gz
-sha256  0f106da6c01d88a6786b3248fb4d7a940d071f6f488488898ad5d354b25ed015  fastapi-0.115.7.tar.gz
+md5  38428aff025530f61cd5b10efd764229  fastapi-0.115.8.tar.gz
+sha256  0ce9111231720190473e222cdf0f07f7206ad7e53ea02beb1d2dc36e2f0741e9  fastapi-0.115.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 43bc9b3a50..08fe5623cb 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.7
+PYTHON_FASTAPI_VERSION = 0.115.8
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/f5/3f921e59f189e513adb9aef826e2841672d50a399fead4e69afdeb808ff4
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6661dea100324e19a7721d5dc524b464fe8e366c093fd7d87
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
