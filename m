Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793D9CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3208B842C7;
	Wed, 13 Aug 2025 21:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-dNYJ-hiEAc; Wed, 13 Aug 2025 21:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB48842DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB48842DA;
	Wed, 13 Aug 2025 21:28:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C22AC1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE800842C7
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaiuJ3uFuUQY for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 21:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9F34842CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F34842CA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9F34842CA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 21:28:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so1198795e9.1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755120517; x=1755725317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xS8DOwY47ZnVaQrCf9Vm82m2Rr0wNV97J02MDLyddZ0=;
 b=j9kP4YF8QWS71CTnlsNSfnCk6PHPFF7rpPbRZSR0weExzmq1j1cZ+6P66hB3juwrGr
 Fq6vtI0ITdiPyQqNVq8R4zGftpTtR65pxTpVh/ZKBkANvy0/PlIv/qxuDO05u+xs6qSt
 l9W2s6drjbkAROn1Zo2DdbBR+WapZajbRG4wg0P0qPNhRFjdkKvlybwY+oeQ1C2D8cr2
 VFpOO39pCXJt6EVfE+oyxlUerqpeYtHKqv3echSU/C+ra7EcXGJTGkV/TQ3087Iim48U
 nG9mKBxto5Fj0GmP/VvNEp6JIrJRZW7W1DyXKsBQhGx/z3BBy/dAXy1FfmtIbIhWyqz0
 z0GQ==
X-Gm-Message-State: AOJu0YxQ+dDmjT1BCDJLQSiTsYkALaZPdBBUIhogMeUmpmfWjQjCDIFo
 2qxhFAKogA56M6KNmh/SVuPeJQrpnjC/y1T21clykQHW1CZp32zP0HlMfVh16jcKe3UEZtYYztt
 apmLQ
X-Gm-Gg: ASbGncv/dK2nGOJ5HoXqsyoCqLtJ4ze9q9XXt9tY9aNCsv8y4004l2DMb1Inf+GY7xW
 Ia2ptuwJyOMPPImkh19qeQtyTOSJlWRwhbMyqODcd0eLuUqaDTClKlRuMVcUF2KO48QdKtHefNO
 6+4jufrtDSf65OYqgwy7EQY5A0nHzAUVI6Y7BuQw6jBJf/a1EDakDYRsRH/S5IusQrACOu1YxhO
 1CnJFlJR9/XKEZoIbZWF5+cVM6N8H029r/eCk4kMqj6L5S9GzJqOObR7+OqU1aWwu4oKHFpPjh8
 oeufp8u+x6QRI5+v4b6FOzA1Hji7nmypPWPw9GC7gVG3dmkl5G0Lxkk4STKWeMO9JSQugIyv9FA
 zdc/KsQGAJlIguh478zlPkHCyjUKR/vBmqSWiiFFGbFzfW9Y0/y6avjfq9LCPm/alAc7J+LTp+5
 kL19rAYsvu9enaQMMfSVmE
X-Google-Smtp-Source: AGHT+IEZIhC8/SKSrCWbwwd3rwRMpAL9GRqZ4/+NUnMRgM1RQkESNMciiKJ354QHxTlM/arHJoOlWw==
X-Received: by 2002:a05:600c:548f:b0:459:e398:ed80 with SMTP id
 5b1f17b1804b1-45a1b66adbdmr2138495e9.32.1755120516592; 
 Wed, 13 Aug 2025 14:28:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b916394937sm4908538f8f.6.2025.08.13.14.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 14:28:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 "Signed-off-by: Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Aug 2025 23:28:34 +0200
Message-ID: <20250813212834.59170-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755120517; x=1755725317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xS8DOwY47ZnVaQrCf9Vm82m2Rr0wNV97J02MDLyddZ0=;
 b=TNyMmujsCN+k8MwbJvGOtdOow0FOluTnnl3FRccK5GwLDf+5q3dpigziQl63GSxoiP
 H947Gre4iIV8Hr1rkpKA4HQD8Ox7/IIggl/AFSCemo1xGkJcT+hngkfGMJNoHahHNUyg
 SppzHlmuQbM4rYiMIkO7CYcWYihNqdDbS7hzg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=TNyMmujs
Subject: [Buildroot] [PATCH] package/rt-tests: update URL
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version bump 8f52d4183e ("package/rt-tests: bump to
version 2.8") was using the latest release, so the URL was updated to
remove the "older" subdirectory.

The URL was:

  https://www.kernel.org/pub/linux/utils/rt-tests/rt-tests-2.8.tar.xz

On the 01/07/2025 a new rt-tests release was published (2.9), so the
2.8 archive was moved to "older" subdirectory and once again breaking
existing packaging downloads.

The "new" URL is now:

  https://www.kernel.org/pub/linux/utils/rt-tests/older/rt-tests-2.8.tar.xz

[1] https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686708 (TestRtTests)

Cc: Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 3c6b6f2276..6c445fde91 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 2.8
 RT_TESTS_LICENSE = GPL-2.0+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
