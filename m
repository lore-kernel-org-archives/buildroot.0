Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D72C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5656660AF2;
	Wed, 19 Oct 2022 20:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5656660AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsRck9ECQKRw; Wed, 19 Oct 2022 20:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C8160AE1;
	Wed, 19 Oct 2022 20:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C8160AE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B65231BF41F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8195341D2C
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 20:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8195341D2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGzcg8Bg3-Nr for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 20:00:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8BF41D1D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E8BF41D1D
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 20:00:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bp11so30886289wrb.9
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIuztNlXjgirk2lZ3a3qDLFc1pPqiN8pd/xpROHaPIs=;
 b=zWQ+6DPpM8CM8PPcLE2zzWfP1MzHPZyFT283HSqV8Y55PAVCVeNCJmHPzoOP4JK0QE
 Ze/3yvgI5rhzYL0S4Mp3tFj2ODnbNyNLYy0Hckqz1XLnhnVnLY41mcOaCIerkTbPa3s/
 mVzisKesf9uKMTI9iUrsnn3p/TYcOgrgWPV4YeZGFo7cAwE6wL8bQR3vX8/CFDKBlJk6
 8hEIVp3QWk8uJkQSb/T9qX8URHIwYBCmJOcvCK6lavy4MqQdgR+m5dVuayHHMfdB3a6h
 qhNBGPFP1Brr6mVInhKI17pLPlLv7LPORPyFkqXELP4WAmrrn5CfXjPCDICtgK5adWpm
 iXUQ==
X-Gm-Message-State: ACrzQf0mxJiA35lt9LsxK3lLWBpVr6VFVq7MGuhG39UEPgwHQv+ibnTT
 9W1//eGue2FGzL9TYtsdM/ywmEgyf8A=
X-Google-Smtp-Source: AMsMyM4RlOJ28I4uTzuLjHf8InsPOOkw5kJzeDUQnuOXQ9FuuVg3O+TqCNK+zNGvyB4oZqhimjAT0Q==
X-Received: by 2002:a05:6000:1861:b0:232:2471:d405 with SMTP id
 d1-20020a056000186100b002322471d405mr6215820wri.130.1666209654362; 
 Wed, 19 Oct 2022 13:00:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r12-20020adff10c000000b00225239d9265sm14676325wro.74.2022.10.19.13.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 13:00:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 22:00:51 +0200
Message-Id: <20221019200051.2690977-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OIuztNlXjgirk2lZ3a3qDLFc1pPqiN8pd/xpROHaPIs=;
 b=QQUYdcLen08NZSCv9a+dDUVVzvuXwZijLfWTB0wnAGIICIY5dhGgOkodxnBJf8rq/T
 ocEYQCR75o6KAbrxaU0m0nyF1BlWShLrkFJeg9ONBCc9O/jINZh6Aj3wsVS/DxI2J6ul
 biQgvrEYeohn5/7N4EDxlqao3y0IKbmYOZjLpSfXvJ2WjkqoJRymDLt3hA1tcAtlr9yK
 6xn/EpWwctRcGxllgn6Z4Q9T47Q3mauGMSbiPhalDtvr2UMth2e8bIdhsybOeZvf/zbQ
 kgQaupbjbnXhW63lKZ2drBT/XKpUhny12TJ2Qp7tvpa6vIVgo2HIHHhFBVzktdb1eJZa
 QvyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QQUYdcLe
Subject: [Buildroot] [PATCH 1/1] package/poppler: security bump to version
 22.10.0
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-38784: Poppler prior to and including 22.08.0 contains an
  integer overflow in the JBIG2 decoder
  (JBIG2Stream::readTextRegionSeg() in JBIGStream.cc). Processing a
  specially crafted PDF file or JBIG2 image could lead to a crash or the
  execution of arbitrary code. This is similar to the vulnerability
  described by CVE-2022-38171 in Xpdf.
- Drop patch (already in version)

https://gitlab.freedesktop.org/poppler/poppler/-/blob/poppler-22.10.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch | 27 -------------------
 package/poppler/poppler.hash                  |  2 +-
 package/poppler/poppler.mk                    |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch

diff --git a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch b/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
deleted file mode 100644
index 40af6a2e00..0000000000
--- a/package/poppler/0001-Include-setjmp-h-when-WITH_JPEG-yes-and-WITH_PNG-no.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3ea6bca90d87d3f91556205c4e58ca425c6ac437 Mon Sep 17 00:00:00 2001
-From: Marco Genasci <fedeliallalinea@gmail.com>
-Date: Sun, 12 Dec 2021 10:23:37 +0100
-Subject: [PATCH] Include setjmp.h when WITH_JPEG=yes and WITH_PNG=no
-
-[Retrieved from:
-https://gitlab.freedesktop.org/poppler/poppler/-/commit/3ea6bca90d87d3f91556205c4e58ca425c6ac437]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- poppler/ImageEmbeddingUtils.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/poppler/ImageEmbeddingUtils.cc b/poppler/ImageEmbeddingUtils.cc
-index 5c50f1269..c26b9eb2a 100644
---- a/poppler/ImageEmbeddingUtils.cc
-+++ b/poppler/ImageEmbeddingUtils.cc
-@@ -16,6 +16,7 @@
- extern "C" {
- #    include <jpeglib.h>
- }
-+#    include <csetjmp>
- #endif
- #ifdef ENABLE_LIBPNG
- #    include <png.h>
--- 
-GitLab
-
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index cf6c537063..93681e04af 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acb840c2c1ec07d07e53c57c4b3a1ff3e3ee2d888d44e1e9f2f01aaf16814de7  poppler-21.12.0.tar.xz
+sha256  04e40fad924a6de62e63017a6fd4c04696c1f526dedc2ba5ef275cedf646292a  poppler-22.10.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index db6da25d39..5524bfc420 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 21.12.0
+POPPLER_VERSION = 22.10.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
