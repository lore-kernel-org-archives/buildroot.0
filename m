Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD110706E2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 16:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF9E5608C5;
	Sat, 14 Mar 2026 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CV7g_ltOloo; Sat, 14 Mar 2026 16:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0909E607F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773507195;
	bh=p59eBWDjnUf9kUCtFjBWP6nEVLF0gq9pA0gi+aoZ1Y0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C69BgEnwROdPXUiXapepIiIUgh60ZKms/q1O5WFuu+QIYR8NYnM5aabkLMJMiBFnD
	 zZlJd4JGSFFavRTJFsh9U3lnitBS8fTa5Km64xQxHFz1z/8yiC9AJRXoFhg2mnkfmM
	 G6ViSNmm4d+x7kEU57neHKY5lSdtgxwRGWa2gB22Ac84JU1VdpMif/iCOYDn3LgpRT
	 8y3916Fj+M2wLUUZxyWH8sjlE+PBEPyqwE7uUy67csBtkgRX2eVUAzNLiP8oayaz1T
	 i5TyGVjwfBPpwLR2uULBqWlYcVn9QSn+1Y5VFUUPLB5AZh4bqkwPxZrqkUzJ5AwRZq
	 iljH7TQVRJubg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0909E607F7;
	Sat, 14 Mar 2026 16:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ACB0201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2860982253
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_KA-6DJrxnr for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 16:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 859E58225A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 859E58225A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 859E58225A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:53:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4804CA4C082E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:53:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1SEd-000000008CD-443d
 for buildroot@buildroot.org; Sat, 14 Mar 2026 16:53:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 17:53:07 +0100
Message-ID: <20260314165307.2987410-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773507188;
 bh=zu5EAE9rcj4lNvslNHe3NoVX1x4dpWXxl5ioPlBErCI=;
 h=From:To:Subject:Date:From;
 b=uHA8w0MOsUHFcGcKXZs83DlEULio7/IQeELWRjcAdylNDnXCf1ynMiIqY64PIMBlM
 kAksb++5Ggl4pyYZPW7u+N3nNg3XmbX8Roz+MeFe0jpv5vCOXOU+YvztcKOj2HWtMU
 mnEYA4oazJc/jZM2ay498cHp42sJewh6EsHsDCuLNi5b+sf+xEIX9y840iqgrErHK5
 +G7cH3puYXaINZuLOQSh13RzkhtFWjQGkNaSAWKfxN0y4p2ppkWDjApeIjIvDj36fN
 kRgX29QjVRHotdvRmoOo0xEjzOk5cPsnz/hI5KCiSqMtRXYhjli/sxOgIy97jDfrLD
 OeflINcYhQ5ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uHA8w0MO
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump version to 7.5.4
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

https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Updated license hash due to copyright year bump:
https://sourceforge.net/p/dos2unix/dos2unix/ci/0ab159a6c80bd647f4830fb45059472eb1e11d3e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 3e9bf7882e..c48f70d574 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.3.tar.gz.asc
-sha256  28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2  dos2unix-7.5.3.tar.gz
-sha256  bff21c3509fe7348c8327745b2f80d8847b04868073c6d0861bf8c773db66515  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.4.tar.gz.asc
+sha256  f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21  dos2unix-7.5.4.tar.gz
+sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 4c57a4de5f..8794aa46bf 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.3
+DOS2UNIX_VERSION = 7.5.4
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
