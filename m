Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AACDE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 16:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E869460618;
	Sun, 12 Jan 2025 16:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNjSihbhkUO1; Sun, 12 Jan 2025 16:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED10E60647
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED10E60647;
	Sun, 12 Jan 2025 16:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C1B68
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 861234015F
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCuN1SgKT9s1 for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 16:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F061740129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F061740129
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F061740129
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:41:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AA6B840002;
 Sun, 12 Jan 2025 16:41:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2025 17:41:35 +0100
Message-ID: <20250112164136.213929-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736700097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ocoeiQkR5yP1hxqkphrVUndGYm3VTmRfxpMYpyZyUBk=;
 b=DfdixzcDeHCIH/f1q0lCBqTj9awIbYgVmaWCC/0TKvKTfU/EBYwJZzitmZ/FRT88sC1Fjx
 WoRX9zGAZo9mVlpsGqXwa7nYTZb2KuzLuiL24bLul28K84zfE8Q8QUbDKaHnhZ98tKp2Zn
 AIvPzN4arYL2nrgk1yYrJ68S98stomPfHQk+jRWzCHD8KAsbUlmOwFCp6f+zxTb/RRKS1a
 OOiqKg35Aa/JySByuuHkOPHHwYzHr1XMLoAaa6vE+8nxAMlfQQLRJSZynYExKvtHsWfh5g
 /2uMsCYDVQcLXLneHRYUUQQRs/ZIouTH+wx9ajztTfbRh4uDHUsP2EEFf9skaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DfdixzcD
Subject: [Buildroot] [PATCH] package/igh-ethercat: backport upstream commit
 to fix build issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch backports an upstream igh-ethercat commit to fix build
issues at -O0 or -Os. The commit message says -O0, but in the context
of Buildroot, the issue was encountered at -Os, due to dead-code
elimination.

Fixes:

  https://autobuild.buildroot.org/results/bfa074afee8a70abe597b117ecf815e234f16b40/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ry-inline-statement-causing-build-O0.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch

diff --git a/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch b/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
new file mode 100644
index 0000000000..2cbb9c3ce7
--- /dev/null
+++ b/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
@@ -0,0 +1,38 @@
+From 39d065d5fb56525c1171c4fcb643b798ee10c6b9 Mon Sep 17 00:00:00 2001
+From: Richard Hacker <ha@igh.de>
+Date: Mon, 18 Nov 2024 10:54:00 +0100
+Subject: [PATCH] Remove unnecessary inline statement causing build -O0
+ problems
+
+Fixes #147
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/5802c72818df07d34469630a8943915cce738626
+---
+ lib/slave_config.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/slave_config.c b/lib/slave_config.c
+index 7bef3a99..58d6c7b4 100644
+--- a/lib/slave_config.c
++++ b/lib/slave_config.c
+@@ -40,6 +40,7 @@
+ void ec_slave_config_add_sdo_request(ec_slave_config_t *, ec_sdo_request_t *);
+ void ec_slave_config_add_reg_request(ec_slave_config_t *, ec_reg_request_t *);
+ void ec_slave_config_add_voe_handler(ec_slave_config_t *, ec_voe_handler_t *);
++void ec_slave_config_add_soe_request(ec_slave_config_t *, ec_soe_request_t *);
+ 
+ /****************************************************************************/
+ 
+@@ -625,7 +626,7 @@ ec_sdo_request_t *ecrt_slave_config_create_sdo_request(ec_slave_config_t *sc,
+ 
+ /****************************************************************************/
+ 
+-inline void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
++void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
+         ec_soe_request_t *req)
+ {
+     if (sc->first_soe_request) {
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
