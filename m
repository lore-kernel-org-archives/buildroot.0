Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FBFCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7985C61594;
	Fri, 29 Aug 2025 10:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2JtGmc-XiaM; Fri, 29 Aug 2025 10:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A456158B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A456158B;
	Fri, 29 Aug 2025 10:12:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3337DD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 253AC41554
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7deW5oJdzhEs for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:12:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E0A34154F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E0A34154F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E0A34154F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:12:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 47CB01A0914
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:12:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF79606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:12:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E32141C22DB04; 
 Fri, 29 Aug 2025 12:12:21 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 12:12:10 +0200
Message-ID: <20250829101213.1512143-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756462345; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=9NO2kB/p/8Vowdp4sXsrdjNAVWTUpSj7KikscVllJ8c=;
 b=zvH6jcvyZ1Yt6PSv5XeWZl1C2t45AhX0/wqK3lAu4uyspTEm6eC1lZvP/u8nhrYtW1+oUb
 pmuDLdcjQrYx2MdnQWBqTmjGXE9HFAohWESgJSSIH4sIZa4u5RdTbuYpfVgiHjUd41BO1F
 8T279OQ2fJXCJXJsmmv3sqgAPPQfQ5Ib1wIOxsHVspWlCopOOT+aBCktDMi7NL7TIEIvV4
 cG9glBFAGa/nlDQBckBKmNlC2lAdTTjyNQ7huHetI0Xhii3ZhDXTgREMGakM6oTZOTCBUM
 s36iolOn0v9Ha/DT3nzl4fcvKNz8q/eCfrv4vcD4+LBnexouPPu/sB5931taCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zvH6jcvy
Subject: [Buildroot] [PATCH] package/mariadb: fix sub-option indentation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Config.in comment is between the main BR2_PACKAGE_MARIADB option
and its sub-options, causing the sub-options to not appear as nicely
indented in menuconfig.

Before:

[ ] mariadb
[ ] mariadb server
  [ ] mariadb embedded server

After:

[ ] mariadb
  [ ] mariadb server
    [ ] mariadb embedded server

which is what we want.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/Config.in  | 10 +++++-----
 package/mariadb/mariadb.mk |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index acedd1da9d..693b7ce925 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -20,11 +20,6 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
-comment "mariadb needs a toolchain w/ dynamic library, C++, threads, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
-
 if BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_MARIADB_SERVER
@@ -39,3 +34,8 @@ config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
 	  Install the mariadb embedded server on the target.
 
 endif
+
+comment "mariadb needs a toolchain w/ dynamic library, C++, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 0d872442f2..239371eb85 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -112,7 +112,8 @@ MARIADB_CONF_OPTS += \
 	-DINSTALL_SQLBENCHDIR=share/mysql/bench \
 	-DINSTALL_SUPPORTFILESDIR=share/mysql \
 	-DMYSQL_DATADIR=/var/lib/mysql \
-	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
+	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET) \
+	-DPLUGIN_COLUMNSTORE=1
 
 HOST_MARIADB_DEPENDENCIES = host-openssl
 HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
