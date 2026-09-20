Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92348C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 09:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC684062A;
	Sun, 20 Sep 2026 09:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTe0b7aN0Wkl; Sun, 20 Sep 2026 09:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D4B104085C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789894879;
	b=mBYuDuXm+BuwK9Vp7JD7cyvh3VvEYOynez7xHrUhmMixxfNJFcWAoDleK+YuwyLT4f60
	 Bn1K7yBLFwAKLC/SIZbGJGHrYhA4kbqKjplYJnshvYncAKGJSXeJadS1eowRzqX/hvG1R
	 EsG0/U9IZQTDxPCXi+CYOurwuFymeDPV1LuFxK1+H+LJ4bjRgpgabsY7c0voOb1BhPxib
	 j8ML2Ud6nt8Vv3kVc7jn8h7wnEquLwXDD9Ltprei4j9djAJvLy9xxUKIQJdh0qUNMsEco
	 86wq18kSNvX0Pi8SGJHYsYKMq+qArUWkaCYbt5P6KPUondJOLmPDP8oReUHWe6kwAwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789894879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FZKA9Wvl30DvnZJR0WiBl6npuMwkFLDNEEa6Z3f1MN8=;
	b=fsXOxl5Vb+q/YJ97tGT4YIiKjq0PhI/51moZf0pCQUxnaJ6T1lOROg+7FfMl9b/1HggV
	 soBNuRbjBIbCL6OyYiN9KVzd/jOz4ptcgXx64FD0RPqml3FBZBUAYla4ZpfQzRJdV9KzD
	 EsUfAZKrUcHdY0Frjewb3oTPCGVLxpIT70yxLcpz+PQJwnmdyVa4RDrzRPsb+o/0H0lyF
	 bhvo3VN0EfpKDngzSxqOYozyuu7oI50O+nFUdIPFprcZV1W+EGY5A6pJCqxcQ/8exgTnS
	 P2b6IT2qEmoOGS5thMBXUBBhueWzvAU32+Z3r3BTPzm29638AEsW8K918CNbpRefa/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789894878;
	bh=FZKA9Wvl30DvnZJR0WiBl6npuMwkFLDNEEa6Z3f1MN8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DlPk/2scvn86rJnujp80Eo9kXWUwzcViH2Vum/QLpUT9envZRZU8SpB1uBl3ty35N
	 yP9kE5Vsw2ZPc30cAQ5qt/83udUcxVMgLoynv79OxSObvCuIWy/8tPknaqEg8wZDHw
	 GIgRiHE95zXqo0tn5kRDllzk/ng0a/NtJbn+fldcb/NoFh5gq2j9dPVUqw1E7uKC/Z
	 NdJJXNdhjAJ2xwamStqm6D2uP/1Ptbnm7awmXUIRQY+BmAClXuFIuEX7CtauE1VPQZ
	 MTcoDdCy8fh47NiDyxdi+dpwHF5Tnl4NOGhkTrBybNS+ODyW/Mg1arK0Bk0Z+7Mlnx
	 jUO7nS7NL5pHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B104085C;
	Sun, 20 Sep 2026 09:01:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 934E6224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 09:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8554780F04
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 09:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGQKrSvSYpLe for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 09:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E705780DFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789894876;
 b=LqzrFSSuCWkM39ivaqxk84ODmsw/0ApoTGots6VoEG2TLNGkMdrN83cvNzyAVdOR5lHj
 S3bajVghkgr4OL4mDgN4sETFW+5QUBHuvM/XitxQeIxnf0Des7hkl/tK5W0aZ0Anp1hdT
 xSIQX6RtejsQfzcZRMuIEtdUEXaYqOZ78uvN/+KNyahQtAG1qJqK4CQSuWoBdkvKYuSQ9
 1g9dYGcA7Au7suBiQ/hS0WfG+ctYPiI8XvTv5iomLZXgqvsVq8hjvaPDEEKkTHmp5HUwM
 Ao+SdTvjFIhTXyNsvPwDtFHSJCO6uKO6GjquElVhImzSHRlZFG1QmKMZ7uh3pwmYS8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789894876;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=W+OM/wTfMvoyVOgdMpUIuClY/+0cmcdp4Rm+ny8o/s0=;
 b=hebV2bZ+UI4S7/A2Ef7JTwE3ZOkdgygJe14zhRETgALicCA5SCIG/4yWSGMDbLPGuR3g
 +G25d0iHliP4yIX2dR8C4oDy3kK6LveYAxfp6cWSeHhI2ueIkgMga7E0iDUGq5bXqipJy
 5LPyC1keLKl0x6W0jhbPqreVylcJfLCbjSL0HXEbWt7uxgS6F3ymcTXAR0dRIwyrXZyV1
 Os1YLR/oTvWw/2lThX/wkktub6aekK1nfePjRDPsKk7V4LhIHxa0FrIdJJ+XrbbyDqk6E
 6rDsvT0PpiUjWuHmi8hF2nZQuO66/WFDywXSYqmS9FK3hBAl/6nV+2VznBapFcHGJMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="mwGa/WS/"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E705780DFD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 09:01:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 51C2A4E40917
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 09:01:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F2D36604C9;
 Sun, 20 Sep 2026 09:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47EE41032906C; 
 Sun, 20 Sep 2026 11:01:07 +0200 (CEST)
Date: Sun, 20 Sep 2026 11:01:05 +0200
To: Jean-Paul Etienne <fractalclone@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq-ghf1VzxlgtHpn@windsurf>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com>
 <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
 <aq0uT-ghEihRclnw@windsurf>
 <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
 <CAN7e4jpdCKT=e8SY75Cb7o4qiC5Jr0w8oj-OaMmAPCDGpW5Fyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAN7e4jpdCKT=e8SY75Cb7o4qiC5Jr0w8oj-OaMmAPCDGpW5Fyw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new
 package
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

On Sat, Sep 19, 2026 at 09:20:36PM +0200, Jean-Paul Etienne wrote:

> I've made an MR to linux-firmware and they've refused it because the
> vendor was not agreeable to distribute their firmware via
> linux-firmware. Their response in quote below.
>
>     We can't accept BCM43456 firmware, the vendor is Synaptics and
>     they have not agreed (and in fact a conversation I had with a VP
>     of Wireless at the vendor refused), to redistribute their
>     firmware through linux-firmware.

Meh, vendors. OK. But then maybe we need to find a better package name
that clarifies how this package is different from the other brcmfmac
firmware packages? I guess everybody is forking this everywhere to add
its own variant that contains board-specific tweaks?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
