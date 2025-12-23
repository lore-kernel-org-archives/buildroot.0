Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77D2E6FE2B
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD5460E94;
	Tue, 23 Dec 2025 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVfzwE0Lu4GX; Tue, 23 Dec 2025 20:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B5260710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766522487;
	bh=lWTzw+Y+MXpChUTvISvobh2BytsY6hyrfGZ03TLa8rk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T7rAO78UJSxFAvgx3Rej0nFLTKcrgVqjS4QaVAbtjCTXjfvo8nmD0t4+S7SEQg/Fr
	 5+ERpq5nOWqeHEfi+YbLJ7HjWKlWV7++WIsgRhhh6z7lUDjwESocB8KfeLRnjkWvUr
	 y6BFhzJHuX8aeQSNsnG8fjFZ56OAEf/dgtTFlnjOT3C6SmV2BgZ/BkaDhDN8I1Nm+d
	 pL6XxhxlWG4DY/kvpl1jno8mBqDIvlxibY5OIdht2MpA+ngCzhAVZKgML10Pk4nkyB
	 2X1m64exASj/gT6XtTuws4fzPSbcFRAu8nR7buFskcIbVFFoqFgpjOgqsRmfAeMYKZ
	 R++bXY5xjHcvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B5260710;
	Tue, 23 Dec 2025 20:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 358DA24B
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C06D40489
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYh40L9PgWcE for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7179540483
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7179540483
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E4587611; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Dec 2025 21:38:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21e613753ec2fc931c4f7a95ab5c0019bd30636c
X-Git-Newrev: 525a234303bf19a99940954abdfa7aa51add2b94
X-Patchwork-Hint: ignore
Message-Id: <20251223204121.51E4587611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: refactor install target logic
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=525a234303bf19a99940954abdfa7aa51add2b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of calling $(MAKE) multiple times, let's call it once, with
all installation targets needed. We introduce a VIM_INSTALL_TARGETS
variable to collect the list of make install targets that need to be
invoked.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
