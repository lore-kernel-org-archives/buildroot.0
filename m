Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57798C02190
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 08:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28CB384B31;
	Sun,  2 Feb 2025 08:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze3vonV-ynzt; Sun,  2 Feb 2025 08:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4FE84B32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4FE84B32;
	Sun,  2 Feb 2025 08:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C90F12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C74642F23
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3wfHkO4DgzL for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 08:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 640C342F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 640C342F2D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 640C342F2D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b087.dip0.t-ipconnect.de [84.161.176.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD3EAA4C4874
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 09:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34316)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1teVaf-0000000066t-32VB
 for buildroot@buildroot.org; Sun, 02 Feb 2025 08:44:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Feb 2025 09:44:27 +0100
Message-Id: <20250202084429.259494-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250202084429.259494-1-bernd@kuhls.net>
References: <20250202084429.259494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738485870;
 bh=GraLDTWX1B5ijYarGRnMZxIvhy8y5SmtXljoN5CMSL8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DK4Dr94EQXNmgSnLJPX5XG0RZ5z1f+5qhSmHSp+ISfDVaJdsO6HLVw/FiqewX4QZZ
 mNJxgH7zyUpn09BKBQDvwyzN1tA92JFZgUJAglzeDIdXXQuu8jnHTSHWyYTm9a45u8
 XUci+hCyBOpe2ed2l35rDaXqNw8dCfCrO63FEHd1aB/ROvwUTrmhT1vaUqZTUgshZK
 MAhfDSxwb6assfxXj2yJiuJ15rEiciVsOgSFtekyyb5rCBYLGdhTes9FzL0Iq9C2ya
 j5JS6zKVZuN1/7SJ2HdcVd/t4QMs+huKeIvqYgbsGpxPOdREXACCoFKPE34UTzk3BR
 eKgXko6EnjHmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DK4Dr94E
Subject: [Buildroot] [PATCH 4/6] package/libg7221: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libg7221/libg7221.hash | 2 +-
 package/libg7221/libg7221.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index b467438bae..1d3bcc2b77 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0162993e0af557e05b9000e082f6a755e54a6c20a88e2ab725ed5068b4c4ff6  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
+sha256  44ebe717888f1c4d65dd0f6abecbccd96b642c49f2e472e6436ec530582f6103  libg7221-97d7ff5cf508fb6584a43b9e0c09220f8765cb3b.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libg7221/libg7221.mk b/package/libg7221/libg7221.mk
index b62a3b8b84..0e62a9b1f4 100644
--- a/package/libg7221/libg7221.mk
+++ b/package/libg7221/libg7221.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBG7221_VERSION = dbfc29d4806ecdace50379a2f4d68a992a6fec34
+LIBG7221_VERSION = 97d7ff5cf508fb6584a43b9e0c09220f8765cb3b
 # we use the FreeSwitch fork because it contains pkgconf support
 LIBG7221_SITE = $(call github,freeswitch,libg7221,$(LIBG7221_VERSION))
 LIBG7221_LICENSE = Polycom
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
