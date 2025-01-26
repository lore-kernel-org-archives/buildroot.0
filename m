Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18476C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 19:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35EA60661;
	Sun, 26 Jan 2025 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFmowyELANll; Sun, 26 Jan 2025 19:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2ED36066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2ED36066E;
	Sun, 26 Jan 2025 19:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8020294A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 19:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6094760661
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 19:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nwFjTYX4F7Z for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 19:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C06D6064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C06D6064E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C06D6064E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 19:24:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c8f0.dip0.t-ipconnect.de [79.214.200.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77709A4C46A8
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 20:24:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40332)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tc8FA-000000000aQ-2dxh
 for buildroot@buildroot.org; Sun, 26 Jan 2025 19:24:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 20:24:28 +0100
Message-Id: <20250126192428.447049-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737919469;
 bh=E8sjem/XaTQ59HtefHHhqXOGJEUhEVeyuZX2R21TAtM=;
 h=From:To:Subject:Date:From;
 b=fC5f7kufWkcV/vxqpHEmn52bSpfU78m/8VyU7sVRe/peNLu3+seJTG7bGfAdWqaaE
 smALZzlud70ddPjcYt54MvSBSCdnaOcv8TOzSuPC5ARRUeT6J/TeT/yskFaZcwdfL6
 c2kJekWsNnlwCavRUCMhB1D/sR/l9EG9Gz9TzoJb4E1JJRvDY73cdi3DYxJzaOrgek
 FqSN/Mjeu3rd5OFCv5XiVmB2AsRrxTT4LiTdYpXzhMleyhv9CAXyOI0oUjwyta+evT
 rDk1PW/Hrq1VYvYPL07U0Ap+UGqkbQAwqObcvjxo1dcn7JKKUoEBcEcfcucarWYx1a
 PbEi52Xl+XjEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=fC5f7kuf
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.2
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
https://sourceforge.net/p/fetchmail/mailman/message/59113044/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 52ad4856ca..f52dbed3d9 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/58840916/
-sha256  ca3fdb95141c277aca109be77f4d45b47e03ee010043058dd90bc182db518d4a  fetchmail-6.5.1.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59113044/
+sha256  8fd0477408620ae382c1d0ef83d8946a95e5be0c2e582dd4ebe55cba513a45fe  fetchmail-6.5.2.tar.xz
 # Locally computed:
 sha256  1d5eb054414ceb75e018e2830d2c2b61d3ac0df02d5376330766237a091ea771  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 077f395760..ef91196d63 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).2
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
