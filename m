Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B733C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F2B840BD;
	Wed, 24 May 2023 13:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F2B840BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYH8hQyM12FL; Wed, 24 May 2023 13:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7B084006;
	Wed, 24 May 2023 13:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7B084006
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5614D1BF322
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ADB14247D
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADB14247D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TP4dKnlJODly for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 13:31:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E694246D
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00E694246D
 for <buildroot@buildroot.org>; Wed, 24 May 2023 13:31:49 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af6db17a27so113575a34.2
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684935107; x=1687527107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxLQNxie1bguh2vvQ1EXiVELlnnoOW/RA1arOsn185o=;
 b=ZQSuTNdOtaXz2owhHyVGcr8MUGvkDQdvlsbUDKn4g74oFFvvqrbiW/9TssMesCaOhx
 cUkTTHfX/sHXcW6bUoZZyKaNwWIJDuRV0+4Zp8DKuR6P2RS6LmXUDeR1YsihakiolNyh
 Vw3VOOdFSLZgnBlpSCADM4uTkz/R732wAMTvBBA8omWiLs5aFy/cl6ACOwXV125fE1Ac
 XfHnQG46Dz0HXXUGAdnspDLMnvvRIQ5TtyOmg76KR833gN4xCLr/iXs1JxXt31s7hU99
 1JYPXgGbYH2nULVxabh98aqttom+B/XdKu0zfAUH8djYYVsGtFGXW+9QSS0noO7mCw5+
 aR0g==
X-Gm-Message-State: AC+VfDzpEEYJL7bP7TvYj1SuKx5lwQCW2GytywAXtiYpU4SS4zuqpwCC
 SYBVD2FjjGKtOtxcdnGgwKrf9qZQ9dQ=
X-Google-Smtp-Source: ACHHUZ7pS7z6o/qZwvOz0/FhKHuMI3F0Clu2w/qUHFoipmGILyIJFcw62PZeQVz3K5O2HscikzwYig==
X-Received: by 2002:a05:6830:2015:b0:6af:8011:f7f with SMTP id
 e21-20020a056830201500b006af80110f7fmr4658625otp.18.1684935107050; 
 Wed, 24 May 2023 06:31:47 -0700 (PDT)
Received: from casantos.remote.csb ([177.18.46.144])
 by smtp.gmail.com with ESMTPSA id
 di9-20020a0568303a0900b006ac87b54ca4sm4552904otb.34.2023.05.24.06.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 06:31:46 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 10:31:38 -0300
Message-Id: <20230524133138.60117-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684935107; x=1687527107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cxLQNxie1bguh2vvQ1EXiVELlnnoOW/RA1arOsn185o=;
 b=nJIVKZsuvEd7gjuDJJEQqNzkrFLhKCxQ66gTQF888eHTD1ZJpY0NEddW7p3aU4ZejH
 wXaKsRsPVsf7TKvxJjpIUqjM1e9GU6eH08VsOT+zBRY+KJurSGx2ReiDxlBrh+bb50HM
 C1vO8hyY7zvu5tJSjw1TaKBsJOPjFBI3Wkab+luD2wPHAAwNjTrklwlmaIPlADVomxRF
 EkxuRCVIjYa5LRvWNspXP5NZqcjc+kfA4QlB/SaSVa5HgvBOJubR4OhbGFA0wFwPr4od
 G4HWYiwhyRzPHZIdHDgfh5krw/PqvuN+SldHAtLMYNkj7FDA36do2JHHMRaCatXlIubT
 4QvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nJIVKZsu
Subject: [Buildroot] [PATCH v3] package/qemu: install keyboard maps only if
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
reviewd upstream that makes the installation conditional:

    https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2
  - Fixed reference to uptream patch, using the QEMU patchwork
Changes v2->v3
  - Fix SOB, as required by the Buildroot policy
---
 ...tall-keyboard-maps-only-if-necessary.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch

diff --git a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
new file mode 100644
index 0000000000..be9d0ad59e
--- /dev/null
+++ b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
@@ -0,0 +1,37 @@
+From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Sun, 1 Jan 2023 21:00:57 -0300
+Subject: [PATCH] meson: install keyboard maps only if necessary
+
+They are required only for system emulation (i.e. have_system is true).
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
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
