Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD6D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D97040CEB;
	Sat, 13 Dec 2025 11:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 290U5LbGadfP; Sat, 13 Dec 2025 11:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B9F40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627130;
	bh=C5kJLPhwXwAzB7XtCpOnnvxgHA2LyJaG2847sfSBndM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kQ9a3bsZOD8327t1A0hvGJYXVeE1P+TnSzgbpTByXqKE9Rn5Ldtlj32S21jY4ky9J
	 B9DA5oknFcl8DTM+4HDnLhzhyK9FNvXzhV9LegOCXMdQmORHBc8HM46rGc5KbxnvO3
	 GIdPACpdERlGRXL3Jn8MiirafKFCRwn46hIYRVy8W7cgKk9XC/ETheUkv4JecMZLpP
	 ChuIidIo87Bhlquc81P31WRAA1MIoqR4WGmV58/6O6IeGJNTo1xMwVd9aWEFBxQUMQ
	 hLtLUSKIEjZspBTclwrrj9H9VLDagXTlUi9maCzF77gHvMLgHQATyMK2VkMuhRMJPI
	 5kqV7w0xIhyOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B9F40C7D;
	Sat, 13 Dec 2025 11:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E57072C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC36C40186
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KrcYo0LGfUt for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C257B4009B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C257B4009B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C257B4009B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C89B8A4C341C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:58:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52822)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOGZ-000000007Cp-20WR
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:58:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:58:27 +0100
Message-ID: <20251213115827.1277293-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627107;
 bh=fnS09tBzs8GyhpiwkxldyR8UJV3iuhiUoRLDAr70ROM=;
 h=From:To:Subject:Date:From;
 b=F7yxgVhkSF4cnMuU7o9BdyRXrZ6fKDo/exIMMDopP1RKLsK2/GS5PbwgaU6l1bMpr
 G90njl47SElCxHKdbc64t+HNFDAI5tLk+nwEJCGmuO5syrXGxLtpUsVcNTJOltcP/Y
 fOilomMgdapLbIT+sp3mg76Om/xP4wdwo5oipUVMacAIwxc21mF3LLFinMS1xlD82q
 HBh2cMA56AcK8oYxAcSGQ+OLeatMcyJVEDxiZ2rxy92P32Forpf6HbA2kb+SKJF9Zn
 nxUPBPYO/H0xFuuKgAshXfojnWSLys+Ie2+mGcrgVClkRBQicmaqodH1uf/n4yJVna
 DiK/VhgtbVpyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=F7yxgVhk
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.2
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

https://sourceforge.net/p/fetchmail/mailman/message/59270832/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index ddd71e6c86..3a762971f3 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59258857/
-sha256  38d01fe404e67514df394a6ed1a815bbb61aa90c0fa4402252593aced0e38a1d  fetchmail-6.6.1.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59270832/
+sha256  a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3  fetchmail-6.6.2.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 8906b6c8d2..6a63752d48 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).2
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
