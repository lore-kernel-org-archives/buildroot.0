Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB845D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFFF24099B;
	Wed,  7 Jan 2026 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-v7bSQ5kH8r; Wed,  7 Jan 2026 17:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97E2409B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808030;
	bh=HCIEe8+EEnjZx4oatBTBkJpMRp5AJXGR3aC3r85C2WA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jfgTONbp1mKoVOP6A7hqiUutARZ+sIoIe0qvgcGukKrtCrQqadFFG8utpz+bAiL0R
	 nR38RhFSHXdycyNVVx/z8SKA0ChGllPoa7HSA3TXL/mBkDdAdEb47TNlyKY1sfhtcF
	 9zqt9wgpaH4bRzJayJA1wzQc8vb/T7YhociPjHkvb6ksu+pZGNDGw/RipHOomNRkvg
	 Zqsrol2v7OMFbsOr+AhUTgWup5lZg91RAYmyhKQDZmG2ywdIbcevN/zmzpki92PG6M
	 Tv6126Lp9Ffdg3zqVVqmWne4lzeo1d5YG+AdrettNTS40n0MNgnkyGQsjcjr5b5bwU
	 /uyyVlGdm74yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97E2409B1;
	Wed,  7 Jan 2026 17:47:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E73D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AF9E80ABB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LId5CKyk6g7v for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C75B80AC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C75B80AC9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BA5888367; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f0711e5202a0eee13b3241a0e0c1c93bab2785a6
X-Git-Newrev: eb3e03b7447d74ca6cb00f14e1ec0eed74e20ab4
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.2BA5888367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: refactor
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb3e03b7447d74ca6cb00f14e1ec0eed74e20ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
