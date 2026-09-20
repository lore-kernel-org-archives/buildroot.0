Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE1C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C304880AED;
	Sun, 20 Sep 2026 13:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_6_MjOZInTm; Sun, 20 Sep 2026 13:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 882B480F29
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909607;
	b=Lq+Rg2H9f9L92M0GjhGp5YAkDH9QVKhWQGpjnjL9bS7fKqdfqlekJysJzVsPC0wlbvG0
	 6m+8l0umwMO1lH0tC3lf0oh00Vur1zgCJiPqb/fTDoBMPzOHUk7bJsuyfqd7rQ9YgG4s2
	 8JImOQQVqpYXdhJ4D3xlYl51fn76PqZQFfpN9a+9snKuzRTxd6bewIJ4WSEXBht6HxIxV
	 gm22qrTw0duvQMCZbqUfemjc8HtvhzWxTXbuH8s+D52TbwvPwHANVH7FqRFPQCCFEpxyk
	 +TcvmKUhBbDku/62FuyyfwYx+l1TW8Rkn9O1YAwz9K6z4AZn1sP0rKTiqfMnM1oerHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SrSk4qEZUn4j85BHzh/ckqWkWLXiStejPfTTuaYJUUw=;
	b=lVRpLUya7x6mwRyDgMmGIrAYf6D0p4O0zQPxdI0v0hwt+MeVuecTGTjm98j8l+e4gTT+
	 1eRrQaKnG1k8le5MQ5zXrfyA6+YQxP6kS19+BXDq2ApEhyWxaITKCEMByGjPVTAI8dFn2
	 /OYp0mWBya+M37OnGEc0x7eMuz1c7f9BEHD+FWIhbyyoc9pHyfkCE28qFEdGNEcNSk4M5
	 gXiQr3Y2bTGCB/8bGb+vfwXFhLy2r08ZEZAmK/3hc+QiNL9GVWEcqvFVSRYeSxVizOHq9
	 SXT5r14103c+wXPZiqRAfdAq5+4kf8esTcaXbhKS/RYCYjBsZBmwrS7tGcLfVidxDaw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909607;
	bh=SrSk4qEZUn4j85BHzh/ckqWkWLXiStejPfTTuaYJUUw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BMdouBsf58Ok/zxDkP4k0W+unjLej+MFF7HDDp5SMI1gifJPdiv+We84rpE7tpEPQ
	 mkAfrwINtBxeocCstS+sH3K6cOjLPInUrSroH0STTkZq72GJpb4icX3nUfwXiFx1ko
	 m4MDJKupg0090X4MgrOdFZKecmbZbnvsvZVmCxp+n4QSPVR6EVrcrNTlLYDQsvHBO6
	 T5LQ3mRZjeUiZu/bKAmAzV1sj6LHTH10foDYWP8yBp9bkYokGEHVbnCQst6j2Ha837
	 uMODAspWwXs1pNHklxSfgfe3PyAXiFoDwxFeTz+WzvSHPEQ1ey6HCx71sT+iWRk2D6
	 ig+WIs2uLSW5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882B480F29;
	Sun, 20 Sep 2026 13:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFE003AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE0CD4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtcg4-gjTwTz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5066E40129
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909604;
 b=YqW5DG2mojXavwsTrrRQx6EmBz3FtZMhJRdLwrLgFTMZjPaFzl4znlsC9bNpXXTGfpaC
 pm7UY6pXOWeR48bkEzC8WOO8qNkviuwFp/HOU31voWnDL/KmLCUKn0bDDOlebKCAkahg9
 2jzlcdHjFBCdqperc6RnJYYR3fUPo6KOKUFNPcQ5zXfAPaex1DwjUTGxed4PGve0/t1ay
 iwNmniGdzKl9/vUImCQjT7SXaAmZmFLCz5vjnbmH+NmlAV7pMh4Rx7ls10EB0bd5GD2MG
 tEgbog9nzmNEEU8zjslgJ9zLf1zVdSRfNCN6FOJyala2aByF2ZomJpadIWxaxEQA1hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909604;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9PIptOY57i4WT5am8FtJRIZ3e3YNIJlAostO2X4dPnE=;
 b=VHFD6k3yOmzTc/xqMLpeDHcmp58CcQaP65AOMEVnE0iIKOfh0LBNuqVdTXSL8l/rZTeP
 iQZFCj9h0JnOwwNpr8l9WMP7wbNGnYvGV7dMV9aPU8BzWHNKaqkBBIR0L5Q1KLYkUo0W3
 MZBuw395bawZYyJWgmBTjRlFv2rjZu/aJd4uXDa+mN+pCDSuTyKcLelTtL4EaPilYh6Uz
 Y6vqngOsWF70pgR0ooXNTZlBVnscbGBEx2Wc5u40biip27OXhoUSFaju058az1SAu2KSw
 rowe0UgFLs3peq3TFLbpPVqkhVwneW3Fgu3uhRn9HKpN5agP7AvG7LTuPmUjjTPQ/dg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AVhqcW+F; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5066E40129
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:06:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4992FC5CD5C;
 Sun, 20 Sep 2026 13:07:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66CD8604C9;
 Sun, 20 Sep 2026 13:06:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0CCA1032829C; 
 Sun, 20 Sep 2026 15:06:32 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:06:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_aIlFQ0xZVN2PN@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-15-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-15-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 14/77] package/asterisk: bump bundled
 pjsip to 2.17
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

On Sat, Sep 19, 2026 at 05:57:39PM +0200, Bernd Kuhls wrote:
> Buildroot commit 7f48325de69ddaed921572edad875694a8154419 bumped the
> asterisk package from 22.9.0 to 22.10.1.
> 
> This bump includes upstream commit
> https://github.com/asterisk/asterisk/commit/5d543ad80ce6ad8a697cbd6c1938565047d26a99
> which bumped the bundled pjsip package to 2.17.
> 
> To allow offline builds we download the pjsip tarball so we need to keep
> the version numbers in sync.
> 
> The autobuilders logs show a download process:
> https://autobuild.buildroot.net/results/400/400e53158f11926446c11d22681eb8a9430caf1d/build-end.log
> 
> checking for embedded pjproject (may have to download)... configuring
> [pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/pjproject-2.17.tar.bz2 to
>                /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> [pjproject]  Verifying /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
> 
> where the tarball was once stored in the configured download directory:
> 
>   --with-download-cache=$(ASTERISK_DL_DIR)
> 
> to be used during later autobuilder runs.

I am not sure to understand what you are trying to say here. Are you
trying to say "Because the libpjsip version we pre-download doesn't
match the one expected by asterisk, asterisk downloads the necessary
version during the configure step, which is not correct as it breaks
offline builds" ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
