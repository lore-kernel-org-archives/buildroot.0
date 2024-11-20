Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4472CD743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D0260625;
	Wed, 20 Nov 2024 20:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATSWndPkFrtN; Wed, 20 Nov 2024 20:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB3460AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB3460AA0;
	Wed, 20 Nov 2024 20:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B735227D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D3A8413C
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YM5tud93-2ej for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3788484060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3788484060
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3788484060
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:48:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02ba.dip0.t-ipconnect.de [91.58.2.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72D32A4C3822;
 Wed, 20 Nov 2024 21:48:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34206)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tDrcS-000000007iD-10tF;
 Wed, 20 Nov 2024 20:48:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 20 Nov 2024 21:48:12 +0100
Message-Id: <20241120204812.1886876-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1732135692;
 bh=M2Cf+42wE4FJNOP6Rqvuxq80t1p23kGBo3clfY7FlHU=;
 h=From:To:Cc:Subject:Date:From;
 b=BYoiYyDS7PHbvzVmp2lJtTXDOhIG2Qq1697xdl4KTehhwnVs8On63QoeSMWTAGop4
 Nqo0d9jkvDKjrfmKM9pkvCVvD08bEBXidb06VP5BPXHuyDQCQAMKs/iyjGJtOsQO+n
 fAVJFiYh0o8GFFCDQ5QMk9zoo0j05clBtiXzI2lfZHhC7oMtfldqK1RFSVsqhc5Q45
 FkVOiAZMLF+HELoQXjrljUwkEAn5iLVK+O192SXOc8ZmudT06WzamhnZO+muByTXQ9
 M++HxJF5j4gluqD/DlTsD/6LdK0w/vNhssr65sG6AlNcWOwI0ym8SYm6Y9/SxrhwcZ
 7bDr4QREonXVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=BYoiYyDS
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 16.5
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
https://www.postgresql.org/about/news/postgresql-171-165-159-1414-1317-and-1221-released-2955/

Fixes CVE-2024-10976, CVE-2024-10977, CVE-2024-10978 & CVE-2024-10979.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 1d9a9081b7..6a15f78628 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2.sha256
-sha256  971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f  postgresql-16.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.5/postgresql-16.5.tar.bz2.sha256
+sha256  a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0  postgresql-16.5.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4021a54300..12693e625c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.4
+POSTGRESQL_VERSION = 16.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
