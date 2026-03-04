Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C20AEFCE33
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3D98217B;
	Wed,  4 Mar 2026 18:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQD_i6rZOADK; Wed,  4 Mar 2026 18:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F7B8218C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772647709;
	bh=RYLfMIvhfOYJrIfYnqO/2u+NWCyG8UEIrqHAqW/JlYI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dtZr2iVaRhV17QYf80V9nBTYejPQg/I9jnq/UREHDoop+6pkM0orRfzDx9v1G3Fag
	 Kx3uSf55ItoRtVFSkUgVN0Xl8JMwl+KaGJpVoXbF94HD1uGT00XA+3SYZ+0pvLq8Q1
	 YSOXA1Ru1mEhQUrz5snlQ1QMD2lRfbNltSf0bOht85qn1ZxWmbeHS2T+MB0n64ZvTf
	 Ay+kM6MkKzIa9RUVJ5ntxyRvzX83fCBG63+Qbbnxei2wot5wq5/VQ1NVFU4MD068+e
	 1zkXw85Xu534yhKaBntOHmmFrj9pFIiJe6xgHCXc9C6o7teRmUpbYjdfQXzVNfj3mB
	 Fvh0UZeR6K9+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F7B8218C;
	Wed,  4 Mar 2026 18:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ABBFF6
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1FE60B21
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyRnLL0gczMC for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 716EB60B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 716EB60B22
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 716EB60B22
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:26 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-45f126d47b8so5280492b6e.2
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 10:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772647705; x=1773252505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Smj/UcBgCQzQJ6JjaALn9Teg53sCV1zOxELOslN3g8=;
 b=fuHhuDcSnH7Hg0/nqZSydT3XPw6LXYegt55ehKzhsnEPtgxAFOaYKSa+HMbHlsfQgV
 QpSiOPBHT7RhVnpVhOIbxoDT3uAUF1LYiwfi4Z7hv4NBU854vpkaM6KK8oxQ85CJBaj8
 x4VCc7LzAPtp1HtY3OFZCGDJ74ZYzTYYemOp94uxIDaeZvkf+r719WXpcFT9rzjck6/E
 6z32t/0mgSVOLrrh57pm/+3JWrJO/KNEJcrC5EpxnHDpWoEeHZY93Lr+0qEZ5tkYTqA9
 UPtU1g2xIZJQjH1bFtSBvmgzO3j0QaKz/mJxFw/FqjgouuE9Mxzfqy8rd3qNGRxBCT+d
 ZzPA==
X-Gm-Message-State: AOJu0Yw3t3ExY+yCZJbili5Nf493YQLb2D2OFgjKHU4zJPEI2ESEkE87
 9Rco/UQSYqiMXI6aK9Iii663qkvk75K+++JH+w/gdVSCTMYbwazcZyYAkCNF6w==
X-Gm-Gg: ATEYQzx7n8OV/Hx9VoQ2s1iI5azSMEgMgJoSB33okPHPCJeMHa+9l/acQ4RURQCs7Zf
 ANJ/BexNcwhdnLYROEzO7EVvIhTcodWkuBw6PwhUXPAt2iYl+0Xx2XbVkY+q2Me4UitYQ+XU921
 0OaI6yIL/6isQiJTbI3NAfitoJBITbmM3ztOHU+WEvbR223IpzQpIejE2i3WK4kpRdFAIei59XQ
 b9FW/hGoAkL3P+z3EXe3PSRRjO9AgGSWCzPx0/Ic1fcu6xkPCU44oNV0IM0V04IWntJnDsBc1sh
 2iV2VN8RD/eXA7WqdrUu9CjddwL/tqGm0oFI7tlKs5CsGgvEun4c9SsFvqZoOAe6X1bQt15MRIA
 gffB8zeiRc+VBjtGzFeHSjFQpbp7yc4xHlkiLik72Z/y60lRCdCb9tVuQAL/rFRx/hn7m4/Boq3
 1bX4tt1tIQELYso8N8IpfRWWGEDv0w8tUgNLYmXaH8V+x3CwT6zbnyLnSgfrfocVQbDV7RAqmTr
 xZz6Xt2wdSR/m24VzQ9LbL29z7IHL9+vjyQIS6KJlN9kG1yITqyyjpt6TOU
X-Received: by 2002:a05:6808:c189:b0:457:a9bc:dbe5 with SMTP id
 5614622812f47-4651ad17e91mr1340733b6e.42.1772647704998; 
 Wed, 04 Mar 2026 10:08:24 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160d21196csm17765551fac.12.2026.03.04.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 10:08:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 11:07:54 -0700
Message-ID: <20260304180755.3735471-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772647705; x=1773252505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Smj/UcBgCQzQJ6JjaALn9Teg53sCV1zOxELOslN3g8=;
 b=LcAeQSZ7QGHEuvN1ZP2vcegM+6hXStP5BRPjk0aLPHcyjMbu7rF2a7uMQdUhUOF7X5
 AUhSQtGGzMLapuYQsQNxq9MwgGyyoT8VKQEeHvxpuj4hoURv0Z8rybSdtgWquW9TQ1S8
 a9jcW7W9igL8EMWLFiJMjX+2XY7qI2urACKTYVrwauLb7FVa9gpXWdRuVPmaRpUQA8mQ
 4NJL9iwk4cJe8b4YJEMsNIUPS3GE5DLb6LLicFFWBAY2q2D4rTyzGbSKH0pMya7bqw2R
 Ku3Tu22+iayulL5AmEc2EiNTDU9btRrj8kPYZSyLYxX5L4e2lTI7ACk4wr2LbGoORUTi
 Fb5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LcAeQSZ7
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.54.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 10a54a5387..8ec550c4e9 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  bb7b7afd707b67117b53658abad8e1b2  sentry_sdk-2.48.0.tar.gz
-sha256  5213190977ff7fdff8a58b722fb807f8d5524a80488626ebeda1b5676c0c1473  sentry_sdk-2.48.0.tar.gz
+md5  e8e3d9ea3aa3c7fdc465b33b10505aa3  sentry_sdk-2.54.0.tar.gz
+sha256  2620c2575128d009b11b20f7feb81e4e4e8ae08ec1d36cbc845705060b45cc1b  sentry_sdk-2.54.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 216f4999e7..21795bf449 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.48.0
+PYTHON_SENTRY_SDK_VERSION = 2.54.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/40/f0/0e9dc590513d5e742d7799e2038df3a05167cba084c6ca4f3cdd75b55164
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c8/e9/2e3a46c304e7fa21eaa70612f60354e32699c7102eb961f67448e222ad7c
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
