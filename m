Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BEDEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2C7835A9;
	Wed, 14 Jun 2023 14:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C2C7835A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zpyqk7TihcFG; Wed, 14 Jun 2023 14:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDF7839DD;
	Wed, 14 Jun 2023 14:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDF7839DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 279021BF2B7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DFE6131F
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3DFE6131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QF7jdLnGlYiv for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0924561305
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0924561305
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:35:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f8d0d68530so9046955e9.0
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 07:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686753322; x=1689345322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KtRW9+TtEX6pRUXQ+ebW7qo8aczG8xP7DMZQR8y3w/k=;
 b=PHOC9JzegfJNZa2iJpKPY4m0LfpiSgu3XBqnapK/Ufi4NkNTUqBi2SB/1U3L0oJbne
 nR+KJiGGmDhqTr4fR7sCFiKwfzD2sbc3U1ROb6+WOcjxihn4r5CydP7E+Wh0OLekW7NY
 VJAARTZwGzWZS7pSssfUI7fW6RfVSovZw8edQKnEGfL2z+vokxOVQjBCt8fyb5GOVoT1
 8CSEoKBIvbixfHkgYJXWm2xS2NM1e61krScUzseIvuweIQBYWEv7xtnwVrRNuw7Enck9
 a/aOApq4bz+CuhJiw4/G5pTt1wYTm8TSvZ6ucHy3VLzU0E1hjzXpObLqL1yIORNc5sE4
 l5Ow==
X-Gm-Message-State: AC+VfDwI0QE9REdfLnD9U+xEJ+PMNMxjVQSwcnTZKJnkZtzaKbqXPpxl
 lz/ZtrKo21G+a3DyCk2AKQczLYqgn30z7S2cvak=
X-Google-Smtp-Source: ACHHUZ4srj0YWI4ubpVrH5MDZ6/gH44RXZSc/Xd080HDyEmmcYqOslkqX2xnJConOnZqVSU2/EPrFQ==
X-Received: by 2002:a7b:cb8f:0:b0:3f7:26f8:4cd0 with SMTP id
 m15-20020a7bcb8f000000b003f726f84cd0mr11770479wmi.16.1686753322180; 
 Wed, 14 Jun 2023 07:35:22 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c020200b003f739a8bcc8sm17537126wmi.19.2023.06.14.07.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 07:35:21 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 16:35:19 +0200
Message-Id: <20230614143519.18669-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686753322; x=1689345322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KtRW9+TtEX6pRUXQ+ebW7qo8aczG8xP7DMZQR8y3w/k=;
 b=zhppd4pxmMhEwZe2/k2yluSk/hnT22IGNdGZwRzpiS40DvHvOqYeFIkiHcj33nyYya
 YzqUK3oB2kh/ItLBk3qM5fZ0NnSQFDZgmwx03LxvUkcgZwNWEqKRQC/H5uELIvjWowP9
 TAAVbP28eWUBnRjwoXrQ4JSB59EJrnA47YmF7OI4dImx9aExZg6AzuVbAwQQ3h3ahTM9
 i+wuljZ5b05+GOhqfU+TW60/vLg1nkTPr5n+dV/Bc73MG6Vax1MY4qPYesWSx/egZMGO
 IJlvNTwSJjY0cEo/9GkDNrVWnb7g/STZ4mOGyFnqaUsUoYWQE3jrycav3b1M26EkXaYE
 dQ2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=zhppd4px
Subject: [Buildroot] [PATCH] package/qemu: qemu systems emulation needs fdt
 when building for all targets
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

defconfig fragment to reproduce the issue:
BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=y
BR2_PACKAGE_QEMU=y
BR2_PACKAGE_QEMU_SYSTEM=y

ERROR: Problem encountered: fdt not available but required by targets
       aarch64-softmmu, arm-softmmu, i386-softmmu, loongarch64-softmmu,
       microblaze-softmmu, microblazeel-softmmu, mips64el-softmmu,
       nios2-softmmu, or1k-softmmu, ppc-softmmu, ppc64-softmmu,
       riscv32-softmmu, riscv64-softmmu, rx-softmmu, x86_64-softmmu

Commit [1] select BR2_PACKAGE_QEMU_FDT for each individual emulator targets
but forgot to select is when BR2_PACKAGE_QEMU_CHOOSE_TARGETS is not set
(building for all targets).

Fixes:
http://autobuild.buildroot.org/results/e44/e444a02b899d325a9d99daed96b8cb96108383e7

[1] 44be514b21fd94096702b80c62d46c31d72f15a5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Carlos Santos <unixmania@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 91a1b288c6..6fb34a0dae 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable systems emulation"
 	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_QEMU_FDT if !BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	help
 	  Say 'y' to build system emulators/virtualisers.
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
