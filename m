Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB0CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5997613AE;
	Mon,  1 Sep 2025 09:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmlLbGmCRbrT; Mon,  1 Sep 2025 09:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B459E613CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B459E613CE;
	Mon,  1 Sep 2025 09:01:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F9ED2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 730B060DF8;
 Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo4XMKVcJVz1; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A126360E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A126360E04
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A126360E04
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b869d35a0so9586935e9.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717298; x=1757322098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dACF1atoGc2R7pgK//SUERI/KWmQOkB8Do5zP3afGQI=;
 b=G1GzUgd+QW78bx3R2NSofVRD6fpWhYS2VOJ4a4sb9Uopb+kWoARiN2Hk5Z4JryEvWJ
 bEM/XPKwSqQjAtY/xKs5F/a0q0EWPPW6zVL9VBhZEOCpNVYZATNgQnPvVBg7AVWQbBRO
 UV7CckH0ZTR1S7lFdZxYGIBpRl6t+yoh4D0BoqYtP+4bw54aGPiRSO/zQnUWv+AcuMTR
 YkA/DOYKJOkTqTnb/FTVZrp759tntemljrqOudZsGwiBX6UWItaycX/nu7s42G5C1Qxp
 3FbFBT1hPkPumzDLX1fcrg4qUywfmKlAxqFT7GZ9zX/2qSjWikZgRnGTrKt5br/CR+gV
 m5aQ==
X-Gm-Message-State: AOJu0Yxon7ej/hjzngR9z4hvteIg1xv5CJU28lZiW/aJSK7+sKFuBZVS
 90wTKvt+ZANFsrlNnBqCek/cqrGZCQjm8RFSUvEU0ZbmX5ygQRCv++BxTUtbRQ==
X-Gm-Gg: ASbGncuQidEzMEtuquFx0hPya4MfqrKdX6qGP2PyO9D0jSr2hVGJe8xlDDj6GCa/TX0
 AoTxsA65YhcQfd0h/paPz35WMrPrk2QYEmo3YOlcpFY9FjJSty9B44/dCNq7z8WzRNhbSkcqbHK
 SzCwcuaIBO8BmiMfKgBRpx/9jTIY/5DM64DEcFTyYGvu+K4aSLizIqv06r5wotxfmPWBrs+9bzp
 sqoaZvx1QzrW5msxevde6+eExc7v72Kj3b/ACjy50YvTlHZp8lLyx2rfSqwDNdRnSfGfWjC7Tdv
 Ut4FixLooX4ItzLf4m/cvNXVO0hPUpgdWf5o7+NQxu7WWCMP+clTrsmdRAow8vpXowfbC/ssStt
 l5HTbE//UFx2bj1/QQLbZ7yuTPBwJGi5lJ11mMDWtNyNC1K9uPSJpag==
X-Google-Smtp-Source: AGHT+IFcEEuBCZ32o8X3nBLf5lTbI/ZkvaSBKN25ECZowZx7CW5iJt1pziXSskbUTCeaCiqxukrjOw==
X-Received: by 2002:a05:600c:4f08:b0:45b:8866:510e with SMTP id
 5b1f17b1804b1-45b886652abmr40156055e9.25.1756717297402; 
 Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  1 Sep 2025 11:01:26 +0200
Message-ID: <6c191c491031917221c7fcc57a993d8d10156d05.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717298; x=1757322098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dACF1atoGc2R7pgK//SUERI/KWmQOkB8Do5zP3afGQI=;
 b=InM1lsKO0kw5Ztnu9vMerFMcpAOcyrgWkF2xQ+QClY4vXmfkOw1JPAHofjPXFxwnLH
 /33XeWsuGuR7GRz2yMJXNkyo0kkFZ+3bDQrudDfPCS9NS1oT37la0SRxOooWFxs5oeRR
 j8ozBT3PsbD7uYSi+w9pou/9P4OvTUN6eI7UsCGIwxBnsskmCssiIc49sGhnRDkA2RCz
 dJv+xwm+b0URnGqhdd7yWTAY1dRQACaV171ZvIyxuywo8fIM4gELqeaiPYeFrLGoxR7v
 Srmz5v93OTSwIS3dNL1UtU+q++os+o1cLzR/nDtYZkJ/ExP/iSICjhuuFS9kQ3qSvbyw
 G4oA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=InM1lsKO
