Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30460CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04BD76073D;
	Tue, 13 Oct 2026 14:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va7qZp0YaDA7; Tue, 13 Oct 2026 14:20:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 113C86073F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791901218;
	b=HFCRG/hgFQM4EAyPMr2rfgiFBgIve9GUSiP84biQAIzp3elZIYh7sWvYKIl4ScGP2tKh
	 tYjczgWgwZQ4k1SgREyY6e273BgMmwpiqx/PVrZwdtxSfkmmeT7Eo6HhzhD+V7W+dF1Y+
	 ggkgdCbrDolbTqFWizQ+DTpVS0qHR+Aehq6KkvXOUb3qtyflANtS8DhgYYJtGrsZ63jnH
	 ySt0PvKW1Th0ZWm8zFgXyzC+aRxgWJJfdD5zC7BMxuee/tr3RcEBU2QFW4jdb+ZcinKrF
	 JosrnqAllVfcfU3BZ5VqAS75FncpzFjbEoGKqXVl7K4nIX2tdDfVZ71VyeYHlRtexQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791901218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p0quIRgJ5sroTimh1w0uX49HNVx3pQA3UC+Pz8rAiyw=;
	b=ZgEAkSU7auIyCiZgH+ukGhg8EzdXJ60WwibhcMppoWNbcTKF0Ur4doEZaOnZNBfcacM/
	 KuvyRFuEj7oo6k/45a6wfuJ3Uet2tlasYmAjpUvu34wm36aANupSVbRJcYQI/KR8+4oDR
	 wBZ/XJTCtfhczUJqvcz6LXVSkLG/vwkIXgIGUYVUPK7Iqx2UfvVotAH8VhWqQnpVoeQJp
	 /Eryg3V+wwnThW/oYbXkLvf3/FSK4w+Y8Bza3t9KIkSvMYVkmNLtpaI5s2u1MYG9v4CwD
	 yY4xOhoDobYq77bOT/TAV8FFY0z6tMO1WPeHgZX3aOD+gWlk7KTl/kptbagz16tCwFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791901218;
	bh=p0quIRgJ5sroTimh1w0uX49HNVx3pQA3UC+Pz8rAiyw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bvnaVsfVO9E3stGBs3hBlMOw2nysLNNXWzm/jT8vQo9vuMhGpgP8MBjfVvk4fluga
	 L9AX/3kC7+2u1zrC0nhKkFjv9LRoElIgV4GWxQacq/iNHLP2FOWPMt1NxE75VbcvzV
	 AY2H3GOjZGeaAMmZYab2YomU5JwhkmqvbVqJoGnHLn1Et8d5RCP4iqFdb6OUBRP591
	 xvQ7BG16WoOlpxC7vn01YZQyKy3fVG4/BzCmq3E66B1rnqlEomFtRT8yKSb4fy4xb5
	 buw0fpQffqthCmqys1Js+lUjV83pjhqf7JaAZM4e2ycaJqIiMKesPHx8vtXDO5zz+V
	 L5gC/bbwnmJJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113C86073F;
	Tue, 13 Oct 2026 14:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E867788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70F6840296
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIHRdj0QcXG6 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:20:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 04BA64010F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791901216;
 b=AwJBpinKtjLLxHgXccHpaPrcdgI3rYkyGycN2z7uRNpD1oKNdldAH23q8GE79HJl16Q8
 jfAWxxQ294qiBIgxoyUi9T87p11RtxlIYO8xV68XLPVUfkg2a10yO05ZzJwx3DKKb4v9W
 +bikySFiT7D+ufVuFyu4UA1GJyjBujWtJiEWI7+ze4CkGgD/UVg6gR04mg5Gpahk1xKNJ
 MXdd3KRFQ0S0jGedq/4acpm8PKTMwYNieL3lSVxteve5tVFXebNU+5drRhnPnOPAVKgJI
 v7tMgYKH5bKtXYATAO6/tjuoe5D8Dwv09ONWR9dhSqpIRR7CF6H1QeArXhkXjlcHD/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791901216;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4W7ye5ffkLnxSCwxTqq/NTF+NNYqkxaw9qi+VRflqOw=;
 b=dPSTAM5tD4StoeejZPpIm+JP7+mAzW4FUW0+Ufjr8xRSSVjOSV0t4ZWct2MZaDY5qidm
 ZBgTDgKM1Zxw/9LhhGsAML8e4xmZH5hAEhClwtsMxuJA5/DrTtjmsB9Mv17iyZN90UasE
 jrx5HcOqOdTvzbW2DxlUNr/MNnZkqYwXEDSSO46JfI2LqCtAmnF+wC3F9YelwuLf7NC9p
 q3dRkSIVdylv7cHo1wWqFTNr53THQms616em2xUvhRRqt+b4rjBzKMMHbGc7wbd3KQC1F
 t5/w33CnJoZhe3IpCRtkJVTu7UcIzjTdsu85yLZvNzgsClTehX4ndD2xulQZ8t+OgsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=B8BHvOKE; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04BA64010F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DFB3DC653EF;
 Tue, 13 Oct 2026 14:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5739C60362;
 Tue, 13 Oct 2026 14:20:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 967A111D7138C; 
 Tue, 13 Oct 2026 16:20:12 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:20:12 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <as497X2wvEmBm-CE@windsurf>
References: <20261002075640.2350126-2-buildroot@heine.tech>
 <20261002075640.2350126-3-buildroot@heine.tech>
 <asX702U1MaEA4kVo@windsurf>
 <d3efbcd6-f129-e101-5e9a-fc55b1427a26@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3efbcd6-f129-e101-5e9a-fc55b1427a26@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/4] package/sqlitecpp: disable
 stack_protection
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

On Wed, Oct 07, 2026 at 10:14:28AM +0200, Michael Nosthoff wrote:

> > Thanks for the patch. Since this is a fix, we need to know which
> > commit introduced the issue, so that we can figure out whether it
> > needs to be backported to our LTS branches or not. Which version bump
> > of sqlitecpp unconditionally enabled stack protection support causing
> > this issue?
> > 
> 
> The package was initially added in e74059b39ce2f which contained version 3.3.1.
> This already contained this option [0]. So the issue has always been there
> and the fix should be backported to all maintenance branches.

Thanks for the information. I used it to improve the commit
message. For future patches that are fixes, we recommend to always
include in the commit log some details indicating what introduced the
bug/regression.

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
