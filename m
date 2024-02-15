Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B38DC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C7A41E59;
	Thu, 15 Feb 2024 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMTU5h2_rcs6; Thu, 15 Feb 2024 17:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0854D41E63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0854D41E63;
	Thu, 15 Feb 2024 17:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72F411BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D72C822EF
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-vAMBkfUNtR for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA66B822A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA66B822A2
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA66B822A2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:30:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5128d914604so480288e87.3
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 09:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708018229; x=1708623029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3eYyVY+hnEbYVmZMzFaPEKLtbPFLMdvyGCUYTkDy4xE=;
 b=jA25bmpbiV+8z96ea0lPiR/DSc0HW/Bjfk4V8uDcIQnaBewR+WiTNUK+6Hm2D0xBZt
 uzHjlRahX7oNDPjoRnSKYFDJecSMSBlijaYq5ZGSVtwOXePgABzLiPmTlbug3FtI4jCX
 +mAt4p+j+g9Q4yp4wmEKL/DydCKwHU7Aie+z2bbuKQ0I1dVxprqurQER6AAOVYphWeKf
 00pG5j6UsmgemnP7DjuzcjvprGThLEsErHPI4fq1gH1n8N5SWmH+f4d2oxijd37iq8we
 zVKbe7lGXScG8h17ooyQvRnBWiV+cVTARSWVXfgLhkNmO0crl/j9fyABzf6lqYZxEh4l
 mD+Q==
X-Gm-Message-State: AOJu0YxHKU3d4LGP6trfMrMS3RLj2+v/cpZdeeQ/pgV7JFQqKFvLztsL
 N55qqKI+dtBbSaUVfSxyeK9f4Z34a2Pp+T1xugGLfzskfLMLBN+QbWpt83QZOqI=
X-Google-Smtp-Source: AGHT+IH2jp7pF6/pBdrR50XnfjOLPw4aa9zHMpbZVJNulMx0BNKWiTYhbO0gIN0kcnVUhBhCt9w9Nw==
X-Received: by 2002:a05:6512:1590:b0:512:8d5d:6707 with SMTP id
 bp16-20020a056512159000b005128d5d6707mr998825lfb.35.1708018229052; 
 Thu, 15 Feb 2024 09:30:29 -0800 (PST)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-10fc-1feb-1a69-befd.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:10fc:1feb:1a69:befd])
 by smtp.gmail.com with ESMTPSA id
 vo6-20020a170907a80600b00a3cf8cb80c1sm754092ejc.156.2024.02.15.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 09:30:28 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 18:30:24 +0100
Message-Id: <20240215173024.286102-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708018229; x=1708623029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3eYyVY+hnEbYVmZMzFaPEKLtbPFLMdvyGCUYTkDy4xE=;
 b=eokvu1PEqAQ3LvVlKVQpaoaPCUXmzJzEsTp9jharK6a7WMBVuGBejhUULdB9+GQt2b
 1Vbo8MrFrjFkvEfq+Yb29nL1/JCbzv9qhSkwxiUqMK2ULZhaMHuws4pPWG440T2lubbR
 x2Up+h2i+7/0grd04HP2lJhf40gFgfXICt9Hoj7LDkou/ILshcKmFs8s8ZrG/wOux0LU
 QF5qusWDN8/y2O0k8mOC5EBjekHenwG4dFahUhz4/+64WIS59iTLEU+QhAXh9i18t/GW
 jnSLYQC7Tqn11yrtzL8R8hAacISKvQq01sMcUZJFDUKjE9iAuvQQA1upObfhiJzbEkiJ
 /kWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eokvu1PE
Subject: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.4
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/dalance/procs/releases/tag/v0.14.4

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 19832e3897..a3ec5d2b75 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2f9fdbcf7324952e22565ded58148fa40387b5a5f8723996620d6c4588925713  procs-0.14.3.tar.gz
+sha256  22d9ef44bf06bbd6d0d463a40678a1560a9125fdc6e6fbb5db294e05a174ea01  procs-0.14.4.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index 8567bf3da3..34e874a4f2 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.3
+PROCS_VERSION = 0.14.4
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