Subject: [Buildroot] [PATCH 17/18 v3] toolchain/external: support merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When an external toolchain does not have a merged-bin, we can end up
with a situation where the toolchain installs an staging/usr/sbin/
directory, overriding the sbin symlink with an actual directory. When
not using PPD, this does not cause any harm.

However, with PPD, the build fails when preparing the staging (the
host/) for packages when the skeleton is eventually rsynced, e.g.:

    $ cat defconfig
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_NONE=y
    BR2_ROOTFS_MERGED_USR=y
    BR2_ROOTFS_MERGED_SBIN=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_ZLIB=y
    # BR2_TARGET_ROOTFS_TAR is not set

    $ make zlib
    [...]
    >>> zlib  Configuring
    mkdir -p [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/host-skeleton/host/ [...]/per-package/host-skeleton/host/ [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/libzlib/host/ [...]/per-package/libzlib/host/ [...]/per-package/zlib/host
    rsync -a --hard-links --link-dest=[...]/per-package/skeleton/host/ [...]/per-package/skeleton/host/ [...]/per-package/zlib/host
    could not make way for new symlink: aarch64-buildroot-linux-gnu/sysroot/usr/sbin
    cannot delete non-empty directory: aarch64-buildroot-linux-gnu/sysroot/usr/sbin
    rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1338) [sender=3.3.0]
    make[1]: *** [package/pkg-generic.mk:256: [...]/build/zlib/.stamp_configured] Error 23
    make: *** [Makefile:23: _all] Error 2

The root cause is that, in the skeleton, we end up with
[staging]/usr/sbin as a synlink to bin, but when the external toolchain
gets installed, the symlinbk is replaced by a directory. Later, when we
aggregate the PPD before configuring a package, it often happens that a
dependant package be rsynced before the toolchain and the skeleton, as
seen above, in which case the sbin directory from the toolchain, by way
of the dependency to a package, is already present when rsync wants to
create a symlink as rsynced from the skeleton.

In the example above, this plays in this order:

 1. skeleton gets installed, provides a symlink
 2. toolchain-external-bootlin rsyncs from skeleton, gets a symlink
 3. toolchain-external-bootlin gets installed, replaces symlink with a
    directory
 4. libzlib rsyncs from skeleton, gets a symlink, then rsyncs from
    toolchain-e-b, gets a directory
 5. zlib rsyncs from libzlib first (because alphabetical ordering), gets
    a directory, then rsyncs from skeleton, which rsyncs from a symlink,
    but the destination is a non-empty directory, so rsync fails.

It is perfectly legit that an external toolchain does not use a
merged-bin setup, so we must accept that as input. We do so by treating
the /usr/sbin entry specially, like we already do for a few others, of
which /sbin itself for example.

Note that the merged-usr setup has no issue, because we already handle
the lib*/ directories specially too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/helpers.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07..21c710d0fb 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -96,6 +96,10 @@ copy_toolchain_lib_root = \
 # Note that the 'locale' directories are not copied. They are huge
 # (400+MB) in CodeSourcery toolchains, and they are not really useful.
 #
+# usr/sbin may be a directory in the source toolchain, but a symlink
+# in the destination sysroot, when we are using a merged-bin. Account
+# for that.
+#
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
@@ -109,13 +113,13 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	ARCH_LIB_DIR="$(strip $4)" ; \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
-	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
+	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR} usr/sbin; do \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \
 		fi ; \
 		if [ "$$i" = "usr" ]; then \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
-				--include '/libexec*/' --exclude '/lib*/' \
+				--include '/libexec*/' --exclude '/lib*/' --exclude '/sbin' \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		else \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
