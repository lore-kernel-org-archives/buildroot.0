Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F0D339B9
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71F16F49F;
	Fri,  5 Dec 2025 19:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY4vT5yDaHVD; Fri,  5 Dec 2025 19:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3196E3BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764961262;
	bh=ztjrH76YwUPHnzXyyUgjHmqPgFOnaqUYq+zKKLIOF3w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zh2g5MUhmDdP95t9QDDrGpH/Z5qvufpOpa64p83k1BcYpOZOPC15yrkgzZBZvMHt9
	 gkfwTGLv2uqmf7V6dSYFRO4vWIgRsa3HpIVYAyCuxzOhcibQFP6h6wvsuj47GofMqC
	 1XfmQmdZ1X/bFZxpwMghteNPkcGtKjv9grj5rJMq6yVMmLQpri2DC0NU/4AccmVhfv
	 RljNMrc/DZmHyu5wFfxErRctlPuZRN9vXgM8x15vu8xAuL7MSfm/sEBRPnBAum8XNY
	 ohcUete74kxa5y5PyEWw3qQ5sSpipudcdNKYdSChHtqFgAr1XWPbR/MIvl3LGkzrT4
	 xYkdHCG+H1NXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3196E3BE;
	Fri,  5 Dec 2025 19:01:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE3D1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2B0B40BD3
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7r_ZQOUHIvm for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB13940BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB13940BCD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB13940BCD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:01:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 868B4A4C7959
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:00:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRb2f-000000001Wf-3Qg9
 for buildroot@buildroot.org; Fri, 05 Dec 2025 19:00:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 20:00:33 +0100
Message-ID: <20251205190034.1839192-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205190034.1839192-1-bernd@kuhls.net>
References: <20251205190034.1839192-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764961234;
 bh=vZSeIQNrCUc8f8a0MbExr9NW5YuxfF0Zu84XIRm/6Ws=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OUB8b+KDJyuwv/ebNCBt4lQiTCD2g8vm+E1S5IHmcaNtg8bZrpV8c5BHDF7/vjRwZ
 jctYeMEPgbmlmN/Ps4S716VWGO9hBEuS+99mfD0RVt1Jqi0ykF010XrHnEw3/U1AqQ
 62rJHLHEhShsKv9+RTy4IwIoNyW4fUeWv4KhZV9eU1KJ8ErLn14cQmSirM5Pm/Iywj
 iWFFDu/W3nZgTvHKWeQycV1MCvYhUzX/IIoO2bBYe9QHgPoJyNnQTZ2kF/EZMa+TFh
 1t+Aad3flcUAid18X5TCKr5upmnAe9+ydUSnmGYRkEIWm4pn+agmy+Y7x+4HkQjoyg
 IfeJrxlLpPHPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OUB8b+KD
Subject: [Buildroot] [PATCH/next 3/4] package/matchbox-keyboard: switch to
 gz tarball
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

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

No autobuild errors recorded due to previous download error with
matchbox-lib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/matchbox-keyboard/matchbox-keyboard.hash | 2 +-
 package/matchbox-keyboard/matchbox-keyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
index 43ace650a4..1cc657edc4 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.hash
+++ b/package/matchbox-keyboard/matchbox-keyboard.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
+sha256  dd3e9494a9499a3bf3017c8c1e6572a4e91deb20e219717db17c0977750b8bcb  matchbox-keyboard-0.1.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index a1e3c61543..5d54a0005b 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_KEYBOARD_VERSION = 0.1.1
-MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
+MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.gz
 MATCHBOX_KEYBOARD_SITE = \
 	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
 MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
