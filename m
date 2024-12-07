Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5249E7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F581606EC;
	Sat,  7 Dec 2024 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfqAV5UuTI18; Sat,  7 Dec 2024 20:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC80606E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC80606E5;
	Sat,  7 Dec 2024 20:36:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C329ED2
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D016606E5
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb9xnYsf1Uft for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 20:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF094606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF094606D9
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF094606D9
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 20:36:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30037784fceso15588081fa.2
 for <buildroot@buildroot.org>; Sat, 07 Dec 2024 12:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733603798; x=1734208598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vCAkvJ7E0bJS0G4bD3OiNqRMkth2S7+0jVB0cOZ9Cug=;
 b=ggjxcMOWNpASuXnJSWjUaNkDpBR0UIQatLlmSPOfySA7YqBA5jhlMeT/Nx44/m6K7n
 v8Rd9Vj8y6i5xQZoPZg/6lT/C7qb4Sc/WospCcP4dQrmS86u3LF4Ed7uKu/1zA1s/Ebe
 uN9Qqwoi9WbUk8uC1BNglbKWlUVd6q3sZtVAgh1AdAU7Eg4mRhWlpU58hXzL4czPRh67
 /RQGx3J7tAXdyxXzsG9d4a9YQ3kw2cxAltchLe4Qt4YY0/LvOkawz47vUtFW3aJJfoPm
 iK3xjx+8GwPMpfuEt06trj0oK5h0Lbonv2izDYEnEAYWeVhEWxagS6GtEj0BayD+A6Qr
 Mb9w==
X-Gm-Message-State: AOJu0Ywd8n4upYFEmVAzi7tE2JOFMN8/n9vt5dLgcWTaXDblTTbP/w7H
 XRIEI8dWLWSVU01DwIwD/9JBOhgAEW3SrxiDIHNWpR9eXhR/HFw9oNSU5mO8
X-Gm-Gg: ASbGncsw4YG5Oa5PTWxo0TcSxTv4fs1bi/8ziNBx9LLWfwJjuZ7ViAUVBv9oKxxmtYE
 KJqtmGSxY7M93frbPSz2tFrkZfIrvc2evS92fQBm7iV1rxkBKJx0P3FigVDSoT8VAptHPE7lyLH
 jyhH7Bzn5u7vJ1tGPwE25E6QAX/N8TIBKjh2dcJKKYSSujxotP2u0iCxYSJebSat9TfX9SrhCfv
 glgGMnfvxvmTKEmAONOBK9yHjwLotvm/TUiXEsVQVr8PDsSweQYsmKD+ErT
X-Google-Smtp-Source: AGHT+IGmPPVNGT089LX4eFjBswBPIWFaQU/ZNJJb2K30HkSnuK6BhStZq2yjXB1Wef3yoqyauLaYaA==
X-Received: by 2002:a05:651c:2106:b0:2ff:5d45:88a5 with SMTP id
 38308e7fff4ca-3002f89e57dmr30808861fa.3.1733603797722; 
 Sat, 07 Dec 2024 12:36:37 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-30020da27e6sm7955371fa.41.2024.12.07.12.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 12:36:36 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  7 Dec 2024 23:36:26 +0300
Message-ID: <20241207203633.598905-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733603798; x=1734208598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCAkvJ7E0bJS0G4bD3OiNqRMkth2S7+0jVB0cOZ9Cug=;
 b=cYDEnGsILKZ3DHIK8fiIiuwYx9RFmzRCmq0VEscIqwmLjOQeRvbkL3MNCGYDQRgvvL
 hpPgaxXIDFgRxjz6rb7QL37QWSqnoKaroGdroyaegFHv0WuWP4+aIgElZZTg7mOalMly
 UJZEtEDbEkfUVufct9pH/KzHob+OcIufKgVSOaJqefiRTtvntvXm8dVwRWqjrAF6tcZl
 2oOe8KGXS1WQBht3IlZMpcnA3RgQyDKVmoT/C6Frn4lA6HKMwp4eDxhOhx1oFFMItlM+
 cpeRTzZyvuiQPnwf1+aMSHQs/mK7kZ+5hbRDryrmD6fe9JoVvw5h/H5zwkvUS3fTHNHL
 Kd6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cYDEnGsI
Subject: [Buildroot] [PATCH] toolchain: follow symlinks in ld.*so.* install
 helper
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

Current toolchain install helper fails to setup external toolchains with
merged-usr sysroot. It does not follow lib symlinks when looking for
ld.*.so.* files. As a result builds fail with various linker errors.
Follow symlinks in find tool when installing ld*.so.* linker scripts
from external toolchain directory to staging and target directories.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07..92ad53d064 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -140,8 +140,8 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
-		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
+	if [[ ! $$(find -L $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
+		find -L $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
