Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE205FF8863
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9154D60E02;
	Sat, 25 Apr 2026 08:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CU4lo81hXSq; Sat, 25 Apr 2026 08:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2F260DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107439;
	bh=f63I98IGXByotCQZqGI8+e36pX2zTx8w1oXDvZ7tUck=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GAIF2QFMhYuHGgS2czo8zA3aCohJ6idvM15fK+5iSdUDYLv8t78ybIwzO+xdFHOLh
	 DJJGbdN+iXgBQmKr6LmXm1u1YjAn/Y63uwV+16eu6TYYszG46fgDpcSjg11WumQb8p
	 QvtY56E7vSKzDSS13HZhZGvYNY4uDgwJW7cyenO4FcQQyS3ItI4nt3EB1ceaZ0VuNY
	 /SFufDXhICWzqEdgCjm8ugcUlfzeHetTmaKTchAfCsQfT6KoUJ0O14n49JNh1e3c3o
	 BFthTHowN5vGs9MZUKNuCkD9v+7v0i38C5twQPuWWBp86jdIjD6YScCzXYR2vL0hCq
	 0fBAHOJeKul2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2F260DF5;
	Sat, 25 Apr 2026 08:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89908231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA7F60DE5
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKJ-GRkb4UyD for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07C2C60B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C2C60B4F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07C2C60B4F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1vRNPq2PIk-016phr; Sat, 25
 Apr 2026 10:57:12 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:56 +0200
Message-ID: <20260425085657.474422-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9sQK7kx+VxA0sePn/wJ0ls0GdFN6rr40SKSP1QQLqcHQHcQ1SSZ
 /dXHK7eFUgcfdt9g5gooUHJrpVmO+I0bvykCFH8f0dQYi5oYlHv2xyUcPxx9AOacKdXwIV+
 4AubS6J33Z43S0AD1RG13sf8+JzeoIzwt0pya8s3zy2GlzS2YJTb28zSKTfW7nrx/vS2h1K
 B6Z4TarBhDEL9pgNE16mg==
UI-OutboundReport: notjunk:1;M01:P0:PMeUtMk1y1Y=;MqyvtR0UdQe1NWo+i5VX4sXKQL/
 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
 WaXVi4yodPf8yT+WEtaC7us6Y/tjrc6r+mQY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107432; x=1777712232; i=fiona.klute@gmx.de;
 bh=/k6X/+hljT22yGtyezG8PSnxUJlc2bN+us+tdZmXn90=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sKU/NPJPa+2tyxVFyy1KBg4lieyZR5QeI9Qy4tCnIOdISkaFmFT6E0vm756iC+od
 p+meHBcs/8QWIFr12pIGC5X+rn+sJJzlYT7OF3KDgSn34HvoLaoTKc19TJeT60CkO
 1lb+MBM8jQYgdDXygOKJyxxO4NtnbpjLAv/BCa/uDf9SisLG49Z89eJez6o5VEEZ6
 v5g7jEwvSLx63tH6lH3OAioqaof7VdsifJTc7H2FDM74ylcFyW9cnHDo+lGkUQ8s6
 DFN7k39v4g0MNCvUalNq/fSd68tEY7F6bbfgQfCiCObNCXnYLVILgh8+PMg/E0zdp
 4Wy1l6QOD1Dmqk4/MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=sKU/NPJP
Subject: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream changelog for version 34 states that the next major
version will drop the Autotools build, and the 34 series is meant for
distros to switch.

Notable changes in the Buildroot package:

* The Meson build handles symlink install, so we can drop the post
  install hooks.

* The previous point also means that host-kmod now installs the full
  set of tools.

* Explicitly disable openssl support in host-kmod tools. It is enabled
  by default and the build fails if OpenSSL cannot be found. In the
  autotools build it was not explicitly set.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/kmod/kmod.mk | 75 +++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 47 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index bcf65fd9be..e1f713dc01 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,43 +17,43 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 
 KMOD_CPE_ID_VENDOR = kernel
 
-# static linking not supported, see
-# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
-KMOD_CONF_OPTS = --disable-static --enable-shared
-
-KMOD_CONF_OPTS += --disable-manpages
-HOST_KMOD_CONF_OPTS = --disable-manpages
+KMOD_CONF_OPTS = -Dmanpages=false
+HOST_KMOD_CONF_OPTS = -Dmanpages=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-KMOD_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
+KMOD_CONF_OPTS += -Dbashcompletiondir=/usr/share/bash-completion/completions
+else
+KMOD_CONF_OPTS += -Dbashcompletiondir=no
 endif
 
+KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
-KMOD_CONF_OPTS += --with-zlib
+KMOD_CONF_OPTS += -Dzlib=enabled
 else
-KMOD_CONF_OPTS += --without-zlib
+KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 KMOD_DEPENDENCIES += zstd
-KMOD_CONF_OPTS += --with-zstd
+KMOD_CONF_OPTS += -Dzstd=enabled
 else
-KMOD_CONF_OPTS += --without-zstd
+KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
-KMOD_CONF_OPTS += --with-xz
+KMOD_CONF_OPTS += -Dxz=enabled
 else
-KMOD_CONF_OPTS += --without-xz
+KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 KMOD_DEPENDENCIES += openssl
-KMOD_CONF_OPTS += --with-openssl
+KMOD_CONF_OPTS += -Dopenssl=enabled
 else
-KMOD_CONF_OPTS += --without-openssl
+KMOD_CONF_OPTS += -Dopenssl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
@@ -62,61 +62,42 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
-# really /usr/bin with merged-bin, so adjust relative symlink
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
-KMOD_BIN_PATH = kmod
-KMOD_SBIN_DIR = bin
+KMOD_CONF_OPTS += -Dsbindir=bin
 else
-KMOD_BIN_PATH = ../bin/kmod
-KMOD_SBIN_DIR = sbin
+KMOD_CONF_OPTS += -Dsbindir=sbin
 endif
 else
-KMOD_BIN_PATH = ../usr/bin/kmod
-KMOD_SBIN_DIR = sbin
+KMOD_CONF_OPTS += -Dsbindir=/sbin
 endif
 
-define KMOD_INSTALL_TOOLS
-	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
-	done
-endef
-
-KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
 else
-KMOD_CONF_OPTS += --disable-tools
+KMOD_CONF_OPTS += -Dtools=false
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_GZ),y)
 HOST_KMOD_DEPENDENCIES += host-zlib
-HOST_KMOD_CONF_OPTS += --with-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zlib
+HOST_KMOD_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_ZSTD),y)
 HOST_KMOD_DEPENDENCIES += host-zstd
-HOST_KMOD_CONF_OPTS += --with-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-zstd
+HOST_KMOD_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_KMOD_XZ),y)
 HOST_KMOD_DEPENDENCIES += host-xz
-HOST_KMOD_CONF_OPTS += --with-xz
+HOST_KMOD_CONF_OPTS += -Dxz=enabled
 else
-HOST_KMOD_CONF_OPTS += --without-xz
+HOST_KMOD_CONF_OPTS += -Dxz=disabled
 endif
 
-# We only install depmod, since that's the only tool used for the
-# host.
-define HOST_KMOD_INSTALL_TOOLS
-	mkdir -p $(HOST_DIR)/sbin/
-	ln -sf ../bin/kmod $(HOST_DIR)/sbin/depmod
-endef
-
-HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+HOST_KMOD_CONF_OPTS += -Dopenssl=disabled
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
