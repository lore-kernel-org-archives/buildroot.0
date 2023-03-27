Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AADC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5987340905;
	Mon, 27 Mar 2023 14:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5987340905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxZdm_5YdYVn; Mon, 27 Mar 2023 14:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D05E4094A;
	Mon, 27 Mar 2023 14:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D05E4094A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1D61BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0BC561046
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0BC561046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX1PLTTNIslE for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67756102D
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B67756102D
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h8so36758549ede.8
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679926266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yC6jKPS0dr/EaDPrbc7ZYqYjkweq2rH1k+dK7B0LoSs=;
 b=6mi/HK/KC7pQ8+CJedvvpbWzoVcbkjqK3zMQWBUyQnSEPxtFDrlLOHmSP8Dg3HHCsy
 rHvZ/LJiXwxg7GtqtzJmrqfhi+E5YE70X5xHFOI1taz24zCSmITRvZfRqODJuK0gjvs5
 uInHT03eHDxW/iu885nEfxsLq5Y4+suHuNbRsKX6/JNUI9QhTvIKyD35aTwtU4t9FHa3
 JULSEJyR0XiWg8KzC6RYnYLjYbOB9bnXvYLKxCjj6fAAk29hxEUl+5TsygjEyB8YehV+
 en0bAwF7koOV8lquTuujfEeE3U2FhjwxUqob0GMItZoWLIIKHGYlidQtrl+Ysc2Zhk3O
 IM/Q==
X-Gm-Message-State: AAQBX9cCDrCLij+fBDCDObdsjU7i/0Pw156YdNAJIR9zOrMYaOm8UgO5
 /ZMTZ8ocgZKL3iwlLWSAr8K1W5e6thY7G20h
X-Google-Smtp-Source: AKy350bAgtXLy3WuNvRJxTaVwLoSIyXL6DkcdbQKEf42qmymjuHpyY48H9OyH4Yl8OvPGE3Cb2TSxg==
X-Received: by 2002:a05:6402:1486:b0:501:cced:9c6c with SMTP id
 e6-20020a056402148600b00501cced9c6cmr11985410edv.7.1679926266030; 
 Mon, 27 Mar 2023 07:11:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:22fc:f856:23e6:784b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a50a402000000b004c4eed3fe20sm14824386edb.5.2023.03.27.07.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 07:11:05 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:10:55 +0200
Message-Id: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679926266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=yC6jKPS0dr/EaDPrbc7ZYqYjkweq2rH1k+dK7B0LoSs=;
 b=XfppO9ktzz1gjSx6X/8vu4hAE/v2f2jNxovqFCsPZKZmltJVItEZSp4+9XwWZMqpfH
 vAVrU0H8XRndg39I9Jdv8Oyc3qJScfvB2bFM6X4luq3xw9HBI7JgEV3ZoX4aqf2AfznV
 C0CeIbTVeamHAR3TP2y9JV9bUCZtKV3FrE8nV5Q/gbFckiE2hWXX3XQ1fUYRMKRYPyWt
 6bBYzEgaUClki3fCuW0W9C/dDa6T/bOkFKoZ+XYNKE0+XF7qPU5WJ0/bsKct0ZD0uEe3
 S/TsCndCoA0BIO20qd6P7tTsO8afg9tvvS1N9ZnwC5LItyGQgIJJsK2+jjFqTSi3ig4i
 rT3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XfppO9kt
Subject: [Buildroot] [PATCH 1/4] package/fluent-bit: bump to version 2.0.10
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Release Notes:

    https://fluentbit.io/announcements/v2.0.10/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 0caadcd56f..d60531438a 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  393ad4a6ced48c327607653d610ef273843085a17b6e5c8013877abdf31e6945  fluent-bit-2.0.9.tar.gz
+sha256  aad5176cb4dcadacacd379ca43160074c6690012d37c4749536ac3b977d50495  fluent-bit-2.0.10.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 8ba16399bb..319815f056 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.0.9
+FLUENT_BIT_VERSION = 2.0.10
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
