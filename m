Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8636CD5BC2
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4866A60893;
	Sat, 23 May 2026 15:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 178iCm8Iezlc; Sat, 23 May 2026 15:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D756088C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549580;
	bh=t2CRzCcdP5TXSZ9H0Yf4LLghmTO3hC/rTc4Tb9qhH3I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=o+3FBBj/YEoBKpryUsy7govCZ3YO99Wqer1jQaElXdCizIzJb2tzT89q9p8Ak/SgY
	 nD/hYnhucww+XfumiBbaCIxULh4jeq3F5ZJqyqX8Kw6GF6U2cFIjTYNvgN6Y8zKxoD
	 qLihsgZ4s2nii+hApZc+UVrg8g2x9NXxNiIK86Hv2LXglEsfUFIsEo3SSLF0I2vJi8
	 2BSjmLrNG78aagm6DNXaXQowj3ZKBoVjEYOqpAc0rj2RkfhSFu9q1W5zYlPr9x6f+s
	 YU/KsDEehy2cT1n11/PLu0kY1sTc11MfvNcF/UcHXQFjzendcK+PsEuRHshuXozweJ
	 qh3QuZMIEy4Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D756088C;
	Sat, 23 May 2026 15:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89454263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83BA46088C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8dI4mjoqHuj for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 185F36086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185F36086F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 185F36086F
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1xSzaI30vq-00woDj; Sat, 23
 May 2026 17:19:32 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:04 +0000
Message-ID: <20260523151911.10285-2-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8UZ2mitU4YFe3YNGx77uguKthuVKPh7y0yeh0uVgBausY907QPd
 gBhhRZKDHNlT1jVk1c28AmxTmWBqgpkRcr7rirdosarkuPbHdtATqb/JhF3Bq+bLa5bu04k
 5Ho2LDh8m/maeY4vPJje07hl+ZEc5AEvgwrca3BpqM7ka747scKJKlzmfAb2SLiwlxNwJji
 G/neQ1FHhj1CsLBczcxMg==
UI-OutboundReport: notjunk:1;M01:P0:OsN/PgU/kb4=;fZS9xhPBoo0c14Ab25D6Lq56CHE
 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
 avAoVVWCMgFTBo8lPM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549572; x=1780154372; i=and@gmx.li;
 bh=sdXV0YR3MEOSpCzYwrOoh+/jaj3SQ6dZwHSpeL9RxkU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KXtt/mlNbhmpJynF6ibZYPS2a4AUcgMvagXhGkxs5+rpeO0IUikFon4ZPBkJ0Twi
 loef5ZsbUbGhArJrfIJwhh2TyYjFekFe4cPXQCWEO8kL9RhxymDFP97c46CJYWloA
 fkQy0/00MYd+pilIIa8R/EHS7mYeBKJ9f/dwUT0SeaUV19ugN3uhZGiWh7c8poTqR
 tGdKbnwgGvWNt9LJrunfIbCfsPfWd9XuPGSLVYoYrBkdrC1NPy2lRm0P09ssltgf4
 oCFYufPMq+6lXv4c7oEEMsRoZraB52bjxFw8EbYlbM3tyd5cHREXIwL2n0tBHOWjb
 /KO3eoDEt474BEzAIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=KXtt/mlN
Subject: [Buildroot] [PATCH/next v2 2/9] package/cryptsetup: add static
 build support
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add static build support as lvm2 supports static library now

Cryptsetup external-tokens feature still requires dynamic library

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/cryptsetup/Config.in     | 5 ++---
 package/cryptsetup/cryptsetup.mk | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 2773a93d..5062bba4 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, libargon2
-	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
 		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
@@ -20,7 +19,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a toolchain w/ threads, dynamic library"
+comment "cryptsetup needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 22c564fe..6fff7a1d 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -61,6 +61,10 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+CRYPTSETUP_CONF_OPTS += --disable-external-tokens
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
