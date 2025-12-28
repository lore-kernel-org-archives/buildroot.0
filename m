Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B5E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1537780DA4;
	Sun, 28 Dec 2025 19:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoXOBydQwI2x; Sun, 28 Dec 2025 19:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2790080E53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766949844;
	bh=wwGUzAeF2jFOhZsYZ7YjN+WLWloFY1vUr18Bfy/SOxA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=H/XhL8yNgW5x+oe6ieRg4iBbhR6809CQ/Z9eESIFbqsORKxN83/LEaZVK2ZTBQOlB
	 qY42BvHStsD16M9L3BtipfFFybvaz9bVeqeidO4JC/OCoYttSqVWBeB/N0YDsXng+8
	 4ISmo8oZiiROJq1/mMRXBMs/2lvZAOVGTP6jeApuX8yaaOm3amYMHnN2x9xgXRC3nP
	 eqpJPnsb0HQuN273FTZAmO6FoKJBvrIlQ+JDoEOEWQP2rwacgssflzuKz4CBGpbcVc
	 WwwWDov+HCdzsgljEWwdaonX5FdDdFItVZOGnpxH3ZVsYlBb12B91o54TlfkarU9Eq
	 oR0j2DnMwl/Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2790080E53;
	Sun, 28 Dec 2025 19:24:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D95D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C42844054D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIu5WdfNy_bi for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB72D4054B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB72D4054B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB72D4054B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:24:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 46C5C1A24BD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1149C60725;
 Sun, 28 Dec 2025 19:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF16511978462; Sun, 28 Dec 2025 20:23:55 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 20:23:43 +0100
Message-ID: <20251228192344.3025431-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766949837; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=5SupzV1ybnCmduteLLMn9ORzEDwiwV4/KCzHNfMHTl0=;
 b=hWgox5ZRU4nkFxuB4HB7wcBEB29vObpGaiGwKxD2B4CyajAulwIxLzQhHUWK5MXmagyK38
 tx1P+HsqkXdcrsvd0gdMPjXnXdxLAP2QKBZijeanHCJOfJ0fv4hrPyrH8VTHnQg0CCGV+/
 hfdVbk7MU1ybOEXIqrPFsLM8r/eD1JduTvkk+whpJQr4ui4gelzJd/JD6yxNfhbFD7SexM
 ROLyAHa3tpreHvQmWceV1utV/1ioMG0N9Xc4qU9kDFuSX2dnusPqHMUhEtk7V2gV9+FC2B
 ythzIXPxrR+s+1veWEYNUATizR1b589aGOil4pmx0ojXdEs1GQZeNRExTYhHtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hWgox5ZR
Subject: [Buildroot] [PATCH] package/vim: fix reinstallation with a patch
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
---
 ...src-Makefile-create-links-with-ln-sf.patch | 78 +++++++++++++++++++
 package/vim/vim.mk                            |  1 -
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 package/vim/0001-src-Makefile-create-links-with-ln-sf.patch

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
index 1e7e1d6a55..fa7d47d67d 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -55,7 +55,6 @@ VIM_INSTALL_TARGETS += installrtbase installmacros
 endif
 
 define VIM_INSTALL_TARGET_CMDS
-	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
 		$(VIM_INSTALL_TARGETS)
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
