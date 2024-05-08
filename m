Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92BC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 11:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F0E40364;
	Wed,  8 May 2024 11:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VCkysLxix0a; Wed,  8 May 2024 11:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F0B241A37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F0B241A37;
	Wed,  8 May 2024 11:55:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F29821BF391
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 11:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF4D260BB3
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 11:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntfkgbtRM8JA for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 11:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D00146084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D00146084A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D00146084A
 for <buildroot@buildroot.org>; Wed,  8 May 2024 11:55:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b79451145so31887865e9.3
 for <buildroot@buildroot.org>; Wed, 08 May 2024 04:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715169301; x=1715774101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2WOA+BVTVF70MDwMvSBDQkuyRB/FD2DVZcQ+MY8mmA=;
 b=boOl56vmf1qEveSG2qfox1KJW23ZGag2G+o6xPa1bsLpnU+NguWoY7DaPXbFpK45di
 1OENAbmSGQcduQ99z3G9FyGvims+rMIWHdUl5pAN1s6pkGBu2ygWp1gdI3mCfNJO44E6
 8sflq8dBEvUOO0A2ie0lBtRoYzgmPGYpRNUC1VDrowlYficm8f/OAi2NUuDPy2mTf+Io
 T4ol+Cas4TPR4AAfVpQh1AiR4vu3I8NnZ1ftsPCYjUIGwkuyQ6GTqJQjd7b8WFbQFhCS
 qPR/QfbeqpZBioaPhYFwp4DPQWJPIzvCsc/yxvHE/3qHSst/MnaTCItSRVBZJ8MHeIB/
 RjqA==
X-Gm-Message-State: AOJu0YxESpRmqTxu5uL9prwL/H7T5bzYqF9b+GlkskUu26rtLsYcsA2f
 CSIOFSbWzU04UX6224BcT88CPXdRH7UwPYAMd1dynFdEJtmnrSDnWxoeKg==
X-Google-Smtp-Source: AGHT+IGtdpizQF5cNyV4EsoZaIJ8ArseFw14i6MvMYNtju/su1H3/ZPj0V1+Z5KYuvx6H5biYzIHZA==
X-Received: by 2002:adf:f684:0:b0:346:bc1b:4efa with SMTP id
 ffacd0b85a97d-34fca339ae8mr1805809f8f.32.1715169301135; 
 Wed, 08 May 2024 04:55:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 dd22-20020a0560001e9600b0034d829982c5sm15307467wrb.5.2024.05.08.04.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:55:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 13:54:57 +0200
Message-ID: <20240508115457.787358-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715169301; x=1715774101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+2WOA+BVTVF70MDwMvSBDQkuyRB/FD2DVZcQ+MY8mmA=;
 b=ncdcL0/MOK9lddkwfdbZWAnM205tAFN/FAyLLkVpyn46gDNJwh3V91LX3pvRJ3Dv5G
 3EKeyU9pCFWUi06kXSOXqV0sdCyTKk5SKamAHd5aWqEanHovoLURn66wA/RgjglxTkHb
 Ba11W8WBzTKrdB9UCuapD9ZWk0aykaCmgzPnMksjQKB/k4xym5PyG8dyvjIIg0rnCF75
 5eGRVTGttEH5RMDiRWItil5p4PJTAG7EO2XC7ZnTyKau4CIrB8dMexf8Nhh+//hVykpg
 H1hRPowFsst6d6DJ3CyjD+ZJUdcZsvSbbqEfsthXHlwkBkgJ02nSe8a/pN6ADLEPzpuG
 VdDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ncdcL0/M
Subject: [Buildroot] [PATCH 1/1] package/zeromq: disable perf
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable performance measurement tools which are enabled by default since
bump to version 4.2.5 in commit d3a8177e175e035ca3b19dca7868859f7cb238a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 137fad1a66..f1a1f02f9e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -7,7 +7,7 @@
 ZEROMQ_VERSION = 4.3.5
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
-ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
+ZEROMQ_CONF_OPTS = --disable-perf --disable-Werror --without-documentation
 ZEROMQ_LICENSE = MPL-2.0
 ZEROMQ_LICENSE_FILES = LICENSE
 ZEROMQ_CPE_ID_VENDOR = zeromq
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
