Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E0C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4289660DD9;
	Mon,  7 Jul 2025 10:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvrrnQR7qJhI; Mon,  7 Jul 2025 10:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA1160B0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA1160B0F;
	Mon,  7 Jul 2025 10:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89FCD15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB14415FF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 10:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-5dQbHp1f3J for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 10:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C7B1415FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7B1415FC
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C7B1415FC
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 10:18:43 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae04d3d63e6so488732866b.2
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 03:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751883520; x=1752488320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=37KRV3lH1ylz5MeIlOGZwghzlVx2qflg/Ie/Iz/JrcE=;
 b=grtpBdycvXYff2ijLrBX9pGe5R/AUn6/FZTPE01i0TY5DfQBiR1CffF7ZnE2+Hqk6x
 av/L4cFSl4+Hke+4I9/wrTGRCXlktdN7aVtLA8PrKwSFbYA56me2Og4EXk6ldWGcKJSZ
 tTW1tcCXh/4zcrjrka3iPDWi5h74TgOEmU1GehlgeZDn1O9/+8AOLxzzcqvIWNQgayjT
 Kz+0JjEnk81xqKTKlhedKPV5fqQjEy33sIrztv9Z3YZSe1QMeO2kWS6SbxpU8pnDfu2O
 1A2TbU04N7OPU/Zqt/h4qR2zPbiqVVrhpIJjllum04y1QpV5hfwMorfwR7eUZD9gfvT2
 sDmA==
X-Gm-Message-State: AOJu0YwpAKWBoFYFS9lXBG6hBodgD/fl72eVuWfrOWzpvKRBHCzxAQL0
 QnlCMTbNQ/wX8y44WJ5X6FpBV9xhwDAYF/Tf1gOE5x59YmzFh4KAkd5AcDQYiQ==
X-Gm-Gg: ASbGncsAjv1uShtdQZ7fQD1B4te8snoT1GLYqQDKA9gkFqcVbKH15ir3ttWp3PgJZ/Y
 rsbtW9UT3Omh1aEKu7S3tmqcFcywXigkSPUBD8eLKUZlaSxVZSkTJ6hduS8JrtjFX1w3j4uQrQy
 kkVKlNIGTiRf0UdFICgCzmDFIFrleu2S9juGFDO016yEuWrNvnGXPhbli7Q+n5RMzNd+zM9BG8w
 ABc60DQtfI+vRYAgXIPEFxMGB4uooXt0gGTLeqRoDF3mI+0ITTiTBZVGf5ysmNQcnAmDk/iIBj5
 6eiXiehowlKh/TZgefpU6GUVAFB1dY3T4R0M9oneP0ZoaOg2lIstsjQ0KQ8lVIHgoHAzXUP9j9i
 B3yeaShsc8LQNGiALl0T9AHkmVrPn173hPzKxymbEwtQ=
X-Google-Smtp-Source: AGHT+IHYH/QL4um0ub32PH8DuUaSM2ZVdp4fjyXS1z82wpfYNq0Ebev8UvxvE5yq72JVgmeYsgKf3g==
X-Received: by 2002:a17:907:3e1f:b0:ae3:bb0a:1ccd with SMTP id
 a640c23a62f3a-ae3fbc82702mr1076678266b.26.1751883520015; 
 Mon, 07 Jul 2025 03:18:40 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b02f68sm678538566b.117.2025.07.07.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 03:18:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 12:18:37 +0200
Message-Id: <20250707101837.4032434-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1751883520; x=1752488320; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=37KRV3lH1ylz5MeIlOGZwghzlVx2qflg/Ie/Iz/JrcE=;
 b=hRgdiAI26RLno9D+S0zgc6ZpM55ij+Ydve9CAZFa/jsc8nfxtM+eGwwTMhbbigQSdo
 fA7u+ipPNxvVsciWPz/RAhHYqGLXPwbVteBxeGdecMEoc7pxmejmUOSNxPYu/i2j+ci5
 /OcK/ktmEEqKnwiQi0U7hSiH0OQFuKMHbL6xZKazNxoXjaCMCzTppRSe/XCFee0gvmOj
 a23NKUzdejhnoRKTubn7oKbg8RcI1Yk8/GfRrFgB+5IcrITYftVKvoIZybUazFtVKPMo
 1A1TiuOSJJWKYC0RsU09LdlCIV19WjOq7FqndplzDC2nfG7M17+Q2/V8pDYcY0otF1YV
 zTaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hRgdiAI2
Subject: [Buildroot] [PATCH] package/parted: fix do_version declaration
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

With gcc 15-20241117 compile fails with the below error, update the
do_version declaration to match the header in command.h

../../parted/parted.c: In function '_init_commands':
../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
 2469 |         do_version,
      |         ^~~~~~~~~~
      |         |
      |         int (*)(void)
In file included from ../../parted/parted.c:28:
../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271

Fixes:
https://autobuild.buildroot.org/results/283f52d50ffef91d82a1bdc1f4dde1d54c5ffc23/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...CH-parted-fix-do_version-declaration.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
new file mode 100644
index 0000000000..78709e07ad
--- /dev/null
+++ b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
@@ -0,0 +1,44 @@
+From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 12:22:22 +0000
+Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
+
+With gcc 15-20241117 compile fails with the below error, update the
+do_version declaration to match the header in command.h
+
+../../parted/parted.c: In function '_init_commands':
+../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
+ 2469 |         do_version,
+      |         ^~~~~~~~~~
+      |         |
+      |         int (*)(void)
+In file included from ../../parted/parted.c:28:
+../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
+   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
+      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ parted/parted.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/parted.c b/parted/parted.c
+index 3abb52f..fc2aeba 100644
+--- a/parted/parted.c
++++ b/parted/parted.c
+@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
+ }
+ 
+ static int
+-do_version ()
++do_version (PedDevice** dev, PedDisk** diskp)
+ {
+     printf ("\n%s\n%s",
+             prog_name,
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
