Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8BDC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B0840600;
	Sun,  1 Jan 2023 23:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B0840600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8G7mz6wNgXu6; Sun,  1 Jan 2023 23:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FCE0405EC;
	Sun,  1 Jan 2023 23:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FCE0405EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D08501BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACE8760BFC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE8760BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8kZRv35No9l for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B283260C16
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B283260C16
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:20 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14ffd3c5b15so20206941fac.3
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTTYeRYWDPnSQ2VRdLhghfTWLLKNCGSCsTbvSGQGogs=;
 b=E1L9HWXz1LrQI73i1TdNQxIX7rPM7zsEiQ7s6fD2B1/upfemT1MiDZO1fAqfI1CVfP
 6GeXyuq+YRYFb697Bjx3/Oc4+syemUF4b6f4Qk2vhQcb+nsVjxiPsatd1FkcPmzHLqqG
 G2m0kecRXOwUhGvfsp5gfZtOzfV6S8fePSyaLxAD8kRI15msFd2pRBow2pC6UBNanPuQ
 sK0g3VK3HKk7ebf+gSp3sflFQmLs8W26zLDk7cT17b2Zm8tpEacvcyye3QC9wcMGm/Ou
 Tn8gDWBg7CSEIf3tthLgx9XI8d7Atjvisxq/4o+b1dA1VjNLa6+m6th664fC3E3Z/xYG
 DxSQ==
X-Gm-Message-State: AFqh2kpgsxYkQJXyfT+i9YHuoTnwuvIN/OftZjlItFfJWWUkEcPbsYRT
 mCUZqdoiwOs4Go0exvXjYIjOWGcGuTw=
X-Google-Smtp-Source: AMrXdXsdwUSN2vzeAHlL2ZIxxx1DpMJiuFv6B/eACEFyqWNkcst6yeul7RnljWcD7+p+gHetvCm0Sw==
X-Received: by 2002:a05:6870:678b:b0:145:120:4867 with SMTP id
 gc11-20020a056870678b00b0014501204867mr18707781oab.34.1672616359713; 
 Sun, 01 Jan 2023 15:39:19 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:18 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:31 -0300
Message-Id: <20230101233653.487175-8-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTTYeRYWDPnSQ2VRdLhghfTWLLKNCGSCsTbvSGQGogs=;
 b=UsNcZi81TgxplY+CMTbo8RLBeBDTiQEwMPquAfHlrUQO2Ipuc/SdHOH6DPIzMT4a+P
 CQQUZ0IvDJ5J8AzJeQE0rjzrHok+nateMPtcfLCuHeczhUJAmQuCMc9wE8l6qrWulhhh
 ZRAcG1sTNV8ErSxSZqUH3IqaZDShOy4vlWr1qTIVaF3E11o4c4M+wrB2IoFr/j/34xuL
 m9Bx43m3NbQFl0QD/UeaNCzMIW9QogeyL0+GGVz6/S9TdtX08bSthV9XENLpJ1wrBXbN
 VSRr4nKrU16Uwlz1Lpj12nEJVyHEddGPa1lymuVNMqUPxFTUxibCtzwNcEOai9u+y8op
 nuug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UsNcZi81
Subject: [Buildroot] [PATCH 07/29] package/ima-evm-utils: really install to
 staging
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "8229196d41 package/ima-evm-utils: new package" added
IMA_EVM_UTILS_INSTALL_STAGING_CMDS without enabling
IMA_EVM_UTILS_INSTALL_STAGING, so currently the package is not installed
to staging.

Enable installing to staging.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_IMA_EVM_UTILS=y

|--- output.before/build/packages-file-list-staging.txt.sorted
|+++ output.after/build/packages-file-list-staging.txt.sorted
|@@ -0,0 +1,6 @@
|+ima-evm-utils,./usr/bin/evmctl
|+ima-evm-utils,./usr/include/imaevm.h
|+ima-evm-utils,./usr/lib/libimaevm.la
|+ima-evm-utils,./usr/lib/libimaevm.so
|+ima-evm-utils,./usr/lib/libimaevm.so.3
|+ima-evm-utils,./usr/lib/libimaevm.so.3.0.0
---
 package/ima-evm-utils/ima-evm-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 7ee34d5e1a..01984402ce 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -8,6 +8,7 @@ IMA_EVM_UTILS_VERSION = 1.4
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
+IMA_EVM_UTILS_INSTALL_STAGING = YES
 IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
 # Tarball doesn't contain configure
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
