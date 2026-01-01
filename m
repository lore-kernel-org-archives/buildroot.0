Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94BEEED628
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65C3380FF7;
	Thu,  1 Jan 2026 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqiMZO_Lb5Qr; Thu,  1 Jan 2026 17:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A0D9810B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767287918;
	bh=DNqYipmNdOmL536Rug3g5KmuOlWuKPLQn5YJzmrRnFU=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=drdrbbll1+DGgIH8LVw27bQXCD9MVSuzFTH0e3Zkz9gfiSg1Pvbb34giYaNfInFsc
	 y58fNPDJDvcr7D8GGlw13ftcrQCrWaoCvqSBEyZ5+jXP1aqAWZbdkxq9UPdWmpq2h+
	 E65t9swf+XVJoPb5dIWluVEm12oM8jDHPd476EEEBMIqZjuORxErp+6t3S4f8zHfuC
	 fYD65sKHwHbp5pKPcU4TFvbsCro+6osrlLetFD6gi3SY3NM0I6g+UmIR4apC8gjkYr
	 NJY9eN2/W0zdOtk1vv3yv9ncGT9Ib/9AUuJGtkKP620JMG7bbqgWx9F3soJMwpdMGF
	 hS0Ay8121BewA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0D9810B5;
	Thu,  1 Jan 2026 17:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C957019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF53810B5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSctTOk0-tq5 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C92E580FF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92E580FF7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C92E580FF7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:18:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6F62AC1C39C;
 Thu,  1 Jan 2026 17:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 019BF60749;
 Thu,  1 Jan 2026 17:18:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AEB2113B0780; Thu,  1 Jan 2026 18:18:31 +0100 (CET)
Date: Thu, 1 Jan 2026 18:18:30 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20260101181830.35ccf7c3@windsurf>
In-Reply-To: <20250929092431.8974-1-fiona.klute@gmx.de>
References: <20250929092431.8974-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767287913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uXlCAQGiKDMk+Gn66UMPLubVh/LvP5Nw1lGlPrR7xig=;
 b=JdmWYmk3u8GzW4gq5QI7jkADUFVLTj4L7ogvPFDfBdQVYvfy6ZzpsRhV82a4/y0lkXGZ9e
 j9HxrN8S7+yfPQNJ3LrSOVeKPWC1Ju5sOZZpf6GSuY+nWlz/C2BBYe6EWEKMZTztL0pm+R
 5Q/LViPGIQjaBbwzIBRUL1RrltlcmQS7/hypnfD4b9CDHxc8h49kWdzzgSNM7fwcPLn+sR
 394+AIlcu1q4K04f2fle43SyiFXWnYkxBwXoZK7zMdytDu5iyg3M8NRH7Y8vjzNFn9cFSW
 tFvIYSVDabt+o881gn2zQE2zpKF2Dw2kQb7mMvTpMsWrrUxcx4IEy+ECVB90LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JdmWYmk3
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

Adding other maintainers in Cc: to get some feedback. If there's no
feedback, I'll apply as I don't have a very strong feeling about this.

One thing perhaps that bothers me a bit is the naming, as from the name
I didn't really understand it was for br2-external, and I was wondering
what this concept of package-external was. But I don't really have a
good name. "make check-br2-external" lacks the relationship with "make
check-package". "make check-package-br2-external" is a bit long.

I have a suggestion below, though.

On Mon, 29 Sep 2025 11:24:31 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> +# $(1): br2-external path
> +# $(2): br2-external description
> +define check-package-external
> +	@$(call MESSAGE,"Checking packages in $(2)")
> +	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
> +		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
> +	fi ; \
> +	$(TOPDIR)/utils/check-package \
> +		--br2-external $${ignore} \
> +		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`

Could be written in pure make I believe:

$(TOPDIR)/utils/check-package \
	--br2-external \
	$if ($(wildcard $(1)/.checkpackageignore),--ignore $(1)/.checkpackageignore) \
	`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`

(completely untested, of course)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
