Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6D2CA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 478D7401CA;
	Sat,  2 Sep 2023 07:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478D7401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXCLVeCcylHm; Sat,  2 Sep 2023 07:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8524C40192;
	Sat,  2 Sep 2023 07:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8524C40192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7DC41BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9114D83BCC
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9114D83BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNdgo0FxfIRa for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:26:19 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22C4183BCB
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 07:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C4183BCB
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c615eb6feso2319642f8f.3
 for <buildroot@busybox.net>; Sat, 02 Sep 2023 00:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693639577; x=1694244377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ei3sF52ruKLXrJJr+OFgyIKaA07SyvKkHMBK2a+YBVA=;
 b=ESk5C/SRpJaIQUjJDoGHc6npdendFwupC5bT7BAaadww2YLauQxsHTLEVaF0Q42Pg3
 +zUECF09kErt8Zbd3YqAyj3KldEZJ/6lxsArxMws0BL5wNxF6d0sWDE/ADN+cczyDtk0
 GQoxUD8gF8F9pmoh+DMPqMkmZdqY2Ca6h2E+sh9cpvc2A7wQOuSXtHEIgSWCsr+iMEj9
 uxbyhTENj5BaHAEAg8Qlyc18RY2pYTfIzTA4iiVV9CvPO/0Uqsl/XTHdzXYzFdfFm6yS
 Fz9tefeEGqcC39p30xDhcMXqcxhOTOJm3+FP/22CIRraCROYwZAHN8Cl4mbBaNKPPwqH
 errQ==
X-Gm-Message-State: AOJu0YzihmLhJLdExRyV1/IvELiJdAhAQ4WqbBKry/Z0eZBdVLd+MF7I
 pd4JWbLa1t4mL7cJTSJP4sV3bl0IOGI=
X-Google-Smtp-Source: AGHT+IGXIH3GXbAIsbyZPvsZkT/b1NEixUWA4ykgJ57AB0F6oDJxm5LdRP588EI4GcydiPH3SRvV3A==
X-Received: by 2002:a5d:68c8:0:b0:317:f702:70d8 with SMTP id
 p8-20020a5d68c8000000b00317f70270d8mr3370385wrw.67.1693639576954; 
 Sat, 02 Sep 2023 00:26:16 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 f4-20020adfdb44000000b0031984b370f2sm7579929wrj.47.2023.09.02.00.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 00:26:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Sep 2023 09:26:09 +0200
Message-Id: <20230902072610.737589-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693639577; x=1694244377; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ei3sF52ruKLXrJJr+OFgyIKaA07SyvKkHMBK2a+YBVA=;
 b=eFv3+VycL7cbKkakYOwTvpt36iv1sC/LQECI3C0gYRopMoQ4ppS2yxQmMaJkDDrck8
 otzoYegbbG2rRHjugw5Mmbmd/kXd5BSKiOhwTU5hdePOBTPghWCjCSZakWwMljGzWC0v
 R4DT/lFDawI4Gs2C8ftXqS9APUwUE3cJPGJf9Al0bHI2Ztj1P83GPV2mM40tgmeSSvU1
 s33ukrf7lf+Iuaeb2aBI9UpOJ1G3V+HoBvUF0sY2M0rOL0qpr1VzUVL1MEpCOE2fNdcu
 eCnMkPLQ/8u/ODhjG+oe+Wp5msZFz8Tp5nZsiox5o8xKYLaWwXScTgr0Bw9X6LV7J+cY
 wgHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eFv3+Vyc
Subject: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...build-add-a-configure-switch-for-building-examples.patch | 6 +++---
 package/libgpiod/libgpiod.hash                              | 2 +-
 package/libgpiod/libgpiod.mk                                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
index a21c76700..f1a853a6f 100644
--- a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
+++ b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
@@ -73,7 +73,7 @@ diff --git a/configure.ac b/configure.ac
 index 57c99a8..90a6324 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -155,6 +155,12 @@ then
+@@ -164,6 +164,12 @@ then
  	fi
  fi
  
@@ -84,8 +84,8 @@ index 57c99a8..90a6324 100644
 +AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
 +
  AC_ARG_ENABLE([bindings-cxx],
- 	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
- 	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
+ 	[AC_HELP_STRING([--enable-bindings-cxx],
+ 		[enable C++ bindings [default=no]])],
 -- 
 cgit 1.2.3-1.el7
 
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index f0803cab3..6647b77c5 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7  libgpiod-1.6.3.tar.xz
+sha256  7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5  libgpiod-1.6.4.tar.xz
 # Hash for license file
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 35d003fa3..e7ff15561 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.3
+LIBGPIOD_VERSION = 1.6.4
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
