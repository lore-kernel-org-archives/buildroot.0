Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90998C5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF9A80B52;
	Wed, 12 Aug 2026 19:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei1Pyhgz8bJC; Wed, 12 Aug 2026 19:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604FB80B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786564193;
	bh=pHAjkh+mCurXSgNTXnT/HME/bfvSQwmiGDi/QTDuUOI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IfTAO3tTE50uF584l3PHXzf4ufIVH4Ilg6N3o60C/KTHpopH4i2Vhw2B6q5gsYRu/
	 cXt5hKNZzoryAT676DbWyrJxPNAW7Fxb5fTc7mhKkB3jyF3Fj3ArLoQYrOW8tzyxJX
	 3CXg1u7e04YvtNme3xp2RLqgII5F1tab6D9nrnl5RHsPLxN31laCIZ8uN9MwFdAMiQ
	 ADVfvMI2Nxw/RW782ALeMVME3T9MrveEm3C/mcrRRsEh/kBjBu7KRMbXl1PDpTL2id
	 lls2lirQAYT6JbL8gsgzBjTc/tiEGdLXZX5e7O3WNbuXP+v5UIlojvXkTz7DZk3Mi4
	 Vtabnuo3JPzbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604FB80B5F;
	Wed, 12 Aug 2026 19:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CAC910E
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55F1880B5F
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3S5AIFntDcV for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 19:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70BF080B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BF080B52
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70BF080B52
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:49:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3AD55A4C4B3E
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:49:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuExO-000000002nh-353K
 for buildroot@buildroot.org; Wed, 12 Aug 2026 19:49:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 21:49:46 +0200
Message-ID: <20260812194946.3861716-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786564187;
 bh=f3WPkf5hFM4bB5meOdGQzbZBfrJCWVofy1SL9rR+9IM=;
 h=From:To:Subject:Date:From;
 b=rgEYpB04axFdzCwVT6cw38eyEZM/ZSZ0rG5lfuKOv39u6YOnvEAwGoajcri1Tg1G3
 1SHwc1qmTfkDX9SzhEF64TRc2iV4UW2n0EsoGNEdb/BSOpiaM9YVqoi/fV+DiMcEiY
 TTvTHv46ZrNGDKGlr2pG2fqQaqWhtzBGFdmPmNuq0MgOFnoTvBzsspi40YXOuwJuzJ
 F8o8d9URgPbXXCfv3YLwaTB6KsJ5AKHgSaWqWq6L0/TmftE161y8VJkFb/ahnbk6zP
 rL0kt08ycVagtbIZVEG59T625dc3lE5Nu1aF1JNWQMMZGOz3d0C9pjH4VkVPjn25VE
 ODI8J+QHGUtjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rgEYpB04
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.7
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

https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/85bfaed2417407476856475977151c17ce60ff44

 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 5617aca5b3..511be0b93f 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.6/
-sha1  94aea4e3698a020ef081b2fea778c55e79903a19  mpg123-1.33.6.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.7/
+sha1  2922a9bb86f36c5d9082fad9baa3903aaeef7918  mpg123-1.33.7.tar.bz2
 # Locally calculated
-sha256  929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a  mpg123-1.33.6.tar.bz2
+sha256  31d0e35a4ca567ec9b5ebda6c3062bb4435d6d3eacd6ef0d95cadd7854dc03ee  mpg123-1.33.7.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 99fe6b82fb..17445395ae 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.6
+MPG123_VERSION = 1.33.7
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
