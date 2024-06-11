Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BFBC27C79
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 15:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4FD8405FB;
	Tue, 11 Jun 2024 15:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTasMc1hqeBv; Tue, 11 Jun 2024 15:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A7740647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A7740647;
	Tue, 11 Jun 2024 15:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA7A1BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 430024060E
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_h-LcNsERmy for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 15:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0BF340596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BF340596
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0BF340596
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:22:10 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7eb85e80661so96051439f.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 08:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718119330; x=1718724130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r7TcNGQcAXCilyRF09bq9LJb/ej82E8TMxk1aPYsN9A=;
 b=mAPYRC2bJb63B49yxhApoDza5JGEzzWSfed4VhIA3H7jTx/L2fhBRJM8g/PmCVNVyX
 kwThVNSXaaBlliCwr+OOIiwsSIegcxj5UZByM4g6hd/Awe0WicvoU9+t1ja2EDNJdwPn
 KNCt4sN+nGsa/+1PUPT/OF9sn5h96DR/9fRjMj6oED7xrc4qPoz1X+gdj3sucTy4gbd/
 9BtXWA07pIkS+z6Y9leDDa7249ZhkEjtjPxtnGYUD6uXbenGGbByftYi57G5umrarKzS
 nIhkidpMHJvkv8wUQ6oBx3GdDOfSG6HoMO5bwyqmVCXrFXazwVaj92Hrvqsq2fHzDvii
 Q97Q==
X-Gm-Message-State: AOJu0Yw9B5se92k3pvI6RgXVVkFzDGepk1OPmQI7/xDSRl9+NMHGndFO
 ozWBUlVbUDKpszREq1kRyMnPMF7f0PyQzgYR7slTDK+zBpV2geE/SToSGU1U
X-Google-Smtp-Source: AGHT+IEDp3fRUMukEqDywzKp/cCErKHAwsGyEXsVCpPWlCXi/XzCWVZSU4+dX1KcwKyduJ6+xZd/0w==
X-Received: by 2002:a05:6602:160a:b0:7eb:7ebd:1f9f with SMTP id
 ca18e2360f4ac-7eb7ebd2365mr769795739f.9.1718119327345; 
 Tue, 11 Jun 2024 08:22:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb81f14c0dsm128268939f.28.2024.06.11.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:22:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 09:22:00 -0600
Message-Id: <20240611152202.951202-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611152202.951202-1-james.hilliard1@gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718119330; x=1718724130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7TcNGQcAXCilyRF09bq9LJb/ej82E8TMxk1aPYsN9A=;
 b=WvspL/kiChdaKV2+GHuVncfxT7nLFeBZEg6DMGbkuQV5Ir3gCO+WvYGKBnNVdwQGmM
 ORn02f6xmpCVOGFePfi7aBFKwRPNHzUj3OzQ+q+islgPUowIKA7/jaAp9p1ukWdUquuu
 ITpRuCLIv3cnG/i9or9tpJRYAo7HLcPthmQbnKbuJhcIGXkUvD4cXQyYsRBE3Sm3xwTz
 AcWYS18n05GEYcTL061ZHiDMXel14aJCJoPhlsysqZMUPZ+50ktARaPu/xe799L6o3XA
 FiFlIZ7TbMpR2kniOi8y/xruMMo2Cke/ACmjKlXngmwhvKkdMESbf3rmXomBcTEOGC9p
 YkVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WvspL/ki
Subject: [Buildroot] [PATCH v2 2/4] package/fwupd-efi: new package
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - use gitlab for efi_sbat_distro_url
---
 package/Config.in                |  1 +
 package/fwupd-efi/Config.in      |  8 ++++++++
 package/fwupd-efi/fwupd-efi.hash |  3 +++
 package/fwupd-efi/fwupd-efi.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/fwupd-efi/Config.in
 create mode 100644 package/fwupd-efi/fwupd-efi.hash
 create mode 100644 package/fwupd-efi/fwupd-efi.mk

diff --git a/package/Config.in b/package/Config.in
index 9a948c5536..2be39f98c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ endmenu
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
 	source "package/freescale-imx/Config.in"
+	source "package/fwupd-efi/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gcnano-binaries/Config.in"
 	source "package/gpm/Config.in"
diff --git a/package/fwupd-efi/Config.in b/package/fwupd-efi/Config.in
new file mode 100644
index 0000000000..3d82f480be
--- /dev/null
+++ b/package/fwupd-efi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FWUPD_EFI
+	bool "fwupd-efi"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  EFI Application used by uefi-capsule plugin in fwupd.
+
+	  https://github.com/fwupd/fwupd-efi
diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
new file mode 100644
index 0000000000..35dc9625ca
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  afd0805a2ad081a7caff2ef5bc004ce3a0147b538015e8eca966341716b1260e  fwupd-efi-1.6.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
new file mode 100644
index 0000000000..a01bb2913b
--- /dev/null
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# fwupd-efi
+#
+################################################################################
+
+FWUPD_EFI_VERSION = 1.6
+FWUPD_EFI_SITE = https://github.com/fwupd/fwupd-efi/releases/download/$(FWUPD_EFI_VERSION)
+FWUPD_EFI_SOURCE = fwupd-efi-$(FWUPD_EFI_VERSION).tar.xz
+FWUPD_EFI_LICENSE = LGPL-2.1+
+FWUPD_EFI_LICENSE_FILES = COPYING
+FWUPD_EFI_INSTALL_STAGING = YES
+FWUPD_EFI_DEPENDENCIES = gnu-efi
+FWUPD_EFI_CONF_OPTS = \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Defi_sbat_fwupd_generation=1 \
+	-Defi_sbat_distro_id=buildroot \
+	-Defi_sbat_distro_summary=Buildroot \
+	-Defi_sbat_distro_pkgname=fwupd-efi \
+	-Defi_sbat_distro_version=fwupd-efi-$(FWUPD_EFI_VERSION) \
+	-Defi_sbat_distro_url=https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
