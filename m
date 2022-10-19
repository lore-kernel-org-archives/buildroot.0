Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929DDC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 18:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05B9F40FD3;
	Wed, 19 Oct 2022 18:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B9F40FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7voHJuSs94gN; Wed, 19 Oct 2022 18:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3619440192;
	Wed, 19 Oct 2022 18:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3619440192
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59B5D1BF3FD
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 18:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 334E041832
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 18:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334E041832
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flmKE96NZ8-O for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 18:23:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F7041824
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01F7041824
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 18:23:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bv10so30429638wrb.4
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 11:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaeX0VXa84xLz9E+GVsRcw45fNp4kxKC5M7Z2vyPYvI=;
 b=e769F2dd/+YmbtCCDJwfqlFIcXqWXYTAUI9HbQUU4/WLwTANOxKFv3k1SnfSKkVXnl
 1cWrK6BB+g/pVKid9kysfuiREDIKb1r6vTOaM9nSjBKBp0OJnSkewPknlRa6njiLt6k7
 xHjDMUDZm08Ix/pOQin8fiC+dcBQqFeSmGSZ/MR1oo+oFFGPcu9i6b2E/QWPtCa6lw87
 dLFSWdcfXL91fqwdh+1or9RvksO8IXD8/u5jIzKGQyKkv3tM9RcmQY0zrhEUEflKESJP
 8kW6OGZLkn2kG3C6zTUIJY73cbrc6RWE04NZprQ0aznTRdYjH/AlJlwpyms2sg9M6oZb
 xV2Q==
X-Gm-Message-State: ACrzQf3Qhy7ykE4q+XK+bj1o0RjxiS6e5eSTDsdDgi3OsWlxiBKir9uC
 yOB3FVtTE44Q4EZ9bNB6maqgd8vvoCQ=
X-Google-Smtp-Source: AMsMyM5QJqM+K/zEQQwBvAM+Yv5hNJjpS1KLL0XVqnulsJeEifjqlOGarArS9GBbasQddXwGk7vMHg==
X-Received: by 2002:adf:e54a:0:b0:232:caad:38f3 with SMTP id
 z10-20020adfe54a000000b00232caad38f3mr5854671wrm.108.1666203817665; 
 Wed, 19 Oct 2022 11:23:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c350300b003a5537bb2besm669853wmq.25.2022.10.19.11.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 11:23:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 20:23:34 +0200
Message-Id: <20221019182334.2280837-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AaeX0VXa84xLz9E+GVsRcw45fNp4kxKC5M7Z2vyPYvI=;
 b=eXlbkcUK6OiVXomqXbDTJzuaW/X2clG7Mya1dqQaS3JqDFcGINP7+ulTxdqzz9abmZ
 QfV4tZY8eLxtsP4WI61ZXJ77+iAm3IQUWl3bkyn3/9zzg/+ycQCB6vzR94Q9PhnHv93r
 eljtZ0p080cug+t/bsGhLREKwV1ltcwMxWAAbxBJbmmTJT2SzYDQk/zslnIffF8hnzBj
 IFGbpM8NbmvrF0F6bEaq3uvr0oTwrYA++Fohr2oy0RrLD6tkCsWK5alhJ7yK+CVNSVZG
 d57h5jyGJiHJQ+eyqBUoXdIhHcOcZEzIOUVv0H7c/Fs4ILH466VpROgpJ1brqTsvK9Os
 olfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eXlbkcUK
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.1.0-51
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

Fix CVE-2022-3213: A heap buffer overflow issue was found in
ImageMagick. When an application processes a malformed TIFF file, it
could lead to undefined behavior or a crash causing a denial of
service.

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ff0f3e26c6..8988dad5da 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec  imagemagick-7.1.0-45.tar.gz
+sha256  4333ef2fe63f2510988af82b726f5b1919ebd54037ea6674566c69fcceb67e11  imagemagick-7.1.0-51.tar.gz
 sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 893606ff01..6bdf24c1e8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-45
+IMAGEMAGICK_VERSION = 7.1.0-51
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
