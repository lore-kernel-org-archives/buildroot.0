Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595EFCC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0804068C;
	Tue, 13 Oct 2026 17:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbSGpivqk-1D; Tue, 13 Oct 2026 17:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3650240666
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914054;
	b=DTKJIe1c/333xFrcj2vp0AWSW2CMP2VHFHrP0dIaEac5F635DMIS+G6Pb8HnFreXvo3i
	 ienZkPOYoFRQqrFbEmSBbR6gjgDaV550n5X5/oFTIrQUu5sbcsZh6o3AszxipDQGO+DTq
	 y1mcXLZB5yF1rRIsOMtwMBnjwv1yJ46ZLgXJaVawmPt/rYT7oypS/4mIDUyseITCuu8CJ
	 9mRz27V5C8YC+SxSeJI0lhbao1gUu/2rwAlM8rQSjAd4IiWoUHsoTMKfefmfXgqiOTc0k
	 Ttqhm1qTH5gmRn5bJ/ftJkY3QYf22VoE8PfgzTwJt89lTlk51fJhjT9C8qB7k/Z6RAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914054;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lQlroPtM//owxbT5w/cX/Za/fNobgDkcC3LQK70Fq08=;
	b=RToFD65X751Y3N5nlI+j8I+zanS+H73Y6dKg/XxzGx6q3qGrk5Nt3r54JJVyb6D4S81F
	 w1n4p6pfHsULzbt+fUWuy5QMpMmSoXN+r5R3xTCYjJKIsfxAPKMMoTdwsK924eju4wP5O
	 OfQeXRHmOCpAShC3XNXXEkVmPywmn8wvL7ijPO8rrBcLDFQ+Y3nNw32fcuPvQ2/mvGcK9
	 xQjBu6QMOl8t9JzLdnLGnCx8Dj8b5gpn8jNnaxOz8sPKPHVbOuqk8AP93Shfuw8u359U8
	 +UPCQxWhwaHwB/lPtHi8qkpIrFuqFUMJ+lxTWohsAMh95DgiimYtp3Jw4xx9WR/sykQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914054;
	bh=lQlroPtM//owxbT5w/cX/Za/fNobgDkcC3LQK70Fq08=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GBcTsYOaVwwpN/lg5ZI/7+rlJivrgopMMihSA64nEWjmLEEd04Q+18y1XraviTW4k
	 pFYLh3LWMgtgMoIBouk6Mcx9U2UC83tbAx8YI1UGxK1iZUZWBG/e9D8cMQNpGJMrLO
	 m1LRLM+69UIfFsciiPFSZ6kDPPdYOcKjOjzWZ9tjjnVTZawJKGTsRodjZPrV5rLhY5
	 kBWyNWh72Y5rNaPMH3WHWaNHgLtPAbF4e4bwb9Cw2X2dOCcmlhF2zSTmLlrstz1Hru
	 wqLtvoCfHGVOmAizK7fDwbi4NGv2Za3RJE8GvI7ahOAbHS0TznMged1EAXqc/8YDss
	 9KcbZHDOWsqJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3650240666;
	Tue, 13 Oct 2026 17:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD730362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A45D880AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLyTYfAy6jwL for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D0E9B80AC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914050;
 b=hUMD5kqyquV9L6wfEohcpXyJQEowDXKOiZwVe+Ta5V905tdEkp4XRhrPpQnUDKK7xY/t
 FlTNSuBZmL0nHUiTq2mvVIw68vlhDfbsnTorLIc5NoZPmTUcFSgIcJMtU0DZ7W/rtTlWl
 yO+86HyLwL5zbZHRZablCtwh+MmFIP3qiwiPhd/CXBLE/eLIfmvQgXCsYlMh1OJoSbhP3
 ADWvCEhIio0bQH/3fKcD1ghvsqakSG8Ta5vE2P2B7zlb188fPP9T5wbb3tobuyTwY+LyO
 I4zo/xv8gJzg6SgZVlI/T3iMDggR97naLmZwCgHUD3/OySIzJDstXJLIUEiADEthuAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914050;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=6M07crsceZx1XKd3oXUOarb2fEYHGinnPegsVfnKEN0=;
 b=FqLJ/y/ZzAu1eamUi4dUNTGpLHCVWmpKzUipN8IuJ+0RPYZijTQfMc67nyfPKPW7Ek4e
 sEaXAt9/fO/VbxwidUZswZamAkM38KhLWBqbB1rLR4SHc1DAJQHPQJHe69owxBfcjy8n5
 ZwBgxGbmLNYWaA+JhVT2awTowUt68L/8ieXpParO6kKs7Z8GPPdxT0iC3ObEtzz99L1tr
 9/AW0m5tD/XP7N+5s9FuCZIHsyDA6Jcej8PbgKLazH4KB9qR+kYu6pqghAZXPj4i8BQRF
 KODdUZgF2S5H6KAk0onlrLnAVAFcsKnoaPUgy8/z1CkGgayBLF0ozxt2/fDsLfZJXqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mOqRkxqK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E9B80AC4
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4D3D01A1215
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 17:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21BFE60362
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 17:54:07 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id AEA4B11D71892; Tue, 13 Oct 2026 19:50:16 +0200 (CEST)
Date: Tue, 13 Oct 2026 09:58:29 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <as3koPvBIeNA0Sjh@windsurf>
References: <20261012095005.87417-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012095005.87417-1-francois.perrad.86@gmail.com>
X-TUID: uVI9hKHsPRwD
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: AEA4B11D71892
X-Spamd-Result: default: False [-1.78 / 30.00]; BAYES_HAM(-2.18)[89.07%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_HAS_DN(0.00)[]; BCC(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; MISSING_XM_UA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH] package/luaposix: bump to version 37.0
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

On Mon, Oct 12, 2026 at 11:50:05AM +0200, Francois Perrad wrote:
> see https://github.com/luaposix/luaposix/blob/release-v37.0/NEWS.md
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
