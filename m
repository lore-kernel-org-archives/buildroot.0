Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB3F55103
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 18:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4D684051;
	Sat,  7 Mar 2026 18:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVm2P4KDWKqW; Sat,  7 Mar 2026 18:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 265A383FFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772906873;
	bh=iC1mRqcOxPh4yeLikeYBcx/xGyPe7CutpoWoNqMYZ4c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dgelARBfCpgcwMaz+KpDeLd98N+osN+t5xTp9igODQQuSvdUe9JmsOqPGYgH4wYkA
	 GjsIRr1Ctg7WCA000sVgf52IE47aYo3186dFn+29XA5E+kTW0O9jmQ+tbqo7U2FIHw
	 YskxGBx6+kt2spZ/prW4uSRq1HGz6pyfJsPpEiWvvlCnDXOZSbe1IlL4GE+ZfiHVDc
	 UnQ4/ofkBnQWbcqhtNM/R+zfcTxv/L2Rk4S+jTGVuWBJefSnTqV/yAqKna582+EvUY
	 Je5qmqUvAYhs0IwZjplZ98RF5inErCZ/b2ebzX5UYikOzsc8jJwdGPeJ0Jjjpyousb
	 IiSFFEDyLnUUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 265A383FFD;
	Sat,  7 Mar 2026 18:07:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA1625B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD55540726
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbcfGexTQqwn for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 18:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF67A40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF67A40708
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF67A40708
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 538FF19F57B;
 Sat,  7 Mar 2026 19:07:43 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 19:07:10 +0100
Message-ID: <20260307180711.1025866-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307180711.1025866-1-ju.o@free.fr>
References: <20260307180711.1025866-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772906869;
 bh=lfvMaZyMRtv1vwr9jWvyI4wdSJ3qOhl9KMkylQUyJsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MOFPHP3B96QVUNP3xMDBuTODrJOmkM/0pY5T/0HuECtkM3DxFOUBLpJ4qxxbrBoVd
 f8zIo7W0NqZzC9rdhDJP9UPhb1Iy3goJ2K/NcOSOYeB9pLnXUAo8I9onzKWm40if45
 nQ2d2JjPueE8HdC2VuhIkfiD7O6jD4Usf68+oiWQNGPv1OOUCrwn89saVvkFDrhNWn
 lDsNsZFdpxE5CMuPScEPL1MVfaN47Xfc5SBW/hGd8PFT4i1VooZOcaLHd34yqBY+IS
 hpJb3eO0up6MYJ2f2lyjj+qtwjb844UBkPnKZ3r42JrYQj8h1N9su3+F3NPnAdLuoa
 2sHWMxysBJR2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MOFPHP3B
Subject: [Buildroot] [PATCH RFC v2 4/5] arch/Config.in: add
 BR2_SHOW_SECONDARY_TARGET_OPTIONS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain <ju.o@free.fr>, Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- change the Kconfig symbol to be hidden
---
 arch/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index bdfc2b092c..bf638e6226 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -15,6 +15,11 @@ config BR2_USE_MMU
 config BR2_ARCH_HAS_FDPIC_SUPPORT
 	bool
 
+config BR2_SHOW_SECONDARY_TARGET_OPTIONS
+	bool
+	default y
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
