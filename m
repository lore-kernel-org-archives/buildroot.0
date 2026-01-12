Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9194D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9387280D67;
	Mon, 12 Jan 2026 08:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFyE60abkGmH; Mon, 12 Jan 2026 08:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE64280DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207704;
	bh=04jROCkwCwF3spkr3O2oT0R+xxMyzSrQG4zUst5rXbM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dzu/MI+OqwIVQse4A57bpJOukmb5bivNQiyExGTKOPBVgBBPeDEd/hAJ1EXZbnFP1
	 vrt8ROH3IqonHk2aFLVipIUM+mV+CMsjP9CJbTG1BvcAQjruMmF7HBIdEQAiFjnr3v
	 Dr9lQWrfF+xjGkYNdBBvgjRrgGdh/zaLPhL5COt/NlOB2AxEsLxSvyRMI3bBpOScM9
	 CYlNjtqGaV8fMYGWvbeyxxyxwOtnUrA06+s5nllctz7D9UyZYU44WH7kMTjiUCgYPm
	 t3/CaKajc6bXA5lfErrD1cO+lzA0LVEVQouOTI16kSzleCebAsDKgzb98G9TMY0Bkv
	 9t1hW9GRh4pCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE64280DCB;
	Mon, 12 Jan 2026 08:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97FD418D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E33761573
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiuFPFLgg1xV for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78A7961541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A7961541
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78A7961541
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2BC21A4C4225
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-2BAN
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:49 +0100
Message-ID: <20260112082950.2528445-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206669;
 bh=0r3qRYsPHMLN+QsegKAyNkXmIgGDy0NY8XLDq6RJCh4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rtMR5x6q2wtg3eoF0PyRtcgvuTjM3iTg6A4WuvI3gVh+LPIDrDLTe7kSjMLa/IPyU
 0yQ/bzexwLP7e0TdR9LhrkK+Yy9IZyKxDz3kqH9fDAdpj4ZDvuFMQhU5wqA1qdAqOs
 80EjaRuT2nWVkFt2rlZHlFt58/sitl1jxOBllIomUMfKG1t2L+CwzjIFPuoS0lwo8D
 Z0rZIQksARHEJr+4P328LIgXpbeQmNUn6Fp36dgQN2Gd4mu0C5uh0DNQ9RIF2P0tja
 7wIEk+bE2IiUY7LJg9PRVxjg09hgriB2kZlXjQVzNDqnDfQoR42BNzQDTPGVk69fs1
 8EZlcP9SyI2ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rtMR5x6q
Subject: [Buildroot] [PATCH 041/102] package/x11r7/xapp_oclock: bump version
 to 1.0.6
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

https://lists.x.org/archives/xorg-announce/2024-December/003564.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_oclock/xapp_oclock.hash | 6 +++---
 package/x11r7/xapp_oclock/xapp_oclock.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
index 20e899b880..6d9c605783 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.hash
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003206.html
-sha256  8f09979655e889d056b7a1e50b57f38b32529453e756b53ec659070fb3c3965c  oclock-1.0.5.tar.xz
-sha512  a87e89afdb25a91c36077e030b05c3907ddc063c6bdc0715a01bfc16edef8730b3b5a0347399ef4c8b2a13e70e068cba9ec5fe8d411f08548c0aa790a1873aff  oclock-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003564.html
+sha256  3ee85e5e2d211eca7bdb8b2fe0e3baf31998829af48198b5fa9bbee2aa0d24be  oclock-1.0.6.tar.xz
+sha512  02d062745356ad09e2c5ef22c41f2f5c271e756c6a78cac78d459fdf8e4b107f4f8df1a657e16ecc3ae0c1801c2a913396133ba0628685c9ea4fe359c0d7dcc3  oclock-1.0.6.tar.xz
 # Locally computed
 sha256  f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 4f70df4cbf..2598180dcc 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_OCLOCK_VERSION = 1.0.5
+XAPP_OCLOCK_VERSION = 1.0.6
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.xz
 XAPP_OCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_OCLOCK_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
