Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD49FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 17:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662D560F93;
	Tue,  2 Jan 2024 17:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662D560F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzI7cLy4ubW3; Tue,  2 Jan 2024 17:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2B1B60F67;
	Tue,  2 Jan 2024 17:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2B1B60F67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A522D1BF31F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E6B40A41
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E6B40A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhN9-ov4mhSZ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 17:37:56 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C57E400C6
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 17:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C57E400C6
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d89105365so14940595e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 09:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704217074; x=1704821874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XDvcy9zTistXdFn2ehZrUYq0Oua0bGTuh9pOEc11wis=;
 b=LKQvO3j0C+WAOdC5ybKRxj7lmAPIc15ynn7qLLR5D8XYnGwRFVTx+yOfXiy+iNYRXp
 TtO9i/IlFpHF06QDgH4VspyYoFlUD87IS1+wV5QXi78GoZA5PO1BEtLUF9/KmvMdN7Le
 mADxtKUm4Bin4GEMa5I0pI1u93+euJ58f1RrycegWUoYR342nCeytZdI6tCAasF8oJXw
 dEHrp3XCEvhogiclAx9UAR2wtJXWH26ON4PaZxLIJ00hgeDHlPqsTcv8FHAU3RaoEZKn
 aVFsTLYpNmDFeQTXem8hlOMYu4Ld9et80EXue7jsUZiP9MdYDBY6Kw+3UNQ/GFZd0ccw
 C2Qg==
X-Gm-Message-State: AOJu0Yx+Kt75Hdv/s78PpPHLTxntbrJJZ/HhqL2VudUcR7CGzP4mlxjp
 SrDD+fbyiRG3LrSC5OmFZ46UJ3EraeM=
X-Google-Smtp-Source: AGHT+IEb328n90y790SqrTUGCjD+RYlyaaNSScL3JwxYEgjbjH1VV9eSq9wopu5tewt0i8fWCe0t1A==
X-Received: by 2002:a05:600c:1f8d:b0:40d:8128:bc9e with SMTP id
 je13-20020a05600c1f8d00b0040d8128bc9emr3027881wmb.163.1704217073590; 
 Tue, 02 Jan 2024 09:37:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b0040d88a69dccsm8088911wmb.16.2024.01.02.09.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:37:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:37:50 +0100
Message-ID: <20240102173750.982955-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704217074; x=1704821874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XDvcy9zTistXdFn2ehZrUYq0Oua0bGTuh9pOEc11wis=;
 b=mJ9K9A89cnTYCQsInkoOr8grwEHySNyBfr3IJrxDm3MzeKvUN+ZaAEmRqGxCcqr14e
 ib8hOGznkLZ6uUIBSsTjFc01JY2J/a6jXk8v2R8odfULLVo5W5aa/5EEMt7RYQR2YOY3
 fsOG8cOvU/Guk3rPafLgzHKXMnaMr2dK+/0ghBlkm6/75LEQnc3i/pX+0DeYSz95tq+8
 Z595m22THdgKfWLpovHb4rONuKfLFxElzi5t+7e+LmAqExgl8Q8SFU+osjFBYpmv0mfv
 4LINVrzfbc78Lb9hzdQunr1R5URQryAmm1FDkhSbeLBlhSquG5gPMStDaA9ooIg2rz/Q
 mTdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJ9K9A89
Subject: [Buildroot] [PATCH 1/1] package/pax-utils: bump to version 1.3.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest release
- autotools has been replaced by meson since
  https://gitweb.gentoo.org/proj/pax-utils.git/commit/?id=063fcaeaa05074a9d90acec2f68b25dfb8ecd279

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pax-utils/pax-utils.hash |  2 +-
 package/pax-utils/pax-utils.mk   | 23 +++++++++++++----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index 0ef8fad643..464dd14a5b 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9742d2a31d53a4e0f6df0d3721ab6f7cf8b0404c95fee3b00e678c1ff6db7f21  pax-utils-1.2.6.tar.xz
+sha256  907fdcfc6c6c2913a8e42847f8096027b0a953b9344208d14daf2324fd711638  pax-utils-1.3.7.tar.bz2
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 704e50e738..5dd1842df3 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,28 +4,31 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 1.2.6
-PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
-PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
+PAX_UTILS_VERSION = 1.3.7
+PAX_UTILS_SITE = https://gitweb.gentoo.org/proj/pax-utils.git/snapshot
+PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.bz2
 PAX_UTILS_LICENSE = GPL-2.0
 PAX_UTILS_LICENSE_FILES = COPYING
 PAX_UTILS_CPE_ID_VENDOR = gentoo
 
 PAX_UTILS_DEPENDENCIES = host-pkgconf
-PAX_UTILS_CONF_OPTS = --without-python
+PAX_UTILS_CONF_OPTS = \
+	-Dbuild_manpages=disabled \
+	-Dlddtree_implementation=sh \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 PAX_UTILS_DEPENDENCIES += libcap
-PAX_UTILS_CONF_OPTS += --with-caps
+PAX_UTILS_CONF_OPTS += -Duse_libcap=enabled
 else
-PAX_UTILS_CONF_OPTS += --without-caps
+PAX_UTILS_CONF_OPTS += -Duse_libcap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 PAX_UTILS_DEPENDENCIES += libseccomp
-PAX_UTILS_CONF_OPTS += --with-seccomp
+PAX_UTILS_CONF_OPTS += -Duse_seccomp=true
 else
-PAX_UTILS_CONF_OPTS += --without-seccomp
+PAX_UTILS_CONF_OPTS += -Duse_seccomp=false
 endif
 
 # lddtree and symtree need bash
@@ -36,5 +39,5 @@ endef
 endif
 PAX_UTILS_POST_INSTALL_TARGET_HOOKS += PAX_UTILS_REMOVE_BASH_TOOLS
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
