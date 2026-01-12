Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B42D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1758194C;
	Mon, 12 Jan 2026 08:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZ4scYCIk7b7; Mon, 12 Jan 2026 08:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D2A8429D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207113;
	bh=ghn2toi2j9XZ7KqpL4qclOFolHAETsZCBCZ6MMA0lig=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beKzCsTt8B1q9cIikWHSnT4Q+gYe3jhzT6jfnj5YYqHiRsN7Qz6VYhWdLL4M4PFc4
	 Jzbh09qsHSxK+BhFyNA9Ym0Yz+6xcCwwvbr07OsbDP6A7LXFrlpXb+ggwG6QfX5TKQ
	 cZgwTKfDHfwNh0XZ0F9chlHSJ3dinbyXBlGToOR5lagZvXJ5MWQhQV4I8L95BypypR
	 F1mErIIjPC46VUV/ZVJ5Ab+3suwhrQT9jSQ1p5FuWWQdbp05eLT/kI3o/VLCFPsf9O
	 qYIe1cSU/+Fc0UoEx5xm5wpgBUVK6Z1mEYWBhG5bjztqcfsN+3RA7/V7pKctv4Yu7L
	 eTVeHa8HHj7kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D2A8429D;
	Mon, 12 Jan 2026 08:38:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B58A21CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BD19614F0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6lh-1U3TO88 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 834E7614EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834E7614EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 834E7614EB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 838E4A4C3CA0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-3V4H
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:38 +0100
Message-ID: <20260112082950.2528445-90-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206633;
 bh=2SWvI6WRZj/zOVvw5ubBEM4JdGEJ8WYNKKf76D21zOQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=gyD4v8c27jb5LEXtBORHAkASd1k/m0Yfw5PfShmToYJ3Kcw5ZlTxk2cOyec+FsNfO
 tOmI2Jiis9rup+IQreZCWfkrju4ivC95k2snBogA6uUXPC4H8WES1LNJC/VqU6LNv0
 o4CYRlRFibXeTm6mJKnBDP/UML/AybuL5iMjFMxDGtOZ7mTh5FeAhmGc0/9mZS9y+k
 B7L7p+/RQoPe6/N0+23Er0PIgTEyVtmOs0P4neBREKqEREYvA+oT66TtjrkZdCY0Ny
 ZtfpNCzIjM1BBBmHcOQDsmCrvIBhOOB0sOqPe5fglrAq0DZffReXCeIH+lwJvc/8P4
 b6P+wArhf1T7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gyD4v8c2
Subject: [Buildroot] [PATCH 090/102] package/x11r7/xapp_xmore: bump version
 to 1.0.4
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

https://lists.x.org/archives/xorg-announce/2024-February/003451.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xmore/-/commit/f1d979d7a304113ab5df35971c440e6a76761ad9

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmore/xapp_xmore.hash | 10 ++++------
 package/x11r7/xapp_xmore/xapp_xmore.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
index 960a1e5f92..5ebf7473f4 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.hash
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002964.html
-md5  8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
-sha1  b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
-sha256  644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
-sha512  e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-February/003451.html
+sha256  7eb560dbc1de4e43c64fe491ad73907a29d734cca82a9ad82c7d3feb9cdb0a9a  xmore-1.0.4.tar.xz
+sha512  52ac9bca78431f5f830b4607ff2cc375ab90e11380e0d4d3e591689359806cc7c7ec92c713d4d65742f40407e4f407c372759e5d03e30a30dfd866e6d5c6f6f7  xmore-1.0.4.tar.xz
 # Locally computed
-sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  eaba8f94ecdc70f7d0f7a7c44544abd198f8ef034d1c45d3b915d52194f3ee3f  COPYING
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index f8a3ba8c1f..ac58ce35d3 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMORE_VERSION = 1.0.3
-XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
-XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMORE_VERSION = 1.0.4
+XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.xz
+XAPP_XMORE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMORE_LICENSE = MIT
 XAPP_XMORE_LICENSE_FILES = COPYING
 XAPP_XMORE_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
