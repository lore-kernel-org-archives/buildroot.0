Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F663CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9AF881327;
	Fri,  2 Oct 2026 19:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOMEf4IJwlWt; Fri,  2 Oct 2026 19:28:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DADF680FA7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969306;
	b=MX1ZSpKE67yUYTx6Ez6rf98XnV0oEzWiCIia9DJ+qjjcIM+jxVI44iZJySTm/KOZjec9
	 XCjGXFgZnWVx8BPi0HunBItQE1rx5vZnkX+CH2ESynjtMxe6sUV/VFzN+Y7EBn1o9qy0H
	 uWzP1Gcz3BY3+Vbi4emVqwzCyCIrC9ON1i/YurAI1GS+SJpULTIQtmgbtkNcuPfibeKpS
	 1DCFCr7cFxZ2pqdT6wjl7Q7aJW00Z8pJWnbaWe+FMR8kfGLPg76VZNqtIpJ1IX8QB9+tl
	 MHIQFESBBMX7tprPiodZdgeEvAr3RoOKt/WSwEh8rgKgUrfGzlqDHZNd1hJnSEap02w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aFX6PryAv66IiQ9WH2eXeoSLwTYbIromexadtxPIIZc=;
	b=ZgGBu1V/tUICbHXw22ocbsoaaP1HN8F8R2Symi4tOorf9WGsLkU4KPm614X+Ax1+ohrP
	 lXw2p5cyErQsiFzZj4KO1Qdl7IOIYThKJTvDruTVnKgZlIZGC0makQmuPJDMtGftzUWHr
	 2GB+1KVu1HNifwqWmkiEof1N8hDUxz3PRm/CLO2r4/otNCWJxwpgtD4T+rFJEWYc8MlJ+
	 cK+9G2eTEdvsMHFSLALLt8AvnmLUZkhCu5hJWh8AZpsqzYvHEGx5ROXS4Tngb1pwVU6f3
	 wq2xZVZcijwkG4VPd5UQrgOg8trDhdiTP0BnzEvwib/w+w0jKo6rHDLAiBTa3sxJOZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969305;
	bh=aFX6PryAv66IiQ9WH2eXeoSLwTYbIromexadtxPIIZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K5rQsXVC/pmKNeARwCr+w1/X0ROl79uIWz0yp/twq/3HRCSlQvy6zVHTD4sFxqt2i
	 dkftv2BDc1G34hYrkh2Err+C91zKcmxZwsVX/jYHf4Cqe/hQdfuuoMTb0arQByeydF
	 XayOEVUlyJEl9xODUH4S9A35Kuorj/ikXTkB67bEnXXAmM/eCUURZExn1ZkTZ3lI8Z
	 MydhlmTw4J7g1atZsef3HhY2yZIycNV5jPVF8ExQARcsKaOEtO7jk/WdKRBQ8S5pR+
	 dZs0IFTVfSzhtl95DXcr2nbT889CzlJU7Zoyo94mKdp92WAaWsULgBZFOR6E25lpBV
	 ZeQadCgKjHr+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADF680FA7;
	Fri,  2 Oct 2026 19:28:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C244C1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD3F60894
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otq9TWaZ2--1 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:28:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E7F3360639
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969303;
 b=cWb5mKpzoVgYslnCHj4ocp+UXtjyTdY+6gkh8NvdSm/FbOcEJFEbZybtqjoUGAwyPQlX
 okRdNUdH8HVW6wUTZ4XDspGp4TiBBftJ1/oqP9sVJhX2Rk0wcAhbRtTkKOC2yEPveUxw7
 YlYAH2j6Tup42nwF2Lps2J+Rxc0tXIpGvog8Mu4J36nuupS2zXpIEggAQ+XJKHS0HU1S3
 DYKVM6DnTtz03a0r+mLFqg3QnVJ7rgC3ptKe+xgbr7+ju5OqsL4bo5UBxd8w/Bqy/Kxjc
 EKbczQ7P0JPJTnaDYce/ISBAj6AV6bFD7hEiBYzWUgbNpMuS7xngJPlnhck/6N7O0rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969303;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FI5wxHp9rJJZ1/YbumR+gx4eIOIBEKbAdxb3YrpaUxY=;
 b=RL0CmNWYI5xHi2vgAVwRzddK9ElAyH8vwgZlXzXO8lpJpDQyIctfA195vsfRBQnh1gCN
 ZKj20RFDOT4ky8uCPOsi44DxlpkGNZ0KVUCf1yqA2+qGYp+NKSz332/pdmmRkFLyY35nq
 8WnoA6cKwUGq4t0/RS8zj6cLJSxSF9chVAvcrE7er6yX4GyCmCMzHtF2d5db82GooX1a2
 VKbforozDGlhU13HC8bxJx/YZCDuTSxi9tm3r36t4+Sg/cB54/Ryi6cW0mU1BPizzn6Sv
 +wNncFMdIK+Lhx1aLWRQbtIrM19suTpScPA/XVea4bnT0Z2rDnKVXtxa1FFIjLPrCfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F3360639
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98316886BE; Fri,  2 Oct 2026 19:27:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:26:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f38b58850b0d6a4198cc656946f1304fa2fcff59
X-Git-Newrev: b6274cf27ec50503a59440d5161700ae402e3ba4
X-Patchwork-Hint: ignore
Message-Id: <20261002192709.98316886BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: bump version to current
 head as of 2026.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6274cf27ec50503a59440d5161700ae402e3ba4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump version of kmsxx to the current head as of 2026/10/02. Remove
build options as appropriate.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmsxx/kmsxx.hash | 2 +-
 package/kmsxx/kmsxx.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index c141ef7e07..1d74a06025 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  99759fe9334369ccd80ab0bbfe1110ee47e74f1e20abc2d7b2f028067ea0a0c3  kmsxx-824bbb1f4cd062d66b457faca50f904b34dfd96c.tar.gz
+sha256  8671e99766590055cafd58793eaf56782044e2cf1203a8a390a5726457d39f7d  kmsxx-4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index f65cc668d4..5aeb48910c 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
+KMSXX_VERSION = 4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
@@ -13,8 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
 	-Dpykms=disabled \
-	-Domap=disabled \
-	-Dsystem-pybind11=enabled
+	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
@@ -23,7 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-KMSXX_EXTRA_UTILS = kmsview kmscapture omap-wbcap omap-wbm2m
+KMSXX_EXTRA_UTILS = kmsview kmscapture
 ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
 KMSXX_DEPENDENCIES += libevdev
 KMSXX_EXTRA_UTILS += kmstouch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
