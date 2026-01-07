Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0926D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86AF40E6F;
	Wed,  7 Jan 2026 17:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voGYvqGDYWKN; Wed,  7 Jan 2026 17:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF78640E5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808263;
	bh=Tg0euFZIiwkK3wnW3p2F/rF+yG8CzYae5jymmt2q6Nc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fH/93aPusw+dULoBAQ34w8ZPNcvnefgax+lvFyM/X/jsTD5Z6SxEcg514D2uxB2ke
	 7RfTEAKFuGe4f21XQe9Fe54Obt2c4lQdHlAE1EK9FeHyHf6WHegFl/M8bF+24gKfjJ
	 vBxavZP/pjKSu+hyRz7Gl9iwkWZCwsvfiEI893a/KSGPkQQRM0FUuF1KcF/M+BS+i4
	 XFbA/CqqOA6KrY+lDNKlXeeWdyLfAZAkdlsOUg4UUKb6rIcDNmretWNuZSh41Dajgp
	 CP16DSI0/04uXgjHtAYB5ey44Fe31kxvzlGnl/8SPvWZOxr/mUplRDQM/Gja/U1Ydj
	 nyq6oPQNvV1cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF78640E5F;
	Wed,  7 Jan 2026 17:51:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6AD9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39C8A6062A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDVU8yJJrz0X for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BABB605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BABB605D8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BABB605D8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21E9AB97A192; Wed,  7 Jan 2026 18:50:58 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:57 +0100
Message-ID: <20260107175057.227158-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-5-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-5-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808258; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=76CVRHt2OKrIjJ1ON3PJVG6yrRw+nJ+fDvSsOxiYT5Y=;
 b=BfO31kiPdoXn6FPsOOPVbACJOqNoh80Fkqs1jtv2qRFMvrZxbCB3QuXVjGMze1moG3SEZ/
 /rxcbxyFo2krwbai4wBOss+6gj1HGD6OiZjGA8ugOLX0+dZiVKJphK1wOvtH8ccpNil16/
 L81e4hq3nmetTO7rtZ6SB5bhFTWLaYQEcTDEUbl66xRFVTsjF/yBCupPHE+eCPU3Con/1q
 y8B8Kbsr7lKbg9CYz2v6LJL+A1CePlfgqLFOX4R/QxguQSlcF6nfBnbRzwB3j/2KUkft9g
 YcZkuiN8W0orwMtD0h3xn3g31wwLBsjbUx3JTXJwKAtFdGyC6uEprGDtnbfzPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BfO31kiP
Subject: Re: [Buildroot] [PATCH 4/4] package/vim: inline the VIM_REMOVE_DOCS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The VIM_REMOVE_DOCS variable is currently a post install target hook,
> but it can just as well be done inside VIM_INSTALL_TARGET_CMDS
> directly.
> 
> The hook was registered conditionally based on BR2_PACKAGE_VIM_RUNTIME
> because prior to commit f7a07f42f70a73806fd2f6bf3662fc6907845fe9, the
> hook's logic was:
> 
>     find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
> 
> which was failing if BR2_PACKAGE_VIM_RUNTIME was not enabled, as
> $(TARGET_DIR)/usr/share/vim would not exist.
> 
> But since this commit, the hook logic is:
> 
>     $(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
> 
> which obviously won't fail if $(TARGET_DIR)/usr/share/vim doesn't
> exist.
> 
> So let's simplify the whole logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/vim/vim.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index a1a484c673..4fe8800bea 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -58,9 +58,6 @@ define VIM_INSTALL_TARGET_CMDS
>  	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
>  		$(VIM_INSTALL_TARGETS)
> -endef
> -
> -define VIM_REMOVE_DOCS
>  	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
>  endef
>  
> @@ -77,10 +74,6 @@ endef
>  endif
>  VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
>  
> -ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
> -VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
> -endif
> -
>  HOST_VIM_DEPENDENCIES = host-ncurses
>  HOST_VIM_CONF_OPTS = \
>  	--with-tlib=ncurses \
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
