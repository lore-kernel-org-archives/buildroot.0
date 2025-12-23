Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D27E6FE23
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 18:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0588129F;
	Tue, 23 Dec 2025 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSYd6q4d3qZ8; Tue, 23 Dec 2025 18:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE532813EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766513429;
	bh=Vy6npHVXK3lJnDeFMbbUzDXyxd22aK9D/Mo8W/BhbE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mDjmn7yOEzM8jLtBUP9dq0KePMWvL0LEkGR63H3LaU9dVSrWi9pofhrdqipI6a74k
	 hXQxaVNaj3GeuhRlxuOQSY+QjKFDDG/N55BNsN34szR7+7ch9DXc6A7UetV/JJxtqa
	 ebHlBHWtfq0cXm2x/lYZ8LuQf69/1IquqNpmB2caYR/xAXelgmB/piHURm1I78ljJH
	 +NPFnf6Un4ZvlHRQ6abuegHtcEp+SGdTS973PIm6qa/LtQ8AXNe0J3IX8rQyU10SU7
	 yMXq8Lxx4zZe8HyJVkxGZgSSOG2TzxF0ZkQDLxe08UypAHue6cGkIWbDw7M0BHgdWd
	 hm6oXlKbu/zaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE532813EC;
	Tue, 23 Dec 2025 18:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EABEA119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D20BB4089E
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrC-IbJmvLQn for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 244CA40897
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244CA40897
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 244CA40897
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DD4BA4E41D72
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B3E3A60716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DDC510AB0C64; Tue, 23 Dec 2025 19:10:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 19:10:09 +0100
Message-ID: <20251223181013.383914-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766513422; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kdt37/nSnvlOCDUJNn4MlZPcFJCcxVQ5PtQlvTQ1RDM=;
 b=T7SLAwqnymhBOoYKN1Ke0XGDRbDVDY5U5j1W0MbYRE6iUZkfB0xUzZfvZPArDWP0IPeCpd
 qDv0aqoO2pUbXRud9HGB6aMfgmaV8Hnu2xRmzMMWOHU4uu58AV1iVARqMNCDw8d/bh4kp6
 tQf90fRozgpJJOV0DVq54kkShWIhGEBTQ8KMsvfm7lrZakioXgExSAFvkws7Si8w90ADEw
 b7ex6q5wL3nfeAGAw1O2FEK3Ib+zmWLi+HBAOG8gE15EVhI0BUG8PW6LwfkZoYjFwkjkvP
 zTu9M0MNbhBrcx0bKB97lwjNJxozs6TCDa+OZE1hEw9uur6IgmNDJhcfMAY0ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=T7SLAwqn
Subject: [Buildroot] [PATCH 2/4] package/vim: use more conventional $(MAKE)
 construct
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

In Buildroot, we more commonly do:

   $(MAKE) -C $(@D)/src

than:

   cd $(@D)/src; $(MAKE)

so let's adopt this more conventional style.

This coding style in vim.mk dates from when the package was introduced
by Peter Korsgaard back in 2010.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 43c9bfc0f1..10ff3a109b 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -48,17 +48,15 @@ endif
 
 define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installvimbin
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installpack
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installtools
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installlinks
 endef
 
 define VIM_INSTALL_RUNTIME_CMDS
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installmacros
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installrtbase
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installmacros
 endef
 
 define VIM_REMOVE_DOCS
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
