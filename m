Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39AEC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A91860890;
	Mon, 17 Aug 2026 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SS8HA_HxUSh9; Mon, 17 Aug 2026 21:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E61608AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787002980;
	bh=SKcqcJHy76XLkBeimYpRshdXN1umN54/t82hUG6Yp3o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EMbgqjXyku+vm804zlb7JJ0r5l5YyQwme57m26+fcdxyHLkGKon9ruC1emlxqxR2r
	 h78nVDa3oULh3HibIKqr3eq0HhoJETBcdcHXzejRjh9BYXhdRh9mra/kkLT1xE1WBo
	 9Z8TqaRtmPnFnus6YfQcQ1Yr+iI4w7RghLKtwyt51YHIE0UtzGRoQcLGsLtqJq+udH
	 pOXnG0TvKlCHMGAPoLGoiXQUr+9etUq2LaA7Prq7Vv+w0SEJF+IUlkw5k9Fp6D8Mq5
	 56iHykLvEDl4d9+hjt2RO0LLWD4cXXnJ7LUZFqVfS2AqfGhKGDkLsMlj9LZSE1DOHt
	 DtpLZUcF9+naQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E61608AB;
	Mon, 17 Aug 2026 21:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A438334
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10DF44028D
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuyfLY5pZ9DN for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 21:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.68;
 helo=smtpcmd0768.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 311E7400BD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 311E7400BD
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Z5ik4MEN
Received: from smtpcmd0768.aruba.it (smtpcmd0768.aruba.it [62.149.156.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 311E7400BD
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:56 +0000 (UTC)
Received: from localhost.localdomain ([93.138.58.189])
 by Aruba SMTP with ESMTPSA
 id w56awCITQtpTfw56awLoju; Mon, 17 Aug 2026 23:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787002973; bh=Ydz4XwVqdXejwGvRvZeEGV9QvLkF68rvqtvMI6+dANs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Z5ik4MEN5YgmPk6cSeQQ+98//UyZrmwABoHzZU0WAutiypC78wc7Z4vrOUcDp11/a
 4yWhTUjYYV8M2g2yg1cdTOKWxiQOuUABQ+1VJqcWQavGlJD5ex3atjQO4AJxMx7qcY
 hX4pvsn6WANU2Sz8myGf3YKlGhxMzwH8w+/Ekqtj0+qDnLi51g63bfBe8ju6ph711n
 KKLpeMypf3m/ox90ZvfoVt/zLB24j1iafieLP4JcWfiIU9+K/G/cqAdWk5jZXMtgUn
 cDx0P2F9NGnvYihX4y3K2NIradILUha5GdHbNIzDMP1aqFHMSDz4D309dsywchIUkQ
 nACXiV551S8RA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 17 Aug 2026 23:42:50 +0200
Message-ID: <20260817214251.209317-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPmtVqQvzkpjKqAUhVQYbYJuRCJVuxeMA0qZSkCtm3S9rIoLOG/HWMj4u45Q1HBENGNRr/k2Cs7EGXXXudR4f2Xgjrj1T4HiK9o4NB0krtoIiXAhQrJh
 Bxjhl+C/2f9BcWOokWkdJbceV2bXJap8BOU/5Wp66oEDw/PGyeqxJ6cBnMjg630t8uwBVRVGlCuq60H/gxcRHCz0MJnJvXuBRq6lCTi5l2p2pSrRdR68xoM2
 YAPnU33vliTEAfRnzzKI7rsoGLRuMA0oAAgbhUwC56SIhqmb0XIhgDD0jzhiwX+ou+FjL1iieDOWxthsBSomfg==
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.39
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
https://hg-edge.mozilla.org/projects/nspr/log/54e7c1b0803d151e142e30dc0d05f12e1ec67a13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 9148cf393e..9a0da47e23 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
-sha256  e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  nspr-4.38.2.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.39/src/SHA256SUMS
+sha256  bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e  nspr-4.39.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 3c7351c2d7..49fcf30640 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.38.2
+LIBNSPR_VERSION = 4.39
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
