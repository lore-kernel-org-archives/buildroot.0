Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C39ECAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 15:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F79340CD4;
	Wed, 24 Sep 2025 15:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhfHfcZ0WcST; Wed, 24 Sep 2025 15:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A05D40C96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A05D40C96;
	Wed, 24 Sep 2025 15:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 620A412D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F42F400CB
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1RCpJdIRKl2 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 15:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8DA040087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DA040087
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8DA040087
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 15:43:33 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-74109e2ed70so129207b3.3
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 08:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758728612; x=1759333412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJuQx1CWvU9Cu4Ottkv50KFeAyO0BGu5xc73F/pqxd4=;
 b=itkwVfWV+JSVN/fEgMKkJTKEO8omSBOsdG5pPud7TLpmS8Wm8Y9T0JLp7P+ZT7wEc/
 P84HTAmTUVAaY4utPpXHAMZQUP4M6kzYiPC5VmwofTWOBF/mpYjfj5djD2BSZ2c6xP6o
 E764zwAzl224MO1uaNE3ewvDlZLWBtcRhewJ53Pwth0Ikp3LXV0/BhdTYete4q2bdtSf
 NtQFq6K4j65HjAS+Mp5HDiFFBGJ/QP2F29iHeDUoHrNcNclqbX/AC1AqTzWDjklaaUCP
 /H0FTpoZGt9QZvQnx3CyIOZEIwWuOmU+DamdvB6ul1U9QMcNLtYevtCn9IA4ju06oMJE
 najg==
X-Gm-Message-State: AOJu0YxgdF3rC+trjM2mtWluWT+IOxWe0TwX4O75D3HWjyI8vyaMRVqw
 BlDOBB4c8UBa1zRdA1GcwYAI5eT8Lrkx7GeljRbpYWu1okf+ghOCY6uwoDM9eA==
X-Gm-Gg: ASbGncstpdpyJBqEnV7WBfGeoTuCfa7DPuIwQUqlv9Jtl+dYa7xALSkL4nfGKCcT5Vq
 WJ4h7WzFRdB4KiOx4uR+Z+ZO6/SZJUhOU7iyBBKAHKZv7EvZZgYH3IFJOGOKyicrQzYY8MSSdee
 R88eed8MSlF3ZZPCvFSKfr99K5mz2EM0zqa3DCwi049ldgwD7cLGDYPRQYmq83zcuIw0XAMkZ+P
 kxqUBq7aX3N29S+PvwdDFXzqQkndyX1oZBKMPDmHGfHF6ebd4E8KIjDTIi2oEVrmn776WbkeaLW
 /rf4L9W+YXAyM0KBbNX/7VGoBvhFZneum92RGJtaJkSmUMoj7e2PK/3dWrfdsA8EyduEM6j+3Wh
 Ge0+ToqZ65K/vaFvzDA/efGB+1aLBeA==
X-Google-Smtp-Source: AGHT+IFg/gYh7jJgrQ+gKwtd6iPJGCebCz9UigY1QSNMWOIP026LtUvJsiUICnRTpGAWsOh3u1LLVQ==
X-Received: by 2002:a05:690c:7485:b0:74b:e290:1e2e with SMTP id
 00721157ae682-7640624f3a5mr2774617b3.52.1758728611851; 
 Wed, 24 Sep 2025 08:43:31 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7397186ac2dsm50003967b3.42.2025.09.24.08.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:43:31 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Sep 2025 23:43:15 +0800
Message-ID: <20250924154316.17015-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758728612; x=1759333412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OJuQx1CWvU9Cu4Ottkv50KFeAyO0BGu5xc73F/pqxd4=;
 b=Nd2q9BCLwJgmdS1hVAi+Fi5TVSf/nd5MYSmiPq2+wshUaZeCIT5boRnj344X5oZ2eV
 oQ/oKR5/B5h1vT4EuNOlURHloccRVuieQ0CQ1BOxeV3DG2bob40AizYvPvYnrI0PWBHS
 0z9ckVIFw+La4Mf8a/hNTRlYsbuDr5U0MDH3AzJCjPvP58lOkfqKsIxF1ZLQZhDmMUzf
 OZ6iifwSh9VctlndHHyZIvP3zduid75xQNhHTctQ8OF0n1FATW1ATQqcwDJ0+H7qvPBm
 VwI/o9sZyqteY4wjPMWPCL5v0NAhXJFjEoq7xdnLsh83bw4X8e72VhYMFzna7cKsQfCW
 TXdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nd2q9BCL
Subject: [Buildroot] [PATCH] board/qemu/{x86,
 x86_64}: fix shellcheck warning in post-build.sh
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .checkpackageignore             | 2 --
 board/qemu/x86/post-build.sh    | 6 +++---
 board/qemu/x86_64/post-build.sh | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 50471f3f85..92386b3dca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -48,8 +48,6 @@ board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-sp
 board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch lib_patch.Upstream
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
-board/qemu/x86/post-build.sh Shellcheck
-board/qemu/x86_64/post-build.sh Shellcheck
 board/raspberrypi/post-build.sh Shellcheck
 board/raspberrypi/post-image.sh Shellcheck
 board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch lib_patch.Upstream
diff --git a/board/qemu/x86/post-build.sh b/board/qemu/x86/post-build.sh
index bf83a002c2..24eee7f0e5 100755
--- a/board/qemu/x86/post-build.sh
+++ b/board/qemu/x86/post-build.sh
@@ -4,8 +4,8 @@ set -u
 set -e
 
 # Add a console on tty1
-if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
 	sed -i '/GENERIC_SERIAL/a\
-tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
 fi
diff --git a/board/qemu/x86_64/post-build.sh b/board/qemu/x86_64/post-build.sh
index bf83a002c2..24eee7f0e5 100755
--- a/board/qemu/x86_64/post-build.sh
+++ b/board/qemu/x86_64/post-build.sh
@@ -4,8 +4,8 @@ set -u
 set -e
 
 # Add a console on tty1
-if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
 	sed -i '/GENERIC_SERIAL/a\
-tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
 fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
