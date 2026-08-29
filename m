Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42951C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 19:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5938605F3;
	Sat, 29 Aug 2026 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7qgGBncOjYi; Sat, 29 Aug 2026 19:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788030480;
	bh=ySAHX5r4N2WbP+f6v2hhClk/hTxcjkGRbGuzde/l7FI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CvE37cNzH107YH7/Xt75J2ZDZ+UK58WyrK4Bn8riDsCzp791oTn5RgiWBVI9XniiW
	 PH9VbnBW1URqA8Q0M1uDUPjCoZoUrMStL/M7c6/a0LBdzCaNZ06krYxE8iLI4Vp1tc
	 usvpQeP4yW8nmwsL5rQG0JNuSoBnA+bL9hw12J8m7G9lAkdRztMViS6BDiFjnbO3fJ
	 nHRIQy3O4f3qT0M4E5h42iFqw8IVuPQZqOxv43KW2C0ddKJ6HyEs5TwY3z1I6UJrNb
	 BVViTK4k/QFrDBOfU38q/XvJncbGs0ZDIXMrE0f7kNtv8AwXtJx84fZlpvB+n3Wx1I
	 RAkO5sEeqZ0Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DFFA60607;
	Sat, 29 Aug 2026 19:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 769FF118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C40A60607
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GqFcS1yu2nG for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 19:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HnB0JS4m
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66475605F3
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788030475;
 bh=Z2mAo7DrG9j0HKXHkh3VrtsCpUqrexZernhFL4Q5oak=;
 h=From:To:Cc:Subject:Date:From;
 b=HnB0JS4mDNSWbv2DtMHGpo23utHk75GO4r5lwSh8GNmM/dYmliio/XMQr/2sNbxOo
 IBKllYEqPB39VGS7VmFSDwnhit1EGBFCknzbjTjN2RRXahVR7GNyP3DtQGYSChi29e
 xOTGTROmmH3Dvn3Yg9umGMH7vui/uQfYxDNtx06j1216GmxEYIgq2LfI68tKVnqtuF
 YabhbM+cGr4OZohW6i5VYQh0pE6WILCfT/ob8eSdArWHBJwOhL8RltyDcodhBRvKIw
 ERPrv4Vua2VK+CMFk9rN9Wt8XlPWs9/YBBVQX8gYaJw/3RveOS6daM+eSV671iOwib
 6bVEGv/kOqZnA==
Received: from fli4l.lan.fli4l (p5b3a0f14.dip0.t-ipconnect.de [91.58.15.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98097A4C0707;
 Sat, 29 Aug 2026 21:07:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1x0OPD-000000000F9-3CBh;
 Sat, 29 Aug 2026 19:07:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2026 21:07:55 +0200
Message-ID: <20260829190755.1764700-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-36-g2d5421ffc
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

Fixes the following CVEs:

CVE-2026-19499:
https://gitlab.com/gnutools/glibc/-/commit/63b53df549451a5d69fcba6d7612ea99f517e8e3

CVE-2026-77117:
https://gitlab.com/gnutools/glibc/-/commit/6f9b2bfa500bf5d1cff5d990adfff4b71298dadd

CVE-2026-80489:
https://gitlab.com/gnutools/glibc/-/commit/cb61572ea3f773e1e1978f6c412cc36a30acdb0c

Added GLIBC_IGNORE_CVES for CVE-2026-19542 which was forgotten in
buildroot commit 58f31377389dd2f5090e4dd69deb4d5f994f88c0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 14 +++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index bfeb5ab6bd..8d69de7b2a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  028aa13d6c0737aecf0ec6ac0fa842e3a18c82bcdaeeb800d42a65a76dcbfe91  glibc-2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032-git4.tar.gz
+sha256  39f6808e31a02da42f774912c6754ea22d5f076c4e935b1e233f3602d4d772c0  glibc-2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e0332dadc4..f39e959c29 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
+GLIBC_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -25,6 +25,18 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
+# Fixed by 2.44-26-gd6ff274313d79feb864cc10eb775b91c817a67e9
+GLIBC_IGNORE_CVES += CVE-2026-19542
+
+# Fixed by 2.44-29-g63b53df549451a5d69fcba6d7612ea99f517e8e3
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed by 2.44-30-g6f9b2bfa500bf5d1cff5d990adfff4b71298dadd
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed by 2.44-31-gcb61572ea3f773e1e1978f6c412cc36a30acdb0c
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c88f3f1fa6..048891724d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
+LOCALEDEF_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
