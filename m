Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B0CD5B162
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABC84098D;
	Sat, 13 Dec 2025 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gl3JrU55XHBg; Sat, 13 Dec 2025 20:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAD24079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765656875;
	bh=rVKmje06r5aSrghMKR+HbnDKADhFCNdZ1BaTZr1CZXU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mxJGij5QPq3Vd5FuHuDhb0qS0CKAvJPRCX8Zr10mucMxppmLaanWzGzPBEk2VAOf9
	 0wCUcA51AhcAgP1RYa4eQ+/Ngl+ee3laWtEXQjNcAW3OPCcukKwou5MQf/AqdaRP/t
	 5rXSUKAArcG3EaIa5N06fZB7s6zMyceCZrw/uxfNHWht6EH3e7qkZaIbXQT1NKUNak
	 t4Cq1wWx11YTGvhC5hfe4MgLFtJQMEDagT695pwlWG9XkCzjp69R4BBNdIU02gJ94o
	 tE9vaS14rmhKJl3rgHymiM13WTY7DZ30KWBR/c3bf9Lf5SsnkPvUWkaNiBlFi7ij4y
	 ysPGe8LNkO1wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EAD24079A;
	Sat, 13 Dec 2025 20:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A88D13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47CF5401B7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYv03Izamwyx for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89328401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89328401D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89328401D0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:14:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6A4DA4C2E1A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:14:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUW0Z-000000001bD-1Fvc
 for buildroot@buildroot.org; Sat, 13 Dec 2025 20:14:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 21:14:27 +0100
Message-ID: <20251213201427.1347221-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765656867;
 bh=IYlX0FkEFpm8mN6Wadw7xYlDfDSoMbzBmgTDt8aotrM=;
 h=From:To:Subject:Date:From;
 b=AHi1mS4Ig15RLw7YaSMxrhbblD9UML00j96Z0/1P1wU+PW4Q0I9L0BJsn78uaX5gb
 AoJc/Bt+vRl+6v7BDu3LKpWiFoSqzr9jv5CmnAGwLrtJFtBQBg+qrbP/1asZNu05HH
 PMwDXSW+cngRI66cxJp3dyabhq2Ah8Pnh/i+sS6dnKWUvxaEGAvJphiu7qC/xuA8Xd
 G+uKQtTEUPremj4RpST8PBd/Cd+X12JoYJCjmFuxmJ8enki4Y18KBC+rKU5+pzfswf
 h0cBAqHx2mDLVJuCQC8HwqKiRa/RWq0iHLSvqMjy554HhibEoPoLnTA0RgtMe+t13i
 FByVni7LrIOkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AHi1mS4I
Subject: [Buildroot] [PATCH v2 1/1] package/libdrm: bump version to 2.4.131
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

Release notes:
https://lists.x.org/archives/xorg-announce/2025-December/003646.html
https://lists.x.org/archives/xorg-announce/2025-December/003647.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: squashed bump to 2.4.130 (Julien)

 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index e2dbbf18ee..52bf0c6228 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003642.html
-sha256  5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc  libdrm-2.4.129.tar.xz
-sha512  3ee702cc4a578e9ab231caf8a84700e4dff6f3da70731610121ac2c3390f42e42ad144ea61c53582e3a8adfb1d6bf8254993c5c6eaf85a51421e26d51d341cd4  libdrm-2.4.129.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
+sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
+sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c499632f6c..240c09b8b1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.129
+LIBDRM_VERSION = 2.4.131
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
