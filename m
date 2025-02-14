Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05AFC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E98583A55;
	Fri, 14 Feb 2025 18:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8djHLLnVqlU; Fri, 14 Feb 2025 18:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99781849FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99781849FD;
	Fri, 14 Feb 2025 18:16:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9711E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC98402A7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59mDxOqbeNnU for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00D8C40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D8C40571
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00D8C40571
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:16:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07bc.dip0.t-ipconnect.de [91.58.7.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 132FBA4C49BD;
 Fri, 14 Feb 2025 19:16:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43962)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tj0ER-000000006Ob-26qg;
 Fri, 14 Feb 2025 18:16:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 14 Feb 2025 19:16:07 +0100
Message-Id: <20250214181607.40248-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739556968;
 bh=czZGAy6WrGqyEEPjP9POnIon10BFuh9YsZLQ/tnxVtk=;
 h=From:To:Cc:Subject:Date:From;
 b=CLr/PpeY5JJYW/S7iuaAGR/d+Sib7yJ7p4kTFlcEjfBE+LAJSPCUo50kIMZl1dX5j
 jKbOxuS/f+qQqxBxdXLE3jei0pZyvo5v573EqVXN3shmMyQ3kmmoE1/51ZxEwtz0CS
 IobJsgMwTcarvWRPa0YmcNhW70aH5zYqj3htnd12QhbSMMlhZ8rIEwhMQFdPhob9qx
 Fd1vR/jv6ccDHNgupWmAuhecvoWminuUlS1yNRVtm51ipowcgFd9xI0U9QYrEshIIu
 Jx5+YUZVTM5/kJTtZHm/5QQzKVNX5NOHm9bjME8sHXv7MvtiyDvF+9odqtdTQD5d4o
 vDN97bjD7Ttbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=CLr/PpeY
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 17.3
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
https://www.postgresql.org/docs/release/17.3/
https://www.postgresql.org/about/news/postgresql-173-167-1511-1416-and-1319-released-3015/

Fixes CVE-2025-1094:
https://www.postgresql.org/support/security/CVE-2025-1094/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=759620716adb347c1d8c8b2e6f7d88b947a54c98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 98246ca9b6..e582510832 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.2/postgresql-17.2.tar.bz2.sha256
-sha256  82ef27c0af3751695d7f64e2d963583005fbb6a0c3df63d0e4b42211d7021164  postgresql-17.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.3/postgresql-17.3.tar.bz2.sha256
+sha256  13c18b35bf67a97bd639925fc581db7fd2aae4d3548eac39fcdb8da74ace2bea  postgresql-17.3.tar.bz2
 # License file, Locally calculated
-sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
+sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 8e0ed45c22..a9ca9f4ee1 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.2
+POSTGRESQL_VERSION = 17.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
