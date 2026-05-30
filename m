Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47907CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FF58484C;
	Sat, 30 May 2026 22:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADX-mMS0vaod; Sat, 30 May 2026 22:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA4F8484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780180914;
	bh=t4ZCtQOdRBhcbg4RsWNqNwtRorNz4+uSJAHsDAaJ3K0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WXJI22pajOL2BUpj+A/+MWI2KBk4ggoOM5IkkEdZIdagIzabND0Z+yXIGljME9pFQ
	 rqPeUsKDIJQW8tOxoN+PjHgoOIs+MowC+LS1+k62oeHmzTMFZ89BDaEiI3I8jsR4ZU
	 Q9U5SwBsGs7HpXx2PLd6hd73IwdjB6RvqTSlP1Cu2Zy2UOQaF+f5P9sWrubMflqZwY
	 jNpB9gSQkZoGBsPcn712K0MrOJQKEVwlVs14vGRWQZMjtGLiksmEfyhtW66dOl4hsH
	 cOpoEIfXgCrF55+VTwsBljcg0cHRlut8buXiyDe2NaXJfh4Scr8fM2SlEzkoHEb2T3
	 8BjKjN4XwFsYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA4F8484D;
	Sat, 30 May 2026 22:41:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0002389
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0CC98484D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTbZufy9qMFV for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07B728484C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07B728484C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07B728484C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:41:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -680662496; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 22:41:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wTSNE-00000006CWb-1cPP;
 Sun, 31 May 2026 00:41:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 00:41:42 +0200
Message-ID: <20260530224143.1478100-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FNMkzxBULEaWHcuFT7uh/K4SV117zrxp6pSBM7vUxHRoyjCYnHuaP98cAURzQYZe91NXgTf+Q6QaLpifl83pm/+4QGpKBm67Q29nPqP1bsFUOzmj34iMCfCMQ6D/mNeZjiNemlDnoXXCI1EWkYCGimq49+lmxu1exL9FQHq17/UPKv0aAoFR7YJ9isXpPsCWjycdeZ/t3Ab7BpLQSoCJuRH9pTpOOoW6fnoootWLpbApi5wK4vD3TXzWSAV307Mu87H5slb46tKsGXGumfDNzqVoGD+pJsJjLALVfW2tWmiLuqwUi85IBSqhx0LlTb/nKow7ODfycFHqVOUxoc3lcg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=hYcIX//Bs6G080WCpH3shPo9JFqwCkOAfXhzjzuHhVI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FNMkzxBU
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/sdl2_image: security bump to version
 2.8.12
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue (in 2.8.10):

CVE-2026-35444: Heap buffer overflow READ via unchecked colormap index in
XCF loader

https://github.com/libsdl-org/SDL_image/security/advisories/GHSA-gq8w-x74c-h6p7

In addition, 2.8.12 includes a number of memory related bugfixes:

Fixed memory overflow with corrupt LBM image
Fixed crash when decoding an invalid XCF image
Fixed out of bound read in GIF decoder

Update hash of license file for change of copyright year with:
https://github.com/libsdl-org/SDL_image/commit/281b4ebcb02b106995a0c7fc21f689c160d3fefd

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 9d5ae395cd..16b78fea11 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  393f5efb50536ec13ca4f4affb69cc9966d3c3f969e6c5e701faddf9f9785381  SDL2_image-2.8.12.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index e058cd9f74..b31afa0f08 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.4
+SDL2_IMAGE_VERSION = 2.8.12
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
