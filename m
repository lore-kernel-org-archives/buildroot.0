Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB4C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A77410E3;
	Thu, 10 Jul 2025 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCTIWs3BRuZm; Thu, 10 Jul 2025 20:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A130410CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A130410CB;
	Thu, 10 Jul 2025 20:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 181E4B10
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 085CC61411;
 Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzjRpqnJC34c; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FB1C613EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB1C613EB
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FB1C613EB
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so1118410f8f.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178989; x=1752783789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yNNshrQki/qodENevSkHd8oQwuMLQm0Q4VgZiqH/hOE=;
 b=D2EDr/1LLwVtPkqRWrubkooYM6XmGHeMzQmpU2FZUGbl0RfL8xW2w7eDDUJhPltutQ
 Jhk7tgfl1m0nZfy1TOEW2Dq4B4N9wrnFhwqstPJ+HgkxiBU7yAVJzJ9dpCbr513NSnIi
 vX2320tmeGtBI7ocmyKxlrdnX7x9GthaT9epwT6R3hWITBbfWNGAHNLPkhtTKX0Jn7ri
 ydyU//fypxJQXZpuF17rBUge9A4UP5cugvHCcaTt9l3DudHbSVauYnKaW90Izz2QQeI/
 UW4jmqHR7WUKQdQHwb74OYFG64jJgCb/j2hrPzM8vlkcQV73AeQdcy5qMHYM1SkRTOvJ
 niMQ==
X-Gm-Message-State: AOJu0Yx4pJ73wflJwfwNHJKvXVVuklwBOXqnzBvRcd1aGNbbuBPf4ZaA
 0/R7VjK+I+eoHx05rUy+ho4y5Ju8AwpKIVqylmvIZZl64vOGzWZuDfWlUH2TvA==
X-Gm-Gg: ASbGncu/bkGrQZgTdOBVIbb8L0pJBitn/Nc7B6xu6OOzP0mOdynRJlvydL+xT6kw3yF
 p7QClAdJiwNy8/T+S2O9nbPPxs5UflQ7zjFFVnFb6DXdjtSYfJg6skdSyVErafseoEg7O1+eA3w
 KGmhIPBW8z3rlmSjYy5m//rmwepxv/xZaYniramGpseCilJnKCGQU5IANoEnjtCItpkehhXJibt
 z/kjESJqfOKJBSRvekGEzUrFFX9L4cHig9nxAVVGsiAw9q6Qcg7cuus71//H3wFpt7apLr8bSTL
 HdUM3ZkoGqZlot2OC4zMblvR6FTOqzvg3kuN+M6Q6BSBKQOXHnCQ7z9BhL3oT1eBR164cYYG
X-Google-Smtp-Source: AGHT+IEk2JbsyFb4jb9y2tVD2jjvYn/tlGWUsvEbPNHW0WAjHCgbAZLiR6mrIBvzuAu5TbA1KRq5dQ==
X-Received: by 2002:a05:6000:2910:b0:3a6:d26a:f0f5 with SMTP id
 ffacd0b85a97d-3b5f2dc374emr88828f8f.21.1752178989014; 
 Thu, 10 Jul 2025 13:23:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jul 2025 22:22:58 +0200
Message-ID: <552849cce2f861cff21cf2c1f0f1160dee550307.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178989; x=1752783789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNNshrQki/qodENevSkHd8oQwuMLQm0Q4VgZiqH/hOE=;
 b=mJPI51xx1/FVxLhJTHSnp5Fqtw5cF6y2Oim3dyVno0gFkUqqo1EkKQDtpGl5c2sMLR
 om99tPC7iM39ca34J2sWdYPetuyjxUbMVslE3XeBRdxaabOoHlO4GTd4AmtXDd5Sfi0a
 e0O2iuNg9oZ0HiU7Bv652VgjWiagB0+y9NaQOKE5S2aGUVoJN+c3Q8URrmdTwWUQTOVo
 XrEq8Ph/aftAEcoq3OVDof1UDiyr2UFBVp10eqGBoO0m2HD4eOY7g5zoFWXwGDlaidn2
 jdvNOOhyCx3fjQB6mNlxQ8ah+FLMkV7CxDdKvlg/SvxC7QYK4ZcJAvH1vCBppqAmpZ0t
 c+LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJPI51xx
Subject: [Buildroot] [PATCH 16/17 v2] toolchain/external: support merged-bin
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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
