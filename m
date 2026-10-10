Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B3FCC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E76560705;
	Tue, 13 Oct 2026 17:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2ehbgIO-ck6; Tue, 13 Oct 2026 17:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4AD456073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913974;
	b=cwSvDs5G23qOIwFP67cJE57L0hBV0KSWsT92RVc4NDcbLFpm32sI5RxRPPMicD1EKduH
	 o0MHtYysCp0yRvhB6hwEfitVl3nMjox4lSUMNPqgQ4tAhSOUXwef3uRZNpcMhJZWncPIn
	 IJ6uxqsL3aC1XNlIEWCCnQVt5PsEyPnLlkOkPVgk9Rn8CVuLHwbdwDkzR1uuBbV/gtS8F
	 3CWkVBJ2dJwbwyIpH40qQZ7Y19gZpGmtir3C4MXYgGR4t03nuyEaGRyy6MmJKdBn5CaZn
	 CpB3bVm0poQJKsUZLjB+Z2MByKULDUUJYN2G+5YrEXaPVHwagnZnwCbirbmsvQplBIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pnf6WiYtPyzKrU69D+rlFzEwiwE4lF5Y2wnv/yZ+uxA=;
	b=BCVJSX+4M8dFAizzdWIjrQwOaDZ+fkxfi8ddjRPqmRskTJ0EAMDvU+LLNRNzKFPYnr2h
	 9TjEpnuZtr7ajZGEwUA/0UFTI8phb0rPgzzNE5tfpJ1KNCehqA2NXObKI84MirqXwIJH8
	 8mLCUoA7HIpHKDrpZMHEXHNsnFUAX+R/SiTBMgbNQdhAg0mGH8NyzuWhgx04J7naZGL6i
	 T4ZGugffLTGa9mwtm0ETV6v4oqTsYoMXwKIj5Tc7na/QOLyyIFmUA+Gcz5Kj/lPCxZ66c
	 T2IH00RnKPboVaBV9vQoRjd5Ge6gduhKZQGEXJIW5icCOCEem0K9gHGsGsAbdpv3vag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913974;
	bh=Pnf6WiYtPyzKrU69D+rlFzEwiwE4lF5Y2wnv/yZ+uxA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S2Wk77JELjwE2d3pK6owUg2s89wZpeI7dwlAQ+uvRqoE+NTA1n4qsBG/N26cpejxL
	 PPt8Ky1586/JNOEVJVzs6v0PnwpiswRGs/GtFy0c0xzToqkomrXT6Hu+Rui3l59USG
	 w2k/IIj1mri+pKong6MVOva4qZ+0pryV6USGZgOz3Hyo3l5Nh8C/PHR34DQ57DNn46
	 WsQJttmiwHSTIFDvMdrD7t/XfZkz95pXEMs6oNBkuqzUI0oAZwYYIiqupO1JQPRQW1
	 GxrODYXcW4b55/hTAH2HSd/KkVU6MIr9J7o9qKVHQ/Yrk/IZaSjNyAWpgpdUGvN5/N
	 4+SY9futj01Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD456073B;
	Tue, 13 Oct 2026 17:52:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA74D75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79BB402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1LQmS_B44qO for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B1F324002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913971;
 b=Pi/0eDRifZTUAfPzXHG5x9I1fkdElETM0gN/izGdUwa5UHAMeOwiKnuQR5EzkzTbJUZB
 ae+hXXIRI1P9nHR2wFWYh5NUZdoIsshkNb0aY5Jbi1aP+pE8g28Uj7h/z/X0x1qQx7cv7
 XtWpBrJ+yDy83S3xggmvFa8wqMYyLVbgqqrhLwYtTxbFvhJ/s8RJnizIn5As4jPEg8I2/
 VLkkeawZAQVMdZLJSsf5U563j/CIxlgkb0EFgNEC1BJDIbUUY5XQnODu353nGE1kb5dzC
 KxS0v1xiN5s+A9taqPj+EQUF32RSWHIAcTGiYJi6B5HQ58wGxPXCJ+4595a3DtBoXJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913971;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=napSuu/GItD7OUMsCk+ezEuY6dMn684o2/DgIjYLZOI=;
 b=dQCcFfLeL0zmmhd35xVDAGrp7+A743fsEsRzWXibmJ1huqrokDwatfHW/ErIDODwwQc/
 EBfiOjxssh+YKMkOczHAjVLl1o6sNrAFXi5Tqn6TnyD78mhvhO99Uzs1H9jzOZkquUS3i
 i+0v7YQj57rbEvLeywaUn6wl89amzlhgy3/xSu7L+kAm89gn3NNrcg/ARP1w3nsx53L4V
 RcbUWZnv747NmIyE1xmBA37IAvn0KRwkVGF5lmUcSrkRLLJf4dtv76+Q77Ea0oIfC1tiS
 owE8/QWBa9ASUGrjFDu0ZERCCq1VyMprp8PfoTlVhScfPtSRPYtUigGqDV6zLC0s7pw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UB7VdTz+; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1F324002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 022CC4E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB62060362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:47 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 3A62711D7189D; Tue, 13 Oct 2026 19:50:46 +0200 (CEST)
Date: Sat, 10 Oct 2026 23:06:26 +0200
To: James Knight <james.d.knight@live.com>
Cc: buildroot@buildroot.org
Message-ID: <asqozZsoekYSa9YL@windsurf>
References: <20240216055757.1588-1-james.d.knight@live.com>
 <CYYP221MB114065AD82DF8DF273CA6105A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CYYP221MB114065AD82DF8DF273CA6105A04C2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-TUID: qFdZMBnuTzxO
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 3A62711D7189D
X-Spamd-Result: default: False [-0.41 / 30.00]; BAYES_HAM(-1.81)[87.05%];
 DATE_IN_PAST(1.00)[68]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; MISSING_XM_UA(0.00)[];
 FREEMAIL_TO(0.00)[live.com]; ARC_NA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; BCC(0.00)[];
 NEURAL_HAM(-0.00)[-1.000];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; RCPT_COUNT_TWO(0.00)[2];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,live.com:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 2/2] package/util-linux: adding cfdisk
 enablement comment
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

On Fri, Feb 16, 2024 at 12:57:57AM -0500, James Knight wrote:
> This commit introduces a menu comment to users to indicate whether the
> `cfdisk` can be built, even when the basic set binaries option is
> enabled.
> 
> For users wishing to support `fdisks` utilities (cfdisk, fdisk and
> sfdisk) in Buildroot, these utilities are enabled through a
> `BR2_PACKAGE_UTIL_LINUX_BINARIES` option. This option configures
> `all-programs`, which will default enable `fdisks` (along with other
> program options that do not have an explicit configuration). While a
> user can enable "all programs", there is no guarantee that the `cfdisk`
> utility will be built if neither ncurses or slang is enabled. Even if
> an explicit Buildroot menu option is added for `cfdisk` (where we can
> force select ncurses, if slang is not yet enabled), there is no specific
> configuration option in util-linux to toggle the enablement of `cfdisk`
> at this time.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
