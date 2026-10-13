Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C110ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3C560705;
	Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qM59ZtfS87cp; Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A3B3460768
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914049;
	b=WHxBHfq35YraA4VQDCwFSpr+CiRF65FpKyP8xoXefRzLOONmzGtp1wwNFh8itMsZXev5
	 CeCS5IMa4lKSIwpgYakxZqAKv0AwDZU9oQNsxuPQhj+3/nC7DSQdZ0VF9Ri3H4DAzP75S
	 4FXMmg9oE6KuqDN+VGwmCqfA7KR1TbB79s5POue756quNW3zk7KZLFDC4q/bNXX+5y/pk
	 MZ5nn6889WRngQD6lIb/76k/9sfzCyBSnGJAgaGu2J9pLzocmY6NkzI2RDrssTTsK3kzW
	 frq2ReDRidWzky+5dJrR95/77ft69Z3sunxyqgaXLetPE6yUdB9LZ4qrsFoUIeXjbTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VxJBYaF66K+J9lnREuAUGN4Bf5FgcQgmU7cQ/GpIYD4=;
	b=LfZ1VG/2/nw29Z6BRY/kPyL5eCJWo0VFo4v5U0MXKfywijOfPfdDd/WBdg6FFLljSLvh
	 pzQqKeOMmLbKbn90Itxc2V+yA2jls0+gyKTmDMETgd+Lq/nDie95Vzol7q+JT+BrHbty5
	 pwrPV641Hgt8ZfUVC3JCdGP6rLKc+yj9p0RGTbBaKlsiPVK4uQkcr2es0vfMCBtjdfuDa
	 IshZyEgJhCiSeak7EKZDhA9qGlEIPHXVkLMu3rPDwP4g/jYUZX307fkUHxrcSj23KXzBQ
	 B5wzgfNqdDRlfM/E0hruxgUZtN2bD6S5w2f+36DoWbAks9OEu79fwMp4aTonMspM27w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914049;
	bh=VxJBYaF66K+J9lnREuAUGN4Bf5FgcQgmU7cQ/GpIYD4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RTwnH6LUHRsxexKDXFMb+eRIJMCrcOZxPNCsGPmlxsY6DQcrYzWgYgo+VytehVpPb
	 nolajYDxU/ta9pGpqYHlLDD2UK+Ix5IDg13cQlblMNLHw+1mgr92PvUPZFhAKVnkPB
	 HJsh67peKh13EO6zOxJcHOmm/iwK8R7woQWqaubW3ralvvgrI+Xc+ahiYzpAKiTRpZ
	 iu3qTgI2Zno2BcM085RK+gCJfvxSjNQ4icZFNVJkTCDvwS/RPFAsT3oWisazBtWLSZ
	 js5USVAr5Ml8gXAVJ1omZuzx/p238PcdEhwNTMozOd3VWMdGAfrs0nGgpGMMklunzy
	 OPFDsFik9ulNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B3460768;
	Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE4E362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2EB780AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2woyXT9z9Z0 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D5CFD80AC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914043;
 b=EXTrv5gB+NBXRx7drGPADGTMU7iIuMP8fpDxZV0Dgx6gTgDzPA/zW5pMwJYjXRbmHFGe
 7VR9WcXW5tX00r4AMxsXUUBzGat9C69VngkV0abmJlcXDc529Oo0eie5UYMgnUFB6nbya
 3yP92tre/uk9jwhywcwY197Fh1oEt+hd+aHXaIFl0u4VE5Qs12MiQSfybVuz/wRyTjS+J
 ngFQO+sF4GEReKnJFAMLgnoSSfRgE/qszz2Z9m2yVh951iXjIbJjMmgWmbKgSFuvX5Kyt
 rysH3/OJiGIq1dtOfeVS+bJl2diV++KpVDItOm9n3DI4vQWh0pal6S4jI9Ng3Ulj5IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914043;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=ACkd6pgO7Dcgginciyr5i0h2we1Voh/4U4MtIG6QTO0=;
 b=gjWtJKWnA6yGTf8EjRwyX130LWv2Kow9HBi+gpyqCdL5qOYU2TLsxaqJHQp2njKXbkQS
 BKWOIPDtpJHeK/jJ9R7GR2EAFP7jTZXBzGtZhnwyE3Ci18yzqF+AJJBoBw/1R7+skF4zp
 y6G1CD3zKr9VZLUVhYGZFIO19NL7t4sZ5sSPhw3zm/pSEJyHK5uhUzCa2nEgvs1pJCt7/
 cZKoIxteS0OIvokG0pnCdWl7uTWBVM1gCviXNS7R9Of3md8E8Igw87DRmbw3EueCdw6e1
 JzLX21EdMQgLW5Xcy55W3eDJVC15bSQ4VNlHCs7hfgYV+3C/1+1Tqaej5xYJsS5OAFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QH96Devm; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5CFD80AC4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06B2FC653F7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67FB660362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:00 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id CF24511D717F3; Tue, 13 Oct 2026 19:50:18 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:31:33 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <as3sD0VIZZwk-tXn@windsurf>
References: <20260607213030.1509913-1-romain.naour@smile.fr>
 <20260607213030.1509913-2-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260607213030.1509913-2-romain.naour@smile.fr>
X-TUID: 6nRsRFtI+Onq
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: CF24511D717F3
X-Spamd-Result: default: False [-4.57 / 30.00]; BAYES_HAM(-4.97)[98.74%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; FROM_HAS_DN(0.00)[];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,korsgaard.com,rnout.be,free.fr];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,sourceware.org:url,smile.fr:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_FIVE(0.00)[5]
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: riscv w/ ISA RVV needs
 gcc >= 15
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
Cc: arnout@rnout.be, Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Adding some maintainers in Cc.

On Sun, Jun 07, 2026 at 11:30:30PM +0200, Romain Naour via buildroot wrote:
> The sipeed_licheepi_4a defconfig doesn't build since the glibc version
> bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
> w/ ISA RVV in commit [2].
> 
> Add a new glibc dependency on gcc 15 when ISA RVV is enabled.
> 
> [1] 227378b5930b681c79a13476ae60a98753a98a03
> [2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/glibc/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 2bf44bb70b..8e5b08ab7f 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -27,6 +27,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
>  	# glibc needs atomic instructions, and does not support
>  	# single-precision floating point ABIs (ilp32f and lp64f)
>  	depends on (BR2_RISCV_ISA_RVA && !BR2_RISCV_ABI_ILP32F && !BR2_RISCV_ABI_LP64F) || !BR2_riscv
> +	# glibc >= 2.43 needs at gcc >= 15 when Vector
> +	# Instructions (V) are enabled.
> +	depends on (BR2_RISCV_ISA_RVV && BR2_TOOLCHAIN_GCC_AT_LEAST_15) || !BR2_riscv

This will hide glibc if gcc 15.x is not used. I was wondering if it
would make more sense to turn things around and hide gcc 14.x instead
if glibc is used on RISC-V RVV-enabled platforms?

Peter, Arnout, Julien, thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
