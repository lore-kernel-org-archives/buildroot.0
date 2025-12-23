Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DF1E6FE23
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 18:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59AD60BFC;
	Tue, 23 Dec 2025 18:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OqOax8uIgcG; Tue, 23 Dec 2025 18:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6EDC60E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766513430;
	bh=BmVYuDV5xprD5pMMlergCb/zSxx/aQAlvo+SGjabcpY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HruwJypk6wtpQE8xdi+eNFwHghCom4ZkDuG8xZgw5A+/lXcjzev0+BPy7JX0mI3zM
	 wKiIWToXAPqCjuuBagKMjUFggyOVsZAvqnrUZ4oxZA2X18Z14eA4vGO0JOvy1uOZYI
	 JLbwM+hoSc1ti81PXL1xVuZvGXCShvVytKwSN+ZviluFF2inzytfxi3+G5y0rtWtTX
	 urCRKlPyBdCNTCMhZ0rZ3eku5fPU6jT3zQofc7LnHF04PfVPyl+vuf6Pbu2NvHTWlI
	 8UCn7IAfqz1H1kY5alYj0KxYLBauLPk5CqAKtr8kOnB25WpFKH61IXu775Cv+sqzih
	 FHVVEW0ITAWdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6EDC60E55;
	Tue, 23 Dec 2025 18:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 158E2119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0815340242
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGw-_iCfabzL for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BF9C40081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BF9C40081
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BF9C40081
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B3FB64E41D73
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CC3F60716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08AB710AB0CB3; Tue, 23 Dec 2025 19:10:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 19:10:10 +0100
Message-ID: <20251223181013.383914-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766513423; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=1ogjil8gTYLpe3rcx9YnJ4uHJuOvXPnRoI7isnsqObg=;
 b=pszmynroh/EXqvGk6A2lmKrh9n7tGwAGD4ltwwTEauEgbERx5WaFDd9SIaFTY4Osn/cYs8
 ovnJ6SGMfCScq45ZpaeVe9pYTEhqkF8sre8x1nRqZGo40yo1Rllk3tOLq6YnhgWUpTOA0L
 ei9j2FI3f62PSB060DzXrFJf4Xs6yFgRgXE9YrQ9CgF5G9QnBo8lJqEMJNTiy6t74qEWHx
 620Xcq9mt4rUdMC22R1+lgAEztjBSMwbxh6jFZOJf8z67oZwYnQjdA8ifqFI2MkN9NW8+D
 DIl2urgENqDgB7iJuXs703GSfFDkpsWfr0wK8cDY5kiedLhO4Rh2VND8dzHqSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pszmynro
Subject: [Buildroot] [PATCH 3/4] package/vim: refactor install target logic
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

Instead of calling $(MAKE) multiple times, let's call it once, with
all installation targets needed. We introduce a VIM_INSTALL_TARGETS
variable to collect the list of make install targets that need to be
invoked.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.mk | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 10ff3a109b..a1a484c673 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -46,17 +46,18 @@ else
 VIM_CONF_OPTS += --disable-selinux
 endif
 
+VIM_INSTALL_TARGETS = \
+	installvimbin installpack \
+	installtools installlinks
+
+ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
+VIM_INSTALL_TARGETS += installrtbase installmacros
+endif
+
 define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installvimbin
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installpack
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installtools
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installlinks
-endef
-
-define VIM_INSTALL_RUNTIME_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installrtbase
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installmacros
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
+		$(VIM_INSTALL_TARGETS)
 endef
 
 define VIM_REMOVE_DOCS
@@ -77,7 +78,6 @@ endif
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
 
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
-VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
