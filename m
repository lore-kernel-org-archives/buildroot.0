Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F92C79F9D
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 14:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623AC406C9;
	Mon,  5 Jan 2026 14:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0SUZLY7TMcv; Mon,  5 Jan 2026 14:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D52406C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767624082;
	bh=bzd1Wa3i94uWDnOiC6fdSEzGevYLnrf13zWDEfOwhIs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Jk+M773KMt9o1XvIqapEwLZZuvtTN5qwxhj7IxlmiNBckWGF3Ol9nkdmHqz2noEc+
	 NEdWYJJzYpfJqQo+gJ8bGXP9+Mwwk3dsCMfrVN74+f4mhpTbXcan8tQ2EMhP2CYVtc
	 uKpr6EUosWXf0H6uloZxRpJ4YavNMpHL92rk1mcCjOt2Z6mRrTpohG2p7iwVm/aHov
	 /EvNB788arde9ve8jK8736Lte3APb2XiY66ZKZJNEKrGzCOGwKWrmW67LbROuJmebC
	 FunkAmzBy1bOMzvpBVPGUW4rViJJHfV2AeTj2TZq/q+qMbM3E5Wi6H3xKBdLSFexNK
	 kFtAmZpGy7mow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D52406C4;
	Mon,  5 Jan 2026 14:41:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F58E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E58E405D5
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ocg00tRGnG4l for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 14:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EC6C4057E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC6C4057E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EC6C4057E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.30.53]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1vdaa80INh-005A9r; Mon, 05
 Jan 2026 15:41:17 +0100
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 15:40:48 +0100
Message-ID: <20260105144048.16235-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105144048.16235-1-fiona.klute@gmx.de>
References: <20260105144048.16235-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4FCzw227WaDT/w2GXQ1bwIoexYsj5Y+OGIlIFy8JuEiqsmrWuxp
 cuEwhawJ8th2eYorLAJ6h9l+RFXhpGyhmgwQZiR1YMzAET5ErXrYjlX64kwCrApbQlKvX4r
 A+D79I/Wytcc5WO3t3GweLRTPqj6cidUp882A8Ztdp3nfTIXNRSDHJqqTDhdNn88l4JIxDs
 chzlxeDQyzqsShz1gNHfw==
UI-OutboundReport: notjunk:1;M01:P0:HIByG43z5og=;mdPy4fk3Uw+BjTY7gFhFmSQQesh
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767624077; x=1768228877; i=fiona.klute@gmx.de;
 bh=mi0BX7FGE/qwE6Y5pPWb+cutXz6rGwWVq5UcnTobifQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j31Moc6HeIdD9324PE0cNEX0YwaHzACqlblFM+JDSg7JaB+JrFIx0Ub6ZZEF2vDb
 XhLwIBLGL6CANlL9CKzZbVmdNkuL0cfRfv1/NOfwVWOFxEokyCcDswX4i006xtrf3
 SKhZq2x3YAVFKgBd57IR0VoutjE4MZg2cvxGbtW8ZhOHX44ynjzlLqCHp9ACwKrBd
 YGILUXFIk5dhxKsP31I3wrU8TeApVutLMf1iGVE+QrkTVBaausIX3A0aWwLrApNPp
 ReNideRP2EiP5zPXJJ+fB5wLQLXSERysTGYGbAjY6Rj7Sn5DGkhM7SZ9bmAkgpqjX
 3BdvHsSjGOtAyG20Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=j31Moc6H
Subject: [Buildroot] [PATCH v2 3/3] package/python-memray: require toolchain
 with C++ support
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During the build Cython creates C++ source that needs to be
compiled. The missing dependency did not show in the existing runtime
test because the Bootlin stable toolchains include C++ support.

Package was added in c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Add reference to commit that added the package (not in any release/LTS)
* include C++ in (added) comment in case of missing dependencies

 package/python-memray/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index 831dfe2957..1c5b286a8d 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
 	select BR2_PACKAGE_LIBUNWIND
@@ -18,7 +19,8 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 
 	  https://github.com/bloomberg/memray
 
-comment "python-memray needs a toolchain w/ dynamic library, threads, wchar"
+comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
