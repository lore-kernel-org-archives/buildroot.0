Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F0CC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 18:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2278174F;
	Fri, 24 May 2024 18:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrdhDq51gctE; Fri, 24 May 2024 18:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEABD8175F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEABD8175F;
	Fri, 24 May 2024 18:19:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F121BF294
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 18:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A988175F
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 18:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAAoPOtDT-D5 for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 18:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=alexander.i.mukhin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E43C18174F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43C18174F
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E43C18174F
 for <buildroot@buildroot.org>; Fri, 24 May 2024 18:19:26 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e95a883101so14551311fa.3
 for <buildroot@buildroot.org>; Fri, 24 May 2024 11:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716574765; x=1717179565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeZHXZCerdHv8eQyyy1AHdVYFMeu8rCDQu0s3meTaOs=;
 b=dluUOEKoCwd3I8ehd9ZlXu5i0VbTmGUDcIMC1YaIkKadbxjB4Se5pKo5Rh2CEQZLpM
 EB0BprUPju6/Z0+Ru4xEfLHSHRU+TTNvf3hr0w/ulpjOKFVPo/VjB7g+WeilfdA7w3FT
 ZLHs9yaS1UIyUMDMjie/x/KKsUw9zmqmIoToY0QgaFAqKn659zbgLeBsV7OHL+WmppU+
 4sVIl1jD+Clu3K2uw2S4LMBqcuSICnNoX81dM+WEdsFhb+Hoq84XiahGjkPiDnu/9+FX
 NkNlw30sKuLyzluevq8foGr5w/oz7rSjTMxaxnVlPQYjDT4n94FiYKedmuVwVHyj8pZD
 GoOw==
X-Gm-Message-State: AOJu0YzXoPcJDOzbnDXmBY7a4kMNnOop1igHBSKSLtEk+GIP1WLj4vOK
 Ofqys823nTphLskhS6h4ej0zEp4Mk7himh2UvRgEsS9GJHK6HmRUQ2pkFB45
X-Google-Smtp-Source: AGHT+IHBLezqzbwoTIHSvWzDaKaORJ2TJpO+HoAuzGmf1Z9cKZNTQ+ou7xTlXv14On6basCTPuBc2g==
X-Received: by 2002:a2e:b60f:0:b0:2e6:fec1:dd75 with SMTP id
 38308e7fff4ca-2e95b07038fmr23013441fa.8.1716574764372; 
 Fri, 24 May 2024 11:19:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1838:20:1::ba6e:cf96])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc4874sm2833551fa.26.2024.05.24.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:19:23 -0700 (PDT)
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 21:18:56 +0300
Message-Id: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716574765; x=1717179565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zeZHXZCerdHv8eQyyy1AHdVYFMeu8rCDQu0s3meTaOs=;
 b=PXck/uuHRu4T5Rg9ktr2UwgW+NNb7E9oMs3Wg83exi/xyTjH6jq1h5yeK+WbSqJIyP
 jWgB2wQEVcxqVdEzhs6TGEmRZQzfMIUIZl6d2m6SvCSosgD2EIys7W1A5stWCpDXWI+x
 bFuWfZbGLIGwiXCvQ/0gWe7dGvsgc8jMylF6CPgqWJZTcM6sE+WuteuW7M6OFJIqcH0p
 QLjVuzDfETBxzYvVLotXKRfWkb2E4VD4i85cA6VGS9SRF55vU0DKYer56+vk1PaBa7TB
 H0/zXpyX1rK+b63gNxXq7MESZjNl0neWhzQ5ZVeILayCLaYSWVAD84g0boVSNltIXYiu
 XTPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PXck/uuH
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
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
Cc: alexander.i.mukhin@gmail.com, salvador.joseluis@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 01c86f2b..9c8d4cec 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha256.asc
-sha256  76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9  zfs-2.2.2.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc
+sha256  9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c21c31ec0  zfs-2.2.4.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 59cdd319..fa6d282f 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.2.2
+ZFS_VERSION = 2.2.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
