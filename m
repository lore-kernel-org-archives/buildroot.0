Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A132E83F1A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D06AF60BD9;
	Wed,  4 Feb 2026 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UU2m9UxTXBsg; Wed,  4 Feb 2026 13:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E289F60BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213409;
	bh=8fA8+NoITCTu0V+o8lENFgdyJsJuqRy+payGX47iEng=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m11jlIW3Tp3K28mjP5DvFFivCxETPmjacTX6Xm5ZY3XgXNNN34j7NLc4TduITgsuc
	 i7VGjX/4U5OpGKZfm215aZYYQyaGBNeFKms9GxFlCSyQzBvYyOrOMqSIVR+T+HOU8a
	 ePBfHR6qf1068hGf3K1HnhXd29EoyRPpTpPuMllu0g5INApNe4CM61Ij9Xb496tluM
	 PMxA85fHKn1C1qjs6fDhCdM7eJ46FK2PKTTFX2tRv+H+9L6KXvQ9FCIy9U7o3qyuAE
	 jOEkiYSWdEjEhUH6HuxW0lQrODMjcq/T021+uz0f3hGffGqC72/sAZhXEUm7lN/1GS
	 CYh+0kxJ8pFrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E289F60BFD;
	Wed,  4 Feb 2026 13:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CDA4F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95EC560BFD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwcsrWdd48lg for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A8A660BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8A660BD9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A8A660BD9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:56:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1130626431; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 13:56:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vndN3-0000000AvMp-1jX1;
 Wed, 04 Feb 2026 14:56:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 14:56:36 +0100
Message-ID: <20260204135639.2603782-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n5oz0Js2HwVny8VIqwqq3CY7n/YrvpmKiz213pn2+qWY5P6X1omC64yMWXzNLqO0pq7eUvx49Iz8DzmzKSy+6KCZ7ncpBTOjEmqMezvUr00Uiq4NHmOZBH2wABIe0bkHT2K5mOBVSfr2l6FMPn54JZx9qw8PYa3WkM7IEY9nI46kosNwbiEH/64C4BuNsQYm66lMTtFo0SCz0//h86yRri/ww/9tGnIC/wW4PQfd7+ucXOf15fyGN5NLnP5tQstNEDCs9JVVckua9ojfOU3ROQZTxXF7BWZIOiF1+sggasWf9O5MVL/yU1SSInoa9EJLVNbZbsxkmbLDrS5HCdbPrQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=zO6otdW+DXNqdM4NvcMdJgh6iDyIHLRopKgcGf3fUO8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=n5oz0Js2
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] package/shadow: default to
 BR2_TARGET_GENERIC_PASSWD_ algo
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make shadow follow the the BR2_TARGET_GENERIC_PASSWD_* system configuration
option when changing password rather than DES.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/issues/134

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/shadow.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 2ba7a0e03e..cf05fc1bdc 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -140,4 +140,19 @@ define SHADOW_PERMISSIONS
 	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
 endef
 
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
+SHADOW_ENCRYPT_METHOD = SHA256
+else ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
+SHADOW_ENCRYPT_METHOD = SHA512
+endif
+
+ifneq ($(SHADOW_ENCRYPT_METHOD),)
+define SHADOW_SET_ENCRYPT_METHOD
+	$(SED) 's/^[#]\?ENCRYPT_METHOD .*/ENCRYPT_METHOD $(SHADOW_ENCRYPT_METHOD)/' \
+		$(TARGET_DIR)/etc/login.defs
+endef
+
+SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_SET_ENCRYPT_METHOD
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
