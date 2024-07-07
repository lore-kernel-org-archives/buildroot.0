Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3224C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E27081765;
	Sun,  7 Jul 2024 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fy1DCeeOCNQt; Sun,  7 Jul 2024 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D7778176A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D7778176A;
	Sun,  7 Jul 2024 16:33:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0761BF3D7
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 882FA8176A
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsGULvH0ffRG for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 16:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F67981765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F67981765
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F67981765
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 16:33:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77baa87743so339254966b.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 09:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720370013; x=1720974813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itrTVs+5iBqNAsiojfeI57Vk5TY9R8QDm7sviYX3Sf0=;
 b=R8XVMRRMjQCUo73pDNgOeFKQ6i4EIr8V/wqFo4V+5fj2NQCsRTRW6vn4lhMCk0dpyf
 sejZ6wsRcsGr8ccxE0sbC+fc7BotMkGXzr7/KPWdKwKc7RR1M3h/Ow6SGksqqaPL2qIE
 y4KHULZxpTs1hQHtDk7gY6V2ZtGlA2q4tFUqxIQkR7nQoezAX8mSbzlwESZ6tVqUPGIw
 nqxDXOd5t/yLtxvtf0VfhDs178H5KQetzxqi+auKZYgWjVNwd7uN0TGLTgfzLlWpvC3/
 BOED34gl8ljAQSPiJ8/Mf0Oc8YcXlZAPwJnv0fAgDq6IbStaoG3qdEVC4TeS3svDLTa3
 +S7w==
X-Gm-Message-State: AOJu0YxoTWLVxkZO2TqpIAIjjHuqWS7x85i1tjc/PyumH8PVdOosfTVx
 H7AKukxvuxjq3HMBvkl/Ta+aT8rGDL4VjEFUVcmXTFszWhtsk6jgcSR6SJVd2J75vRhM/k2+XUt
 Skso=
X-Google-Smtp-Source: AGHT+IEAAEx40xYiYTYxsSCv6rQ/GK73Z9KhJYte7IdVyxz6SPNyCB/u3UNzG88trJY/nZjRDOTlHg==
X-Received: by 2002:a17:906:f2c8:b0:a6f:4804:d41a with SMTP id
 a640c23a62f3a-a77ba70c750mr666520266b.55.1720370013109; 
 Sun, 07 Jul 2024 09:33:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77ed4eb787sm91384666b.111.2024.07.07.09.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 09:33:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 18:33:29 +0200
Message-ID: <20240707163329.306725-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720370013; x=1720974813;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itrTVs+5iBqNAsiojfeI57Vk5TY9R8QDm7sviYX3Sf0=;
 b=njs/W06fKyN9214I+fy0+t69hLTC0w8bZr1csGBGzbpzySU5nRhiA2ZvDrFp9doFDI
 RZ5zFBz9Hf6JmM9SOGt1Z2LONO3IFFwpxrFVdRh6RGX41ro28NOvKVk7s3uNV9m2RhH4
 f5bY7hM1VYLA3juSKZbNCBY79shdRbboPHEJ8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=njs/W06f
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mach64:
 fix patch fuzz
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, xdriver_xf86-video-mach64 fails to build with output:

    Applying 0001-cross-compile.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 85.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                         | 2 +-
 .../xdriver_xf86-video-mach64/0001-cross-compile.patch      | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..63174590d446 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1558,7 +1558,7 @@ package/x11r7/xdriver_xf86-video-imx/0003-support-glibc-2.20.patch lib_patch.Ups
 package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-compatible.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Sob lib_patch.Upstream
+package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Sob lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
diff --git a/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
index d27617606eac..02d34ce9fc3b 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
+++ b/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
@@ -1,7 +1,9 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 --- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
 +++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
+@@ -80,14 +80,20 @@
+ # Checks for libraries.
  
  if test "$DRI" != no; then
 -	AC_CHECK_FILE([${sdkdir}/dri.h],
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
