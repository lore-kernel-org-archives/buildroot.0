Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0164D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7852810B1;
	Wed,  7 Jan 2026 17:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvQT7iYM7jAr; Wed,  7 Jan 2026 17:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1B880DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808260;
	bh=fHgfNP2ib2nlYzGSbB/TW2OffIVTN15hBjL52M3Oahg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aBmOudwHD8AvYLg82THMK/tP6jag5GszfykLzl0ErMjtDFRG7kzwjjqR8oqm5IEj7
	 xPrwf5iI84HwEFSZ7tiQIG+iub1lIFXwcLBXvYlMdkzVDgV5BjgjBzQTBcb29HeS44
	 t5fpmlmzMcgQBkHWJzBMB/jxXCaLNtRugN8v8qKfH6BydMjLXCwRJ5lLU63z2cp/V9
	 CyGiD2CmvDgu7GjK5nOGG0621NLWlwy7sV2N1yUw0sQskVS59aKmXf1ZKpvJwqAH3Y
	 z+BYtbWLt7I+6puIZmmuxTPtXYvoOPXOSQWYHx/3KfNHSYpMf2ZOcUexWbk3qinbbd
	 Z/tIe2lVy9VBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1B880DCA;
	Wed,  7 Jan 2026 17:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DD8E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 305DD40E57
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwm9Ve1fCFAS for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D31540E43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D31540E43
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D31540E43
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46C22B97A596; Wed,  7 Jan 2026 18:50:56 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:55 +0100
Message-ID: <20260107175055.227111-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-2-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808256; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=F9mFpqsjus7T2mv976TEidpmLzTJWpceyGTMVizzglw=;
 b=VsO+815B38KK4XIMW6wSwyfC8hzujSao2zlp/FfbbCagAGnjRqG7q0jzractxNw2IGcAWR
 LCAjDMo2Yu8nlvphvTIDw6vz+m42Zy5fNKq5nr97Q0WVbtWB5SL9jcgAhowhGF01K7vxW2
 ehynfFV7Yt7OcOpmwttnpMBhCiaqHujjaIky2K6sVWALnnE3wUP0fyWgapWaHV+6PnKbib
 cDhk0EMv7UJpcExzH66tyFdyGiIbiLZTHfuBXHEytFAHv3T/75gaFpr0T0VBQmgzeb7j6o
 r6h6J5pbCFi1Kc6I2Rl/ki6Pegch3O3XY7u01UZzYD92SzYhzKpgNrRnTG+Quw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VsO+815B
Subject: Re: [Buildroot] [PATCH 1/4] package/vim: fix reinstallation
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
> While not very common, it is nice when package re-installation
> works. Unfortunately the "installlinks" target of vim installs links
> with "ln -s", causing a package reinstallation to fail with:
> 
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim ex
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim view
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rvim
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rview
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim vimdiff
> ln: failed to create symbolic link 'ex': File exists
> ln: failed to create symbolic link 'view': File exists
> make[2]: *** [Makefile:2749: /home/thomas/buildroot/br/output-all/target/usr/bin/ex] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: *** [Makefile:2752: /home/thomas/buildroot/br/output-all/target/usr/bin/view] Error 1
> ln: failed to create symbolic link 'rvim': File exists
> ln: failed to create symbolic link 'rview': File exists
> 
> To fix this, we remove the target links before proceeding with the
> installation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/vim/vim.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 2ecab0652f..43c9bfc0f1 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -47,6 +47,7 @@ VIM_CONF_OPTS += --disable-selinux
>  endif
>  
>  define VIM_INSTALL_TARGET_CMDS
> +	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
>  	cd $(@D)/src; \
>  		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
>  		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
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
