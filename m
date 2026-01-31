Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8AD61037
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 17:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F5E383C13;
	Sat, 31 Jan 2026 17:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZLsj-dF_8ps; Sat, 31 Jan 2026 17:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8EB8375B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769882273;
	bh=vGMB1ukFp6zikkST35v5LrX2uRrwPAmx4b6DqJUTVn0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IM3jDbQVzUunAm3e7Vyp41LpyrAVkoR310hgpA4hHbR7AroRlqKFvEWRNLhYDBH/k
	 zBQHRBW/o2OyHzIMqCDHkIWT59iN6CqjFYbxc39A/tRuhZVfNoYeZyX/dMAmIU7KhP
	 XO7q39vcljc+6BYqQzUS4Z4j1Yizti6m2IKKCvIftM28ncvJDhhtcam8xlUfET43t7
	 dbBX2K5/RwV714x5ZEbwaP8PbZgIi3GLgGIajlIsDgwl7p0Rc0JRayW3nk82exR4LK
	 KnrPly49fHzDuL3JGS6hV0/TSQNCTP3KIdEGZtELnPtJWJyIJIWf9a7hUvJhAJg/1d
	 4I+3idsPvQl+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB8EB8375B;
	Sat, 31 Jan 2026 17:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 626A31F6
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 17:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E65060B67
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 17:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcUSNfr3cPTL for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 17:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91E0260B23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E0260B23
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91E0260B23
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 17:57:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b95e.dip0.t-ipconnect.de [84.161.185.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A41AFA4C464E;
 Sat, 31 Jan 2026 18:57:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmFE9-0000000082o-1n3V;
 Sat, 31 Jan 2026 17:57:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Jan 2026 18:57:45 +0100
Message-ID: <20260131175745.2467286-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769882265;
 bh=+31Xaxgof9HH3z7sCzRK4tA++1/txztq5q7pmH3VhzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rl4Ddzqovefm6jUQaWEhwovmmgkak5VQ0dylH0ismzrjO3eV1tEvDpNHRktrwOrkf
 gW2pcMGpRJyIvgDhIlunAZ6p83FIzPgWH1O+EU/X/a/LmRNyHciqiK51tKC59AjHo1
 WFY50A+XOG1Me0geKz9DJjzwYZRttrCSKbQ1PjQG5qEOF0ftEcCVSHP5emnnKhkbRI
 CjKTgOXPIiY6FONAHYA/+6bNIaqhrHGfNhmAvrEMO7RN5Whs1KijC0oTRXWjjKZIG4
 hiAoG07kxyQWmeGI51sDq7fRqb28MQVLwRLwuKd43LQziYLuxfm49vT8lDZ08SU2zG
 oCLdxf0l08rAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rl4Ddzqo
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.4
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

https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes

Fixes CVE-2026-24515 & CVE-2026-25210.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/expat/expat.hash | 3 ++-
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 9d99c38a45..7536e7cb1d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
+sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
 # Locally calculated
-sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 07aba205cf..215c34e9cf 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.3
+EXPAT_VERSION = 2.7.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
