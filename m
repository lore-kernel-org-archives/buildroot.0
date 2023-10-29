Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7416C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29034434E7;
	Sun, 29 Oct 2023 19:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29034434E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epWD3MxWutiv; Sun, 29 Oct 2023 19:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D708434D8;
	Sun, 29 Oct 2023 19:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D708434D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 822DE1BF870
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA3C7089E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA3C7089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7fa4qEIBNbA for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 19:36:28 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5775270894
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 19:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5775270894
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso29798425e9.1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 12:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698608186; x=1699212986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6+Laz728wC6+NRRBmaD1QbrUwnfi+g3XjzGGbEhOk8=;
 b=dggfJFPc48hHdCHzE4YSmfouFCgRcjOzMiilfCWmuTzB0AFUMagdr/CWH3/USfmSYN
 Pa63nfS44pI0QDa/hOJOvgluEwC64ivTByx63iYOTHjOe9558wvMX2b3DLMC2KPnLapK
 gYRSlyTQZdsAXt1ZFtK2A1k0aIhCw6dkkjKRVfJdah6IXe26ryEGO+z/G4r5mrFar8cV
 BWzXk5aWijXY6C9YU5Y1yb4N1P37NUIn+0hhH36eEAkGoc/AeWCAbJ7sVP7MHZtFdEFP
 VwnZIBeE5I9dbbqwWfTXTp4wjTf0LZhVMNOE5Tz+PhOl3K2iJDEffHJWf4wdrB1fTMic
 ZkvA==
X-Gm-Message-State: AOJu0YwCsOAEaxUNQ43VZZ6LJSOfQ9sp1L2NNos+9sUy863VGgx33NL4
 c8krA3pDPbMeAEWubZcM0JePBkimhoc=
X-Google-Smtp-Source: AGHT+IGarWCaq982evK3cl6fbWNyDV27724E4Gg5Qx03EdV5NAyU+Lb6Wu/suDEKf/DD0+EQ2lCseA==
X-Received: by 2002:a5d:47af:0:b0:32f:8085:73f8 with SMTP id
 15-20020a5d47af000000b0032f808573f8mr2106377wrb.18.1698608185685; 
 Sun, 29 Oct 2023 12:36:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a17-20020adfe5d1000000b003142e438e8csm6599200wrn.26.2023.10.29.12.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 12:36:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 20:36:23 +0100
Message-ID: <20231029193623.679637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698608186; x=1699212986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F6+Laz728wC6+NRRBmaD1QbrUwnfi+g3XjzGGbEhOk8=;
 b=mo95WovoLBO1xddgfod3qVe1EBAm0vBI+GKCbN79uTjbe7VFQG3Bk+AyD2PhG005ov
 f9ot8ZEtbJvkX80bvTeUjo/kjrO/mSnwToSgrp9FfrwwGljVu9Qm6T+9W7t9kR+VBSlt
 7014jqbZ9UgfHivvr8Gfo/xhF90OAOGvMlrYqvGkUjJM6oj2usP/03oNnv7z7JtBNw6J
 sur6J+JPpM912MqMTPRHYuGBHl6n7kjstK93U2CQ9i3tuA8DnbphIeOCZGfH0zX9TaYO
 Q3yBJ79lHF4cxoVHVvMRBwxU+8HNFYuuCHIU6y/kTxvas2YOjZSxDHOUh61c6gNWqiT1
 7OqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mo95Wovo
Subject: [Buildroot] [PATCH 1/1] package/aespipe: bump to version 2.4g
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aespipe-v2.4g     October 23 2023
    - Added configure script autodetection for -fno-strict-aliasing compile
      flag. This option is needed with some compilers that miscompile code
      when link-time-optimization is used.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/aespipe/aespipe.hash | 8 ++++----
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index f7491278e0..4fe7d0753b 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4f/
-sha1  2c23e1a6be298cf4f173f06b1123e4ecd5e9a202  aespipe-v2.4f.tar.bz2
-md5  ed05c62c1954110f009bedda4bc1562f  aespipe-v2.4f.tar.bz2
+# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
+sha1  fb6b0108176d653f0e5b3be2385b132be791d800  aespipe-v2.4g.tar.bz2
+md5  c216c6c9e939fac69f859af0ad2fd8ef  aespipe-v2.4g.tar.bz2
 # Locally computed:
-sha256  b135e1659f58dc9be5e3c88923cd03d2a936096ab8cd7f2b3af4cb7a844cef96  aespipe-v2.4f.tar.bz2
+sha256  bfb97e7de161e8d7ce113b163bda1d1a8ec77d2c1afab56dcc8153d7a90187fc  aespipe-v2.4g.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index fd4f776dda..4769536d2f 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4f
+AESPIPE_VERSION = 2.4g
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
