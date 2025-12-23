Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C28E748FC
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA3360E9D;
	Tue, 23 Dec 2025 22:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKOrBarWmQ6o; Tue, 23 Dec 2025 22:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC28F60E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528087;
	bh=LJksMH3JAze0qRCA882UbdJTCihE4PWv1hUMc2UOBas=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nDeG2c1wMM+U7PGgneuuxNvDWihCvOJD3KymlWxygZ8fFoA/yQkw7hUx+1eiU6NFf
	 SV2UsRuGL8HKYWTgAmE6K6PoBmjUDYjtLwJYdOVKh7KlvxkFY/JPC3p8EmOIRluFDq
	 5pbIQ4T6pLioK1ylLm+Q4VCIwDYjwrMh7Y79aKIoWNsiOCpId/fHs8gkLRMPEHiX2u
	 mHR5dAmjZb597m/RXhA0uOUE3NWcJIJCjmysMRJVG3rzXj4SHwypf93wbuYoQyVjFo
	 MhFE1WGtxeawH9x2g8ssBjpILMLWBUjFxOTXqFd2Av4qbx0s716ngNvmVB7UIc8/2n
	 S3x1+7C5V+rcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC28F60E96;
	Tue, 23 Dec 2025 22:14:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE9B6B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5474811A7
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJF16o-yoHpQ for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.53;
 helo=mail-ej1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36B36811A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B36811A0
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36B36811A0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:45 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b7cee045187so966199766b.0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 14:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528083; x=1767132883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gey3P0HlkTarWuHb4hUCRQ+wF9UxGe5/UOZbpXh+qp8=;
 b=K60tXaURC2/iKEKumd42AbTYXLyfiPWor40bOQsziKPnGavq+sH0y5rPOVjlYfLLCU
 a4RinjXJWcljNU5zUL1mTUaE7goVveC6pEzyJytnhoDxaK5nkTeuBo2eGWGGwV/mb1m3
 +KcPR2SKoozHCUi939BMtAKLb3ItEZVaryQ+cyJ58ZcNh+mIqK1yMJNHirbDcigR9R2T
 2fuBnxRYRIPv5ztwI4b59Lc8WbbC7GpY9OdjL5+xwVbKb0z2i8MuQB4mIi9rZHNil6Ur
 R919JWCTLA084qAc621I9IKOClnwXEQh6ndTkGvz7TX+V2bwKRg5owZXojP57tS1KnFh
 Fp7A==
X-Gm-Message-State: AOJu0YzHKMzfB87KDiRZvGCCxgJ2lh4b38D5GisqOnUBFog4uMFayTp9
 Jv462SMt+rv6yhWlTqUVCIQmPZkD5Ehxo0CvKN958bOs68jwbW2xZiGnWzlyfAAVMIs=
X-Gm-Gg: AY/fxX7V+vWFhjLA2NhPFM0wB/tUtx10+H2N3gClvj8+Qjf2jrHaMGVwSCgQKzWFOCb
 fisxSGWVxeOxPKL8b8eiIeLRrsfnss0kUBjrY+k3o5s+4CcsJsv2aPYZteft2qdERLhhZZhZmgz
 3iRPi87YdVKIhZpzE6CQ3jk5N3/UnanbgZLxMVAsnebTpOh9nzcfsxlEJ64duBYwHuVPen/WXw2
 Wb+rmKY4IIAP/Re1edyJIHrdpNiV7p0UUJNsexu2BqisFxpaZPyDdT2ojTNCV7fRZtMq2shsqHi
 ve9gY92limRkFDBjCvBIt/ZDPvU4qEsGEGD+5PR6nYdyV45NMsDlS/Muxh9PkCCUDZ0jt+Nm44v
 RU9TxkbefK7kXTH/vMI68XlYNmkHi1Vq+thNsxotPNJyOa7pR8Si+d+IOBQgY0stIHxactJYade
 8uPnI4ovfAMLV7CBG5t+Vvezy9ZMzRsP8wAWgE1qxp/U1pm0NmU5ef
X-Google-Smtp-Source: AGHT+IH+RBzr+A+5b+yVNefikGRAUAf9qfg1YzWRjuwZgC5QYrfYEA5fAOqTAy1lulphSinsR1aS3w==
X-Received: by 2002:a17:907:7e85:b0:b3a:8070:e269 with SMTP id
 a640c23a62f3a-b8035649310mr1879177466b.14.1766528082812; 
 Tue, 23 Dec 2025 14:14:42 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb5f:fa00:faf0:ebea:87cc:7ff9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cb27sm1503398266b.51.2025.12.23.14.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:14:42 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 23 Dec 2025 23:14:39 +0100
Message-ID: <20251223221440.61806-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/gnu-efi: add host selection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Will be needed by host-efitools, which needs gnu-efi version
3.0q or later.

Inspired by https://lists.buildroot.org/pipermail/buildroot/2018-July/213212.html.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/gnu-efi/gnu-efi.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 268e5350cfa..8b25e13c53c 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -41,4 +41,21 @@ define GNU_EFI_INSTALL_STAGING_CMDS
 		INSTALLROOT=$(STAGING_DIR) install
 endef
 
+HOST_GNU_EFI_CONFIGURE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="-rpath=$(HOST_DIR)/lib"
+
+HOST_GNU_EFI_MAKE_OPTS = \
+	PREFIX=/usr
+
+define HOST_GNU_EFI_BUILD_CMDS
+	$(HOST_GNU_EFI_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_GNU_EFI_MAKE_OPTS)
+endef
+
+define HOST_GNU_EFI_INSTALL_CMDS
+	$(HOST_GNU_EFI_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_GNU_EFI_MAKE_OPTS) \
+		INSTALLROOT=$(HOST_DIR) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
