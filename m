Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28751CFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90D64089E;
	Sat, 22 Nov 2025 17:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6qjOF6z8cJQ; Sat, 22 Nov 2025 17:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA1CB40874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA1CB40874;
	Sat, 22 Nov 2025 17:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 446F134E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 357D560BA7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4-IsJprU3zP for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C07660B78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C07660B78
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C07660B78
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:15:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74E90A4C7565
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 18:15:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42412)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMrCn-000000003Hc-3io4
 for buildroot@buildroot.org; Sat, 22 Nov 2025 17:15:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 18:15:25 +0100
Message-ID: <20251122171526.2260242-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763831726;
 bh=0SajQ3Y3gMAJZkRskq7oJzA8dT/XUX1aRzvxL6Yzbos=;
 h=From:To:Subject:Date:From;
 b=yA5COkSgiA1xR/oppzrNP9i8TOhCGXvACCz5j3fe7VsixOum7Sxviu5NgPX+2WrjK
 3mat20Quixs9PFi6LC6XXBIJHVVemGIHqbEprR7cQVMp1aVtHIRVkxtjkEYeKYkQJR
 FYaxGVM2KL2CNcIL2iZ0PVMmrUAQIwx1yk3/qTtjM8sYG2Fet/COfhG3EcuSpTJZS+
 eP+9lKU94kPpmAHeeQTqGUSCH9vXVxyE/N+rfCuJJgWfpqRKfP5Gn9ycIWVIOqTIUQ
 amq8dAkP6ntEQ6PY5ZSGkvcoTQ8bR3gQYX88Di9KgUL5Po4Rklgii2rg/RUDOeQQ7z
 NF4FWIyJ0SOLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=yA5COkSg
Subject: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.21
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

Release notes:
https://forum.torproject.org/t/stable-release-0-4-8-21/20817

https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
"This release is a continuation of the previous one and addresses
 additional Conflux-related issues identified through further testing
 and feedback from relay operators.
 We strongly recommend upgrading as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index bf88d14578..ea15ddefe6 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.20.tar.gz.sha256sum
-sha256  1bb22328cdd1ee948647bfced571efa78c12fc5064187b41d5254085b5282fa7  tor-0.4.8.20.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
+sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 513cac9f0f..746eacd581 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.20
+TOR_VERSION = 0.4.8.21
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
