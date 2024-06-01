Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F2C25B75
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 01:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B91060752;
	Sat,  1 Jun 2024 01:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8WjBpMz3Tj8; Sat,  1 Jun 2024 01:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5206F6117F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5206F6117F;
	Sat,  1 Jun 2024 01:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A17491BF4DB
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 01:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BB5041490
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 01:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4CLquuVWXsp for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 01:18:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88DDF41481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DDF41481
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88DDF41481
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 01:18:57 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7eb0116faf8so35199939f.3
 for <buildroot@buildroot.org>; Fri, 31 May 2024 18:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717204736; x=1717809536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2lA1gBumXREfyfYmqCTrrTr6KZFS3d9nYy7aUuulFM=;
 b=a49bshb8WWe04zTlTpBLWgZVA/3b54i64gDkA3o1z2J7jDDOJpbM4G6KNUFlDXug66
 peKd56/bDClf5fKY8KEq6vfVSluuufQEVrRGZgtm0bufeJeZiu3bC7hefdwFXDTXIUrE
 2QpVBhOZcVmUO7uVFb4Hd8bBf9rJaixawwdnwUjC7rmVYLBo2f3jTwa3h9aAs58KGy2a
 6V0Dvcsij/N9qlwzi9ElFUJWsfSamw3iWz0Ec5LXGNWagj2n9UlUSBRNmMVKN5GRRTTr
 YELpnrDml/P7IeLevAGiI9mt7+Pl8FhXVayxkEKaE0rK4LY06Ud9CBLay+XGS5O8Ovyj
 1s2w==
X-Gm-Message-State: AOJu0YycQ0fHp+VFKoz+V0O3gP7IyjzIDcy3frr4DHg57620JWvnWabX
 /nAim15CABQ1LKuYzQxi7QcwakeIFDf5vc0VYKGOJetAJsDkx/nj4454Og==
X-Google-Smtp-Source: AGHT+IHzFxd6+0V8O4fFVDUQuAU/3b67dPdchIobJ26HoSs+yxrAZIXQ2s93apDn5xlahz3pRiCmGQ==
X-Received: by 2002:a05:6602:3fc8:b0:7e1:7d63:887 with SMTP id
 ca18e2360f4ac-7eafff1f4f1mr447439739f.18.1717204736171; 
 Fri, 31 May 2024 18:18:56 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b566adecedsm331616173.27.2024.05.31.18.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 18:18:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 19:17:33 -0600
Message-Id: <20240601011733.2964473-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717204736; x=1717809536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V2lA1gBumXREfyfYmqCTrrTr6KZFS3d9nYy7aUuulFM=;
 b=Iu+JJZzQkU6oD8wJq+h/q96A7p2XEVfd3FxtxwpW+mFxGjGv6PgRom/frjEvC0MOag
 rybmuoF0g2fGb9dmsNOEfyajNQthmhmzBql1ux0vyCQjt4b/C+s2r+Rs7fqhxrjcmdw4
 8iK7W6tp8BNY7ncyP2ckry3pctmnVjS6piM5KpJt2kWAfaOUk8MA3569ZzU/vVMrBjZU
 bckjBbP0q4sCmz/YQxMsSYQb+XLOlVIZ1PpwCaG1ntn0ZqktT2xZqVnpyJFcrs3AMr+F
 3cl5gASpTEBxZgkcIxD2fTiu51qkZBf6lfsBr3qHL27m0Q/+tH9uu9V2pCAUVqhYxt81
 J9ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Iu+JJZzQ
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: drop glibc Linaro
 toolchain version check
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It has been well over 10 years since glibc 2.14 was released, I don't
think we need this check anymore.

The distutils module is no longer bundled with python 3.12 so this
eliminates the need to install additional python modules under python
3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b838dda34d..0889be0d43 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -25,8 +25,6 @@ import os
 from random import randint
 import sys
 import traceback
-from distutils.version import StrictVersion
-import platform
 
 
 class SystemInfo:
@@ -166,23 +164,6 @@ async def is_toolchain_usable(configfile, config):
             print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
             return False
 
-    # The latest Linaro toolchains on x86-64 hosts requires glibc
-    # 2.14+ on the host.
-    if platform.machine() == 'x86_64':
-        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            proc = await asyncio.create_subprocess_exec(
-                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
-            ldd_version_output, _ = await proc.communicate()
-            if proc.returncode:
-                return False
-            glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
-            if StrictVersion('2.14') > StrictVersion(glibc_version):
-                print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
-                return False
-
     return True
 
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
