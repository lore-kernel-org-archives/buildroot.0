Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861901125857
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 17:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34FA04103D;
	Wed, 11 Mar 2026 17:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Rdkx51nBvrk; Wed, 11 Mar 2026 17:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B552B41030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773251899;
	bh=FPg1HrQW1ntjwzQ979MkvAKd3IOww/huFRJX3N946wU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kNb3G7XpAMROO4KwBDvR9pf1vPMCe9z4MmnHANdo88enBq34/izevV9kYmdq1EJL4
	 eEhb/XZGB1Z2WIOCeLg6MoTRlTGrI7tZGTMuy+S8p1qeOagbnoIYzGteEu+kZPbnal
	 JJzR7E3F87VJhx3PMRZI55FVnrKqLhG1WcjvuPJy3UizNouLBkxcVFgEHC4xXOCoqf
	 gLgHjjVGy3o0ayjCc9DkyDZcqJteabciYPFH+U0zY5JpFHAemtBOXSt1YduMW+WhFc
	 9VFwZ3x45KNqlLMoCgCntMzLcpF67sbiIjI1uZLx6FZFWb/C4Gprxy78vWNed7lMnl
	 ZTkWAhNcPodWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B552B41030;
	Wed, 11 Mar 2026 17:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D463282
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F3E24102E
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYyltye4ZqWK for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 17:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CFE41037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CFE41037
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CFE41037
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 17:58:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 800BCA4C03FE
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 18:58:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45724)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0Nox-000000006ht-0ChZ
 for buildroot@buildroot.org; Wed, 11 Mar 2026 17:58:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Mar 2026 18:58:11 +0100
Message-ID: <20260311175811.3371430-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773251891;
 bh=dm3eMed8ugqaWruz7mCBtFSu21m6MFWqUAbg14IAoB0=;
 h=From:To:Subject:Date:From;
 b=D1z4R23hExASOYAzDlPNf630q+VeP0zu4A1xTNijiNrYzHkB1B1vm2tL3Mv/LRhTY
 193QdQaTFwx+rj/lo1MJD/uf42p5/AyRjmIhOKEnmVW+WgMsqvPqfyj2LJUfL3T4uM
 eJhWhxKnKBGsReQDNuydrIzRR8XaEoEpC7L1iKWcvSOGawqG6UX01ywpgckTa/dYoo
 SqZZrDJSAKE2ynvn1dtrSlUXRONhCp/NusJCKKzMzZu+TgslfXRMvijnWuJ7Z4qgY8
 t/Vw2JcUbA0R5vn30Ayjp5KLWEBSjsxqWes4KY3j8/BfDckV6BvcmexjnT2JJ+Bj2b
 b7q2qnqZb+qsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=D1z4R23h
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.1
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

https://ccache.dev/releasenotes.html#_ccache_4_13_1

Updated license hash due to copyright year bump:
https://github.com/ccache/ccache/commit/91a090aa0295b9c55cda1bda7b048d77c65400e6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 6 +++---
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 1c666c9293..d408836c4e 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.12.3
-sha256  c8e3ef79531966ecfa05bd1666c483b473df9af00896935cc468cb5ed573c16e  ccache-4.12.3.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.1
+sha256  85638df95c4d3907d9dd686583f2e0b2bd4c232d36e025a5c48e91524b491c4b  ccache-4.13.1.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  afe4bea7c75355e3a1c7bf6eec6f95fab01f2e8116d8e495e5af4c3a45513ae9  LICENSE.adoc
+sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 30f87f7d90..1f12123164 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.3
+CCACHE_VERSION = 4.13.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
