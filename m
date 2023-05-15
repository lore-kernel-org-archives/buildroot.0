Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CFC77B7D
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B573415C8;
	Mon, 15 May 2023 20:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B573415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9ip0EDUKwNM; Mon, 15 May 2023 20:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AAD40BB1;
	Mon, 15 May 2023 20:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AAD40BB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0D71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C76605EE
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C76605EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvWhL8ZLEBHq for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 20:30:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C30E860590
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C30E860590
 for <buildroot@buildroot.org>; Mon, 15 May 2023 20:30:06 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a516fb6523so124154305ad.3
 for <buildroot@buildroot.org>; Mon, 15 May 2023 13:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684182606; x=1686774606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1kErajFYVuPLJZpGDyeIs6ksuvSN681Mig6lVR5Rec=;
 b=QivJKp2SQP13cLv/mvonC3iV5G6hkTpbkVTPJIrbRthBoVhBg+7JWkqgxnFLbwDaeM
 NAdSoslm35eOGHadAGU8wopN6DK/BHQXiGqX3j83gs0AyGFAzl9h47vQ8/G2fl/KCvRp
 0SMwxqnuqasFrBsIOC3sjov0pJzwePY6rMXVMwafxQ3QSFRnzH3Ss+3NJUpG7MK4c7CW
 zVZ6lruLPPUPwUAtuM3uBk/GDIyPXBIB9jJTt05m7FIReqpv6/NMsyqri7qKxtCtkKCA
 LbjnuFcnu/sPw8s2EGQAKFr7sikSuX+a2F0/UPicALmvEG+xUU61OEL72gnLi2vsP0pk
 5F6Q==
X-Gm-Message-State: AC+VfDzdj/6ZPi2/kAUKUE/l7cDIwbmJabTykwdKVZsZM0bNQYaLrVGT
 Y7q64yIrCoRwFCOjumJvML4BjYb/X6eHrw==
X-Google-Smtp-Source: ACHHUZ585HeCFu3ynmiS+6fTA1jaEm7XUslkr5XzM9fThmfCA5AUw2rk7wjcLyS1azjGFFtn8pu6cA==
X-Received: by 2002:a17:902:7c0e:b0:1ad:f407:37d2 with SMTP id
 x14-20020a1709027c0e00b001adf40737d2mr9257746pll.5.1684182605521; 
 Mon, 15 May 2023 13:30:05 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::75c4])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902860c00b001ac6293577fsm13888429plo.110.2023.05.15.13.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 13:30:05 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 13:30:02 -0700
Message-Id: <20230515203002.346534-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684182606; x=1686774606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m1kErajFYVuPLJZpGDyeIs6ksuvSN681Mig6lVR5Rec=;
 b=R3ZS/W4j2L5ZdjoTZolzEOdhNgwcpOBmyIFMegl/qdpkgvantZ6zMAgnB992AyS6Gr
 mnx9c04DItT3wLrWvlnxpgGo+FCyrBPyhc/x8xqVhswokRq8LE1f/NeI2EIsaJf1CSml
 7t7WJbQOz70nk+8dOz3qXxNsXvNNwFGLHetUaPXWeW2cABrvj3aY0GpJhx86SsZbYhX1
 EqdRblS3Q/xKbHpqUjRfQYRp8/Iw920U9i/cOywsjs/dOgJTBLYdyZ3qdyb9ehAE2jsE
 AodMqcyJ58YahJghbD/3IxKp9cTXtpdLmMp5hIo6Sty0RwvFUdM2GdwBBmh4NfSCmnkb
 JwUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=R3ZS/W4j
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump version
 to 1.76.1
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/0001-disable-tests.patch        | 2 +-
 .../0002-Add-rpath-links-to-ccompiler.patch                   | 2 +-
 package/gobject-introspection/gobject-introspection.hash      | 4 ++--
 package/gobject-introspection/gobject-introspection.mk        | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index 390707c10a..8de216c039 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index c2cb577f..65ce7adf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -232,12 +232,6 @@ else
+@@ -237,12 +237,6 @@ else
  endif
  subdir('docs')
  
diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
index e21da42ce7..a8cf332f21 100644
--- a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
+++ b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
@@ -15,7 +15,7 @@ diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
 index cb97e76f..d29b28c8 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
-@@ -231,6 +231,8 @@ class CCompiler(object):
+@@ -266,6 +266,8 @@ class CCompiler(object):
  
          for envvar in runtime_path_envvar:
              if envvar in os.environ:
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 0db5072c3b..063b96275d 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.74/gobject-introspection-1.74.0.sha256sum
-sha256  347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653  gobject-introspection-1.74.0.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.sha256sum
+sha256  196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf  gobject-introspection-1.76.1.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 9131e1eb73..f0c7fcd2ca 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.74
-GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.76
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
