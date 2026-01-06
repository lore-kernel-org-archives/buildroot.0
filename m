Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C5FD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50AAC40C10;
	Wed,  7 Jan 2026 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbmloYzo3Yom; Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A8040C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808107;
	bh=zzmaLgGds1LdVGK/Y8lkQgm/J1iyoPDjL5xBDL39U4M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dq6wKeWTt6ZR0QcFcPFRaD/g2/KYTIkcmENVInZI3jNpxD6XN+qvDoDPGbC7YnDtT
	 kuexUPZPEwH0fQCzqnLFvzCaMPuTSayFoL5eSq0mnxyB3dpNuvr/TdtMQBpCKG6kBj
	 skodyhp75QQQA2eeKvQpPpucJLoNTeKGwyNhjaMhPsLAMl+LKtU0XsbIkwFxBIrB/r
	 pR5uOG2mVSJp4/zxJs1Du+4GEo7vu1Bk3meIGp7X+gzTIPRkVM9lOjrVtEpekTMG2R
	 mIkRmIF3124ulX5HZYIKApQnkQz2ZwRI3TzQHf9OWSM9WU1J2/P3N3UAHvMyJLv5k9
	 cZWZR+A4yJPjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A8040C08;
	Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 149C39ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC27F80CDD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veCxlWaq2HH7 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307CB80C1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 307CB80C1B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FA7C8225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c24744dcbc5c5b4e12cb7c7b79713fcb4c4e1a69
X-Git-Newrev: 6d92d9ae99d5d9d30362a87e7b0473d77b6b2c79
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.2FA7C8225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: fix
 reinstallation with a patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d92d9ae99d5d9d30362a87e7b0473d77b6b2c79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In commit 67e84345c156170fa01103289f1d255a74ad830d ("package/vim: fix
reinstallation"), we fixed the reinstallation of vim for the target
package by removing symlinks before calling "make installlinks".

However, this didn't fix the same problem for the host-vim package.

So instead, this commit adds a patch, accepted upstream, that uses "ln
-sf" instead of "ln -s" to create the symlinks, allowing them to be
overwriten on reinstallation.

Fixes:

ln: failed to create symbolic link 'view': File exists

on reinstallation of host-vim.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ee656a4486cecc24dc424e4de62ca6c185432d0b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-src-Makefile-create-links-with-ln-sf.patch | 78 ++++++++++++++++++++++
 package/vim/vim.mk                                 |  1 -
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
new file mode 100644
index 0000000000..54d423aacf
--- /dev/null
+++ b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
@@ -0,0 +1,78 @@
+From 5686ef63f81fcac2ca6ec6e7160829b295ad4e79 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 15:01:38 +0100
+Subject: [PATCH] src/Makefile: create links with ln -sf
+
+Running "make installlinks" twice towards the same destination
+directory will fail, as symlink will already exist. This is not really
+expected as "make install" is normally expected to work again and
+again towards the same destination directory.
+
+Fix this by using ln -sf.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/vim/vim/commit/6df5360691266b5eca49380e94f3e21fa48e5e0b
+---
+ src/Makefile | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 6fb1eb95e..39f798260 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2746,40 +2746,40 @@ installvimdiff: $(DEST_BIN)/$(VIMDIFFTARGET)
+ installgvimdiff: $(DEST_BIN)/$(GVIMDIFFTARGET)
+ 
+ $(DEST_BIN)/$(EXTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EXTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EXTARGET)
+ 
+ $(DEST_BIN)/$(VIEWTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIEWTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIEWTARGET)
+ 
+ $(DEST_BIN)/$(GVIMTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMTARGET)
+ 
+ $(DEST_BIN)/$(GVIEWTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIEWTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIEWTARGET)
+ 
+ $(DEST_BIN)/$(RVIMTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIMTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIMTARGET)
+ 
+ $(DEST_BIN)/$(RVIEWTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIEWTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIEWTARGET)
+ 
+ $(DEST_BIN)/$(RGVIMTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIMTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIMTARGET)
+ 
+ $(DEST_BIN)/$(RGVIEWTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIEWTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIEWTARGET)
+ 
+ $(DEST_BIN)/$(VIMDIFFTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIMDIFFTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIMDIFFTARGET)
+ 
+ $(DEST_BIN)/$(GVIMDIFFTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMDIFFTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMDIFFTARGET)
+ 
+ $(DEST_BIN)/$(EVIMTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIMTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIMTARGET)
+ 
+ $(DEST_BIN)/$(EVIEWTARGET): $(DEST_BIN)
+-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIEWTARGET)
++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIEWTARGET)
+ 
+ # Create links for the manual pages with various names to vim.	This is only
+ # done when the links (or manpages with the same name) don't exist yet.
+-- 
+2.52.0
+
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 77d3ac35ad..852d5ed959 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -55,7 +55,6 @@ VIM_INSTALL_TARGETS += installrtbase installmacros
 endif
 
 define VIM_INSTALL_TARGET_CMDS
-	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
 		$(VIM_INSTALL_TARGETS)
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
