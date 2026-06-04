Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCFBCD6E68
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 06:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D580384E0C;
	Thu,  4 Jun 2026 06:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ouS-7Yg602w; Thu,  4 Jun 2026 06:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE8E84DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780554749;
	bh=o+Eke4DteUntXk2WB+idz/8cyAYP06yKGj6qzThnLc4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jBZRCfPET5lt5kMWVEPfVivxcgUtTh1DB+7kaPuDLb5Qs+tH0i1qT2AiHvZtWS/dS
	 wU6wX+pAy/lHzipmIBjM6Hp8Pud0YMCJHZzCIhGjtpUI/VFdkotGAkFnMcn1c82qoh
	 v1fMucFeKENdZopFBWku21HL8emRYDBZ6hX0Ih1zfPKG6ATiEQIn3Z9yGHRN9K08Gm
	 HUsut1aoqAMboXx1D0/xyNwnrODsPt/POuCWTIy+p6NM5x8KMy2ayyaINwSpsV04L5
	 vK3zRoqOcdwh4laCazie+BQ9LdO3wa8Pbvg5pt9H7kJlXQCP9EzU1u6u4NRBZzvLIi
	 cmrhvUZdTHy2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BE8E84DF9;
	Thu,  4 Jun 2026 06:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A1EEDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 06:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BE8561C6C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 06:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qULjxePe4kw0 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 06:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A267161C62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A267161C62
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A267161C62
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 06:32:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2BBE8A4C3AD2
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 08:32:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41128)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wV1cs-000000002RL-3JUD
 for buildroot@buildroot.org; Thu, 04 Jun 2026 06:32:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 08:32:22 +0200
Message-ID: <20260604063222.193642-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780554743;
 bh=TovOPTKwwV93hcs1YA+NrCjKn5OKytzWv0nwaOq+mpo=;
 h=From:To:Subject:Date:From;
 b=uNsquMBY/y1dcppLndIOZa9X4pafY7vLu5tnVYiptU9E20wLJw8cwoHCEzOXGw1zm
 kSMtHGorWL5D19U9X7+JCbhFej5WaTMeQi6RHHLx/ULi414xDho7drcor2LgjFc68Y
 XjTohg2+UAPEFgr1Pa2bRTui/HAZAxeQINZvuouD+MvCNE3m3rgfPXY2oR032ONAPV
 LfqmJPsbpL0oJ+sJM0p2MZybcmpVItZGbYL2ta6fMIUWgYmUZkNq0JNqFCFhvSIXDP
 uPh5YfYOCaRHq/CZTwLicUQtU5h4WJ0hOsL7Hu66wHB+BkDvSS0o7RoGxveVa+5mvU
 ccr8wr+r9m6mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uNsquMBY
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.2
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

Release notes of this bugfix release:

https://sqlite.org/releaselog/3_53_2.html
https://sqlite.org/src/timeline?from=version-3.53.1&to=version-3.53.2&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7d0e0c597611f09bfbd51f5c34d3945ece58f346

 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d520096a3b..948a603d4d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83e6b2020a034e9a7ad4a72feea59e1ad52f162e09cbd26735a3ffb98359fc4f  sqlite-autoconf-3530100.tar.gz
+sha256  588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316  sqlite-autoconf-3530200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e2f1a426e7..aa2e24e8b5 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.1
-SQLITE_TAR_VERSION = 3530100
+SQLITE_VERSION = 3.53.2
+SQLITE_TAR_VERSION = 3530200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
