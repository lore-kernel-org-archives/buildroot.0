Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71961D1A63D
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE804031D;
	Sat, 10 Jan 2026 18:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AitALYAsTiOM; Sat, 10 Jan 2026 18:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115E24034A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068372;
	bh=nqIYfV9FyhSLB0FGEQdHqsVs7nEWBjTzbcr+oFjjQPA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ab0V4d/JLBKzAaYIog4zDRqPWoNgzxzxX7Kdaw/XhO7W5g4BGhW51FYJT+HHGDdae
	 HQw0EEz9mq1rwTvXA543Ec577JjoWFiWf4t9GqiwE1efQgAs30G29INpW+hm6qA+jw
	 2qeVliGZLDiC8RoDazfFOkoK41QHnRkU7aLPtdM9DEuHyPPWumNg69Wsb2jKccceOq
	 3RwxigMppLDt/QrmQljUG1t77JK8KLrXnm99NStvhtD1x0cBLG/o01Q9ebLBHbef/q
	 sxfG1M9XvYD0+sUEXgY/i8PQrEdc7hLkOs6y89SH80FSiR8XVXpVXtB5JTgaJefti0
	 Vbd8XodPjOasQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115E24034A;
	Sat, 10 Jan 2026 18:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ECE612E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 753AB40240
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaoKb7GVsWfS for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCC7B4006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC7B4006B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCC7B4006B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21E8FA4C362F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:06:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedLg-000000007ln-2HiB
 for buildroot@buildroot.org; Sat, 10 Jan 2026 18:06:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 19:06:04 +0100
Message-ID: <20260110180604.2187061-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068365;
 bh=BI1oaGMvdWMKkt5PFVyWnUi40NZp8Ewyd0/c+/Jom0Q=;
 h=From:To:Subject:Date:From;
 b=mUiADF46S7jW6q5o/FG5jj8zplOfq+fat06MV7NTPtF06FXfOrOg0Wndj7EKpF8XO
 glIjA6HgWwKkEsfbYM3//1gR8fZcAvsYnkXNf+krXhudAyvr7oZw49ew/KArSgJK8Q
 feweCH9NRbP/FZKtMCNIk3zC1eQ+XaFW73azD//LLzoSbbko4dH1m8BiV83ycF9JkE
 c0H3kF33j7C+/mEK/evJmlS4wzmzgR801D48IQ1UcNfYVyMF7Pfp6yLqkJtFjA1bNC
 OloDFNUmviYRzqjcP315Co/viy9GruPCuZ6QPdJdfWX0cPmWwhtujcSlZljvDNza/m
 K1aOD63lHVy3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mUiADF46
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.2
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

https://sqlite.org/releaselog/3_51_2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 19d5584625..055e935a4e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0  sqlite-autoconf-3510100.tar.gz
+sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ca8071c78e..795bc32dbf 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.1
-SQLITE_TAR_VERSION = 3510100
+SQLITE_VERSION = 3.51.2
+SQLITE_TAR_VERSION = 3510200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2025
+SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
