Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF34C7EE30
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 08:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10F240E5A;
	Wed,  2 Jul 2025 08:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdyC28GtkCNz; Wed,  2 Jul 2025 08:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D915B41893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D915B41893;
	Wed,  2 Jul 2025 08:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C53196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C4480EDF
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFgWecrxQduX for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 08:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEAFA80EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEAFA80EBB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEAFA80EBB
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:38:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4539cd7990cso17963725e9.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 01:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751445501; x=1752050301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0RIOrpJanubeLAkbnDJL5wPgctJ6TVT7QOLf0mg+ayo=;
 b=jLKPGwbN6g4lmTX3ZILc+X20UhGbAkNZ5+tYDqixZ/68EQlDf/8O+S7GLcvxxP8jGY
 9xWl2mveiMpv1xAQdWwX/+Z/RvL3bR9hAHVsi4WRlGbzM46wAd3airDo6+EB9Dt7CirW
 MmesdbrZewhBSePMXvpCn0kRic603ZGD0WyFH6SC0Vt/iVB2YHpFjuX5J9tDJ8tsK8vt
 5RJT2MZHzYxOYpZ6ZjUzAp/KY5eeciFcNhIRDig0Ve1zOzWGTBBWxfg2brcToh88BA6w
 ztgwNDdC9De8uz2YG61uWf/I2rEtLRJm4I5pDn/yMOIFj9tlZ8s0wSPVyE/ILGfKl1mj
 WrJg==
X-Gm-Message-State: AOJu0YzL1dZmI1C/gGBpnPOHDM8RLryfMW/NjFeWEUcWltF+HC8JPMzX
 wwvpsfnocz9oLmXquts4q6QylIdiN5OyschlvmFU6Edae6/E8UvH76BX6cwEEWFLIfepRPW7plX
 zCD+r
X-Gm-Gg: ASbGncuGKwmBHaMR6LrfV/7xNaADicaKk4Pl7RvzrK6petUdklJgFjLmiP8c8Z+rfI3
 HOBo+KsVz2Yii6dpe5e82nkV6y0pQSMXDPAgMa6WqE8JYQQNdb1NeaZ7Li5UbKbOEGUOVs7raLF
 ITZrD6SNbicLkYUPM8J82flOhqHJPPegxSA8lFCLTfWv6MTuTq/i1GQbbqwqgK5iT5ON8V8zxin
 4F3ONS8vbSoP3trwkM2Hvv+mTUiFPkTwAcx9MNjGKDSz0rWSmKM+km+9A9rmyVlk6BiOjmAb5YY
 vJX7cyoDE9aybuQEY01li3abFUjeg7ZTeREfLBdtlrBTMlDL/Y2AClGNmiVCOp4QrmkCfgvEeFO
 LBnWAtDITkbZasdD2FQ==
X-Google-Smtp-Source: AGHT+IFxGmEP1a5584mfuY3hGsHTDrtYJooPxXhEJ8rc7TFSGPKPJ20dEQSJtvQryNO9Na8oEj3I4g==
X-Received: by 2002:a05:600c:4e4a:b0:453:79e8:e92d with SMTP id
 5b1f17b1804b1-454a3c1e7a8mr15352155e9.5.1751445501061; 
 Wed, 02 Jul 2025 01:38:21 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453a1914d10sm81253725e9.4.2025.07.02.01.38.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 01:38:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 10:38:04 +0200
Message-ID: <20250702083805.1553261-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751445501; x=1752050301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0RIOrpJanubeLAkbnDJL5wPgctJ6TVT7QOLf0mg+ayo=;
 b=FoyRN/BvqFNKbV7Da4MhrwBz/NA11EbUcrqxQL67ATbRmWceE/mHKobaVstEvqWtrf
 3AWRg4M6PosctIJcPO1Y3UIu6UZmLbDy8TSv8KmsLzYslMcg/LjeFSAxYCp2rAl/ua9j
 P0kThSvf2hGBqjQErkzV5GrXrcLzRWEoAXuRIQvUtNjcBQ5pkd1K3L4/3jekCnT0DBVE
 CH6H8O6MyMyJftuVrwkp459d2y4bF4dB7ETCLApcnIrl+Q0ewak1iBc0N7tuhD5mlZcQ
 4O+iUnldwDUqs/ya8M1u2vVKhI3aWb9YqpTjT7JwwD/FEkQCe9bId73mf00mDDMYPcwA
 dCNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FoyRN/Bv
Subject: [Buildroot] [PATCH 1/2] package/gvfs: bump to v1.57.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes 23 minor or patch-level releases, mostly containing
bugfixes, and improvements on many filesystem backends and translations.

Specifically for the Buildroot package:

- Switch from libsoup (v2) to libsoup3, since gvfs v1.49.90
- Drop patch applied upstream
- Explicitely disable goa (gnome-online-accounts) which is enabled by default
  in meson_options.txt

See the upstream changelog:
https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.57.2/NEWS

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...e-incorrect-i18n.merge_file-argument.patch | 33 -------------------
 package/gvfs/gvfs.hash                        |  4 +--
 package/gvfs/gvfs.mk                          |  9 ++---
 3 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch

diff --git a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
deleted file mode 100644
index a85a1a374e..0000000000
--- a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Fri, 21 Jan 2022 08:32:31 +0100
-Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
-
-The positional argument was being silently ignored until meson 0.60.0 where
-it fails with "ERROR: Function does not take positional arguments".
-
-Related: https://github.com/mesonbuild/meson/issues/9441
-Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
-
-[Retrieved (and backported) from:
-https://gitlab.gnome.org/GNOME/gvfs/-/commit/17a067b9b823a0d54e061eae45ff8e2c7e4a88d0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/daemon/meson.build b/daemon/meson.build
-index 5f9559aa..e20ada29 100644
---- a/daemon/meson.build
-+++ b/daemon/meson.build
-@@ -360,7 +360,6 @@ if enable_admin
-   )
- 
-   i18n.merge_file(
--    policy,
-     input: policy_in,
-     output: '@BASENAME@',
-     po_dir: po_dir,
--- 
-GitLab
-
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index fc068ddb94..4f81421af6 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
-sha256  b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2  gvfs-1.48.1.tar.xz
+# From https://download.gnome.org/sources/gvfs/1.57/gvfs-1.57.2.sha256sum
+sha256  f16bef8eca1fd6c117e85db011d21e915669790d55867349c5f1b291299e9585  gvfs-1.57.2.tar.xz
 
 # Hash for license file
 sha256  45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4  COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 50efed1abb..b46b438dc6 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.48
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
+GVFS_VERSION_MAJOR = 1.57
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = https://download.gnome.org/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
@@ -28,6 +28,7 @@ GVFS_CONF_OPTS = \
 	-Dafc=false \
 	-Dgoa=false \
 	-Dgoogle=false \
+	-Donedrive=false \
 	-Dmtp=false \
 	-Dsftp=false \
 	-Dudisks2=false
@@ -125,8 +126,8 @@ else
 GVFS_CONF_OPTS += -Dkeyring=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
-GVFS_DEPENDENCIES += libsoup libxml2
+ifeq ($(BR2_PACKAGE_LIBSOUP3)$(BR2_PACKAGE_LIBXML2),yy)
+GVFS_DEPENDENCIES += libsoup3 libxml2
 GVFS_CONF_OPTS += -Dhttp=true
 else
 GVFS_CONF_OPTS += -Dhttp=false
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
