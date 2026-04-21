Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A71F94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71AE6087F;
	Tue, 21 Apr 2026 19:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2ru6eDemd4b; Tue, 21 Apr 2026 19:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE0060885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798430;
	bh=OJ1r+fpYyLMLd4YgUwZ+QzGs+B9HaICUbye5BXKW2dQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YqtpiUFY+2LauirN8H6dHla4D/UB+Z+zJ28ohp2pICNEsUk+xnAyt87FQVjG87g32
	 n+/tdT+SR6cgydH7FI/MjSPNFZMv6A8os1Vnfig6BI3sHj8PKUNFxG+b2Mtf6mxrss
	 /7OxZgvHpxyXiVpNgoV6Rw2wQLNVR/Q3D3szsVc0GMj0nCpTK1Gze7l55Sn/qPkmDg
	 aKxLvgefB39u7siEYNQDMYvW4J8/yMAc1KEjOG57qqomzW5D6hK2GRtZE+EXhSzpki
	 BAbSOwTv8UxcgCpuyzOKuqpw/X3O+wSaSPBJkb6Ts0/jiUs/yJzmf5Lv3/SGIgab3X
	 5pumxzUPwlvmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE0060885;
	Tue, 21 Apr 2026 19:07:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B0B4257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CE8442037
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciz_m6Bn8qiQ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F099B42032
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F099B42032
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F099B42032
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:07:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE636A4C0185;
 Tue, 21 Apr 2026 21:07:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50464)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGR6-000000004TT-2beX;
 Tue, 21 Apr 2026 19:07:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 21:07:04 +0200
Message-ID: <20260421190704.2723240-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798425;
 bh=Ixm1zjnKs0S9hoyssLZRG2HkL6RNpwi3MwukXfP22y4=;
 h=From:To:Cc:Subject:Date:From;
 b=W1Xnn99xIOY+zYXOrcB4uNGnJk1MPugc0BeOPkKixhvWjfiyj+MAdnRWl6JEgpiEb
 /XYRO4IGaKUOHtYoHU/jJap1rd/Mp1yyryo8jbSGIzujEwx2AvoVYgkx4222+zMEnX
 Bn1tpR5uoZW6OuRqJquzE/Aakl0xJ5n+6MXoXIutfErhXrQ+ifZ8GUqB3pUOX++ldp
 VBZFRg2CUs1Na9ytF5VzpQ16wo3Hc6KIujp2Lq+KnCTBt3BfWwN7i17gGuK3LBddd1
 s/B2mU09v8dfzwF4LHKSGJ8tgXBM2P70kjmhRXMFXEU0Bxp890DtbIdG5iaAkP9fsT
 wgETJohUj25gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W1Xnn99x
Subject: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump version to
 1.96
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

https://github.com/radiator-software/p5-net-ssleay/blob/1.96/Changes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 219edd4e0f..739df2c181 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
-sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
+md5  63772ad94b874b5f0f025c2a4285f82f  Net-SSLeay-1.96.tar.gz
+sha256  ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753  Net-SSLeay-1.96.tar.gz
 
 # computed by scancpan
 sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 7f58093082..1ba2227bc4 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.94
+PERL_NET_SSLEAY_VERSION = 1.96
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
