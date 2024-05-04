Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F8C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 09:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54E4283BA3;
	Sat,  4 May 2024 09:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp7zbX4PsjX6; Sat,  4 May 2024 09:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376A683BA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376A683BA5;
	Sat,  4 May 2024 09:15:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 676701BF2BF
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 09:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B10410B0
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 09:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yqFp6dSRdYP for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 09:15:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0582410A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0582410A5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0582410A5
 for <buildroot@buildroot.org>; Sat,  4 May 2024 09:15:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41e82b78387so705515e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 02:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714814118; x=1715418918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ui//pWtNvXuBThREpZaPBrRhKpw6QrxISmkBBsWGmnI=;
 b=SV0BlQmay8ILmw3xDR02SJ90yRaG2Dvklms+qlnX5jtbMtt3fCAdeSrKGp+R2gak+A
 alzVyes1KvEo1bv3eTmJJNKd4ml7keBfoKwCwmyMWEEwv4BhsET/qDf/X/ukbxQIineh
 peOFCnGIBwULHofOO6f2LCmDkJeGA46sUhdGRRu7aQoCZzCT9pQwHqGV9sJJ27H9qf59
 /sNsL2L6cJJetvH1HzFgftHtUklboOjR59BFf3k5Y0IjDdxNCMBCwU5SCst6hZM1Vd+g
 uYPtpGMxZZx6ycqtB8Y1ghtEYFib8J1zWtnM14gdA4cqWVd83UvCmD2BY6sBV3RMcBV9
 Lc+A==
X-Gm-Message-State: AOJu0YyGRzZXgPj1FCvxP1shZMFQzhYNDrFEcaOLJKQOW2naQb2gltS0
 4LeppaLXe6U2axSUPCNp48O+R93To0vGnF+U0n+2IsuTIi9kCtrd5mRCcg==
X-Google-Smtp-Source: AGHT+IHt2o++2QkvpvO6nr2w+7YTy3C8IJkdP/uCq2lCj7OZd90zEUovcxJST6WrugpbVGgcRSZQRg==
X-Received: by 2002:a05:600c:3148:b0:418:d6f2:b0c1 with SMTP id
 h8-20020a05600c314800b00418d6f2b0c1mr3364265wmo.26.1714814118042; 
 Sat, 04 May 2024 02:15:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c384700b0041b6f63f42esm8486426wmr.48.2024.05.04.02.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 02:15:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 11:15:15 +0200
Message-ID: <20240504091515.365847-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714814118; x=1715418918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ui//pWtNvXuBThREpZaPBrRhKpw6QrxISmkBBsWGmnI=;
 b=ZKOUQsFuvG+yiocHkoqGw+vicdtEeI/Zk44d8bXyvZFZ+CU9kdd05K/pKvWutCVvdO
 qK4uYGaj4AeCKA4gd8G7SXT2jrJqf5e/Tfglo22eQLHQdlGEueKMYWMya6z6eNyy3DGA
 sHYNJmPnCVdC/yz6zuLodT0+s8/H+0sZyovKLZA8stspXCLya6hd9rQZxmVUyMEXl8mz
 F18fMoDnK4k5HDIvKbG8iT4W23dQTKbRxjiECVJSgzZNJjYVookAlIYKFy0efwROGk5n
 ZvO6dNCc+/DkJzve6oHvvHlVtxoOurhKqKRcwt7vCBOSO4QomxfZ2d/VD+zB3qivH5hr
 7cRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZKOUQsFu
Subject: [Buildroot] [PATCH 1/1] package/libutempter: do not hardcode PIE
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PIE will be set by buildroot if the user wants it so set LINK_PIE to an
empty value to fix the following build failure raised since the addition
of the package in commit 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b:

/home/buildroot/autobuild/run/instance-3/output-1/host/bin/m68k-linux-gcc -W -Wall -Waggregate-return -Wcast-align -Wconversion -Wdisabled-optimization -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0   -std=gnu99  -DLIBEXECDIR=\"/usr/lib\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl,-z,relro -Wl,-stats   -fPIE -pie -Wl,-z,now  utempter.c -o utempter

[...]

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/12.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
(.text+0x4): undefined reference to `__shared_flat_add_library'

Fixes: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
 - http://autobuild.buildroot.org/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libutempter/libutempter.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
index d51f70049c..b6e77449c6 100644
--- a/package/libutempter/libutempter.mk
+++ b/package/libutempter/libutempter.mk
@@ -11,7 +11,7 @@ LIBUTEMPTER_LICENSE = LGPL-2.1+
 LIBUTEMPTER_LICENSE_FILES = COPYING
 
 define LIBUTEMPTER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LINK_PIE=
 endef
 
 define LIBUTEMPTER_INSTALL_STAGING_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
