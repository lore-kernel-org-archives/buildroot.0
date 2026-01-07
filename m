Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651EFD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3A182433;
	Wed,  7 Jan 2026 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbCja4gfNKN8; Wed,  7 Jan 2026 17:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4847582435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808302;
	bh=xIFtWsGIWqm7/+y5XhyM7BqfYFnk0tEEShFM6/avWKY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b3QSUnGVE0pEUa06LRptg2WcTN8sImt4DUve/KkAQtNpDIFYj5vh7qXoDp2q7W2jI
	 7BYDpHNqIk3AStQ+VLFGY4/cLgq3WaeqLOBRdDWwoyvyoFyZHkH5rL1g2X76NKylIj
	 xMK5vJm+D5pDAQaFBTewnQZe4mOC1T5M8MnSZ0mlKvLEDGQOvGRWIrGiMfe2TgT4rg
	 k+gv+nG5ayQe+jAkaJq3OASxS51m0vPbjV8/Yk/9xo96fQxGSQMbp9Jd/dHZPuQy3Y
	 ZibjFExCSStBiEmZjtqP6oehApoW3xcDAgl9Z9XfnBBaBPj19UQ+aK0p9tJYTmDQz6
	 Fwsu+sAFThJPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4847582435;
	Wed,  7 Jan 2026 17:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E000325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE3682437
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xq3JUtrPrkH8 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C79F823FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C79F823FF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C79F823FF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B90C4B97A704; Wed,  7 Jan 2026 18:51:37 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:36 +0100
Message-ID: <20260107175136.228096-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228192344.3025431-1-thomas.petazzoni@bootlin.com>
References: <20251228192344.3025431-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808297; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=KGjP8OH0ClJoDXnbw5BpORnDKuoL7Q4GN3O3XbS1rO0=;
 b=cP00xT7lXx0r5U7xcFzndryudRy7bCp0IMoufuDkF+Rd8mDMmdndSqka/Vxul27c9o5/2u
 ojsvo5zIfKlrPttLXJ6pQUBSjC7NQKVwonGSD+c8lHD4Mti5JAqeuZ9bSb7NHnxM15SjpQ
 /RHV4b6GTKM5Nape+odnvEg7vh9Qn2PP5mPl8EPxPLdOM3Cm5wOd04/4gs5uj8PNyjsQPj
 pCVgCGGGkb/Tt4qHADNw0Bt8hYmGQA8I5W/ORosbmx2DJ6kDqPL5JSDjhVdeLXxij1vqtT
 0xt1ljwEggWPxiQmKkgLEqEUic1zNAS9nu4G9FDYjeDpDA89zc9hxGDZ0tLO+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cP00xT7l
Subject: Re: [Buildroot] [PATCH] package/vim: fix reinstallation with a patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> In commit 67e84345c156170fa01103289f1d255a74ad830d ("package/vim: fix
> reinstallation"), we fixed the reinstallation of vim for the target
> package by removing symlinks before calling "make installlinks".
> 
> However, this didn't fix the same problem for the host-vim package.
> 
> So instead, this commit adds a patch, accepted upstream, that uses "ln
> -sf" instead of "ln -s" to create the symlinks, allowing them to be
> overwriten on reinstallation.
> 
> Fixes:
> 
> ln: failed to create symbolic link 'view': File exists
> 
> on reinstallation of host-vim.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...src-Makefile-create-links-with-ln-sf.patch | 78 +++++++++++++++++++
>  package/vim/vim.mk                            |  1 -
>  2 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> 
> diff --git a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> new file mode 100644
> index 0000000000..54d423aacf
> --- /dev/null
> +++ b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> @@ -0,0 +1,78 @@
> +From 5686ef63f81fcac2ca6ec6e7160829b295ad4e79 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 28 Dec 2025 15:01:38 +0100
> +Subject: [PATCH] src/Makefile: create links with ln -sf
> +
> +Running "make installlinks" twice towards the same destination
> +directory will fail, as symlink will already exist. This is not really
> +expected as "make install" is normally expected to work again and
> +again towards the same destination directory.
> +
> +Fix this by using ln -sf.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream: https://github.com/vim/vim/commit/6df5360691266b5eca49380e94f3e21fa48e5e0b
> +---
> + src/Makefile | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 6fb1eb95e..39f798260 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -2746,40 +2746,40 @@ installvimdiff: $(DEST_BIN)/$(VIMDIFFTARGET)
> + installgvimdiff: $(DEST_BIN)/$(GVIMDIFFTARGET)
> + 
> + $(DEST_BIN)/$(EXTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EXTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EXTARGET)
> + 
> + $(DEST_BIN)/$(VIEWTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIEWTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIEWTARGET)
> + 
> + $(DEST_BIN)/$(GVIMTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMTARGET)
> + 
> + $(DEST_BIN)/$(GVIEWTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIEWTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIEWTARGET)
> + 
> + $(DEST_BIN)/$(RVIMTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIMTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIMTARGET)
> + 
> + $(DEST_BIN)/$(RVIEWTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIEWTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIEWTARGET)
> + 
> + $(DEST_BIN)/$(RGVIMTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIMTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIMTARGET)
> + 
> + $(DEST_BIN)/$(RGVIEWTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIEWTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIEWTARGET)
> + 
> + $(DEST_BIN)/$(VIMDIFFTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIMDIFFTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIMDIFFTARGET)
> + 
> + $(DEST_BIN)/$(GVIMDIFFTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMDIFFTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMDIFFTARGET)
> + 
> + $(DEST_BIN)/$(EVIMTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIMTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIMTARGET)
> + 
> + $(DEST_BIN)/$(EVIEWTARGET): $(DEST_BIN)
> +-	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIEWTARGET)
> ++	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIEWTARGET)
> + 
> + # Create links for the manual pages with various names to vim.	This is only
> + # done when the links (or manpages with the same name) don't exist yet.
> +-- 
> +2.52.0
> +
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 1e7e1d6a55..fa7d47d67d 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -55,7 +55,6 @@ VIM_INSTALL_TARGETS += installrtbase installmacros
>  endif
>  
>  define VIM_INSTALL_TARGET_CMDS
> -	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
>  		$(VIM_INSTALL_TARGETS)
>  	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
