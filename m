Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469D410AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18554401F7;
	Thu, 26 Mar 2026 21:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyhkCAsKSaQg; Thu, 26 Mar 2026 21:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4519D40945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559767;
	bh=bcF9jE7x5k8g/JcF4KNjtvG6ruwrjs6Z2mh1C14JkXY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qLahNYpGI530wTOdZ5c5ch7e5xACjTwAZMbA6FacGk8UFNF6JYc+TkucDDTXDMwG3
	 YonFwxb90YERGtQEV/VWBuQziByqmOr0Li+mJdA1xd50AIVztoUGo/1TWDRKq/LWLA
	 GtXEKN/EPRErIkbdwgQFNI5JUtOjAQyuiz0mvbCIMZryf0S13hh7Uuze19iaWQ4qQI
	 5qyO+feQZP8rJfYFCuMkzUlD9zb6JShQgfMjmkPKYUrYaKwAXh3R0ioFUSPzWp6xmr
	 A7QfImK67oiFYumJJlLyEYm6Qpn2Fml4s4o48HWj0GBeogYQsLak8Oe4TUxq4nX8Zg
	 cNXG5W861gz4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4519D40945;
	Thu, 26 Mar 2026 21:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05158249
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2DE401F7
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VE3qq0FGsGqw for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6A7440E7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A7440E7A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6A7440E7A
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:16:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69B8AA4C0DCF;
 Thu, 26 Mar 2026 22:15:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33618)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s3T-0000000075C-0Glg;
 Thu, 26 Mar 2026 21:15:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2026 22:15:51 +0100
Message-ID: <20260326211551.3598750-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559751;
 bh=b8Z/Y6a/23Xm5aU0pv7+0PCH0micwTrVDLrXrHYwqBs=;
 h=From:To:Cc:Subject:Date:From;
 b=JHnTtwSp1B7gg7TPp09rObGx+XZ8ZyyOODJaVzVFpQlL5r93N4vusBPmA5v2/UTjr
 W93wOeaiaqoyToHhursoEAQtje9ivp+ttCG1cdSPZ25ujf0TYpGU3n7JOyzi7/G4CJ
 LdD+NkWZuKtrMESo9SE80PhPhQHOaDj1oHzVDUobw11jF/pIG6iEZ27vVpYKYEWv2s
 nj7EROuZW/+/+UezC1kGczsuKMBZ+EQ9vKDDdj/nP7/r5BJuCSaBU3jHoxmO4gtPTV
 GtXFjIunvZ6daWE4ygFbLSrReyQzNrCfT7sUzlGcSl3ZkoIsMJLRw9b3JOXo0Rd6zC
 gSAEbKinzdlyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JHnTtwSp
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-16-g5c6fca0c6
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

Fixes CVE-2026-4437:
https://sourceware.org/git/?p=glibc.git;a=commit;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d

For a full list of changes, see:
https://sourceware.org/git/?p=glibc.git;a=shortlog;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index ed6d69acc2..abf8d4db18 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  5e21722755f466d15770574788394a4abb4fb1e02603a707beeb199706a26a46  glibc-2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160-git4.tar.gz
+sha256  f19dbfef9499e97a63b1f309252d43fba36edf244561f38f8e00cbbbe04e106b  glibc-2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 64a2c58377..6cdcf5ce93 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+GLIBC_VERSION = 2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index aa746a9d70..bac90d47c1 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+LOCALEDEF_VERSION = 2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
