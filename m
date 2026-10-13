Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5190DCC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 13:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9A880849;
	Tue, 13 Oct 2026 13:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibiSjXTULzqx; Tue, 13 Oct 2026 13:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BAA180998
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791896680;
	b=URdbO/O1Sh4D/aCuY80mw1H2m9BKDC2SdaTnb6uW0aRgEz+JU5YoMD0uxL8XpaRiszwd
	 iNRaH0W41rSq96qDqia2IOhSexoEsrcxdnfXTeX9+N7T1m3ul1EHcsqhe8sJOidMsm6k+
	 ujTN++a+DJOYG8uMhSfeCXPAKk2VXSJ/bdtj28LQCGIwARGNnN2G74LToMylIGQb/8K4F
	 h0Zmx8Q0Iu0yqGGCNzEX5qUq1LBiShIwIeZxYYijzA/EKv46DbN3GxI0LfLpyVBr2FVfr
	 kvtsVAjY2u0GQTdk1GnxwWMkiAqbWduALq0tcmZauJvqav0FuExrGZc9Pt31XVMP/kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791896680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Do/RuOGFtAesoUZt3XQ8+RGpPpHeW9s16kFuoaE7F5w=;
	b=BZAvgNL+Dv7WdtwaOa2B1qUhnzCI4BCt3F3d84+N9nmOLfyGRmzJ0yVgG1qxCq+mZTEd
	 QODmSNs1+9wcnTsUpUPzC7+93g2RE9LfLy0J4eyJarhQmjITWt01QXR8eV+BGDHcyNqt4
	 IbTaBXhYF766uIWmLow/gcgdG5ehiCgtTPiBTyhxj6okyh71fepxwSWZfQBuKqOVfVv3W
	 trz/fJA1Mds3TYhWxvmH10G5I5qduaHP1DP1k7+3C1REja8VBbGYMzjaL8TK1aiuHfc8+
	 zXR3TsvQf+FSz+4eNjdtcIHh9Az69r28/hdFAVS9CJIwxap3zHtCIUip+VT7cQGIoJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791896680;
	bh=Do/RuOGFtAesoUZt3XQ8+RGpPpHeW9s16kFuoaE7F5w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OY0vk/uLC1Rzb+P71UpMu/Wa8Gb+OZWKH2SMvAQnypCvZKeqSG45EBWThZoOg9KnI
	 V14EMLC8GCsuaSTEk0B3YgSfbwJNYKsyUQPmyW8S1cmDtuXfT6caPmfsao4tYLgTRv
	 dxDxjWK3yWDC5b1Nsl6BT7S51r1rGhoh4Ewy3ocncgoTR+b7Rv/z4n/gb81htT5864
	 2pWMHpPmZAhaO1DIpYX9ANZPVmexGG4RgywDgP2ubMxL+piz96dIAb6QI3aFSWz1O5
	 nMqAvWXCEGfDRygGdnZ/rYNWQ+Mf74Lda7cmCfGQD3eAIMoA1B16gr0uLQFGG5QbnJ
	 c/oAO+Q/+IhOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BAA180998;
	Tue, 13 Oct 2026 13:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A625235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F03E780AD0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa7r2cxJNGCe for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 13:04:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB52E80998
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791896678;
 b=eiUQYZDG2Oy47UkkLmOsLje9Axq4M76vTiv2OX1SZJ6sMPDDRyg/ib4qi0nlrXh+zPaH
 /M8J+dru1jY72R8hj4hZ/mPfEfUZVJ9jpJEkMo+MuMYV0dZD2TW8mGk0aSEjm78n9+aAU
 9eOFnRP3RDxBmp7zDLJ2WLVK2UWG7ysSo/qhsXEA7qUnC/zrjOIcgkX0rXK/X9j3gHy+9
 6LzyZyh0QhKNQ+ECHT4YdY8j4Wa0OuwRVNOxDxOuRS3p4NV0KJsPWmLyWOF1uBF65vghY
 LyZFBsBZmAG0uMxGBlF6dwybsz6QwEbumWOKqnbTfrUxPm7NSWb5Un+Wi9i7aZKepWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791896678;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=l8L4qzVSOf4NN8sM5BclUE+Ywhhgp/gpnOYnck7+GxU=;
 b=FoX0jvSyhscN0MBhOX8bL1n6ZEzD26+QrjVjZF6z+hqncEXXvLrL/6rvgxnslO8ZS1B7
 v6la2ZoSzBNham3Cy/g7wpjhxa+ETKyAA+qvyXmY9CHKTRg272zF4WouH/tY3FbBBwcQ5
 C/BBolZQF0FCKUH4ZH9dnOTbRka/yXDF1FD77d6cdxuCCpYxwfBZsz41Zny8ZHl0W4MB2
 TX8WX53Wv+9XuHFCX3L/+MG8cDCOEDlJuB3+o9AVVUu6BUtqdelJOlwhMPRq6Har2ZFUt
 xegBz8h89U4y8JXRwhZyVxEOPX9vS9oRRxHwBshhtKTmIvjjjBb2UNYcnSFFwEOJMyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DKZhu0Oc; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB52E80998
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:04:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0C14B4E4120F;
 Tue, 13 Oct 2026 13:04:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D27BE60362;
 Tue, 13 Oct 2026 13:04:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D11811D7115B; 
 Tue, 13 Oct 2026 15:04:24 +0200 (CEST)
Date: Tue, 13 Oct 2026 15:04:24 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Nevo Hed <nhed+buildroot@starry.com>, buildroot@buildroot.org, 
 Paul Cercueil <paul@crapouillou.net>, arnout@rnout.be
Message-ID: <as4sQrV4YU97glMl@windsurf>
References: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
 <as3sjbzkJ8Teyy8t@windsurf> <87ld81ua4t.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ld81ua4t.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/umtprd: expose package build options
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

On Tue, Oct 13, 2026 at 01:12:50PM +0200, Peter Korsgaard wrote:

> So I guess it does make sense with the option, unless we say that it
> should always log to syslog given that it is a daemon.

That was my thinking: it's a daemon, so "of course" one will want it
to log to syslog, no?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
