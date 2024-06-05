Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C4CC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DA9849D2;
	Wed,  5 Jun 2024 23:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC71P0zl-1OE; Wed,  5 Jun 2024 23:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF8D849D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF8D849D3;
	Wed,  5 Jun 2024 23:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5C6F1BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2C96611A7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RoN_Y8jkitc for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE464611A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE464611A3
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE464611A3
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:41:36 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7e9113f0cc8so17080039f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 16:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630895; x=1718235695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4xsa0PQtpN6mOIRnu+MQ+TCM9Hmzkyqg0W78WD394R0=;
 b=L477X7LirZgWBZi5a4wHkbbyRdgVzhh+6V85YxeoEywg+UJSCgSVYZmATNLWKT/uMp
 0oWYnBy3eZm+zkUv1UVi7uK1PwKSGUoQDWldBZK3zsclz/wvadjOyZfG17cTOq/svvjY
 mIN7v6hcRJJvvhPdBdP3DbuCoufSzZnyjU/vXzfzWDIqlSyGaD/V1tD91F0E4X0sXLK+
 t8W4UsVQSvnV0foXWhHmiydEyXDQfm6ogA0xr10R9TqNn5nMVYiUCCU9hdWXGg+N3BPH
 la/GvnlQJlpHh2YVfqRy26sCz5F4P+UvnALQ9Ly4wtf395/zngwAVU5aDqq55VSfHDFn
 17NA==
X-Gm-Message-State: AOJu0YwByUg+Ut+y0y6a23rCF20YP4yRJ70fBIQ/swTswqIa8IoiMuby
 vA2pzKpWd1JyrE+6nuNYKVBGr/32LqMFJRep6wH9vfJMZfgV7a4xmOO3tuve
X-Google-Smtp-Source: AGHT+IG3gypGbQh2pC/Upt6AlQ8+LkAbO2mPrprUjeY+yKE549kFyocT2u1aTb7qPEmPgsRUOvxRrw==
X-Received: by 2002:a05:6602:2b93:b0:7de:c742:8e0d with SMTP id
 ca18e2360f4ac-7eb3c49e793mr457417139f.1.1717630895462; 
 Wed, 05 Jun 2024 16:41:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb4c47d534sm4871139f.34.2024.06.05.16.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 16:41:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 17:41:29 -0600
Message-Id: <20240605234131.3370484-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605234131.3370484-1-james.hilliard1@gmail.com>
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717630895; x=1718235695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xsa0PQtpN6mOIRnu+MQ+TCM9Hmzkyqg0W78WD394R0=;
 b=mt6XkOkuWZbtdTeB7hP1ZNVBvLkas3lTVqFVgNpwWXX01xhPvfPKXvHE37x5NlsH9o
 w3PPcyDph83iMXvni9CUf9lCao4iqrFyyJqCTKffA75cskFH3TOVLkj6sFWNnzsMGtLT
 0rmEA3NPqDEhw5CiXDxvNP24PYG/vrrVgvoBIxgncLEmUz41YcZFEjwp4SRXr9x6gywo
 n8PyiJnUokCX57oIa68zNQyq3drD8anizPF4Lvm0boxn8UJ0MaKn6CxmfTg574h6K7Fo
 biFVkZ529BkM893P1koEbbg9kHvzOSBXHVqcNz6LhrubR6V558YikZOH49vARuI9PMUm
 lQKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mt6XkOku
Subject: [Buildroot] [PATCH 2/4] package/fwupd-efi: new package
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
index 0000000000..575cf73b95
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
+	-Defi_sbat_distro_url=https://git.buildroot.net/buildroot/tree/package/fwupd-efi
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
