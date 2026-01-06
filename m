Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A3D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E752E41465;
	Wed,  7 Jan 2026 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHt-yYFZ0ock; Wed,  7 Jan 2026 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24FDA41456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808952;
	bh=2qPl6noATlmYBlU299QZVINSxtYdgO/28gMCxrXNOeY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8yYW4zbYepFS3763beW/3f6m4O0dTzLu8CVFc8YQHbM+Ea1fofztqw5HG7XWjUXh
	 v5097KAxjXcKEhlUSwAjjA9J9WMN8cY9esAv2c7W8yXTiBht4Hiw9H6+i2NE/qsKYj
	 H25m8kv3IJgIgNGi5/zPoOZdc25RbUJ6vfsz20dRhhpRUr8gwpJCV/TVL/l0ciuNuT
	 EFbnSlg1ocluL0efVpp9aULEAAA/LkmYGYnRzETwJZ1kSYxt66RiZ03euE4tA9nChG
	 wCyy7yk1dLkPMWJFVtatSDOR5q7kl+pjZ8oUBUU4N8YT3fEMO46bEdGfjZ5mlSftwF
	 1RSTKcmT2ULDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24FDA41456;
	Wed,  7 Jan 2026 18:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFFE9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B42840CCF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soOuFtjsZQST for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE41140A2C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE41140A2C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCAC287C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:36:12 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3bfab7709d8bbe43b906174971783fd7caec71b4
X-Git-Newrev: 6578fa8677f8faffec0a1fd635bc82f6defdcef3
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.BCAC287C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vim: refactor
 install target logic
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6578fa8677f8faffec0a1fd635bc82f6defdcef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Instead of calling $(MAKE) multiple times, let's call it once, with
all installation targets needed. We introduce a VIM_INSTALL_TARGETS
variable to collect the list of make install targets that need to be
invoked.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 525a234303bf19a99940954abdfa7aa51add2b94)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 2bf01fa8bd..d250ac6b59 100644
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
