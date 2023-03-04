Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF53C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C9140457;
	Sat,  4 Mar 2023 13:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C9140457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOHDwehspk1S; Sat,  4 Mar 2023 13:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B672C40325;
	Sat,  4 Mar 2023 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B672C40325
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121451BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E003D60AC9
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E003D60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIqmcDZFTq9r for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D7060593
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3D7060593
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:53:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g3so4744109wri.6
 for <buildroot@buildroot.org>; Sat, 04 Mar 2023 05:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677937982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+KTDhmch/TOiYqAHNYRQrOgYtbMxPIHXwUW/TibZ/8=;
 b=Q+4NkVF73bjx1rnO5UT90gFzgoYLHCe2kbKzoYQx5j1/I+5uOwc+jI0GkVCpbmstry
 tiMjq6tpe1Crg8SWHga8jKWmQ8M6mH55TSTDcgv0XTiy4lOhnGBSTniapW3pPrMGws/D
 EUYKsCaiUz1yJWTOfRmDeeKdL7n+MxNDbJdtLv7KZEvRjWDZilcVecqH7pQWwNhjqN4B
 2wXLySsvc0sz9dScl2RaiZT5j8PfNpH2L7EWOEyJIYFMIbClo/9NOXrpzXWki+jCcvOe
 A3rm88z08xmW6bOY7aclol8VPSUOI6RzPYX5WtJfBPrFaS7ILqY1MPm/nlOMWJ7XdjdA
 2DvQ==
X-Gm-Message-State: AO0yUKV7UIz+a+2at+LmwCFfSK/S+fklvat9cAgDzWS/wMHS7LmSFbIR
 EbUS6cg4t0uVjIs41Plb2yjViP8AGHQ=
X-Google-Smtp-Source: AK7set+FbpNlyKWuJgWf+UOwgelgM0+wAjw0vr2la0GK54RlkGhkJyJdWCWnRWWQZ0BpXKxQfXEGUg==
X-Received: by 2002:adf:ee86:0:b0:2c5:3fcb:681e with SMTP id
 b6-20020adfee86000000b002c53fcb681emr3556227wro.4.1677937982509; 
 Sat, 04 Mar 2023 05:53:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q18-20020a5d5752000000b002ce3d3d17e5sm3759211wrw.79.2023.03.04.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 05:53:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 14:52:58 +0100
Message-Id: <20230304135258.24967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677937982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A+KTDhmch/TOiYqAHNYRQrOgYtbMxPIHXwUW/TibZ/8=;
 b=NsENwiqOsPcVuAE9f0JOHk1unP67Uhfva4DaJXcRsRjNyjRK/DGg+Um0f6HL93w5In
 IT6Aa3mTj7rP6v6aUA1C3W+9/gFpUcjU7w0TXEjRM9+5yRV40dnqRenx+/MU3Uz2luCd
 HOd6+aGsQeRYzSDGF/Ub1OWoWSz+OmopA6erZ4+Ixp2g1IZWodkuvrSDqXG1PrvIY4kh
 /lXVJY9IFRhcEsNZmHrA/6nx1fMg11VK0TJuKJgBJXV4bkgtRmM7zFhXA1GJd9UaR2zA
 B4ySZ07desUj9OfP7g8bnyTXnzgUZ5tJHReHilz/IGCObcEmWn5i2rK/YLKfrNRTYYLQ
 Ceig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NsENwiqO
Subject: [Buildroot] [PATCH 1/1] package/exfat: security bump to version
 1.4.0
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

- Fix CVE-2022-29973: relan exFAT 1.3.0 allows local users to obtain
  sensitive information (data from deleted files in the filesystem) in
  certain situations involving offsets beyond ValidDataLength.
- libfuse3 is supported since
  https://github.com/relan/exfat/commit/7cbc1544a4f68d8b4d33b187a053fc554405c56e

https://github.com/relan/exfat/releases/tag/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat/Config.in  | 2 +-
 package/exfat/exfat.hash | 2 +-
 package/exfat/exfat.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index c0b4eabe11..c0ed2570d9 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_EXFAT
 	depends on BR2_USE_MMU # libfuse
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # libfuse
-	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBFUSE3 if !BR2_PACKAGE_LIBFUSE
 	help
 	  A full-featured exFAT file system implementation for GNU/Linux
 	  and other Unix-like systems as a FUSE module.
diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index b40fc7f0e5..c6082a403a 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3  fuse-exfat-1.3.0.tar.gz
+sha256  a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20b2c8bbe6edb3001e  fuse-exfat-1.4.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index c0ef77a113..a8efe5b0ba 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.3.0
+EXFAT_VERSION = 1.4.0
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
-EXFAT_DEPENDENCIES = libfuse host-pkgconf
+EXFAT_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBFUSE3),libfuse3,libfuse) \
+	host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CPE_ID_VENDOR = exfat_project
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
