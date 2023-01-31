Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94970C636D3
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 05:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F385D60601;
	Tue, 31 Jan 2023 05:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F385D60601
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ_OCFwwkGJU; Tue, 31 Jan 2023 05:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF5E60608;
	Tue, 31 Jan 2023 05:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF5E60608
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 723CA1BF399
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 05:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C44407D7
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 05:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C44407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4H6pv9bHtuER for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 05:03:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FEF840739
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FEF840739
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 05:03:24 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id u7so4547454ilg.4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZQM/snn9P2FDYsjd+ctqkHo9OUAOFoB0/2SP+O3HW/U=;
 b=SdpvNoPx9NTvBEdrarNcUyiN8piNzD37nPHHnFj0HpHzTOHRIj5FA9Kj6rdcYugroQ
 b+MZu2sWkljPjz5y4Zxv3meOP8AiIqOV3BOacz9WvlIoA7955482J/gEfOTHckaVlYSN
 y4LT5Kt/Ra1DG14WxKmDbVaeztcfgn/9wqbro2Imzh6U5gsjZpScpgNzNzsukqQTEZL7
 aF/rIWDLD5tLpp5f2VzUsG3qc44YiZdhSegiEe533ltK8s6PQHcslQ02Vj1EAQd29CBT
 VJ4aJQjSdcfFGx7EsslNokZPATogMmgB8Ymny/D9nfystAZ5ABS9TF8ZGYTtLybgeVvi
 QrcQ==
X-Gm-Message-State: AO0yUKUVRFa+GaIqWJL7K7AerU5Jip0zqX3yI7hRbRQL8MaSTLSLee2z
 Vut+TAu2B7ZRraTyVKqIIiLb7ilpcUGIAQ==
X-Google-Smtp-Source: AK7set+bVhFfYJk3iyQbP6gyNLk6rHqcHFdYD5zZ8/st5nPlpna8P5JBaBDxtBnKhv5fhUbYzhqTrg==
X-Received: by 2002:a92:c24f:0:b0:310:9eab:3d83 with SMTP id
 k15-20020a92c24f000000b003109eab3d83mr20079832ilo.11.1675141403000; 
 Mon, 30 Jan 2023 21:03:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 i6-20020a02ca46000000b00346a98b0a76sm5256844jal.77.2023.01.30.21.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 21:03:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:03:19 -0700
