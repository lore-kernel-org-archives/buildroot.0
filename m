Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E968C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0253160658;
	Fri, 12 Jul 2024 18:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFdzLIxo9xm4; Fri, 12 Jul 2024 18:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185D76138C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 185D76138C;
	Fri, 12 Jul 2024 18:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150C01BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02820846EF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UzbdnavXOSA for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5B6E84692
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B6E84692
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5B6E84692
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:42:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso3148433a12.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720809770; x=1721414570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5RVC2oRAJKl4oINnEq8fbpSg1MBdtv5m9YQH78PoINo=;
 b=UNM2w8xHEoQnsOSt293jXLgHQY4jiGdPJ4qRR91nelDXmwQpWFAKJBKrhskJbhDqPl
 j2t07E4dPjovXD1WTvlxq+lTF2cBMVsADun5k2DSUJZUNkMFP/Kb+XBHax+nBc1p8ANS
 azS884yo8MCihRc9mIyGajDPH5CJLP92++Htin/kUZU26b/+ETb+Wx/ochFXn6LqziX2
 U9u75vvaGPZCQMNiShnWze2mbdC1yhM/jHAfH/QTO7J1uGKHOg5WtU0HYcUz6tgP3EOO
 3WIrAJYS0j1J9oN0AMvy6J53NW/pDIfNQW5kNVqh4nHEEGryClXKQK5sToRaabO6//9H
 uqxA==
X-Gm-Message-State: AOJu0YycaqDJ5aY0NA04nyC1WtaRl9NsqyantjIw+SJhN8LhTmae7Tpg
 sH9xXNGVk2lVrp0NjZcE2YAXbT6i4iA0qdKpXaeoptVf7e1+zKJyl3BeFA==
X-Google-Smtp-Source: AGHT+IHej1XhMJ5Nn17WNDi0dmOAaiJlN6dE9RJktbajFtXeIBSaaRFWORX4lxwpX1od7fdLQvKQcA==
X-Received: by 2002:a05:6402:50cc:b0:58d:d3f6:58d2 with SMTP id
 4fb4d7f45d1cf-594ba98e65emr10398043a12.3.1720809769286; 
 Fri, 12 Jul 2024 11:42:49 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc4e81a6sm4807865a12.49.2024.07.12.11.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 11:42:48 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:42:41 +0200
Message-ID: <20240712184241.256166-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720809770; x=1721414570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5RVC2oRAJKl4oINnEq8fbpSg1MBdtv5m9YQH78PoINo=;
 b=Ma5KEs+l+a3TK/bACRe2bgbLqYEQhr+4f7Tbi6lh6UGg0WGblo4WL9mGRKKVI0pKSY
 XSo77Pv0ioV4JqJwNeWbNXk+fHk8Phuo3iSr3jVnIsHKb/goiEzU3wFB2FAVxIZHgCos
 Xk8nqq02HevZTq9XuqmBaCPuCYtnAyloFe9BoB8x6yZH+vP5TR9EryrlBjpwLZGVg53J
 XWlW7iLOSaFzI7JmrzD2dX0ygUh4VN8VfllWL0spUfoVpM6FfKASopOTEjMtepooa7yz
 12Cl35qcRXBWCcjAudUuVP4c/6Nh9cl626yFHT4CDUNgl365jCAHy4b+1zy+B95lDfLe
 Mreg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ma5KEs+l
Subject: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to 1.6
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream moved git repository.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 6 +++---
 package/ima-evm-utils/ima-evm-utils.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 9777c7f213..844ba0d4fe 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,3 +1,3 @@
-# https://github.com/mimizohar/ima-evm-utils/releases/download/v1.5/ima-evm-utils-1.5.tar.gz.sha256
-sha256  45f1caa3ad59ec59a1d6a74ea5df38c413488cd952ab62d98cf893c15e6f246d  ima-evm-utils-1.5.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+# https://github.com/linux-integrity/ima-evm-utils/releases/download/v1.6/ima-evm-utils-1.6.tar.gz.sha256
+sha256  3d09e77a09e985b285891f13d458653f44913879147679dce30bdbf00380d40e  ima-evm-utils-1.6.tar.gz
+sha256  d037fb0b5fdb4d1e09e246a56bdb8049fc6d9b1f9270c0ec2ae4bc8f9285165b  LICENSES.txt
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index b969b4709e..052400eea3 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.5
-IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
+IMA_EVM_UTILS_VERSION = 1.6
+IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = GPL-2.0
-IMA_EVM_UTILS_LICENSE_FILES = COPYING
+IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt
 IMA_EVM_UTILS_INSTALL_STAGING = YES
 IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
