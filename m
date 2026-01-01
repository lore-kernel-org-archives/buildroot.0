Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CC1FA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD40C40286;
	Thu,  1 Jan 2026 22:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izijHWGX12VF; Thu,  1 Jan 2026 22:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34639405ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306642;
	bh=adQZnP35yRvDbl/dJFZ+kJRbSfRw1pj0E1+Ls3a8Q14=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hHEpQbwvXvcHF4KnmZMye+G1tMrtEo+lOy9YQumGpLevE0MlxnGjdTwnRcoqb+h7H
	 pDzzOl/8rEXm7cidcN3S/lgZSUpumivrX4bmJbkQcdVrvlCdud/VkrzkiCaNfsg3tc
	 rfTnYB80Fm1YbVHpB9C5oP0FGDA4KMM2e6NjJmzBQ4VNyc6FXmY31DIHh39Mrvz+yX
	 zTioxZBdpZYDFQ89KasfKO2bTpmiJS/2O+AqSfUVhRb2yGvQLX3XEcoYo6B0SyO9uB
	 JyQy+87kiLLN4Uacs+u/1arLrR/x2cC+DI+wSlds51Y0xoZsSGf5oQHqiuJlTTPU3i
	 D43Zk7Ujqa6kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34639405ED;
	Thu,  1 Jan 2026 22:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 314EF19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0645A40387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uO0-AoM8lEYW for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC5F14036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC5F14036A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC5F14036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 79140C1C3A1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DB0A60749;
 Thu,  1 Jan 2026 22:30:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39B2A113B0717; Thu,  1 Jan 2026 23:30:33 +0100 (CET)
Date: Thu, 1 Jan 2026 23:30:32 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101233032.13c2027c@windsurf>
In-Reply-To: <20251119112113.87557-1-shirokovalexs@gmail.com>
References: <20251119112113.87557-1-shirokovalexs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767306634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NN31XUS/EnnlvfdrzVjKhBGARUWeUeHmb2VEjD5TE3M=;
 b=KHz4+BgKMNX55OqITYri7GJADbaTHHQujSw0jrlbo7Kmr++JKQxmB4hhaDzM6neBTB1kUS
 vlPjtaZidmOGJ2XMM7WtmaEI+/zhn+PejmZM10ycwDOFepRsYFeWmTXefbVy8rvLR5fjFH
 NdHjj0uv5aKiDJZXsP5VOd3H0PEMHpFNWNk4JA/5y1D9RJW7tjv5/c544HZedpy4/bjlmo
 AE0RDQJCJijuI2wjdvGqkFRcNn63D4P+7fu8etdcu8xG8DLn+4foOxVHjWgoHbMqFFAUiE
 11LV6NzZ1PSE6nWDxS/lXRr2U8QJc/im29gWF530NhrwQ4vnO/qh9Y/+I7d+DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KHz4+BgK
Subject: Re: [Buildroot] [v1, 1/1] package/kibi: new package
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

Hello Alexander,

On Wed, 19 Nov 2025 12:20:33 +0100
Alexander Shirokov <shirokovalexs@gmail.com> wrote:

> This commit adds "kibi" a configurable text editor with UTF-8 support,
> incremental search, syntax highlighting, line numbers and more, written
> in less than 1024 lines of Rust with minimal dependencies.
> 
> https://github.com/ilai-deutel/kibi
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Thanks, applied with some changes.


> diff --git a/package/kibi/Config.in b/package/kibi/Config.in
> new file mode 100644
> index 0000000000..1a045ea21a
> --- /dev/null
> +++ b/package/kibi/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_KIBI
> +	bool "kibi"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  A configurable text editor with UTF-8 support, incremental
> +	  search, syntax highlighting, line numbers and more, written
> +	  in less than 1024 lines of Rust with minimal dependencies.
> +
> +	  https://github.com/ilai-deutel/kibi
> +
> +if BR2_PACKAGE_KIBI
> +
> +config BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING
> +	bool "syntax highlighting"
> +	default y
> +	help
> +	  Install files to enable syntax highlighting. This option adds
> +	  200 KB of data to /usr/share/

Added an empty line here.

> +endif
> diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
> new file mode 100644
> index 0000000000..7d99b709b0
> --- /dev/null
> +++ b/package/kibi/kibi.hash
> @@ -0,0 +1,3 @@
> +# Locally generated
> +sha256  0a2cdd264fadf455ed919e5d4c12ab25614735dfe0b30895004ce4f3919d7eff  kibi-0.3.1-cargo4.tar.gz
> +sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
> diff --git a/package/kibi/kibi.mk b/package/kibi/kibi.mk
> new file mode 100644
> index 0000000000..dae6746310
> --- /dev/null
> +++ b/package/kibi/kibi.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# kibi
> +#
> +################################################################################
> +
> +KIBI_VERSION = 0.3.1
> +KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
> +KIBI_LICENSE = MIT

Changed to MIT or Apache-2.0

> +KIBI_LICENSE_FILES = LICENSE-MIT

Added LICENSE-APACHE here.

> +
> +define KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS

Remove the _CMDS suffix, to be consistent with what we do in most other
packages.

> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/kibi/syntax.d

Changed to mkdir -p, also for consistency.

> +	$(INSTALL) -m 0644 $(@D)/syntax.d/*.ini $(TARGET_DIR)/usr/share/kibi/syntax.d

Changed to cp -dpfr, also for consistency.

> +endef

Also I moved this variable definition...

> +
> +ifeq ($(BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING),y)

... inside this condition.

> +KIBI_POST_INSTALL_TARGET_HOOKS += KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS
> +endif
> +
> +$(eval $(cargo-package))

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
