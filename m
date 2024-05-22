Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A75FC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B825F82115;
	Wed, 22 May 2024 07:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxh8DsSxHlAt; Wed, 22 May 2024 07:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518598210B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518598210B;
	Wed, 22 May 2024 07:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA9271C585E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F09D4079C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81X4RFY5UdSs for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16F674079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F674079D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16F674079D
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572baf393ddso903476a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361381; x=1716966181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rs0p4Tth8J3OSee/3C0gBi/pc/ucbnya7jKIqqamahw=;
 b=U4Y6V5Me1mQtadoH/Qx2xFcGhGdfzdnikTCS3K95riJuLH970NVQec6LHqHkzMHt1t
 /s7yhtAIJK5A3lL4BuVFAh0Tmm8eOxfN5g9wSXD9pzV7uv4gMg4eXbCUcJID5QQGhC9K
 v8Ay+iuRRbdr+bBYStzArvJuQqqBiI+WomOwq5PL8zovzCtamWDcP+/uC9h0UwCWx3IS
 M+WgL2UNLzs2htQGu4vg0Pc98lbIjnAY8LB9TddDsAuivT7NQU5Mdkg4rg3fUbdTfEHd
 R6j4wJGF+6OeXtHllpCB5URfBCbK4LbwBKTpNjh9MOPrLABwyP33znrvtsM3VLzQfEYM
 OB9g==
X-Gm-Message-State: AOJu0Yy6MM58oZNcaW+6V8S/+Cq1OG7FkNmjW+ivO9jZgGoLSibRkjWv
 4DRxf/7ipwY6GPj5fUPYVEtAqO09zX664myw6cbCBEYUKynAS7NPCctodt2TZK6WqQs21+o0Poq
 vwKs=
X-Google-Smtp-Source: AGHT+IENCzdmJigCOsIDMfMI1UGWjkFqQn5NYL4gCNxPFS+5ft2auX41KszL47A37yZSelbeJw7u7Q==
X-Received: by 2002:a50:954e:0:b0:574:f83d:b282 with SMTP id
 4fb4d7f45d1cf-5752b3f847cmr10534532a12.2.1716361380413; 
 Wed, 22 May 2024 00:03:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:29 +0200
Message-ID: <20240522070238.3282121-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361381; x=1716966181;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rs0p4Tth8J3OSee/3C0gBi/pc/ucbnya7jKIqqamahw=;
 b=At2DrUvOcaShfvZMfkJ8URwK8cI3Tj/MjAbrRmTWbnkwnKWbjEbsia45o4lRiWlC4O
 uGeQ2S+G8/DPQBSUT0ujMhb5fsDAVIsPdGS7md+LV5By1K7Q0Ixaz4QTubj7G0PstEe2
 XGQT8HVoT4ocUJVy6nOnVkQ/yZYDxwnpzWm7s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=At2DrUvO
Subject: [Buildroot] [PATCH v2 10/18] package/libglib2: update the patches
 to be applied with fuzz 0
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...dd-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index fb9905724278..8f87671167f0 100644
--- a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -1,4 +1,4 @@
-From ff3db531608eb0f9de8a88c1bc34fe0f1d93121c Mon Sep 17 00:00:00 2001
+From 03e9cae3f3a7e2bbd5110f1ce2739601571bc024 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Nov 2021 18:01:05 +0100
 Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
@@ -14,6 +14,8 @@ Fixes:
  - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: Never submitted
 ---
  gio/meson.build  | 1 +
@@ -21,22 +23,22 @@ Upstream: Never submitted
  2 files changed, 2 insertions(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 29473d26b..112d4ada9 100644
+index 462606f3b56c..e6b736167b8d 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -841,6 +841,7 @@ pkg.generate(libgio,
+@@ -880,6 +880,7 @@ pkg.generate(libgio,
    variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
 +               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
                 'giomoduledir=' + pkgconfig_giomodulesdir,
                 'gio=' + join_paths('${bindir}', 'gio'),
-                'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
+                'gio_querymodules=@0@'.format(pkgconfig_multiarch_bindir / 'gio-querymodules'),
 diff --git a/glib/meson.build b/glib/meson.build
-index f78f32969..6c5486699 100644
+index da76fc005e46..cde2edb197c7 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -384,6 +384,7 @@ pkg.generate(libglib,
+@@ -441,6 +441,7 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
@@ -45,5 +47,5 @@ index f78f32969..6c5486699 100644
                 'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
                 'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
 -- 
-2.33.0
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
