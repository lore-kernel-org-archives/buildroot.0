Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF9E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 15:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CA680E44;
	Sun, 29 Dec 2024 15:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xCF_n684RC3; Sun, 29 Dec 2024 15:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6733080E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6733080E48;
	Sun, 29 Dec 2024 15:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B32CC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5544051E
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfOy5SH3dhQ1 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 15:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBE454012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBE454012F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBE454012F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 15:51:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8cb.dip0.t-ipconnect.de [84.161.184.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71ADBA4C4058
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 16:50:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55226)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRvZB-00000000879-2hia
 for buildroot@buildroot.org; Sun, 29 Dec 2024 15:50:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 16:50:57 +0100
Message-Id: <20241229155057.1910781-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229155057.1910781-1-bernd@kuhls.net>
References: <20241229155057.1910781-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735487458;
 bh=Bsx1hjJZ5dzmKTzLs2Awf+4HIqKnKwMs7yaH928h1JQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PINyo/RsuS7O7MMQCDeaDApnzecRxJjEllBGWKI/Zqn0yjapcxPoxvDMarqs7PVgp
 uc6MMalA0UOjz3gmeAuzv5iubyvDgbenLRFArs5pqHIbCpDZXxWTg0dGJPUZs9RL/A
 1x1wbP6k0ISD9EOaeHYht8QdAv4LtBq4EmO55AWzW6o93ZqFBpdfbsKinwsxoco0Ct
 +uDh8D5n25GtTJW1zzgSuZLfvsyRYwp5dW0q2aXH2eHqH9leaOZ2DSpXTzBKxE/+0y
 U7AzYwdTmrFS76CDJiJUc8zua/XLX/EAP7mgrFuowxMaSFHhpBBaawP5EDfVOmLQYf
 mqLOZ230KAwUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=PINyo/Rs
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-nextpvr: bump version to
 21.3.0-Omega
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
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 130bcbe5b2..976b774dd3 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3df0ed9a1f7dd61feba1fd8281cdd5b6e3ee153f78eba3e645e5d2213f7c5793  kodi-pvr-nextpvr-21.2.0-Omega.tar.gz
+sha256  72502b3a57cbc3cfbfef92104d97681d75cdfedb2a4173ac92a8e92fdc60d668  kodi-pvr-nextpvr-21.3.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index cd0378bff8..5d3c59dc13 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 21.2.0-Omega
+KODI_PVR_NEXTPVR_VERSION = 21.3.0-Omega
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
