Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EB7C54798
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 15:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26086407DA;
	Sat,  9 Mar 2024 15:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIVYLEnpdPln; Sat,  9 Mar 2024 15:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB77C4079B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB77C4079B;
	Sat,  9 Mar 2024 15:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561AF1BF4D8
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 15:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4335981F3E
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 15:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yU6iO6Eg_LnU for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 15:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2006E81F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2006E81F3B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2006E81F3B
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 15:22:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412e6ba32easo11387855e9.0
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 07:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709997728; x=1710602528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J47WUJsZESwKuuotQ+p8WVotc4NEOBfwSNfD0n9f79s=;
 b=DfqOonk1bT8DuPVWLQrvkG5c+oWaOx90ps3/TAzk78VB2y7VBmg0KNIS/GJ+uHkt/v
 fW7UAeXSSkWNv6S2aa4IUPiNrcLE2UKm7mJy6KggHDG+U1NVumsI8jmLngtAxnjGZz+H
 bKAmTJrK4TyEGN+xSH62oWH4UBddZQ+g/UVaimCqn96qC2CBn5vjMODX/Y6yvOWw0999
 dTXRrjUKeJO0OQa7lzsewbDPAKJMgI+E9/i/NyLqE7KBOUPEjC9V+mR2uyhknWFag0Ji
 q7S5ppca1sYABa0mTNcTkdmTuDJyWBTJSVzslKl+b8TFNDoOB4IwxCwDad3eAeoVncaE
 bUWw==
X-Gm-Message-State: AOJu0YxWBGXOLflGPU5R2HT+z3/Bjf4XavJFiMi7oHMVdAfBWofDimJq
 3s2QgH4K4b/w1mUqmLT48Y9sPzCX0nRZwHXvdoiTtCNyua8QnGS9i0Ha65iR
X-Google-Smtp-Source: AGHT+IHCouGhYkZGKDtKYbLhfZabvMHEj7JmnuL6V15hhOUEMffN36oo3xc7R2Wb8cuuUwpknAAl1A==
X-Received: by 2002:a05:600c:1c08:b0:413:1375:871b with SMTP id
 j8-20020a05600c1c0800b004131375871bmr1677116wms.26.1709997727906; 
 Sat, 09 Mar 2024 07:22:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b00412c8117a34sm2778382wmb.47.2024.03.09.07.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:22:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Mar 2024 16:22:05 +0100
Message-ID: <20240309152205.28587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709997728; x=1710602528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J47WUJsZESwKuuotQ+p8WVotc4NEOBfwSNfD0n9f79s=;
 b=ibBfjpmsUXQ3ihy7V+4vYdnt3lyvcSBP79IgcQJDKt63orFJVSVkRbNgZY1fdpngkj
 E2yxgRrfs3mfI49+HOm3BB5+KroNT1SFP0lL5UB0znLCsd5r00Qq59QZDv1D8mwUiaHE
 fT4T0gDYKABLR00SXGqEVw/G2Hnql6uaAGrHQ6+hgGJzxTP3ynxMGKT+5TdjUJ85kP0c
 yCvfmkzhGb3CV34t1s9DPmglaFUeMpvzAcECumS3X53SEX4+iMCDVDgEltH3ruosvFh2
 YWDdY3DSMSR6yZJwdT4EM2tvZHfCubqkM7xtp3161zYw2hrdz2NA/5/wtIruDWFlyrF2
 QJ/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ibBfjpms
Subject: [Buildroot] [PATCH 1/1] package/axel: needs gcc >= 4.9
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
Cc: Ismael Luceno <ismael@iodev.co.uk>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.17.12 in
commit 50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
https://github.com/axel-download-accelerator/axel/commit/517d3ea036c2837b779a15b410331cd0df4fb066:

src/random.c:1:23: fatal error: stdatomic.h: No such file or directory
 #include <stdatomic.h>
                       ^

Fixes:
 - http://autobuild.buildroot.org/results/ca62edddd42252bf21caa8243f8aaba38992fc68

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/axel/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index 4507855ff8..740095a505 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  HTTP/FTP download accelerator.
 
 	  https://github.com/axel-download-accelerator/axel/
 
-comment "axel needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "axel needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
