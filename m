Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F55CE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3362061145;
	Wed, 11 Dec 2024 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqFlrzY3mLPF; Wed, 11 Dec 2024 19:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40AC561148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AC561148;
	Wed, 11 Dec 2024 19:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 731AAED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53F1140B35
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ovi3iEeZoYiC for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13B804093A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B804093A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B804093A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D45FA4C2545
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:29:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37222)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSOW-0000000056t-29VA
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:29:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:29:12 +0100
Message-Id: <20241211192912.1671782-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945353;
 bh=9F5IM9P4uTxFJATF5kw+qzQ1tFbnQR/Tplgx5FkiYcU=;
 h=From:To:Subject:Date:From;
 b=mn2/J/e7EpRegpCptpp0/OVusIgAslEaJHEEURjatAIDIXpje+JC2J44bIUOVvxxf
 2G7gPKWY/u36ozEWXoOdlw+gEbrYsqalga4pmw1SHrBJaJJ+DmXfNgjKNAABcSwnVK
 zvxd/bynvVSOTjM1jMu6vC9UmNtphJBK1toUhphD1Afg9gvyVqmmnUdgeUvPZ8UAcv
 IwIeURN6zhgXz3H5nYqqQIw2PwZ8xqGAy53CcQmV4OB7WHNIwlmL13nh3TTpqELNQP
 mLvrYKgb8q9Sr7bGTjG7xidjREDAFmh+U4/XyiVeQnjZEKovM+0xfjHli//AdF2Ixr
 sGh9asWq4B/0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=mn2/J/e7
Subject: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.25.0
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
https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index a0561d8d0a..da71b49d09 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
-sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
+# From https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html
+sha1  ca79e61fbf1d32133f60ef7c7d476b250b6da423  wget-1.25.0.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.25.0.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
+sha256  19225cc756b0a088fc81148dc6a40a0c8f329af7fd8483f1c7b2fe50f4e08a1f  wget-1.25.0.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2a3a38e50..e3143647d7 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.24.5
+WGET_VERSION = 1.25.0
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
