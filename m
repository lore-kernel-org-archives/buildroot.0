Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A14C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C56402C9;
	Wed,  8 May 2024 20:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAASqLAeG9oU; Wed,  8 May 2024 20:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16458402D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16458402D7;
	Wed,  8 May 2024 20:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB281BF2B8
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B2B41BEF
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 20:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7W9azTa1v5I for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 20:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AA3D41BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA3D41BC3
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA3D41BC3
 for <buildroot@buildroot.org>; Wed,  8 May 2024 20:49:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34c8592b8dbso111548f8f.3
 for <buildroot@buildroot.org>; Wed, 08 May 2024 13:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715201353; x=1715806153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TfgJ4ktTso75nYp10xpu0sL3y+FwrE9BtadnIK7Ea4=;
 b=oskMxzp6kiKpOhzFjH+KJcq2jz1WTgL4dmbYyvhdFaYGcP22rMx5DDoIV1cNaCOQls
 XiU46YgeHzMb5T3zbGnoIG24RwvlTHm/8NuuAfsyZwyRtpAcwlMZ6Mgs99kJUG3AwKwv
 er1RE6g8KkKGwgVMbttrN7ttPiElLIDJNKyOjxBHK94cCxOQ+Lt2X9i/Pc9gsZDtsx9D
 uWIWGG77hqMLUWM3hQT/5F4VsqzPdnEBaj7cEkpsHx2MJpfGx04pk55QAIPZoDZqODll
 FQC9rIPBzorGd5TiqcmRiymVflTBDAuz+2laV9hOs9HlWLGqsJBJkcLkdZsCL+KjDPTF
 4QBA==
X-Gm-Message-State: AOJu0Yy+lzKryXR8hLcqm0Ipgfe+iDBedw/8DIyIfYOwUa3DE/evrfJN
 10+qDmTkH14KV+dMltfsW52bcrljKFTOYr/N5RrmO2ZMsUjxxn0Q0WqXAw==
X-Google-Smtp-Source: AGHT+IG8ATTD6nt03poxI3zrKrDM7KZpSNkuLVfHnN94HBCapzd2iPLHRxEro8DyESgTsxH4Wt8dvg==
X-Received: by 2002:adf:fd8c:0:b0:34c:4c89:108a with SMTP id
 ffacd0b85a97d-34fca6213e9mr2479161f8f.43.1715201353058; 
 Wed, 08 May 2024 13:49:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 dl6-20020a0560000b8600b00343dc6a0019sm16083958wrb.68.2024.05.08.13.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:49:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 22:49:10 +0200
Message-ID: <20240508204910.751301-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715201353; x=1715806153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TfgJ4ktTso75nYp10xpu0sL3y+FwrE9BtadnIK7Ea4=;
 b=NJ6IodcPVRiYmfoSXI4WD2J0jzExoE55dPJNVMvGEvTH0CMYVq60Mhw1sZc+4sLfO2
 xbVNqTZpWfyDRAciLXBntwZBvqKjdZpiM3QkIIExYY2a97URJ7vUnolqFwHKdqndvBl0
 k0T9X4req9963zZ1CAsQabe42EtvrlD1ovBW9NycWPtHzljYtgZrorAdGaQugIiKVTYj
 RGjqkRsfEUHevuFDom/AWOSUufvcBKQeEshTyGzUCfyfpw6HtLpQQbdIVUkElLnlbjGK
 Z/lNpeWRp+zfkwYnoA8jAxw1amVUmm8I0AislqhnyoAWXfxSZbtCBUu/dWknFxnzxKuw
 2Avw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NJ6IodcP
Subject: [Buildroot] [PATCH 1/1] package/libjwt: security bump to version
 1.17.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball and so drop autoreconf
- Update hash of LICENSE file, verbatim copy of the current MPL 2.0 with
  https://github.com/benmcollins/libjwt/commit/ebebb5027f37a85c40c072a02681e206d31875ca
- Fix CVE-2024-25189: libjwt 1.15.3 uses strcmp (which is not constant
  time) to verify authentication, which makes it easier to bypass
  authentication via a timing side channel.

https://github.com/benmcollins/libjwt/compare/v1.15.3...v1.17.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjwt/libjwt.hash | 4 ++--
 package/libjwt/libjwt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
index 47e8b2c506..adc32c3a26 100644
--- a/package/libjwt/libjwt.hash
+++ b/package/libjwt/libjwt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cb2fd95123689e7d209a3a8c060e02f68341c9a5ded524c0cd881a8cd20d711f  libjwt-1.15.3.tar.gz
-sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
+sha256  b8b257da9b64ba9075fce3a3f670ae02dee7fc95ab7009a2e1ad60905e3f8d48  libjwt-1.17.0.tar.bz2
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 8929904d10..f143ba4b62 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBJWT_VERSION = 1.15.3
-LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
+LIBJWT_VERSION = 1.17.0
+LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
+LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.bz2
 LIBJWT_DEPENDENCIES = host-pkgconf jansson
-LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
