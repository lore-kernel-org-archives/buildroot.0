Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8172CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859EA41568;
	Fri, 29 Aug 2025 11:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzQm75uEktGx; Fri, 29 Aug 2025 11:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B07B41544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B07B41544;
	Fri, 29 Aug 2025 11:11:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DA0D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BA641559
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVW0BWJyWE9G for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E47B40497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E47B40497
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E47B40497
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 77DC3C8F1C5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DED05606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED7E61C22DAEE; 
 Fri, 29 Aug 2025 13:11:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 13:11:24 +0200
Message-ID: <20250829111125.1668963-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756465903; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ptuHlE6XlXEbWgF91uaFRkNhs8vzkGF0lSD0mLU5DJ4=;
 b=0IZegIjJDmngGoeLlsDj2bb0Ppck0Sh80FSsa+mJBiKZBN8e2leKv+mKcf3fT3bW3DtxVe
 bYy+eFuXy4r0GuPISBMLhyWbfPn+LZbQIStkvOQ1Zl5uTYEFidsuAtMEl1ZVeSFk6YQaF2
 M1IlzVQniYT1i4yqBJEpj+w58X+NtqxAviviEGQjt7bfMpllaxrmfATkLWjRSJP7hyt8Po
 U/p1QN3ialqro/Kdo4Xg9hbdICR9bWyiKvn1On4Ln80E4Gthkko6ySsMkI5l0oOqC9imGM
 28bhDwRSbaIlNkAAlgusjZXo9poCwdcgjrz4NI1rkUaefCDYTomla+BlOTUHmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0IZegIjJ
Subject: [Buildroot] [PATCH v2] package/mariadb: fix sub-option indentation
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
v1 -> v2: my v1 was messed up and contained unrelated changes.

 package/mariadb/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
