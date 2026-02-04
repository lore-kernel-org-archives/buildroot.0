Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBEEEA7946
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EB940988;
	Wed,  4 Feb 2026 20:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtIHiUwGjsYa; Wed,  4 Feb 2026 20:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 010AE407BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770237186;
	bh=+T/GuYHwMl6GYVQPvGx57r8TlAgK1ROzCRtJ2E5sL5E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=DCTiLRC5lCJ/7aEYqe/0QMkZ8RCKXwOErENDYd0OnB2dLLtfrvmtZu93V7nqsi2X5
	 ASESWA5EmNqOyBb+zdkk3TjXv5ksD9zH+qFR0M/GDFmpw9+e6oTvn0HlO3DBwZ3DrO
	 V4Tr5QYxnDEf7ngHi87MdEMi6xdeqrdJvPM48nwwaTU6u5IA4pNO/TW3VpzleQKXGs
	 KLNgvH64Oc9FJPkGrGMEiBEU0BfL2ZYQLr9+69iphw8i5+Bi9iMDc6Twjm/eLgvcxI
	 cQwuCQOxQVGaHiWwkgR6gjiGrCCXPLB/dinH+jD3Cc6SkcPMZierDxhta4y1Nwjdmu
	 yvsXB1jmnPTSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 010AE407BB;
	Wed,  4 Feb 2026 20:33:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D03F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB0F44042B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaVLLuJDtBW1 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 20:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC874033C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC874033C
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC874033C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:33:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E8C51814B9; Wed,  4 Feb 2026 21:32:58 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 21:32:47 +0100
Message-ID: <20260204203250.3141089-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770237179; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=sfDpP1xNOWclrs2Aqhhv1R/x7DzBx9fwdSmRlUTaiU0=;
 b=ujCvbouxGGhss2GVntqwvUlXYu5oteXIx5CKbfBKPos6vUZEAEYA3rK7wRos/2epegDFfc
 zicyedsVedvv9y2ptoGlgy7RmWYkartldm25GkDykBl6tRmyF601vBjGxGbCCaRGZsr+i6
 FMlGPgEO255PXTNTM7KcA/iWifatdNs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=ujCvboux
Subject: [Buildroot] [PATCH] package/gqrx: drop boost dependency
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gqrx only used boost to support older versions of gnuradio since v2.12 [0].
it dropped that support entirely since v2.16 [1].

So with the bump to v2.17.7 in 6cf4f6cdb663d224bef0b96fedc183b27781a28b
this dependency can be removed.

[0] https://github.com/gqrx-sdr/gqrx/commit/43931aa5860932832d52e4e42cbca47bb0a412ba
[1] https://github.com/gqrx-sdr/gqrx/commit/5052dbc060076a5b3883ab823ec3fd2e327a42dd

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/gqrx/Config.in | 2 --
 package/gqrx/gqrx.mk   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 25a8a77d2f..f2ad2197b4 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -24,8 +24,6 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_ANALOG
 	select BR2_PACKAGE_GNURADIO_AUDIO
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 745edad959..6e64649985 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -8,7 +8,7 @@ GQRX_VERSION = 2.17.7
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
+GQRX_DEPENDENCIES = gnuradio gr-osmosdr libsndfile qt5base qt5svg
 
 GQRX_CONF_OPTS = \
 	-DFORCE_QT5=ON \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
