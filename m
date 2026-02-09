Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB9FE7E0D9
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDB960DF5;
	Mon,  9 Feb 2026 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Quk0xaRukMKZ; Mon,  9 Feb 2026 19:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE49560678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770666805;
	bh=oPfHgM8AeUIpFT1T+cE4NUS3w9di3UU2n3i7+dLihLU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hofTvb9FRtfdgbB88HpkvkkPXAwsvXpKE+f0eu8q0sACl519Qq6/ocdPRkBYYFaKq
	 vUlCIJ8ylJJYiT4ouKuAU389jXrtNToTRexb8xo9YL7hTAAUe2g2iA2wC4o22THff4
	 zfbuB7HeXTDKtEXxSnpGJPdemf88sWZSXHkxBgpp7Z0JFYo/I+YHoD3jd3gkzFz+Li
	 YWKti6l9bxru6oB2rZxwrQY23jEbq2R/+gc0rgkf+loDoWAylscg8ufk/oErDvviPn
	 zGbOSc/mBo7vDoYlkxqB4cIxGBkN1Kw5eRF5822WDqQTucp3Uk21y0sWLNB0CIDcpT
	 jhmMCWHJ5j7Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE49560678;
	Mon,  9 Feb 2026 19:53:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 817731A9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 660BD605C6
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvC6Bh-AG1SC for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 19:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82A2D60678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82A2D60678
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82A2D60678
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:53:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a038f.dip0.t-ipconnect.de [91.58.3.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4FE4A4C0597
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:53:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32870)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXJv-0000000037O-3svD
 for buildroot@buildroot.org; Mon, 09 Feb 2026 19:53:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Feb 2026 20:53:20 +0100
Message-ID: <20260209195320.368734-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770666800;
 bh=BquYigknXdYgCOYZLm8mctLCnm+xlX7VtxCRaauSoWA=;
 h=From:To:Subject:Date:From;
 b=sawQUqpIAjLzOQEVr/m7auaopxlaBglsSg0YAejwntGcDNQdlZdNRXel6K45hkU5D
 DNLzrFyxbtHgNcAPqQxCqN9DmCCknwviPr+jqRyT4Cex3j4blSUJJm3w6Lgy4P7aT6
 qTIfx7I8+m0p51IEOjKytg8rwwMy+KfoR01sTkWaECy/WfszWrem1l84c/ETrjcZt3
 WXKum2GXBA1Y9PFGN+QVbp1tBhVhm50u8K0RGnzJ0McEBeX8F2dUCIhiIbQY+qwV71
 MCfLsMlOfb6AOHzsExXnxFaxx/CuYtCcSk9xW4Z0+oBmCKclseRFoNiabPdOkUXvyR
 tqjc+yuTQ0TxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sawQUqpI
Subject: [Buildroot] [PATCH 1/1] package/make: fix build with gcc 15.x
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

https://www.mail-archive.com/bug-make@gnu.org/msg16254.html
"GNU Make avoids importing Gnulib modules, since it will make
 bootstrapping harder.
 [...]
 So, you should be able to compile with -std=gnu99."

Fixes:
https://autobuild.buildroot.net/results/e92/e9250f1bdbbd7c65a8bd108f32ad9eef73a3eacf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/make/make.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/make/make.mk b/package/make/make.mk
index 1d1a976eb4..6da857af74 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -14,6 +14,10 @@ MAKE_CPE_ID_VENDOR = gnu
 
 MAKE_CONF_OPTS = --without-guile
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+MAKE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+endif
+
 # Disable the 'load' operation for static builds since it needs dlopen
 ifeq ($(BR2_STATIC_LIBS),y)
 MAKE_CONF_OPTS += --disable-load
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
