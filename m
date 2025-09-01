Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E98DCA0FFF
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 15:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B214413C5;
	Mon,  1 Sep 2025 15:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBYshztYW1ej; Mon,  1 Sep 2025 15:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9D5412D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9D5412D6;
	Mon,  1 Sep 2025 15:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D75710E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 15:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E77F60765
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 15:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5BakjFkcUpn for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 15:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34B606073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B606073B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34B606073B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 15:47:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1250891132; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 15:47:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ut6kR-00314n-2s;
 Mon, 01 Sep 2025 17:47:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 17:47:10 +0200
Message-Id: <20250901154711.719109-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eARZTEnipXMliroFbbeEwIQ5jnVNUjXuMFLtnB4wAsBehOElQhkvlY4qqN9tODTtobltpsuIC2TCne3q/neeR4YZLpqBhG1neJ9JK5KK1fiUfQR/MHK6SCjAqLCNY/ryW1RQuO3Z0xaKawcZe7K17AI34X+GHse4eH/XmR/WPVD/adCBadMm/dVWGouE6HKpMmvPikLpwTXf31ZQBKzct0rTDFpE9D6IZcOOnLCCoXAZ1qytCaxToRwAlwJrgRj04bmVC+d/uG8S+zT5lsCzUthZRHF3QejMi2hhXDsibcr6SXId2KZS9Vn4st5OyspL1QgxEMkx1U5y3lKN4gYDOA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=KtJ389j1pgUFcNubgrlG/5qrO2NH1NiGG2CR54Qyavw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eARZTEni
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/input-event-daemon: fix build w/ gcc-15
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

Fixes https://autobuild.buildroot.net/results/7c3556ec16c28b61bda62156a3bee858cf80cd1c/

The source code uses empty argument prototypes, which changed behaviour in
C23 (default in gcc-15):

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

Causing build issues.  Latest upstream release is from 2010, so work around
it by forcing gnu99 mode instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-event-daemon/input-event-daemon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 37fe2241d0..17a25082a2 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -11,7 +11,7 @@ INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
 define INPUT_EVENT_DAEMON_BUILD_CMDS
 	touch $(@D)/input-event-table.h
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
 		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
