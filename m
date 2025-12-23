Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD99E6FE28
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 18:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A07F60E6B;
	Tue, 23 Dec 2025 18:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfVCBs9aQSVP; Tue, 23 Dec 2025 18:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34E5360E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766513432;
	bh=1lUsZnXSx7LtPApgDhR1VtdIQ2vXhskc7GcukZCRDic=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nTzCIX+GDuQKMbUWCeR8zmxmarq9zFQdVlktHHZgder0KKOMoYHe2OAI46KvFUPQ3
	 ZP4B2AlW395pa4K/XgrS0ZbP0IIDL+H6A44XaypSVu3iI4ixAXpsXQ2UGEiwMNBsN1
	 Rz6enwYN7X8wifkrr0vARl7462DDrWsqvJMwLB9GpaMCGfiN2rYiZrdgRpXRWbehcz
	 OHhbSkSzYW3twtLn+weZ+iIsRFARZX55lZ9L0b3B1HdY5WbaglM/DlKMEwDuP69PWD
	 TAozpFfWY9Vt9D8A64rYFvGKECYLISMlzS424ffHHq3UJml0hS6N/uL5AvVYwC3rNe
	 POsZKeHDoKIGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E5360E5C;
	Tue, 23 Dec 2025 18:10:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 382C125A
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2974260D4F
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zmrlk1x8WBvC for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 18:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25A0460BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A0460BFC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25A0460BFC
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 719384E41D74
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A5F760716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D369F10AB0CB2; Tue, 23 Dec 2025 19:10:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 19:10:11 +0100
Message-ID: <20251223181013.383914-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766513424; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5STEh6GgICeyko5Z5SVhpd/ztw6cJ2uIpcTYzERd6sU=;
 b=HrUicrVALvu1JS8vFOLKRAXf5HBWiWorKwr5zGIyV35gVIemNYI2j+1Ixd9KZpF/CZHZr9
 ymrQJBJx7Hva42AspWw98dw+wsFW1hDvAh1NwmfHtN/f7lnINQrjAO+ayNTJFlGJDFsD/M
 C5Cq9bL1pUTPtbh3xupvgQWgc9EE41/nNcD0zb4FuPO6MjIBt8YJxQY1rQjOggrM2Sv39+
 enBxItxZ/dlXlmEfqtPvgrFH6f9sjVvxnlo+AQLsjuXrGbIbbAX7nBRIGytiylqNIn2Qkr
 olmSPRXPqJd/GHLBGm4N0JMw7qGBpWKSYt62zR6HUCKVWCkFB+EmhUbkOebUtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HrUicrVA
Subject: [Buildroot] [PATCH 4/4] package/vim: inline the VIM_REMOVE_DOCS
 variable
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

The VIM_REMOVE_DOCS variable is currently a post install target hook,
but it can just as well be done inside VIM_INSTALL_TARGET_CMDS
directly.

The hook was registered conditionally based on BR2_PACKAGE_VIM_RUNTIME
because prior to commit f7a07f42f70a73806fd2f6bf3662fc6907845fe9, the
hook's logic was:

    find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete

which was failing if BR2_PACKAGE_VIM_RUNTIME was not enabled, as
$(TARGET_DIR)/usr/share/vim would not exist.

But since this commit, the hook logic is:

    $(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/

which obviously won't fail if $(TARGET_DIR)/usr/share/vim doesn't
exist.

So let's simplify the whole logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a1a484c673..4fe8800bea 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -58,9 +58,6 @@ define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
 		$(VIM_INSTALL_TARGETS)
-endef
-
-define VIM_REMOVE_DOCS
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
 endef
 
@@ -77,10 +74,6 @@ endef
 endif
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
 
-ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
-VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
-endif
-
 HOST_VIM_DEPENDENCIES = host-ncurses
 HOST_VIM_CONF_OPTS = \
 	--with-tlib=ncurses \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
