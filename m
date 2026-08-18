Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE71C5DF7E
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 12:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF7E608C9;
	Tue, 18 Aug 2026 12:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDrFfL1BAvHn; Tue, 18 Aug 2026 12:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753C560622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787056274;
	bh=HsEjMu+O2vAMdFUqBy8TgSeS2E4GR14DZ+BwQJtUcsM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qEIccjgDWquGZ00EjtapQpvkeyAF3viYLgdoEZftd3SDKoZhVXfIiXq2pFcJyI1DW
	 cqBNDWWgOX7vVp6znsseZ/3S8I+vVnMO1eRfuDGM45STJZHc0n7G7/6Dkk4o3kvN6d
	 5OGYrV5SmS4tAMlQGah6t1lxMzmScnG4G28xU73s7+yt+ikmnjqWDHuOogXrF0Wuxz
	 AqdP+uhDjUUXP/1b7lRM8RkmawXXyCQMXXWq6g+Ctnt4zCTu8br5GdLB1VigXvbVWo
	 n/LR65L0H9CHzusJVEWKJvwUo2xwgyisG3aBocljkvWjqt53PlwdSB8Yh4r0NER7Co
	 CAvx1BPacW3Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 753C560622;
	Tue, 18 Aug 2026 12:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A61F52EF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 12:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C77F40765
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 12:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zZEgycwBfEA for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 12:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.13;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D91F0406C9
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=green-communications.fr
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91F0406C9
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D91F0406C9
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 12:31:10 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MvJo7-1wf31P1U9Z-0152AX; Tue, 18
 Aug 2026 14:26:02 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 14:25:16 +0200
Message-ID: <20260818122544.18514-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:GTd3jZ4bcF+1GNjqYIVSNtuF+PF3qB0aZsuOong5HknEGJHwdQM
 K+uTI9dGTO1j5bgea9Ht3EgL+kS2LRJ7lC6+OATKwwSEYi4iTY3PF822RSeuBET/s+ZxFEB
 EjATpF1WKppaPkFGTjs1JPspgcgcv4dyASsAJU4X6oyTgMXZTUgpFeiYwXJ2fO8L/K1JvSn
 NhnYsfVZlcubOm2shH5dA==
UI-OutboundReport: notjunk:1;M01:P0:/EDrfnR1s2A=;GJZ6lbsw0YgD4nSg0I1RNO+MRww
 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
Subject: [Buildroot] [PATCH 1/1] package/libgit2: security bump version to
 1.9.7
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

Fixes CVE-2026-5917 when used with libssh2

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.7

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 38486c4e4d..f8e8a042d5 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a88a42a4ea9bdab7aa8686eead3bf7d9c6dd74529caca16ab22eaa92433d31d9  libgit2-1.9.6.tar.gz
+sha256  1a4fbe7589e814777ae76b64734ad80f4ecad22cd33a22682a2aaea4ae5375e7  libgit2-1.9.7.tar.gz
 sha256  e0938121c0554985fe17196ac38fc590d149268e9c46e0c0e7a2eae1354fae71  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b4d9984540..7ae02654f6 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.6
+LIBGIT2_VERSION = 1.9.7
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