Message-Id: <20230131050319.2821287-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQM/snn9P2FDYsjd+ctqkHo9OUAOFoB0/2SP+O3HW/U=;
 b=qHPD8bDg+qJ3+eju7AjQmcMFIVnBCWUJ8bNeP21MYRkxkFyQk6oD8O2IDfTTXauEbr
 TlFYNSxAsnB03h5BYykMyVIGnLhKQI6AOGlvsq0otRZG+jqF1HnZF37/PfvlcpUyRAkW
 1atO37zp7qtbcIswbjw7925CC0epnlInTVkHqRNyxj8PdPaft6p9Hkp0B9rBgZvYN23j
 NHd9IdoqA8auN4XyjOe8xwgi28Z8LFuFSX2GlcatRDmyTN/hYl2gy1obyeOxSxS6ETy/
 qOpucMVU/eE0uhQ0pE8+FAvF+wm9oq9LGeeB+lCa3NI3orJGqJVOVoKZngfXzImNaKKX
 TpyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qHPD8bDg
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.67.0
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link to Rust 1.67.0 announcement: https://blog.rust-lang.org/2023/01/26/Rust-1.67.0.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index adf1799ad7..d00e6342e8 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  a1279760f91b3571733e0b0268128d143be2734916753900b5fe7b8ecc3c0900  rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  835b4e1b4d396674f7866a83b9a4f44db16fd12f01a7eaed527282b3700a9b92  rust-1.66.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-mips-unknown-linux-gnu.tar.xz.asc
-sha256  c7349617c42274bf50f6e3662dfb4f6832a93780099c3bb510be1a5b93d04c37  rust-1.66.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  fc38663870f0af47a27241d980ca886c3f7d432267920deb412ac8576bef68f0  rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  2b1a6c54db49a9e62d60cc96c1768f405e0f4c59d698186bf3a28a1bb017b6b5  rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  777d3a650448c15048710282388e90d10740540f570f5d17ed4a2dbdabb89552  rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  875bb310bae7c8c1d2d228a49aa4b547608b6c807ddc9ec44bc87272c77d869b  rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  89164ccf75909b3d02bdcb787e33876cad87e55ab0e6239b030b4b6631ed356a  rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  e83f9fc473072db23376783595a008cdd9b2f2e9b3be109e55939392864840eb  rust-1.66.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  a201aa4595ec8015662b7103b1409a4787c6d1f1d540bb68746633527d855858  rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  9d96ba6a5a255339cd04af079d906753d56c85503c727279c227d24bd4987e24  rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  520ac446f20490685cc4d73192cfbb4c9b9e55c884aa4ae2b098e3a54d891de8  rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  42afd189ef64988f64976f767a734734bccd7c71e578780e902148c98226fa29  rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  506126773af9c3dacc506776a0b2e12fe6fa0c95eaf4f4ebb5cdbd335feb83fa  rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  3d21b478fbf07bd27902bdd189e6988341f0c2c0108b538f926cea3031bc8ea6  rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  5282fc97111a7eafbead3463ed7bc0f3065332f21aec6a39a740157fe42f943a  rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  0ebf0178bbe9c5572d1db89e190dee23aef0e2f667995abedbd66e33d0bd73ab  rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  938e7442c21ea0895c44ec78fa718ea1d3abe32ed0425ed328c905e188af250e  rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  bdc491f4c05669e7a3382b6bfdaeaa20e2cfa5ef553305df0e0d73729a45e6e4  rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  d75c6dc3c00d662b0d3f6ce7fde0f76057542edfbc97a20b29247842c8a711d2  rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  830285e5388081c68fac9dc955aa824a4d919b0e24eadc6e0b95b30103d79db9  rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  d720bd1e493f53797f90d83dbe6d52ecbe1ff3cae282f4b2e18c37fe92c9adf6  rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz.asc
-sha256  90eb8e2490283930e682b79842d664d4867414563353d53dafc47eccf44aea17  rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-musl.tar.xz.asc
-sha256  c4bab2d63223d0c6e63806082e30d8c38b37eefc10ee2e7380971e3012c00bca  rust-std-1.66.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  b32cbbb9002f8a20b302823a2ff122a91f077b5e1a7bc1340de690ded86bf10b  rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-musl.tar.xz.asc
-sha256  52013329eb6697d94f5dce01dd509b4b93b473c18a3a2c05d0230b9dfeab14d1  rust-std-1.66.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz.asc
-sha256  e6029b4cec5d6c06c34a0dbec614fa252fdc8cf31013d6e561112cf90f742568  rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-musl.tar.xz.asc
-sha256  23f917eccaca59d4c911eb96d8ffefe86834dbcdf902c9ab6dad8558c31c4575  rust-std-1.66.1-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  70d1406e0981d5d31c1d3f85c848bba0476e0ff6203e7706f66b4d2212f01b66  rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  0fd221d4b4205ce548e83f0e7416c8332eb12b64d5a43c0b3ed61e9f7d6edf13  rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  132d6d5750a877972ebc6f23e831f2ef3077465b2ab24ca645d32ea83c496fe3  rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  533f370368ac8b6192e1450289c64544ebf9cacc38c3a52ef6c0ecded7ee6fa5  rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  8bfa3d6079c6df049978fe61b1ccaf992aecd006e23df2439ecfc883bd8bc31b  rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  d7028820888d0decde047a6e77b866e690532aa09522c9a23a3fbf8780a72257  rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  417b12a9bf090d694514937cd8c321ed625f155248f63c0de8207b17fa4b35b1  rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  7074c4ea9fcc683ceb0adcca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35  rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  4c64a09be872b5832b50d681fbe29691b6a5d3e23ee5535020fa22b8b453c770  rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  776eff6f451845e88224714ee6da7819e34f01b7625bf927394c2b91e5c8243c  rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  51d1567e1d28e43c2165886f5a4955dcdaa41aa5ddcec5fb08200491fd1f6062  rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  3aee03fa61c28bb242023efb09a22e38a76b075cc72bcad9894560be8b28a927  rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  c5e2c9b160bd8d99514f13cfbc0e42a722fd9ca14e6aaca4b9b77731a7a48377  rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  a9710727ba28955deb7fbec799faed19486c9af3c7e3088ec6659a257515ffca  rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  5a108891cab3fd0567bf8c2b44f18c045c067c607bbec3ea62b02ad40809b151  rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  2ba12fe020b17de3a6fe7633c59ab50ef44f9715caa858077aad3301408f583c  rust-1.67.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  f7fd19d9b4740b2acaee2ac3bf502feb2f16d1d0c203c1d7d2d2652652a9f997  rust-1.67.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  23dc0289abd12ef396c2ac822a28245157f1be5b574b5a5f4059a9ba7b61184c  rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  9998f93c29272d9ecabb69e908da23e728ec835520b430d0af12250d175b981d  rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  c24de54f46022c9490fc403ccb1e7384a52181ecd28afea0a37f800793b229b4  rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  271b4181072251276e3c97c3f772b6d9ee39aa8d9f05ed28f34bf5910c9964ad  rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  f3a8517334a174826cf92954d525d039c941265066f46948ad89b61791398dd3  rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  2b4c27e3a9475278838588fb64159f74a5a8e752f53249a299d2c5188f0bc2e1  rust-1.67.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  e6345aebeba55f39cb35fc06a3ac6c43c35f596309a6ed26023b1898346419bd  rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  d78573b19cff475c5d3612570d79f53b220d6aaf3824c71bc94d74b5f778ef84  rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  6ba01d65aa949128a125d85d750f3facff59c5b1448ccaf66fbdb7bbb3696107  rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  04fb84e9de6c815a7031930afca5d66e6993b639a7f304052df6da750d5bbbe8  rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  896aad9bcf8990ef213230755311609a5a05c99f3d265f47bc6844638f60d202  rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  8fd54bfb494089fd26c76b8d9f537bf031aa9018aa29ffe5d7258c82eaa51223  rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  212def6f18494cd45c90a471f2b0aff67c4eaa03567c7ab03fe901c337d853d3  rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  adcab5bb095b4b9af706d3b2cc62341bced76470a7c573354b52f9c8cffb4b46  rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  97c7922f3250d70e8b7a7f7420caf299274e253e1f46c3160f2dea33e159d5fe  rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  8aec6e33b6c80365979519423a168729c4fff2ea57f66e5123e0602f2ef050a7  rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  f98f2f4e76ef3056ba98be13ecfaacad07ab214f8ce940dfad56723056d42872  rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  dc10cc70b1fd6f74d0c3a7d6cf25bc583edd5f61cd26dbcc6f6bfd22d3e4eb04  rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  1677ef03dfbaa5715609fe7b51e3b036f722fe8934a9186e8f24e26b94588b41  rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  675f0e2e2930f784d03ad6de663fd4ed2b5737689944f0bc8b20653e611c3bb3  rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  da13b4d9cf2709b3de996d0923df05fb343f774ff89fcfb6a8548f562113c44a  rust-std-1.67.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  080ce3fa7f5b84d900be5842a52053345a40d6dd77b20bcac016eb2083a9a59d  rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  b5d5a777ca669d8d6aa8bad85efe5ff9d5559a3f6f9dfb9a8d95337dd0cf1b21  rust-std-1.67.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  a2bf13ed3f38427ae65c9ee33a0f4c71fd70d8fae6d9af45045f5318834370e5  rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  d7d223ec4ddb4816e9c537a395a6575ad853e48e0c41415c1a54235c3eb2aa72  rust-std-1.67.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  3b02a3d60f952336e16d1d67a2276ae3197f3839c7b2a557f5ec8d2594325958  rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  2ca3557e288fc1a312021b5ee2c08d1c2acd052b72b60472b494e79b42d2e713  rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  585c73b1407938290aa5f72beea6d994c60323b6a48b26b618d2c2f9e53916b1  rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  23364fbf0dae146a0be76496ac3ac22fbae5603435020d930e28531395b8355d  rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  2b877cdc8af0546358df77a0e22104d5e59a3fc622b6986a3fcbffc9c96a3c8b  rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  6e2e15c188dc67428467e894a62679d6f4115d5e5e10916d0273c16152ab060e  rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  44b700068e9e40a01418e537b5c0f4ee279995b55ee6d6266409f057ead1c6de  rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  db3960e0eac9d7c2485fe418bf9052d2fdd16557499d320919f385f9f3db5448  rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  ec92fa64616c67785039bebabc213e6bae6ffc2744ef052b79c7960df60b257f  rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  630e4b8b95c0b501676f2477b6009ca122019e1e0d637222443e26a0c5931f3c  rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  f1988eb337c00dd30469f545b822b8fd3b0372e6aa88924b7906785ea1f69fba  rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  d8cdbee292c86182b54ba152cd33ac3abe4c684186f29017bb4cf7e92ff3a2be  rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  8f03b271bba56b0245833f2cb08044865068ce8721d6a736d3ef7056aa109daa  rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  33f320dc4ae075f720f541564868e494c17dea97ea853507225f89f8b0c57363  rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 89009288f4..d62ce39cfc 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.66.1
+RUST_BIN_VERSION = 1.67.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 545a452bf0..2a260ca64f 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.66.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.66.1-src.tar.xz.asc
-sha256  07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe  rustc-1.66.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz.asc
+sha256  9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d  rustc-1.67.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 691683b492..d14ad3a3e7 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.66.1
+RUST_VERSION = 1.67.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
