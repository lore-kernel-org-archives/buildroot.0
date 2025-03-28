Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB72C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326BF85865;
	Fri, 28 Mar 2025 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMgxPqS1EPnr; Fri, 28 Mar 2025 19:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054C7858A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054C7858A6;
	Fri, 28 Mar 2025 19:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC75A12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEA8E70903
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMfQfY7-KADg for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9EFA708E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9EFA708E4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9EFA708E4
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so2015306f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191865; x=1743796665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNfryypOx6BWRinTqgU8NhvvmHUUb0kXE2mJEtKjnXc=;
 b=G6d531B4Ixu5mdgQ9qsBmEapFh6AJp3cvhH8kmFFIfB8FX9HLq0yDs0NtQBwHLXIXc
 TiXfn4xT5fWzcfrc/sG6VlaNRcF0F34sapKyfsA8Al1CABug7QVI2qqzupY22l+kC8fq
 59cB3gI8V2+HdID8iJLIbL5w1NIuZZnjnPkvmUSW2u8uXVl4uESwQafuLoEO8TjqIeVt
 YN44haqQNCQPbXWhOXFQ4TEJRVnVdN8KGgBxVz1cZvISU5kvdA+jioOcdQHCLDxCVHQy
 h98ZlBqHpi4lY6+0KlVpzDeBDMpgExyRjzphcEKw/z/l8WoeyChPHa3Y+PRTe8ofThWT
 5fRA==
X-Gm-Message-State: AOJu0Yx8xTy7sSABUrh5sTYvHRpLIrrzHHGhVm6P0SEgkrjfwyoSGEro
 xKrCtk08DNNyeGjMLoDUJHelI0XjWRPuZpy+DbFzr5acLkc62JpAZ1sisQ==
X-Gm-Gg: ASbGnctSMbEtRgfXFYR+gEAl9ftfv1sgj2ZrXTmQyB8Qp5EpKFcrsvDTxighwLi6RCz
 nRNMIKZQK2A6Me2q3U0CngeBv8X6mRAWO8Yi/K0VU5cKu4Ji8D6JGSxZ8FvwrOuadrjFL8zXU7+
 Fpol6dfqsVMBODLxbSu2om5q6qOy9o/4sLFP6xTYZCuXaMGsiTTzTGjh5Wnz0rWyeZRQhmuLsVy
 /R7+nDxqeovEz71N4KPDlitvSZpD3uIC7hS13EaN6IsI6uz0KVTd5kQqhO5pRFIJG2ge7a+0WoO
 PbKPuDp4//XEqtSFQ9DCeT1FIDnxLM2jMrQVVifa3hWjBLxp7Q++6Xmdpa4Yb5ZoRg8KK7DSRT7
 8u0DjfyOf1so38JU5PGS2uZrCUjXb
X-Google-Smtp-Source: AGHT+IFqbGxx8IbLWO7qv58sbEanrMb8PUoyzQ9IUBcOAyD58F2gubyRQ1tlZayjtwvdh9Hu0fEY9g==
X-Received: by 2002:a05:6000:22c7:b0:390:fc5a:91c8 with SMTP id
 ffacd0b85a97d-39c1211df1bmr304373f8f.53.1743191864702; 
 Fri, 28 Mar 2025 12:57:44 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm3552272f8f.64.2025.03.28.12.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:57:44 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, ju.o@free.fr,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Fri, 28 Mar 2025 20:57:38 +0100
Message-Id: <20250328195741.3921731-2-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
References: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743191865; x=1743796665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNfryypOx6BWRinTqgU8NhvvmHUUb0kXE2mJEtKjnXc=;
 b=E5klk4aHImM5j6Ce6iVBMx8nB7g/+aIv7pbDCD//l7JWkF82i526S1pha6+pj3IZ56
 5hf13zXKWBVP+dSUZFb/4L41JMQWnPQL94Bu8hP5gE/hRPKw8uZ1kGWkljJoClTGqNuO
 v11RXg9S9Cy8G5qx9RMxBkalQW+/EmzA0qtu/5aVnT9WHNWM/ZqOK8CTx4I5y7zf0FSD
 /LgZtCptk2alUMaz00vfnsoNbw1U7CLeJzdgxk8VDyvcl6zOaGogax+AnFL0g07/fK6g
 RVqIb4C1dTHsHi8ADURaSs3Up0vpCsukTv/3OWyDCz1f9MFqiI/vKQ8KSTp8d3jFb2py
 gn6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E5klk4aH
Subject: [Buildroot] [PATCH 1/4] board/sifive/hifive-unleashed: fix
 shellcheck warning in post-build.sh
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

This removes a warning reported by shellcheck: "Double quote to prevent
globbing and word splitting". As a result, the file can be removed from
.checkpackageignore.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .checkpackageignore                         | 1 -
 board/sifive/hifive-unleashed/post-build.sh | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 66b3e100bb..14f1a40a7c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -72,7 +72,6 @@ board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-
 board/roseapplepi/post-build.sh Shellcheck
 board/seeed/stm32mp157c-odyssey/patches/linux/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch lib_patch.Upstream
 board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch lib_patch.Upstream
-board/sifive/hifive-unleashed/post-build.sh Shellcheck
 board/solidrun/clearfog/post-build.sh Shellcheck
 board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
 board/solidrun/macchiatobin/post-build.sh Shellcheck
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/hifive-unleashed/post-build.sh
index b418120652..14c80558d5 100755
--- a/board/sifive/hifive-unleashed/post-build.sh
+++ b/board/sifive/hifive-unleashed/post-build.sh
@@ -1,2 +1,2 @@
 #!/bin/sh
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+cp "$BINARIES_DIR/boot.scr" "$TARGET_DIR/boot/boot.scr"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
