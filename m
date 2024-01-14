Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6B1C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 12:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8D7B413A3;
	Sun, 14 Jan 2024 12:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D7B413A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Rjef-bbxi7D; Sun, 14 Jan 2024 12:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B045F4146F;
	Sun, 14 Jan 2024 12:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B045F4146F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F33B1BF59E
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3781B410E6
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3781B410E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhYK4wE9pUrs for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 12:55:01 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE21410CB
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 12:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE21410CB
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3376555b756so4338397f8f.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 04:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705236898; x=1705841698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+aPuByGP33jQkj3Bb3GArV2GW0FatEMX8AkRK7tr4Y=;
 b=iaNhKATa8YZaXX70UXyb9sZYhTgyn5WVpmxhiUS0l0x6ApxkMqj1ko6eEqpZxXsM+p
 mhQigAYQ3BHQJrbYMVEzJy1vfYnbvQ8P25aE2OJ3XfI16SRRdJO9+KJ7058AdXEYYlV1
 DudRWHEcA1Vf4p5FyEHWmKRtkqW8otxugk19WulvDLkS6SRdCLm4ESEckmDzpDebXlYU
 /0NImXMr3ucQ+98T8iANCX6+E3f70xsXEjwT2KoSkNYq43p2eZdefw2znWGbhef6prib
 8eY8d1jbrt1JJVV6cWt1WHodmgoor8N5xchJTtpYiUyCdGs+mJQjrgF6QQL8ndxnWKE5
 s4UA==
X-Gm-Message-State: AOJu0YxByuOULVLU3mB7gSNrjYXdMRptNyuGoWeMsPMo8dx3JvfrB171
 DcYGHzqfPGcB9/OiqzNeX8aezIcPinU=
X-Google-Smtp-Source: AGHT+IEBmtr0ot0W4hy4hhdAIxgm/MQ/3CozHHxDvgLqYVlwQY8glAFKKGOPdCzgWFhKyZEOtG+gmQ==
X-Received: by 2002:adf:fc8c:0:b0:336:c79d:7504 with SMTP id
 g12-20020adffc8c000000b00336c79d7504mr1959462wrr.2.1705236898349; 
 Sun, 14 Jan 2024 04:54:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a7-20020adff7c7000000b0033660f75d08sm9035890wrq.116.2024.01.14.04.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 04:54:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 13:54:48 +0100
Message-ID: <20240114125448.819400-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705236898; x=1705841698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i+aPuByGP33jQkj3Bb3GArV2GW0FatEMX8AkRK7tr4Y=;
 b=On4r8vU2SLw3oL0+OM+QGUZmSSH9RVCGIdt3Q/ZXL0vccS8YzIemt3IqGIP/puLe+k
 32RZFAoy/n52dPAn8o5wjcF+vw8tj5/PCS/g3P6gNbBx1lHxsKwhfXKMCJ0nMw7wAwiZ
 b9QokxYBtBJV+bnknmXvgbzs9j5/cvqttvTIMRNl2UePkwE76/34Q+7qzM7M+qSmDMRt
 1K8ofnLVrlIxw+ql6+fF0MYY9Ih2pyfswvxcsnPAK2w/mqCNar3PSJeIgRVf5DhvtntO
 1KXxjS62rKTf316CT962D5t7nS8he5trS56E6Sxpx/HTcaLlF76GeUCAifOh00dWpIMl
 B7EA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=On4r8vU2
Subject: [Buildroot] [PATCH 1/1] toolchain/Config.in: update ucontext
 handling
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As suggested by Thomas Petazzoni in [1], add a comment on
BR2_TOOLCHAIN_HAS_UCONTEXT to specify that this boolean will be set to
true only when a toolchain provides a full featured ucontext
implementation with ucontext_t and {get,make,set}context. As a result,
drop its selection from BR2_TOOLCHAIN_USES_MUSL to fix the following
musl build failure on php:

/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/m68k-buildroot-linux-musl/12.3.0/../../../../m68k-buildroot-linux-musl/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
zend_fibers.c:(.text+0x946): undefined reference to `getcontext'

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20230516193307.1543455-1-bernd.kuhls@t-online.de/

Fixes:
 - http://autobuild.buildroot.org/results/271f9fb8bfa5ba2f74feef81e6b375b54e21cece

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5be63d4e15..f1f9212f25 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -34,7 +34,6 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_UCONTEXT
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
 
 choice
@@ -303,6 +302,8 @@ config BR2_TOOLCHAIN_HAS_SSP_STRONG
 	bool
 	default y if BR2_TOOLCHAIN_HAS_SSP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+# This boolean is true if the toolchain provides a full featured
+# ucontext implementation with ucontext_t and {get,make,set}context
 config BR2_TOOLCHAIN_HAS_UCONTEXT
 	bool
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
