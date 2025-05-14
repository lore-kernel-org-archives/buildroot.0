Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A2DC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79CE839BC;
	Wed, 14 May 2025 16:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQGS6_uUGtx9; Wed, 14 May 2025 16:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0439A83A4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0439A83A4D;
	Wed, 14 May 2025 16:58:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61942153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420638382D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAiXRDhmLLhr for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2B368372B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B368372B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2B368372B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so340225e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241914; x=1747846714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NkuxZDlyTQ7RM1DOn2eJRMb8+vSYq0idr+jucTNRR/w=;
 b=tIUuL0ntfmeBOnWby03kcDSF8DZkNeessTugdq3SiF3JPTm+W9+vFpoKoUQ8SgPrB0
 3rCq3pVtWjUVLR4+zo1ubS9ERCCNZGMz5qlnw+dmvKLFL0Sq619LCAU1HBJk0FzkuXJ6
 iTN/pz06gI043C2dJtTrdndyOEYVvML5I+hZSyrZiXcUZLpHuRmsrx462JaPmQsvJT2m
 OL9+Vey8bJEy1BhDPHWzS7uKDK3k3o63Pyu5eJgXNPXZPIJf1UiSNd3TX4wiBbyoI1Gy
 LHL0HqEk3KlHbGjOBv1J905+KukqTd2jBhWtX0vsgd7/1wPK33D3pIzpRyhGyVV/HUGV
 Uyhg==
X-Gm-Message-State: AOJu0Yz22cGmEUAO3phigFy+Wo5srnWto9jr2hu9hnPFoVUgQKn1NHm0
 658v7CYLBi8Cuy1HO5rUWF95xdZPlIdrgjyLEPKf7ZYc0dRDwoTUoDvEIg==
X-Gm-Gg: ASbGncuYmy+1EZysm+R6lzQ9gNZ3p/Hd16ohocX0hED/w0yx3Rhbm5X0Sp38h+5LLup
 K5kvMp3RKekbhRiNYvukLqt3GvorDxgzMKepsLD2q4/RNgIPQI0xPlZXfNzd75r67zj2a9CHX9m
 E5TvAnOP9w3a4wHdgtVMRA4OlO9seybRSICAWPV5vRroOipa7A1GeBc+KxB94MOh9tXOWhV8ueU
 rZtUKlIHdFVMEIiAyphdydWt8NqE2eDyZ6u0Hgyv65nXSoklIl8F4/0jg88tiuGzZBKixGrQ6zO
 KmnTB3cnbddooi+jL+A7c9OUG9PtF9v8y9Vl11zlADeFAoz1FlWVtinPiSGblQ==
X-Google-Smtp-Source: AGHT+IFqfkoBN2RrsyRaPYjWRxgCAZwEiWs5TnkOLaILDeRrfKkh4fDT5GLTWZjb3YQxDOhbEoJwVQ==
X-Received: by 2002:a05:600c:83c3:b0:43b:cc42:c54f with SMTP id
 5b1f17b1804b1-442f20e8974mr42810425e9.14.1747241913761; 
 Wed, 14 May 2025 09:58:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 18:58:25 +0200
Message-ID: <f56740db9990aed5e07a44ee450795e2a0110abf.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241914; x=1747846714; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkuxZDlyTQ7RM1DOn2eJRMb8+vSYq0idr+jucTNRR/w=;
 b=EoKnCY26RMI4wmyWE9COP2q8sQVPqJJa1FU8jF2ztETbyyKdCb1sqG7fu0VqRlQQ0g
 pEBKpOEzpsM0LTuPL842RjAY/ffAyTu5lHD/ounyd3yJJDyNNkkKrnIqyyIEOw7D2ZO1
 FbVjOwYOallLIcTBZ6NdIc8s4Wpm23kZi9NIBdRpk8ZjJ6NrRWRKNk7hcvCj/KNao5Ox
 Y6BHYnBbJ4BJknLF94nA6CjM/LIGEfSxFEGIaAs7Qxht6EWjC/KSAPvNHQi1WErkSt5Y
 Ip7O0KWUAPD+dTyTNbfqkZiA59IOLOmM5VCgCnwfCsZv6NMBXPUDwnGPbqsysrxFhsck
 jihQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EoKnCY26
Subject: [Buildroot] [PATCH 13/13] toolchain/external: support merged-bin
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
 4. libzlib rsyncs from skeleton, gets a ymlink, then rsyncs from
    toolchain-e-b, gets a directory
 5. zlib rsyncs from libzlib first (because alphabetical ordering), gets
    a directory, then rsyncs from skeleton, which rsyncs from a symlink,
    but the dstination is a non-empty directory, so rsync fails.

It is perfectly legit that an external toolchain does not use a
merged-bin setup, so we must accept that as input. We do so by treating
the /usr/sbin entry specially, like we already do for a few others, of
which /sbin itself for example.

Note that the merged-usr setup has no issue, because we already handle
the lib dirctories speically too.

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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
