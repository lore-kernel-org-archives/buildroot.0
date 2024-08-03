Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B5C52D6D
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23F5402C8;
	Sat,  3 Aug 2024 10:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jt4tPxpjrQfo; Sat,  3 Aug 2024 10:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F453404EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F453404EF;
	Sat,  3 Aug 2024 10:49:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 818211BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FFE581ECF
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tGMBJwXvUNO for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 991A681EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 991A681EC8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 991A681EC8
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:49:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E518A4C032A
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHo-000000003Oc-42qo
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:51 +0200
Message-Id: <20240803104656.2574228-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682017;
 bh=DnIH4Na3CF8fQAfxycRu3tf4X6JcneW0O/Sr6QD3YHk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N5v016t6JC9dNdfONMA/tMs+nc7pHSm/ZKD4O1pOj6oC9B8e/7CbGM06Lax6E3MXV
 8UqKx1Y1gCuBjTRJkC5dJNlMAXomdkli+KiGWGUXDwndhnXbATyATDKjjC9dXxnshp
 EKJKzIPwnVaSq9ALE/lR3qnS31+VfgbGcQqOKzgCc93CYxOgvw51lfhDSiA2vzs+P8
 4Q+a01Cck9pUCEnboMP/gkn2AlXTijVU0ZEK5dGQkqIYzSs/N7mq5TiO+VcHjfAq99
 XB0Cgbm3twGEEZJhInWTG4EOvSjNr0WX3HYmnnzh8CeuTwrpNT/LMDT75o2DHdpIUh
 gXEOiOqGUNS5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=N5v016t6
Subject: [Buildroot] [PATCH 10/15] package/kodi-pvr-vbox: bump version to
 21.1.4-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index aec8100c77..e35d518baa 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  becc98a7d3bc8e4a78f775a34851ea1d4962e64ee4d63bbf339ac86cf12a4b95  kodi-pvr-vbox-21.1.3-Omega.tar.gz
+sha256  241aad6926579835d5d0513ad588f39ee9e99de5858655c38a25454c69372746  kodi-pvr-vbox-21.1.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 35ff5fa6c9..4b16c70ea8 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 21.1.3-Omega
+KODI_PVR_VBOX_VERSION = 21.1.4-Omega
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
