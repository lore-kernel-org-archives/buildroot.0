Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E7CD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 06:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E117782151;
	Thu, 14 May 2026 06:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwSxaOewo1EE; Thu, 14 May 2026 06:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA158213F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778740861;
	bh=1/u1Ko7+gN78D83DR8ZmQImVBRkO+ooUT4KMVDMJt7M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pulbSqdOe9qYikQ+52N9xK8d3j229ph2GqwHFHrf28qHbcqiv8nFx0IzGhKovXNH1
	 oGXMcBU6DK0sKHsDtsY4HjWn+FnBNH2tIqRuyywX/b08RU3zlTJWxrvh+NUYCJvOXt
	 kO75z3i41JyndoeNZXr+HORByFT8lpP1E2QFLTECHNxJthnBUQA/gvRkgq4Ua6dRND
	 /rCd9CaeeIwgA5g8FDlNNdQqndzpvOuwYU9EMOs+TDsgrdZ+8P1es8Q5AYJv6tICrZ
	 NyPwwqfcVcu2NUJWkuTWo1Q1Z1JGlrLpP66xTEtI3e/FFdh3+NPTf1c64hccVcqXKI
	 xhaf6+xB6PnIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA158213F;
	Thu, 14 May 2026 06:41:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79AC337F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B1FB60D8E
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpOsnDjxrzgo for <buildroot@buildroot.org>;
 Thu, 14 May 2026 06:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3144560D8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3144560D8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3144560D8D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:40:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c094.dip0.t-ipconnect.de [79.214.192.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2878A4C0D73
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:40:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59500)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wNPkd-000000003yj-1vAE
 for buildroot@buildroot.org; Thu, 14 May 2026 06:40:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 08:40:55 +0200
Message-ID: <20260514064055.34049-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778740855;
 bh=mxHbae24kPc9JQFIrueCdrmPRFQh+YK5TZ7eqM2Tc4w=;
 h=From:To:Subject:Date:From;
 b=S6R0Q0c217nI54aPGesquB9u/wwPM1IhexlrbGBAIG5yZLKjAAzGw2VDcfmWXfpz3
 SPgrBEX00HnK+STBtQq2SDrOEVOmtSCsmZaks7CTK67tGjzQOHYbmfDv1X1yuz+3P+
 PNPJLh3Y6eMZXiKCzX5rMTwogyDCiPUbuH758PbN7I9WPO2F4fPIA+NIVGX9Wl/i0o
 yUnxSMp8QT8utgzu8WyRtA0kTcapi0F7NLPpiIr0uoTz1+4ZxFIPyOy8j72080L9ac
 i9ExVsc7NZ0GTXkGDnnxmfXw2856BZnJ8QAGkl3PTDa9/AFJAkuuRDuJzAqMNjuIAq
 XwEEJ69FP+G2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=S6R0Q0c2
Subject: [Buildroot] [PATCH 1/1] package/sed: security bump version to 4.10
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

https://lists.gnu.org/archive/html/sed-devel/2026-04/msg00027.html
"'sed --follow-symlinks -i' no longer has a TOCTOU race [...]"

Fixes CVE-2026-5958: https://cert.pl/en/posts/2026/04/CVE-2026-5958/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sed/sed.hash | 4 ++--
 package/sed/sed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 10e2c36d8f..1f1a578813 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.10.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
+sha256  b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7  sed-4.10.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 8165083658..cf6d263b06 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.9
+SED_VERSION = 4.10
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
