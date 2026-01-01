Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECAFEEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 23:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8709160784;
	Thu,  1 Jan 2026 23:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqU1vDXyY2BY; Thu,  1 Jan 2026 23:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42576063A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767309067;
	bh=qp1qdyjB+dXTuTfgmlXaaxp3lSifinfZBHgNvFrimYE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a14E2JcV6Id6U0N6l/POLnrXXgMu7/zrpLyg1KnMoK1zR92jA/S234eNP/6pbw8qW
	 mTwNZ+QEnHi+VTExZGOFfvCCDkkLAjR1rIaL2P4C1RS8lerqM/xP2AnlFXqgVC4GGa
	 p1nuOpw9NLiggDM4ca13BZALyRN4k0WRDZmUi39UJ/eIeysai3FV2DHCzERI3EOHeM
	 SHf6Gm4dgStRkm7/CFz9Si52QxMTGMpkPRO1g93JYAgI4rkQhjKc2wAp5kCm3eJDS8
	 KuMhk1k2QYU5NtVJHiYpsU4PWxai5YtjjKit4YXmmb1X+5v5nmJeEjAFogiEl6j5VH
	 mT6OnRba39z/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42576063A;
	Thu,  1 Jan 2026 23:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFB5D351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD78A80829
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQRNUgsBgGTA for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 23:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FFF580828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FFF580828
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FFF580828
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 138D5A4C0D14;
 Fri,  2 Jan 2026 00:10:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60232)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbRoo-0000000052v-20Ma;
 Thu, 01 Jan 2026 23:10:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  2 Jan 2026 00:10:57 +0100
Message-ID: <20260101231058.1726375-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767309059;
 bh=5AZpp4Ss1utMFfAiUDHZ+/gfeq1EEsLluKSdQCtQlrQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HYOW5TDTZJDOsab51zZkPID+rDSNwBtsuVosnnRQ/sb9tnen/fJ8VLmiKQ3kg1Lbj
 Sq/r5U7rrdljeeXS0fjhOnpndiX8hdbhffYaP2H9x+2y2JVWD7gqBRdn/jR/w0ERHv
 NZP8YjSoeDK6ExQeASJf0xsj+b6gVHJOP3BKxkME6qpYgxdUpkRtG5xzQZg2WOu9Gl
 QOFIr888ycNGNY2iaPm8yb+vAf7ps3nWmgSG+czEdm+jPEX3/cIBd3cXMtNsMeQgCc
 ci+JbA48sh16xdSF7eNOcwtcZlSW38bhDSDZNH8CH9xrakj7XNkconicmsN94rcgm7
 QNKosImeeeihA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HYOW5TDT
Subject: [Buildroot] [PATCH v2 1/2] package/libdill: autoreconf needs
 host-pkgconf
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

Buildroot commit 106e2b448c5249aa905aeaa0a5a1d1f87cf8f694 bumped libdill
to include an upstream commit:
https://github.com/sustrik/libdill/commit/b3b81d2c7bf4daf8a57925ddd40f5b6f13484187
which added PKG_CHECK_MODULES to configure.ac causing an error during
autoreconf when openssl, with host-pkgconf added as optional dependency,
is not selected:

configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR

Fixes:
https://autobuild.buildroot.net/results/05c/05c6a3f5a9290f1e5e4f62fea13a0f4cb1278c04/

The first build error of this kind occured on 2022-08-21:
https://autobuild.buildroot.net/results/a29/a294492db81b6fd105dac88d8f5c8bc1a222bb8e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added more infos about the autoreconf error (Thomas)

 package/libdill/libdill.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 9dda81d085..bea9aaeecb 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -10,6 +10,7 @@ LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
 LIBDILL_INSTALL_STAGING = YES
 # Fetched from Github, with no configure script
+LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
@@ -19,7 +20,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += host-pkgconf openssl
+LIBDILL_DEPENDENCIES += openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
