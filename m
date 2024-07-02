Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B68C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D43D810A6;
	Tue,  2 Jul 2024 13:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcdU5-tjaVjq; Tue,  2 Jul 2024 13:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F6D810A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F6D810A8;
	Tue,  2 Jul 2024 13:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 049491BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28734169E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYyrKY3f3Att for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D06A2416DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D06A2416DF
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D06A2416DF
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:39:30 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a72510ebc3fso625939766b.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719927569; x=1720532369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38q+h1/5gDFygSKmswd6lqGvCJhxMEXI9yg4hinFmKo=;
 b=DYO/861CdKnEZC+fy1kja+S0fuRAEbJmHNYn8LhmpOK/BPOeu7Op39IPRec58usKOm
 2mIrZS5fAZ5qeAoY3dXLgiEJ9f9pORHK5Z0v8noKwWQrdbAmrNV2IDIjX6qRpu5sW2Z2
 ayXLDxyFWygjMKmbwmodwgJ+OU+vZbV1VnMzd3Pd3xQxHIzy48Zf4pxobd6YfwytgaD2
 2XS7cBU//Hhg+B+81lsRI1SPRtviUU9SFWyngulUot59WxMB39zgxKFKB7exMIyCIPqh
 iRYvV4mnkEkqYLPlOtbsd5hWkqorM8A+dRRqSLrbOLTNONCatVtH9tMvUYoPv6AR8Rgx
 mYOw==
X-Gm-Message-State: AOJu0Yxi5p00sTDpGHnAbpO3hNlo1bJOHasve6G1TMBEgxTDaGTuV33O
 yhdYwPt+qH77r6+qlTzP30yqdMvO5L2tzmGIihjMVLcs3MyjIQVxW+LnqYQgJz+B41H5XHchxQ/
 wogY=
X-Google-Smtp-Source: AGHT+IF5qOFodsTE3Yt6wg8XeN1TnQ+H7OXDm41chjkZJzb0XGVBGNbT96uPsKgyCf91QwlMrwY+Og==
X-Received: by 2002:a17:906:db01:b0:a6f:4bf2:daa2 with SMTP id
 a640c23a62f3a-a751443c744mr759702466b.15.1719927568737; 
 Tue, 02 Jul 2024 06:39:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab065689sm418544766b.106.2024.07.02.06.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:39:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 15:39:25 +0200
Message-ID: <20240702133925.2426667-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719927569; x=1720532369;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=38q+h1/5gDFygSKmswd6lqGvCJhxMEXI9yg4hinFmKo=;
 b=gKLzQHmrgUUdHuPGc4CJj/sRfIf0JY+Bj7U/T6CAf9mz18HaRej4dEapr6SX8PLAir
 yW853Du2r86R25bUZvNIWVcapQo89Xxo0FqVtsgt5DerK86HWKgEmjJdQHgIRwtw6uBD
 NHiDQV59p4rLQqZFjPJ6Z1H0N0+FDvqsku4QY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gKLzQHmr
Subject: [Buildroot] [PATCH 1/1] package/sdl_mixer: update the patches to be
 applied with fuzz 0
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

Due to this change, sdl_mixer fails to build with output:

    Applying 0002-configure__set_macro_directory.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 2.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../sdl_mixer/0002-configure__set_macro_directory.patch   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sdl_mixer/0002-configure__set_macro_directory.patch b/package/sdl_mixer/0002-configure__set_macro_directory.patch
index 9802333a1d4d..cad9baa9c31f 100644
--- a/package/sdl_mixer/0002-configure__set_macro_directory.patch
+++ b/package/sdl_mixer/0002-configure__set_macro_directory.patch
@@ -20,13 +20,15 @@ Fixes:
     libtool: and run autoconf again.
 
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff --git a/configure.ac b/configure.ac
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1,6 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT(README)
+@@ -2,6 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT
+ AC_CONFIG_SRCDIR([mixer.c])
  AC_CONFIG_AUX_DIR(build-scripts)
 +AC_CONFIG_MACRO_DIR([acinclude])
  
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
