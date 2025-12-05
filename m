Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A2D374A6
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF4D84B17;
	Fri,  5 Dec 2025 22:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lBUUoNtTc8M; Fri,  5 Dec 2025 22:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E273784B9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764973122;
	bh=32E+Cz85egpgzOw7aVy9xNi9ka2Y5adohjXoIv0FtaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OMvr4XfANFDJD4A0+7A1GNRC/cHPpJcgz2i6fLC/aJcxp9pICvuBw679QWJ1ZwJWP
	 1V1vlhePR+kR5TpcD3hFCYCAiysvfYimacWH/mzTcIdENWTK90vRQgvAQ1i5CCLdsN
	 1KyWEuiGr0L9oFa5IFzLRQsw4EOsUyTIy42WvNt7coVc4XvBCapoF5ibZJsm9gaBlH
	 sWeqAMPbg21WsSBot87H0+Kpt9QvZFFTpDRm6K//QhUAhIhlOdMDsKxQAAS/H+uvz1
	 kbJO0aCqQRafQXwC7mFTYJU6oYfDuVXE+hpz8s9Ixb4H58zRbt05dc5KHpFQcr0aBf
	 oQ6o5mZcpa8nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E273784B9B;
	Fri,  5 Dec 2025 22:18:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FF8E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54F804041A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SB_a-2mzU7D for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 22:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A9D140010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A9D140010
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9D140010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:18:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 089A5C19650
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:18:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 787B3606AC;
 Fri,  5 Dec 2025 22:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C52B2102F17A8; Fri,  5 Dec 2025 23:18:34 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 23:18:32 +0100
Message-ID: <20251205221833.2624440-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764973115; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=jVTD2aSGcXVrCEgrBIpgd9jf8R8pVcSVHZ/7FKn5xRc=;
 b=IYjnS8gTr2ey5+7o9tI7IZSMuE1hxhVarseJxg07Wl3XyGGL34EB85tY2ITYJsDltDTeZ4
 JP1qnJPNHvurNBwGfgFZXtyC8pX0H2ZEEH/tk9CdX3D7jEkrlXxVUnUY/pgj9e/37uZA5E
 PR/IDw1lLtkEDGPSbpyYR4v8Px1AbxgC3NgLeippRhDE94AH0HxxyckaMzmYu79uCC2oAT
 2JSubMU3lgUjieduedQxQ848LJqcUDO7qQ2JY429Ga4fO9VnTaFSKkxPwGhsZJZi2iOb4t
 jfAKh/q1ue/qP5+5alc1/vsf9e/w3pYuXIlyBZd5LYR30V5HvQVTGgbhGozHQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IYjnS8gT
Subject: [Buildroot] [PATCH] package/python3: fix build on Sparc64 due to
 glibc 2.42 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since we bumped to glibc 2.42, the build of Python 3 is failing on
Sparc64 due to the removal of the "struct termio" definition from
glibc. Since this only affects a small number of termio operations, we
simply drop support for them, since they basically can't be used
anymore (and we don't really care that much about those specific
operations that only exist on Sparc64).

Fixes:

  https://autobuild.buildroot.net/results/28fee0f8368ae3dc1d607ebad4881b736e360f07/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-stop-using-TC-operations-that-need.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/python3/0009-Modules-termios.c-stop-using-TC-operations-that-need.patch

diff --git a/package/python3/0009-Modules-termios.c-stop-using-TC-operations-that-need.patch b/package/python3/0009-Modules-termios.c-stop-using-TC-operations-that-need.patch
new file mode 100644
index 0000000000..0381a1c54b
--- /dev/null
+++ b/package/python3/0009-Modules-termios.c-stop-using-TC-operations-that-need.patch
@@ -0,0 +1,72 @@
+From e4210a767ca27689cee8db84ce2854d1dde917c3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 12 Sep 2025 21:04:24 +0200
+Subject: [PATCH] Modules/termios.c: stop using TC operations that need
+ termio.h
+
+Modules/termios.c makes use of TCGETA, TCSETA, TCSETAF and TCSETAW if
+they are defined. They are defined by kernel headers on a limited set
+of CPU architectures, but require the "struct termio" definition to
+exist, and this structure definition has been removed from glibc as of
+version 2.42.
+
+Since these are seldomly used, we take the approach of just dropping
+support for those, in order to fix the following build issue:
+
+./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to incomplete type 'struct termio'
+ 1119 |     {"TCGETA", TCGETA},
+      |                ^~~~~~
+./Modules/termios.c:1131:16: error: invalid application of 'sizeof' to incomplete type 'struct termio'
+ 1131 |     {"TCSETA", TCSETA},
+      |                ^~~~~~
+./Modules/termios.c:1134:17: error: invalid application of 'sizeof' to incomplete type 'struct termio'
+ 1134 |     {"TCSETAF", TCSETAF},
+      |                 ^~~~~~~
+./Modules/termios.c:1137:17: error: invalid application of 'sizeof' to incomplete type 'struct termio'
+ 1137 |     {"TCSETAW", TCSETAW},
+      |                 ^~~~~~~
+make[1]: *** [Makefile:3403: Modules/termios.o] Error 1
+
+This issue is observed at least on sparc64, but not on more
+"mainstream" CPU architectures, as they do not define
+TCGETA/TCSETA/TCSETAF/TCSETAW.
+
+Upstream: https://github.com/python/cpython/pull/142326
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Modules/termios.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/Modules/termios.c b/Modules/termios.c
+index f2c5a4bafa7..43a7893c5d5 100644
+--- a/Modules/termios.c
++++ b/Modules/termios.c
+@@ -1115,9 +1115,6 @@ static struct constant {
+ #ifdef TCFLSH
+     {"TCFLSH", TCFLSH},
+ #endif
+-#ifdef TCGETA
+-    {"TCGETA", TCGETA},
+-#endif
+ #ifdef TCGETS
+     {"TCGETS", TCGETS},
+ #endif
+@@ -1127,15 +1124,6 @@ static struct constant {
+ #ifdef TCSBRKP
+     {"TCSBRKP", TCSBRKP},
+ #endif
+-#ifdef TCSETA
+-    {"TCSETA", TCSETA},
+-#endif
+-#ifdef TCSETAF
+-    {"TCSETAF", TCSETAF},
+-#endif
+-#ifdef TCSETAW
+-    {"TCSETAW", TCSETAW},
+-#endif
+ #ifdef TCSETS
+     {"TCSETS", TCSETS},
+ #endif
+-- 
+2.51.1
+
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
