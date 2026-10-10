Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E2ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4180B6083B;
	Tue, 13 Oct 2026 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2R1g0x7yiBWz; Tue, 13 Oct 2026 17:56:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70CDB60828
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914195;
	b=N8LnNWsunnP6HukFYi48gI3zgnHdOHnSjvH/MLEprvd3uK8fJh0tD0STM9De2nWHIH5d
	 OHliGyhooTpdet7Z3YQwsDCTKJ9hP8QfI29fY3U5/MwshyFODd8oiews/vn4qNVlXj1P1
	 sC68YgG/uLwTZ70gBBYyohZ+SfTHMfzhj0SO/+WxszNW9zeeSqrg2bip0TvA9/TrmwxOv
	 dK6RzeQRK6yrweDQC2XSozGf7m8nILwEMlPE199uWGhKuYWdzS0OlPNZ7yCN2i5j4CK7x
	 HH/72R0ngVIdhw6Hc6k3lx5FgcwK0RfsPvvCpCwdWiVb+OhUsqcRSEMYZ/lXoPt/EKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0NKtI5gmda2KH/lyNmJ+QTHRtb532O275/YblHU0iKQ=;
	b=luOe2q2082YpSq1JbdHvC70pJNVqEu0+atWRErjM71m9cPatrrxzziQrGsWyNdFmge69
	 dm2xbCCD8QEhDj+l9gPFlppHAdIW6OqUcoFIF8WdOds4l5Iw4KTMIxcfx3WTkEF7rB5zB
	 jmA6Xs8boDGm4sFgavgebcX5SaahQy/Vkxb3fpixB1ls989oBY06HsfcMZjXuRaUUxjyT
	 JOZPcFMedLkaoI1AM3bQ5EXlRvnie4ktsMg2wWevN91DeswcytaZzxU4fHM1FlQizBtGL
	 raE5R4Q4ddLJdJzEpTLmDVZdlefqVK5saC8cLsnq9mWq5zYrliNcs/uWDepx4L4qDPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914195;
	bh=0NKtI5gmda2KH/lyNmJ+QTHRtb532O275/YblHU0iKQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Eh1RWoEYZRDfczbOxjm57TBycZz5XPA0DSg2whqgoH2W1ccE0InVGnoUFaZYTjb6W
	 6KHIXhOat/ynoskqKK3qeKjkT9Vc9woQK1eYa+y+8OUTT4IV0kebFVIY0V3IYtxmaf
	 lOvirffUQpKPaqWfIr9tp1dt8a6YEfRy/YuY/gsoRBwAtgC551tKkOchSqGutrP/tR
	 k6lp006oPHLhNHVrS5aP3D4hm93YgxJCTGG0JcrxG4tyQID3x6qT2Q3gCXi/Bz3483
	 9Xjqbsqt0kcVVMoHWUNlFypHDHbHNXq98wY48mTegO7oQ6YUIaDpvVcnpnx4uOfM8/
	 JfpuibSEFnYsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70CDB60828;
	Tue, 13 Oct 2026 17:56:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 448942AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 347E64074F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlHM5ajbCIE9 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 392514073F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914193;
 b=DGM0sK93I5MFNvyRO+/mNqII9ipWfYRB5KWrD3kUBc+SFNxTRanOqsJ7CKhfydS8bM/G
 BWOFI7c9tK6USouWOALefIUbjTla0iAsEOiOJTpt4nQRR0+sIhNoaps/suznHTqNEOxuE
 GW5GA64AZTu2IpHXwR+CtSMFIG2FLD6Txa5R08a7dJ+OWKoHd7TJHThwVO4Ix7NYCEnZz
 qL58ku+cyG8P5Gr6DuT5NIDdrLPDvGY5KKh7HgpwAnnvMHdzj3y0F4PWc/FECJIl67Gzg
 ssYGbbbNaws6JqjfWACPEhiesZarvXzMugw9cOeynvIrJbj4wpSYv3HHedEX/rj/HXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914193;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=sDAjmmdmdxg+bIkLxxfCaJLLkuEs3c+KuptjdW4mC5I=;
 b=a5rcd0u7bs6xMqbladY2F3CmLP+drAeXp5gjgNrlNsnIfanK6VdguDL9ODmh7Nv06pvT
 VoO3jBIO1vQzhQGlROQQjISpWG+gZmCJt9tRmaKDTe4G2z9OgBNYgSxFZlAwmmVlPwsIF
 vQPTC1klg7CFF4tmQ708gPtHhfBSoUDwbzNR0QBge3B4F+D/wdEDZFJVWx9eA85ydxl0K
 LBI0D9pOtyAGdOv8SeyjVn/Z+CG/pxZhAvAQJGRbKWpqRZliRLVdjDvVcMKzn5OS+IEzI
 xw1Gw/f9hAP9Hps/nwl0oZbb2QuQkoMw5sXACeSiLHoXzhH+O6k9Dhhm9IfyCKGoz7A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=INLNYsX0; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 392514073F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 22B164E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E5D0060362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:30 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 676CE11D718C7; Tue, 13 Oct 2026 19:50:36 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:08:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoAhBeAstxCtxIa@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-39-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-39-bernd@kuhls.net>
X-TUID: KvxKREYw9oEl
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 676CE11D718C7
X-Spamd-Result: default: False [-1.18 / 30.00]; BAYES_HAM(-2.58)[90.97%];
 DATE_IN_PAST(1.00)[80]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[kuhls.net:email,bootlin.com:url,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 38/84] package/luvi: bump version to
 102-g9fa6c141a
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

On Tue, Oct 06, 2026 at 06:20:19PM +0200, Bernd Kuhls wrote:
> This bump includes a bump of the lua-openssl submodule
> https://github.com/luvit/luvi/commit/98fa10f2823d4a9bb93306bf445d596aa8c4a75f
> which is a prerequisite for the upcoming bump of OpenSSL to 4.0.2.
> 
> Removed patches 0001 & 0002 which are included in this bump.
> 
> Renumbered and rebased remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
