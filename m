Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5A7CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F23405A1;
	Mon,  1 Apr 2024 13:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7K4453Q_Xmpa; Mon,  1 Apr 2024 13:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59D7409B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E59D7409B9;
	Mon,  1 Apr 2024 13:13:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD561BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D856581C44
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffwdf2nkwA7w for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:12:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7339C81815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7339C81815
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7339C81815
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:12:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so5814702a12.0
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977175; x=1712581975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSO/wzUslcv62V4oVoaG6VLY9LrIp0Tt3yliqdxexUg=;
 b=GIroZINPewTU2KI7AkAoW5vwegN1tHAc2H1nGaTQPjU8oSA8ZAl1stxyhakUGaAkSd
 EgE1I4V/YiWpiJA9T8lfUFMISOTxBamSWM43oQK5FnGvgTIvOPucofvgQIe1LUB0LjDe
 91wA/4HR2P60Vkff7lCjh3043/3SxYuGSiYj245EtMbET5YewPls3lrbkS/+4ZTUaUym
 IBGvGQ6lLdr1JE/W/rL5F+yvIHZ7Bv/RyEOGVKHAQrsINq0II1JOsq6lUWjoe3cOyzS9
 K7rBf1kBJH/vsSEWwBBO0jctfxxZ8F0thEItS3Bq+4/PzgQypS2MPrYO9s7lEcwG45kR
 niXw==
X-Gm-Message-State: AOJu0Yx/DscoWg50BXuLBZzW6DjbWJ52MUrfQMD6+1DHAmpud6NIVamd
 dx/+WDI7XF+IKIIbCUFMM5ohKdF6NVljIakfG8codRMy/AWCOCQTBDgxNtQX
X-Google-Smtp-Source: AGHT+IEbNV9fNtal8KwXumOdmZE7+ZG4QdIwA12644go4ueQm+Lg3nWkhJX+mIfvZm+ShTRgelaIBg==
X-Received: by 2002:a50:9b01:0:b0:56b:d9b0:f1c3 with SMTP id
 o1-20020a509b01000000b0056bd9b0f1c3mr6113397edi.39.1711977175075; 
 Mon, 01 Apr 2024 06:12:55 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 e12-20020a50d4cc000000b0056bf6287f32sm5613485edj.26.2024.04.01.06.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:12:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:52 +0200
Message-Id: <20240401131252.511224-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977175; x=1712581975; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MSO/wzUslcv62V4oVoaG6VLY9LrIp0Tt3yliqdxexUg=;
 b=go0ldhJcarHIPV8DrATuqKG6dkdahZinZqrcq7QJhdG8BCCELRPyMOgC4A3ubtYJWQ
 nQuh/heDbol9vMK8mbU+MFXGsCzmwb37WXuVuiAySCgbfc+FAh03I+p2pmqumbU903ao
 dGEmmh6Fq+Uy8HUgVhtGikKY3/Wg4ZaqKs4vyMLOEKJG6E5q47rkt2ijvlgyb3Yk6Grq
 9ZX/IJtu7N31xK28nPQtV5nqHD4cEbWDFSr5gQ2Fy8gpuKp75rES7KCUs7DLG5t/MDiz
 4fS4ZaKYFFRzVLn0J7703F9+XvZOP3Mc/VLKI0nMGCxPR6MkoGh8FZfFFPAYewf2cNDU
 nXyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=go0ldhJc
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.52.2
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

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../pango/0001-Drop-Werror-array-bounds.patch | 40 -------------------
 package/pango/pango.hash                      |  4 +-
 package/pango/pango.mk                        |  4 +-
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 package/pango/0001-Drop-Werror-array-bounds.patch

diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
deleted file mode 100644
index 45821e853..000000000
--- a/package/pango/0001-Drop-Werror-array-bounds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Mon, 1 May 2023 23:27:52 -0400
-Subject: [PATCH] Drop -Werror=array-bounds
-
-gcc has strange issues with this and produces false
-positives that recently started breaking the build of
-pango as a subproject in gtk.
-
-See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
-
-Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 930f41082..2d30c0141 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Wuninitialized',
-     '-Wunused',
-     '-Werror=address',
--    '-Werror=array-bounds',
-     '-Werror=empty-body',
-     '-Werror=implicit',
-     '-Werror=implicit-fallthrough',
-@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Werror=sequence-point',
-     '-Werror=return-type',
-     '-Werror=trigraphs',
--    '-Werror=array-bounds',
-     '-Werror=write-strings',
-     '-Werror=address',
-     '-Werror=int-to-pointer-cast',
--- 
-GitLab
-
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3e609e6e0..69b6b0adf 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.50/pango-1.50.14.sha256sum
-sha256  1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8  pango-1.50.14.tar.xz
+# From https://download.gnome.org/sources/pango/1.52/pango-1.52.2.sha256sum
+sha256  d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b  pango-1.52.2.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 723e6d228..ec0f5127e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
+PANGO_VERSION_MAJOR = 1.52
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
