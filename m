Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C0ED13560
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 14:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B54606F0;
	Sun, 27 Oct 2024 14:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDmzNYOHDhKY; Sun, 27 Oct 2024 14:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B2B60643
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B2B60643;
	Sun, 27 Oct 2024 14:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF7F971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 14:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC0160643
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 14:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb4KKKUbGpVB for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 14:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6716C60593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6716C60593
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6716C60593
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 14:03:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1befd.dip0.t-ipconnect.de [84.161.190.253])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C14DAA4C0A3F;
 Sun, 27 Oct 2024 15:03:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49732)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t53rx-000000008Sd-15fa;
 Sun, 27 Oct 2024 14:03:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2024 15:03:48 +0100
Message-Id: <20241027140348.3551966-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730037829;
 bh=EpQZHoTWLEs89MPvQMYn6vHVg7N/7Ca7CLKf7B3JW14=;
 h=From:To:Cc:Subject:Date:From;
 b=rrzkOb3jhJ+vaLhFXd96htSFmnz9Vxb6TsmlbITMlUn2lnMjmIrxJddcIwLsXOmbi
 xShqGFdKsgBrYJ8KZgh2JZqtYNYcvO/JJuGzLSeW/NmdyzSjZ2J2JdiuaK7GfPaqCG
 yaq/ZuDV4UB9RZmhSIq961EiLuWV7hNB23xOAe0rDDUEbezmG45qguSNNistwYbeKH
 M/9+RYhClU1jDz2LmncexURytuFasKtw9ffny+m4NE1deVaOlru0Gj6CtNMJtgxon8
 rkDuac1DU0SPrJcOFB7JfUIQ7hBp+6mLFIhkbXFDXKOJe2JEqtqzvLYj8KWTfpjzu9
 omNhqvVQ2lv3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=rrzkOb3j
Subject: [Buildroot] [PATCH 1/1] package/monit: security bump version to
 5.34.2
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

Changelog:
https://bitbucket.org/tildeslash/monit/src/monit-5-34-2/CHANGES

Fixes CVE-2011-1473.

Rebased patch 0002, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0002-configure.ac-fixes-missing-config-macro-dir.patch    | 4 +++-
 package/monit/monit.hash                                      | 4 ++--
 package/monit/monit.mk                                        | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 31b20b3cbc..3bee55cb5e 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -10,6 +10,8 @@ Upstream: N/A (specific to buildroot)
 Signed-off-by: Jens Maus <mail@jens-maus.de>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Bernd: rebased against 5.34.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac          | 2 +-
  libmonit/configure.ac | 2 +-
@@ -21,7 +23,7 @@ index 3c3d30a2..f4c5ea07 100644
 +++ b/configure.ac
 @@ -8,7 +8,7 @@
  # Example: 5.0_beta2
- AC_INIT([monit], [5.33.0], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.34.2], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 1d9feca57b..276e0a19d8 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.33.0.tar.gz.sha256
-sha256  1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5  monit-5.33.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.34.2.tar.gz.sha256
+sha256  291ca3d898e9b425b6d0c1768728fecd6c1cf4c268c79db15fda26285ad5b832  monit-5.34.2.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index e3a4fac936..a2d8073c31 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.33.0
-MONIT_SITE = http://mmonit.com/monit/dist
+MONIT_VERSION = 5.34.2
+MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 MONIT_CPE_ID_VENDOR = mmonit
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
