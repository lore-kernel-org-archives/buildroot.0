Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD82F36BA9
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 05:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E97360731;
	Fri, 10 Apr 2026 05:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUDBWVMMfFIi; Fri, 10 Apr 2026 05:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8934B60857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775799059;
	bh=qfaH5+JydI9qp3PHUbyncT/ChiUOWyAu7iEmQwZyXIk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H58v2EDkLDxPdKtUbDYqq6kOqcDGvyjLU5w0GCADa0qJTiGNEOIeyyZgTKSewFmQw
	 o1BFtYIpdn5+605REgdAo5NZK+sMYHN7JLauMQ+iPDplpYnT2iNey2iuxSzqyAq9BG
	 rPnyV7WpfCXK2iPBqEwsZ4GWMmFCVMI6B9DxsORcDsJuh1KxF8jDxbm9sx1aaUgNzC
	 8Kz7QAvohODd0oButwhiz6S12YziwUHH9HWOiieULU2uCKSq0csyP4TzsP9+F2MIJ9
	 sr093A+wWuPi4AcV1iEuuv+iF6JSWzUCn88B4pLbUSJsDnHuPwQyRCOIeHF9QjsrXm
	 hfiZ9QoYLKwiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8934B60857;
	Fri, 10 Apr 2026 05:30:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 648AD1F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58761816D5
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-wdLaptSsV2 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 05:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 859BD814C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 859BD814C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 859BD814C6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:30:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a090a.dip0.t-ipconnect.de [91.58.9.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE489A4C1087
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:30:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51424)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wB4SF-000000000dF-2VZ7
 for buildroot@buildroot.org; Fri, 10 Apr 2026 05:30:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 07:30:55 +0200
Message-ID: <20260410053055.304955-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775799055;
 bh=agNJ6PCkpNW8r6lZnxBAwuHSjHJcnGaGEuuXCDEDN0Q=;
 h=From:To:Subject:Date:From;
 b=WQUR7+QyQtZ46xUMvUCybdAB+mC7YZsSaRWQN3OR1ulEIx1aM4Y/nD6wmEnF2wgs8
 9sZRXrDMjwJCxAOCkWn7vp9iclX/467IzT1SDiTrjaQ2gCPZBkAZ8MqwRu4uWQwMxx
 8mdo0jK2jqYrmC8AeUcNgbUzu0ou8D+duxJwEs+V86bszHdQjeHe23VoKAuphB3gQ7
 jK1dQ5Gg7zVrA+Nto33cNi92gbYBjly8Q4+G7ANqlM9E2eBQP6qZXqqUaw280hkA9u
 2w7v9BUCH4LlvX3CnNG1I9Tt34AIesfX5dVx9h0ZUGNREsp++C9D0bKQwPPG7ckO/E
 XKsUECfI+Vqpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WQUR7+Qy
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

https://github.com/tvheadend/tvheadend/compare/5abbcda4d8c82d2d4889452a7056a7bfcd728fc6...37453bc3fe5f9e10f3428ebb1abdc613f8b07186

Updated license hash due to upstream commit
https://github.com/tvheadend/tvheadend/commit/4adb0cb06be5b936bcf09fccba7fde79aab8cd49

Moved mandatory dtv-scan-tables dependency to main block.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 0ec391b8b9..1062dd2c81 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f3c311c2bed4de5b0312286f5b1a0307edf502fa0ed360855eedb044d4247674  tvheadend-5abbcda4d8c82d2d4889452a7056a7bfcd728fc6.tar.gz
-sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
+sha256  0ced1ea6ce8b78ac9bfc7e6e8cdc908a57840d25276b5248039661483faad705  tvheadend-37453bc3fe5f9e10f3428ebb1abdc613f8b07186.tar.gz
+sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 87d99bbb72..2f99bebbb2 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 5abbcda4d8c82d2d4889452a7056a7bfcd728fc6
+TVHEADEND_VERSION = 37453bc3fe5f9e10f3428ebb1abdc613f8b07186
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = \
+	dtv-scan-tables \
 	host-gettext \
 	host-pkgconf \
 	host-pngquant \
@@ -135,8 +136,6 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 TVHEADEND_CONF_OPTS += --disable-pie
 endif
 
-TVHEADEND_DEPENDENCIES += dtv-scan-tables
-
 # The tvheadend build system expects the transponder data to be present inside
 # its source tree. To prevent a download initiated by the build system just
 # copy the data files in the right place and add the corresponding stamp file.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
