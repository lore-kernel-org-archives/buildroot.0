Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C8C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 09:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E48781249;
	Sat, 25 Jan 2025 09:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSPVh4PWgIoR; Sat, 25 Jan 2025 09:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397C481253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397C481253;
	Sat, 25 Jan 2025 09:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BAD94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 09:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF7281253
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 09:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJz6PgrzGWcc for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 09:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAD2581225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD2581225
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAD2581225
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 09:41:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c8f0.dip0.t-ipconnect.de [79.214.200.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2A76A4C0EED;
 Sat, 25 Jan 2025 10:41:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50476)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tbcfJ-000000003OE-0mhs;
 Sat, 25 Jan 2025 09:41:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jan 2025 10:41:21 +0100
Message-Id: <20250125094121.32306-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737798081;
 bh=YyOMkmKgOaTdbfqYdgRyN4T0pxrulahBnDgibcbHcnM=;
 h=From:To:Cc:Subject:Date:From;
 b=Y23ipk/bcCbJqtNegyl+Pfzu85Mgn70CgtyiIE6SG2+DSqMsFNpEv8NQb5c2vqRFi
 bEfuP1DpFbuXc61/+r/ruTDYada+05RwztczxnlZ6tzebuz06Qw8O791+PnVQeAwrR
 hyXV3j4djE70m2/Jw3XA970uXD0NYsIeXlK/J1tlfD1+VLIohnGIGXVK5sANUuWezz
 YoKQtPpNiQs2kLW8K9Aa21t49en1VuJiYRCTsP2wZ95BSFxcPYxTZ4UDmKratmK0gK
 dn3nUMd9TccmT+Z3ngzLtB4JL9j1e/QEMmC4uI0C6RYxfCeoo3HDaQVKcNxu3BTnWm
 armDOZbrwql5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Y23ipk/b
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump version to 2.4.1
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
https://github.com/gerbera/gerbera/releases/tag/v2.3.0
https://github.com/gerbera/gerbera/releases/tag/v2.4.0
https://github.com/gerbera/gerbera/releases/tag/v2.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 8a0f052e9e..edbe655dde 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c77f4a8ccbed5e18499c0854803fec65ae2f26af633818b52584651fbd3eec13  gerbera-2.2.0.tar.gz
+sha256  563ee3941b0347a91f5a3e9fe151032bd0e26868bfe7b7c68a7c095f8b07677b  gerbera-2.4.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index ac5b69b681..9434f6fe64 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.2.0
+GERBERA_VERSION = 2.4.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
