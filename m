Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64875EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 16:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF0560F95;
	Sun, 19 Apr 2026 16:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0hVM93fizy9; Sun, 19 Apr 2026 16:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8677D60F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776614856;
	bh=k7pjuQmNN24x0DJqkMvE+XXvppiOR/0n8scLzdCyEDs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B4fw0WECW7j5cTpmaAQt983fGtaIo3nd7BYTvl+xJqBQZW8SSsDeuNme46HzsPP/B
	 dvS7nYPqhHuelPOx2ro9Xm7Mvq8oDsjFjWDD1G8vZ3Y5ADz/Oeshe7nIKPx3dkFAe4
	 s0LiMGc38B6DB37RQGMJwiaaCJF6rsfQLlaWzEm0UsFgToZA4oPZbwrcs2rVutzMCX
	 NlVAC86g3abF3rtOion/UdmUREJ5j6S1L3gnLdV1UxSuF/hvC59Mawn3nojbYzxuU8
	 neM89i2kDFOQqqoVaeyE2j0GV5s0YqyTKs0LK6mTBvM6PCqfbSqqcFULqa4wgq8UzF
	 LEHPQ6pCBYZUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8677D60F88;
	Sun, 19 Apr 2026 16:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A65824D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7C660F88
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1GgwllqCDKn for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 16:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B17F760F86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B17F760F86
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B17F760F86
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:07:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F4A9A4C38CF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:07:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEUgD-000000006M7-3F1O
 for buildroot@buildroot.org; Sun, 19 Apr 2026 16:07:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 18:07:29 +0200
Message-ID: <20260419160729.3281153-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776614850;
 bh=hzPxtT4QpG6YEtuinTQdM4T6sNnu0eCqGkEBv9GjBZA=;
 h=From:To:Subject:Date:From;
 b=i2bHHj1c0H6jmhHKxbxV8XkeO9VKRNvSVfDEUM4YsQJAf7S7lyiWCZQ3HlzipylEt
 DiIw+4V800A7w4OcgeylIHoIRKFJ1GR0LevWB6symb/qyePWEeMpgt7irqM1jksc6s
 jb4PoSys16ALCvg9X5cSNNfO3ndE63klTfai3W1ceG5cMIb8XVpggHcACcyj3fYs8a
 ACc7CSAQ7CZwb7jlfeHoO6prEhkk5QK0OP4/c41nv/9WOy1d7OvJkK0f6QhqAf1+nP
 SJzq5IU0mWThoOkswJjKWgddv+NRN/xyJQd2NfkaUONiz3TFoJX5dKZ7UrppOnyg+n
 d0lVclUvZwAtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i2bHHj1c
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump version to
 1.31.0
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

https://github.com/OpenSC/pkcs11-helper/blob/pkcs11-helper-1.31.0/ChangeLog

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit:
https://github.com/OpenSC/pkcs11-helper/commit/909ab8babcab354ee3d3ceff2c900b21722b9066

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pkcs11-helper/pkcs11-helper.hash | 5 +++--
 package/pkcs11-helper/pkcs11-helper.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index bc9cf3478b..3732499a25 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,6 @@
+# From https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.31.0
+sha256  46f0067bccd7be2c28f88b8bca775172b9e52fb6fc1280b44ca8bb831433fef9  pkcs11-helper-1.31.0.tar.bz2
 # Locally computed
-sha256  4c5815ba910cabf26df08d449ca2909daf4538c9899aa7f7fadc61229d3488a9  pkcs11-helper-1.30.0.tar.bz2
-sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
+sha256  e05d3ce5570debefd9763c8529fb9a4329cb4713618354216e3cca59ee9902e0  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index de192493ea..0fa2a7b162 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.30.0
+PKCS11_HELPER_VERSION = 1.31.0
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
