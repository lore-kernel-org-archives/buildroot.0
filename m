Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E6FCFD2F3
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869CA40C85;
	Sat, 22 Nov 2025 21:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4PG4lkdG_OK; Sat, 22 Nov 2025 21:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CD740C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CD740C93;
	Sat, 22 Nov 2025 21:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A0634E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F1A74005A
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMjyu742yKOw for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 21:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 734E14004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 734E14004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 734E14004D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:18:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48139A4C7050
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:18:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52892)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMuzu-000000000mT-3FIh
 for buildroot@buildroot.org; Sat, 22 Nov 2025 21:18:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 22:18:22 +0100
Message-ID: <20251122211822.1600323-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763846303;
 bh=5HB73dVNxlBzYmvyN5CJxVWiqD2+g2JNO1V/5ijrQo0=;
 h=From:To:Subject:Date:From;
 b=cxNnG7JIXSTNqAQQxGabvXQ2hkhbD9do+neSye++YLyWfqWvq+OfG6+NSA85EkRGf
 8OeHi+oxho72AZD2H/vI3dto3xerayB/MofpxwnyD3YMdDgQ3yAGfecMloGNzkBA4e
 hDArWsOvPP8bxkjMwN8VqxQo2LB8F0VzhVg+xJ/i4mzvV18XFouA4Xpl+qgwIPb83k
 G6qr0L56HdwaXwA97OBDD15Esll7D5EzQkivHIbOvZkXL+5dNNMEGT4wNueps/zPmQ
 Mg4yJ2E+/23mejUYRi046gbCW0UCsAng9E9LWI71GOHyj37UxcgPhBCYVBdugqxYjm
 EDPeEngi+kAZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=cxNnG7JI
Subject: [Buildroot] [PATCH 1/1] package/{neard, sdbusplus,
 thermald}: typo fixes
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/neard/neard.mk         | 2 +-
 package/sdbusplus/sdbusplus.mk | 2 +-
 package/thermald/thermald.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index c1804c48a2..e79ed278b4 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -16,7 +16,7 @@ NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define NEARD_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index 498b835052..207243b14d 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -23,7 +23,7 @@ SDBUSPLUS_LICENSE = Apache-2.0
 SDBUSPLUS_LICENSE_FILES = LICENSE
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define SDBUSPLUS_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 9faa47683b..4e3d897bf3 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -32,7 +32,7 @@ endef
 THERMALD_PRE_CONFIGURE_HOOKS += THERMALD_GTK_DOC_HOOK
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define THERMALD_CREATE_M4
 	mkdir -p $(@D)/m4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
