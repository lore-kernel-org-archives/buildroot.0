Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45756CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D72D40732;
	Tue, 13 Oct 2026 17:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gIyhoPhwRTA; Tue, 13 Oct 2026 17:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2EB164071F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914186;
	b=VFiu4wf+MFxSYqrrbfylaQmmRyQW/5HAEZXGBDC78ZX2x4j2qzYLh0fl71cTqym8Cgyy
	 ESU54BoEvrgGr7fXqA7ibEHSGl5HgRY01hY/LI9/w8rEVmNiLNdyuaiotQn0Hq5Pkcpg0
	 pM32ql9PhvLBbyDD5qfhWApudmKHfj/w7s5esldRBYXyLEHIX00zbdouyHEPpeF3RTcVW
	 kO3zdJlTdanJ0nVT0yZfjlszAQxUTzpWJfRz4wQIZRmTbBTECt2oOo1G366ePSiFPF24x
	 cQNq9NAfElvv/tS2Sw8E9xogDNFT/tckmw3CdgE0Mwe4xKSIYfvm7bDfL5/TqWsn28w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=evgNE/1hFqiNhHbyiV3jM+ORYHrL3Q9FgHTJzyS/YNA=;
	b=n0PEJXWLrF9eVE906m/Ev+I8WULINbOEmCNtZ3yKRO75eJrMwp8cfOLmsh02HmQ8wlPK
	 2K/VSbuTNJMgd/TqhjP5IfWW5Us6brw/RUlvnWq3rmnoAFJhXVLHT9caoj+uCHDLhc4ZC
	 6lXQq9UZUWM0U74FEFqM2aTDcV+fBjv9phQMRrtwmhBcTIxmI1kIOJb0io08S+QTvx4gS
	 ul2eOZQ5ThPLXCQXtr8BdvxrtxSwhDAoUG8FVE5nBpU5scdfuZP7AkSGxaJIPuY3GPw04
	 dapt6BCsHEoRwwLq4zLFtjE13YzWrKDMxBfNN+nxlU3RXhZOAf2F2ru+TFKAMxgRxnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914186;
	bh=evgNE/1hFqiNhHbyiV3jM+ORYHrL3Q9FgHTJzyS/YNA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ogfse+JGQGGbKAISwoSTyT77Y0uW8OhDMIYKquZyRzRAHD5re35R1mhHBFyMZ6zwm
	 gkylb0IZ0bxR3uk18j+F7tyIIP84tTTDcDIFySluRk2jJBuGKpmLME16psqRKQfGxe
	 pIcPUsT7oVKb38Ehpgq5RNJzZsZDlkjQbF5VLnMe4q3dKciwgAoOMq+fsOAcl9U0qf
	 MuzwoaeP5zg3h79OS5ZjXSI8Xrot7qYYODS/FRD9ZtZKPsMqlurPyO5J/1PKbuMh/n
	 +AykGgeFNkdyQWu/HVczoc6u2xXp8CHoO1J2KYFb8595ttGbB2ON37PSs3I8AsnDxY
	 9LBWkH/p7+HMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB164071F;
	Tue, 13 Oct 2026 17:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37C8A362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 296A840707
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moX1zh8p-mUx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35E9F4071F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914184;
 b=ahjxVyI1i65XD8guX4ihDWbFOmJ5S1/XeyOaOTP5HHWLXmO9zvvtKfcHH5kWjFwHYd//
 eWr0jk9xFzFjmUuksE4LJkm02vzapzCudEDeYss1fdEcMB9OJtmv/mkURGE7UDRaQrpOL
 iBzUKg3seQh0YaZTTSo+E7DWyOHo+nFThQCxSEnALIWjuF67smc5ipGxfSri8Drnh4um1
 07ltjNmhQfGdgPw0cZhJD6hilvxS637DLsY6B7RnJhaYqhUl2OEA2Y7BySKQtCFrMITxZ
 eHdjdDCNGuMO6H5aEgF2PhqoZBs13etEnDfBXe9V9RMmWhDDJgM5mtmMTKJq++0ZB5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914184;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=ZiUuk5YRQMlp+ZJL8W1p4XxOGtvdFIWZK3tvu3vhQVQ=;
 b=mk3rhsPA+3arUMltcAYgydZmB8Lj2e5uim1V71HWrZZznFWXDduUrBh6UZTdQ9CwCODs
 ytviaGi0wXd4kwrNjeZatIXa4dL5XekLwtDO8XkmX5Huoa13NvkjbyXLdZQriqRfKLykJ
 XvGWzBPPsDHISsR2GRYsQRgVDvc+YyVm4SHkkHvTEF2/dB6PPTW0KS946XoQ32SPzz+K4
 Xu35FgqgG8JRz/dYs52ZlEB19W25XjEYNNMCeXZjeCqE3rg+8NeY82VAzUaLXclkfnTnZ
 xRB/ASDUwweJa2Se7TaFEbtthdGT/Hkgpp34SzeJ6XrhRLDIzxpTU9Tm4veJnk7RNng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vAhg8B8V; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35E9F4071F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5914AC653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7F5960362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:20 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 46E9511D718C9; Tue, 13 Oct 2026 19:50:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:12:53 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <as3n_5frXjPNJoNZ@windsurf>
References: <20261012163812.1213902-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012163812.1213902-1-fiona.klute@gmx.de>
X-TUID: ugzNSIrpPPNo
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 46E9511D718C9
X-Spamd-Result: default: False [-1.65 / 30.00]; BAYES_HAM(-2.05)[88.38%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_ZERO(0.00)[0]; BCC(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmx.de];
 MISSING_XM_UA(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 RCPT_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 URIBL_BLOCKED(0.00)[bootlin.com:url,u-boot-project.org:url,localhost:rdns,localhost:helo];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.10
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

On Mon, Oct 12, 2026 at 06:38:12PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Release announcement:
> https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html
> 
> As described in the announcement, release archives are now published
> on https://git.u-boot-project.org/, so update UBOOT_SITE
> accordingly. Note that old releases have been added there, too, so
> downloading old U-Boot releases should still work with the new
> UBOOT_SITE.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

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
