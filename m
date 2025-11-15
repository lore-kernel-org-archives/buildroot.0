Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A00CEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 10:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F65608F3;
	Sat, 15 Nov 2025 10:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3VMsGNw0G3H; Sat, 15 Nov 2025 10:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DCE608E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DCE608E3;
	Sat, 15 Nov 2025 10:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF4FD5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FCED608E3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5c8uUy1RT_iq for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 10:21:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB651608DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB651608DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB651608DD
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F8FFA4C65DB;
 Sat, 15 Nov 2025 11:20:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKDOm-000000002ws-1mIX;
 Sat, 15 Nov 2025 10:20:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 15 Nov 2025 11:20:51 +0100
Message-ID: <20251115102052.3459680-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763202053;
 bh=VfhGqByDsbSy3IaLEbZoJYtz8y8nR7nCdzo6pEzXEI0=;
 h=From:To:Cc:Subject:Date:From;
 b=0340KQSAZsSWfWqqcEoAkZk/Jhq++Ic/P2U+iwBJOF0LqOuy5qCHf49dnAoARAPoW
 fmICmadLde7SFV/OQjFqXU4codOakW4jpQUYCVE06VaGOZZ6FbRaNSTCIHZQFuXsHy
 9pz8N/5bjIqKcuX0F+XTkMB54JnpaUIe3nLBj1zHRG6w6H6pw5jJO8BoDzL3xmLCt5
 Czkb/RIHmxp1RJtT+KPBjceQx93yu7EybiHil6/YD79qO3sE0ZIxuC7UqTwirdb1rK
 0K6E9oLnI0RthajrdNBH8aiyH1qjVlOYcr6fur+yvq2pn9EqfOJLT1S3ci+Z9ljuov
 xLzZfc871dsnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0340KQSA
Subject: [Buildroot] [PATCH 1/2] package/postgresql: security bump to
 version 17.7
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
https://www.postgresql.org/about/news/postgresql-181-177-1611-1515-1420-and-1323-released-3171/

Fixes CVE-2025-12817 & CVE-2025-12818.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 3b5e773c65..efa1b5e751 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
-sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
+sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
 # License file, Locally calculated
 sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 31d0068328..86761bf939 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.6
+POSTGRESQL_VERSION = 17.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
