Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213F9CD4F4A
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 16:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C521760DC7;
	Sun, 17 May 2026 16:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M24WT_BXE1vD; Sun, 17 May 2026 16:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0786F77F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779036067;
	bh=K73HGnpvI67GQ1h/mYxX+LAWRS69175FjMVe+QC2XMg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XvgZ2wWtEc//cxTxG6Ri9f1eSrymCxykJDMuRqAdattaALDMu9aPTQWmDxY3giN5z
	 t4f94iMFUhYMipfozCkVMtfYkwHQ00rcmMlU9hzlcPMLxJQINUFGmtVSpTdLS4JDP/
	 TFzqSwD3qo9BWxiCq4ogk/N8NXi1OMfIh0pbcw22ccKmMH68/zC/d/WB+RiN/EfAZB
	 l9I+eBt7+uOKeSg6xi1ugz3BP3iQfBoJrPNp8Nam6+ueQocN3XEXCei+BSqnSO9gzY
	 OGhTHFfYOy2tb8hAZxh+5LxvAFHRJrIab8ddVpCu2+N5JKLR9zAbiqRoX69Dv2zzW7
	 miI5rDUfjXTXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0786F77F;
	Sun, 17 May 2026 16:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEFC390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 16:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0475D40F6E
 for <buildroot@buildroot.org>; Sun, 17 May 2026 16:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkJ4DcnLjVsT for <buildroot@buildroot.org>;
 Sun, 17 May 2026 16:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0D5940F70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D5940F70
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D5940F70
 for <buildroot@buildroot.org>; Sun, 17 May 2026 16:41:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcce.dip0.t-ipconnect.de [84.161.188.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCAC7A4C1EA1;
 Sun, 17 May 2026 18:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42628)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wOeY2-0000000085X-15aB;
 Sun, 17 May 2026 16:41:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sun, 17 May 2026 18:41:02 +0200
Message-ID: <20260517164102.3570510-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779036062;
 bh=oY/vQqiKvU+w++1diKw/MJxHkKTiITEQyj88VzEQy7o=;
 h=From:To:Cc:Subject:Date:From;
 b=CMxnoclL9ykukiobdxQccnPtJo2d4W7TP90L4RC2GBzhx5TFqmHt6Fc9PiC/VnDkM
 eyev6jaZvGMMDmaq13ta+bpzTblXxtZ81PtQX4RvCEgCvwUnpzdgg02iXdAd5obt/8
 LeryZrHOc3YIv4x3rp5ChDJW/xkxUMp2IH6T+2vZvNZlne0LYen8XCp4SAR9mTnku9
 0H/awUaa9iB12XeX6lqKZ/HFpRMSR8QdWKyNXi7MYb2VeDnkgJgIASaxWPPLwxU8vu
 YMnr/NEvuQiIvMasVsGMY43Z4oYAyA3d5HgX90tcnYJCVcpcL7JZXHvAyJ7bC+nRuI
 hqHSva8ZK5HAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=CMxnoclL
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 18.4
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

https://www.postgresql.org/about/news/postgresql-184-1710-1614-1518-and-1423-released-3297/

Fixes CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
CVE-2026-6575, CVE-2026-6637, CVE-2026-6638.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 58eab8e548..be57f216f1 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
-sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.4/postgresql-18.4.tar.bz2.sha256
+sha256  81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094  postgresql-18.4.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index fed3887ef5..16ed591df4 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.3
+POSTGRESQL_VERSION = 18.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
