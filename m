Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801B2CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4741640334;
	Tue, 13 Oct 2026 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC-YbLd3OI9d; Tue, 13 Oct 2026 17:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7318840291
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914242;
	b=nu7orgQGpp2NVQWXGK48vOsHHIPF4H9de1Noz6Sri5wR+3wwFix9pjoEtUwF0o4XC8ev
	 Gs5Do3WTKHkae5rYgxl3tisUO80McbpEGZWNyP5uUYbL6muMaDp3PNqw8uUhbHFNqWEjj
	 3nmAZqkw0IUt1A4sQBYHdFHc4vLvAZKrY5r6jFxr/hvFleDkR9OLDFI4JA2AO7tcPch5Q
	 oU/AuDkklY9OWjtz7q3Cu+dxGmx1LC0N52cK5vlCkB6u2f37w2rdL/cHI7rPxhSOkQJ/t
	 3qKxcHy3uxQOnWOtAVmSRcf+2r3bw+7JNFItpt0FM0q7/qhhoKHDNI7GYNjWK2fJa+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=00vQEdUMddbqOIhQPiLrXUYFsBxLEqIHaX5oibW21H4=;
	b=PY+gpB803ceHqif7BrK28qiCkD6HWciVa12zURF6CVEtKVHSyZlEWzzUyBFSPOUqZ8b+
	 5jVnxlhSK5xjCzdYKbGGpj2n1Ul8suBlDaKHmOnXRGIFiWLjvjq8+/eWR8tqD3sMC4rl5
	 v4pYP9ll35T/g0rwSxxW9Ma6GvI0hS/VPc1jTOzwFrZv7kXX+jAMASkuPUwscdFgsOyzH
	 q9YmQ60jnM1v+7OP9F0amFJw200azxIbYebnNAOBQWnkGcn/2MRMFRKx77UdoYzGD+00T
	 1VieTTAOtIeYurycYCy2CS8I+/9LBQcWrQT6BGCkJN7LAuFk3JSQjdahMksK3u21ogg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914242;
	bh=00vQEdUMddbqOIhQPiLrXUYFsBxLEqIHaX5oibW21H4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSUFWk5+CFoSjmUUXpFUSbbV8yNEtOvDnBui1rsNopwK3NdnkPz1Wh3O38gBrdEX4
	 GPrRpMcVZejWLUr1dHIRC481cCaqzJYzZXt9OTpP4e1BCw3lQWMbYihvFXYsbjlyH2
	 teYcK4Lje0BU0p88bhddADdK5u7YIA/gYnNEujm2AXA05Tl2sXC4Y4AuXqDaw+zmVz
	 MIJiUzJd37WOYFRldu5GY5LrpWy4u6XxA3NzDanJLgPRV5joMaGN3A47nikUrT0Nlp
	 Kr2eeWKo4t7CGWUH46NDqwAwOE8c1npeQzadn1/EvIuWVgjl+jaPKILSwBkiqluq5x
	 e1ICTchS1M5kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7318840291;
	Tue, 13 Oct 2026 17:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC392AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9189A40782
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joD8NOgtC3T8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB6F24075F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914240;
 b=EpYGR3rtVyJlz6cxW1lLHiaAQOkDqr79UfNi68MmZvkRTWDzfqHRloaMITD60shenxEJ
 26Q0bFEEHkGxvHzrZ73obdBKUbyqZa0jLy9mJE3/3c8EWSrA4O8m+e1jctVFxb81g1uO2
 9kLT2xaE3a/9r/GnxeFlzm3IEiUl5WdrGECxxWa7LQu78PmTAp0fpMitpF5gN8DnaxER1
 g1z1qu28D6GyX47Oau3p7S6aZ/VeZfRQeRBS+IOslagNFmwXVJraAV204pGbGobACzJoE
 tkotLtXQo941DGA4tOBllKZPr8I9FG7hfMDBx6URPrsOogm5CAKKNue1ShaoXrYXHKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914240;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=G/Womn/J1WOcVjoVlixdkBSjt8ZpGSiHspYs4z298l4=;
 b=Y2pr+aLRnsNwGohCo+6KxeU+LlGxlDNIvidkVTpLSDjv5YT+WL6aBpYbuffbclvUCNg9
 oGaCOq90JfKI13B44huW+d+qPaLKOl7JF+ijvDLd+BvQYYQHY8HbJc+t+KydC/aXTIiEO
 w3vAlljkzwvfrQSVVwzIxSV1v/St3e/vLkQAaa/M8rJPredo1Qciaz8vjgIEs8fFUJrZO
 JR5GHKibCF48Ei+JHIefbqGjMk0toDoWDPvJq66HNXk+IGZDDywj1Agp9EGuBvW01XLw+
 p5LdSs+0y1FPssVzIXy6PPhLSerd2svnKvOeTHErsZFgG19PnXpLbN8cQrPDWWpAQXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="X/XRNhsE"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB6F24075F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C96E34E41217
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7F860362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:18 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 165E611D718A4; Tue, 13 Oct 2026 19:50:19 +0200 (CEST)
Date: Tue, 6 Oct 2026 16:03:32 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>, 
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Robert Rose <robertroyrose@gmail.com>
Message-ID: <asT9jXZcLXs5KKvp@windsurf>
References: <20261005194814.1090598-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005194814.1090598-1-buildroot@heine.tech>
X-TUID: jN1c/foRQo7d
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 165E611D718A4
X-Spamd-Result: default: False [2.07 / 30.00]; SUSPICIOUS_RECIPS(1.50)[];
 DATE_IN_PAST(1.00)[171]; BAYES_HAM(-0.83)[79.00%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; BCC(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,ginzinger.com,gmail.com,linux.microsoft.com,grinn-global.com];
 URIBL_BLOCKED(0.00)[buildroot.org:url,localhost:rdns,localhost:helo,heine.tech:email,bootlin.com:url];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v2] package/libabseil-cpp: require wchar
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

Hello,

On Mon, Oct 05, 2026 at 09:48:13PM +0200, Michael Nosthoff via buildroot wrote:
> absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> with wchar support is required.
> 
> Fixes:
> https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
> 
> Assisted-by: Github Copilot:GPT-6 Luna
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks for the patch. However, your commit log does not indicate which
update of libabseil-cpp brought this wchar requirement, so we don't
know whether this fix should be backported or not.

Could you send a v3 with this information added? Ideally a "Fixes:"
tag that points to the Buildroot commit that introduced the "issue".

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
