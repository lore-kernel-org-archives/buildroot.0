Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68AC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2CB401D8;
	Sun,  5 May 2024 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y2N8FX4W_k1; Sun,  5 May 2024 11:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC85402B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC85402B7;
	Sun,  5 May 2024 11:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7E71BF36C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7623740544
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jw5Hr2hi-ZN2 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 11:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F49E40395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F49E40395
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F49E40395
 for <buildroot@buildroot.org>; Sun,  5 May 2024 11:22:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41c7ac71996so8937215e9.3
 for <buildroot@buildroot.org>; Sun, 05 May 2024 04:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714908152; x=1715512952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pMLwVWENkGe7yowwpPthMzxab/XFOEL9QFGiQXiPFKI=;
 b=VwTocpp5H7LnGFOADrw+us/UoGMNaalj/8GkYFEEZUOpaamoHIoY93XXTHSQT2yyvA
 6GFzx5gk+actj95FcIRT/gZSumeEvg1Q6hDFiVqYVJbBbLc/2cc4WuBGk+PlNJqCBzuB
 lVLPXqFSBaLoODd9szGqyZV/enSDHCsC8HQsNCqIHzqghuqw36JoNFM2CT5ylTj2A+Rg
 xD8S4h067U2he3oRS95Vm5h38Zbc+ybXpsgBS5uDyeZi6UcZdFV5DUC8p0Id/70RO7Fm
 zETyntRCACcoTumxBLbP0BqV8OhvwLKHUdNMSqe8r9q+gxFuvKPbKKigwVAQbgWvoU27
 YqBw==
X-Gm-Message-State: AOJu0YxzmBgTZDeLM7pJg/biUotceLWBvFYvnn5TsGDXDt/wXhrVmGpJ
 yQuHvFZcPgp+rix39zb8f471lhPT2wN8xaLPnptHeONG/5UbDZpjyoP9lg==
X-Google-Smtp-Source: AGHT+IEmFciByiiuK+Bu+RzLSc6b3WLqTs1+h0eoRx4Yvbhf6MYC07C6m8DckuNme4TUq0qq8BU2RA==
X-Received: by 2002:a05:600c:1912:b0:41b:fbec:a53a with SMTP id
 j18-20020a05600c191200b0041bfbeca53amr5748454wmq.16.1714908151946; 
 Sun, 05 May 2024 04:22:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b0041563096e15sm16103425wms.5.2024.05.05.04.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 04:22:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 13:22:27 +0200
Message-ID: <20240505112227.36660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714908152; x=1715512952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pMLwVWENkGe7yowwpPthMzxab/XFOEL9QFGiQXiPFKI=;
 b=by2KEGHaTpThqjSODWTjkalvwOUW2oOGQrVZf3yPrT60jG94+CSziobRzeoX3WVBDt
 +I34lIyVpj9WZSAkjQn+EJY4vniNmMWKJcjz7KPuT71f5WDIgpM7QYPLlT2+rJSjcEj5
 1ZxFfYwuOZ5Q1Z6wm0O9pJroXPWS23xEzQMhhklDdxUuasgB3dmdghflgjXzQX1Hu8LH
 58ncUMMisHKflfJO5qwGZHM8kstA0453Au4DafdXttmL5RXU7b/tbMLMXCLKJawuwkPe
 Q6H3RGCfr+a2XiFMB6Bl1rRA5LBkNHunEWlYh5qpA52T9AfWYyNG8lmTv55hYnMlilaM
 1+Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=by2KEGHa
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix x86_64 build with
 binutils 2.41
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following x86_64 build failure with binutils 2.41:

purgatory/arch/i386/entry32-16.S:23: Error: 64bit mode not supported on `i386'.

Fixes:
 - http://autobuild.buildroot.org/results/60f2f163b491879a8ea7f2d56a6b0d38b3cf439c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uilding-on-x86_64-with-binutils-2-41.patch | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch

diff --git a/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch b/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
new file mode 100644
index 0000000000..ae44c21fe1
--- /dev/null
+++ b/package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch
@@ -0,0 +1,94 @@
+From 328de8e00e298f00d7ba6b25dc3950147e9642e6 Mon Sep 17 00:00:00 2001
+From: Michel Lind <salimma@fedoraproject.org>
+Date: Tue, 30 Jan 2024 04:14:31 -0600
+Subject: Fix building on x86_64 with binutils 2.41
+
+Newer versions of the GNU assembler (observed with binutils 2.41) will
+complain about the ".arch i386" in files assembled with "as --64",
+with the message "Error: 64bit mode not supported on 'i386'".
+
+Fix by moving ".arch i386" below the relevant ".code32" directive, so
+that the assembler is no longer expecting 64-bit instructions to be used
+by the time that the ".arch i386" directive is encountered.
+
+Based on similar iPXE fix:
+https://github.com/ipxe/ipxe/commit/6ca597eee
+
+Signed-off-by: Michel Lind <michel@michel-slm.name>
+Signed-off-by: Simon Horman <horms@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=328de8e00e298f00d7ba6b25dc3950147e9642e6
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ purgatory/arch/i386/entry32-16-debug.S | 2 +-
+ purgatory/arch/i386/entry32-16.S       | 2 +-
+ purgatory/arch/i386/entry32.S          | 2 +-
+ purgatory/arch/i386/setup-x86.S        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
+index 5167944d..12e11649 100644
+--- a/purgatory/arch/i386/entry32-16-debug.S
++++ b/purgatory/arch/i386/entry32-16-debug.S
+@@ -25,10 +25,10 @@
+ 	.globl entry16_debug_pre32
+ 	.globl entry16_debug_first32
+ 	.globl entry16_debug_old_first32
+-	.arch i386
+ 	.balign 16
+ entry16_debug:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
+index c051aab0..eace0958 100644
+--- a/purgatory/arch/i386/entry32-16.S
++++ b/purgatory/arch/i386/entry32-16.S
+@@ -20,10 +20,10 @@
+ #undef i386	
+ 	.text
+ 	.globl entry16, entry16_regs
+-	.arch i386
+ 	.balign 16
+ entry16:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
+index f7a494f1..8ce9e316 100644
+--- a/purgatory/arch/i386/entry32.S
++++ b/purgatory/arch/i386/entry32.S
+@@ -20,10 +20,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl entry32, entry32_regs
+ entry32:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Setup a gdt that should that is generally usefully */
+ 	lgdt	%cs:gdt
+diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
+index 201bb2cb..a212eed4 100644
+--- a/purgatory/arch/i386/setup-x86.S
++++ b/purgatory/arch/i386/setup-x86.S
+@@ -21,10 +21,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl purgatory_start
+ purgatory_start:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Load a gdt so I know what the segment registers are */
+ 	lgdt	%cs:gdt
+-- 
+cgit 1.2.3-korg
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
