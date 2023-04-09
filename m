Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2460CC7619A
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 00:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84FD584338;
	Sun,  9 Apr 2023 00:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FD584338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_HniOCzl-xA; Sun,  9 Apr 2023 00:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF02484336;
	Sun,  9 Apr 2023 00:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF02484336
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A4A1BF2BA
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 00:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B24341D9A
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 00:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B24341D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvZA8MvmkG3S for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 00:09:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01BA541D92
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01BA541D92
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 00:09:36 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 r17-20020a05683002f100b006a131458abfso20994209ote.2
 for <buildroot@buildroot.org>; Sat, 08 Apr 2023 17:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680998976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WkrMTYxD4v+L2rC8je2m0yNcQBFGonOB1HAHuT3Y6Wo=;
 b=uWHG8DLEfC66yzeQE7xsjI0bw4/etPeSwg7bV6DYUIayFwR2MenUjobzYOZubdYCgy
 yR6aIZv+/tNJRihsDmBeyv4FCxpMv9BFR9zB5rEvRfGVmFJjsojvQk/F1B6sJPIMZPIp
 9bEgxlgO9Y0XJC9IWT7kro6MvDreiQffQvKMJj8LXCEHNBXUtb2kiZ4fxLTtlDzzz0PU
 KT9j6dghHwzvgZpyYJLFIpeXHnOxK44Z8ucmVxZuOSdrG+Bb3z5b8NiBSWAZ7ahLqgh5
 bBREnuW+ebMYwujYzcBbTAoFs5VQrhPnBQzUXeqzTNYbvuWXAalyssKf3+yMHGSDz6se
 ysQA==
X-Gm-Message-State: AAQBX9ehPjP9tnZmwfkSzzq8DdGlAWct1sPwgmz/GOlSFETOYaY7Glzj
 SxfSocoEojZe47xlaYRe78L9sKjoIKc=
X-Google-Smtp-Source: AKy350Zqb08S5oZrwiDuMrDyf8ibTsqpgm7ISavZLb9bjCTXhy5Z/HrvGT2KhRlUGVKhQI8P8BUEfg==
X-Received: by 2002:a9d:5f0a:0:b0:693:d998:f50c with SMTP id
 f10-20020a9d5f0a000000b00693d998f50cmr2576681oti.5.1680998975685; 
 Sat, 08 Apr 2023 17:09:35 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.136.22])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a9d75c2000000b006a154373578sm2957079otl.39.2023.04.08.17.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 17:09:35 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Sat,  8 Apr 2023 21:09:29 -0300
Message-Id: <20230409000929.391071-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680998976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WkrMTYxD4v+L2rC8je2m0yNcQBFGonOB1HAHuT3Y6Wo=;
 b=MRR5DzA745E6u6OZ+g9RgNK4Qd7q+gbSGbMM9i3/MGxZ/7lfoyhGEOSv6hQEJZ7HoO
 5koptIWGAm09nY0A9L8oZd8b/ni3R/QaRHl7WBx//OGREEmt3GYsTKamewh5VdyMiD07
 EIfMxruiP100pD5UA4+5k0NRjz11UUGRM52gDghn8cul/fYAMx7jwQY7xtNOCjWLvNRS
 TcRLfqCh4lcVjtl0yhiKk7H2jUb86aKa8UdqZv15Vd6BRzbYjbpOc6keI3c5H2WboJVm
 ecLNeBuBGP8D7znemLvTUlEOmHFpdJI98HDWSWo02TY1/V7wBOxqLceFxxrJt8mkBqqT
 liAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MRR5DzA7
Subject: [Buildroot] [PATCH] package/qemu: install keyboard maps only if
 necessary
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

They are required only for system emulation, so pull a patch already
reviewd upstream[1,2] that makes the installation conditional.

1. https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06428.html
2. https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06438.html

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...tall-keyboard-maps-only-if-necessary.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch

diff --git a/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch
new file mode 100644
index 0000000000..91ea1e86c9
--- /dev/null
+++ b/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch
@@ -0,0 +1,36 @@
+From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Sun, 1 Jan 2023 21:00:57 -0300
+Subject: [PATCH] meson: install keyboard maps only if necessary
+
+They are required only for system emulation (i.e. have_system is true).
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+---
+ pc-bios/keymaps/meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
+index 158a3b410c..bff3083313 100644
+--- a/pc-bios/keymaps/meson.build
++++ b/pc-bios/keymaps/meson.build
+@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
+                        build_by_default: true,
+                        output: km,
+                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+-                       install: true,
++                       install: have_system,
+                        install_dir: qemu_datadir / 'keymaps')
+   endforeach
+ 
+@@ -56,4 +56,6 @@ else
+   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
+ endif
+ 
+-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
++if have_system
++  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
++endif
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
