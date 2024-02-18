Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002ECC48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A57C40489;
	Sun, 18 Feb 2024 21:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9BLx2FdYWh9; Sun, 18 Feb 2024 21:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 133D940125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 133D940125;
	Sun, 18 Feb 2024 21:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2591BF86C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46DD4607A8
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dpgfU4ldhmO for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 21:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2194560629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2194560629
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2194560629
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 21:07:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso26098905e9.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708290458; x=1708895258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUs4R0OiiYvm1p4lbfrr2Ik7fYeKmmg9ftf5ONzL/zU=;
 b=jEcTbqGj5GB+P7yxEcF2taKbYkKSGLUU0FvnzAiT/SNfSmfSiPLer7VkrmMHq6tkn0
 ebBBLNfvEArgZOY/bAz4jJlIigOt01x7aOaCtEdpsmAuDqb6pRKY29FkIqBpd/hxM6Yc
 XHOor0O2i3kmxIIX+//EI91BN1cHHeIot2mtG6Rc2+jHMxSGWyonCTxdmrIsB84ThE/q
 wKoREmHQtgFQJSJZtPrGPCMH3CW96WBgY2XhEWSiP5k8mUjzn9VbC2KiOH3nUvl/X90E
 9fkwQbS5ZPzs3Q6vTkDPgo1gjiM0MIbMNtxkVd2kdFE7bu8CxpeH/otiSxeSM72yq/X8
 TyGg==
X-Gm-Message-State: AOJu0YzNuHBANC2/Y/MKDa3Q4FlUrMmw3OmPF5An58bMpcWl3ur/pVJO
 pdzlu5EJbTMBFnl48CwmZuYrDqomoXRZvOf3bReJAFlC7lWTEElp8C8WT7tHtn4=
X-Google-Smtp-Source: AGHT+IHzXg21cJn9gVvX2o1V8Voj4BkjmFNBSfxDkYZBvNV6bg0j4w86BEBPw14lrnl/vzgJYUFONw==
X-Received: by 2002:a05:600c:4f43:b0:411:e86d:85a3 with SMTP id
 m3-20020a05600c4f4300b00411e86d85a3mr11989458wmq.16.1708290458365; 
 Sun, 18 Feb 2024 13:07:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b00411c724fa10sm9280584wmb.2.2024.02.18.13.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 13:07:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 22:07:35 +0100
Message-ID: <20240218210735.50128-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708290458; x=1708895258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SUs4R0OiiYvm1p4lbfrr2Ik7fYeKmmg9ftf5ONzL/zU=;
 b=i9nU2+plH94cqxfa0uW3TVFp+EY46SUPV6y09TKhOkUah72ECUypS/4GQK+YU0FrCK
 TnxIWPGfJGQVa+zJOT9q+LQzVllvBS9bN7uCBn61CQVSR1q/CdNwJJxzDroseIc2e9or
 8CsR4QNuKXzWJ8nwlnxRkWMDdEnP4R7wKj7Oe6u/JSgBfQzxpsAZBkqPaktLg7PpfHLv
 bI5mcAtN+WYYt1B3J5NNibMdlcT0fJllqkVVmhCA7hIcSvdQDjLBS+Nt4X7hpzUpo1A3
 9AYOVqLCF4znYmEPHafBPQBqDgDKag2i56dm0R3FTzgorz3oGV8XRRMWAEJB4kAa7xdw
 JmvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i9nU2+pl
Subject: [Buildroot] [PATCH 1/1] package/tio: needs threads
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tio needs threads since version 2.4 and
https://github.com/tio/tio/commit/93e6efc00153e625e4ceb8a51e01b324247d312a
resulting in the following build failure since bump to version 2.7 in
commit 4b33d7a47dd41fed5364a398320c2b7d0687ba5e:

In file included from /home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
                 from ../src/tty.c:23:
/home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
  218 | #   warning requested reentrant code, but thread support was disabled
      |     ^~~~~~~
../src/tty.c:43:10: fatal error: pthread.h: No such file or directory
   43 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes: 4b33d7a47dd41fed5364a398320c2b7d0687ba5e
 - http://autobuild.buildroot.org/results/9b20ff06a0ad24b7e7f4750ebe64e2077e36164a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index a84daf8a24..e4241fa5e1 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
 	depends on !BR2_sparc64 && !BR2_sparc
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_INIH
 	help
 	  "tio" is a simple TTY terminal application which features a
@@ -14,3 +15,7 @@ config BR2_PACKAGE_TIO
 # fix or workaround for now
 comment "tio is disabled for sparc and sparc64 architectures"
 	depends on BR2_sparc64 || BR2_sparc
+
+comment "tio needs a toolchain w/ threads"
+	depends on !BR2_sparc64 && !BR2_sparc
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
