Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0406CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09C0817C0;
	Sat,  3 Oct 2026 14:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fcrc-FSYqQB8; Sat,  3 Oct 2026 14:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E37C3817B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036531;
	b=p0+q2y42G5a+DrIKGig1wnHHAqqsSvaTsmcBs+H66ILooPuDM9k4nCLcCu+JdSezEnpg
	 G4v0oOhqBGgaPOr95bibFCOYqCw7VkXJ8kdr5RDWmqlv/mdsHbYMI52MPFiRVbtc3oIjy
	 Q/jIOHRCZ+EKyg5e8h6KqmWky7t2Wmhik7gk09bHoodeL30z7iS3RIGPng7plRnZnj+N3
	 CgrXWM7js/lZGcBCnxecwABDQy/olKywXU0bYyr+SV3mBFMG2Q1mVI+eXGcpCLqoj2Gu1
	 3YXF5toKRH81dyLH376r3fTKzimXYv9r0OTk9vPFxQpLPDeUDAsEhKSvjDo7KIREhFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qyvtxJ0yUJ6U879+G4md6btxsiTp9E6NjNE1vVLrWKg=;
	b=gE8lRZXtwSdCplOsbIDLy3cH76iKZmRKXsyk3MM5Wp1jI2CEN0PSu5AnFfyeqrQ+fCWh
	 NOuCwYIMnGSbQmtKZo7sP+NvIjIpwMz36fPznxwUL0544vxsGeI8RpdfQ6CWIbTjN5fK2
	 UC9HwDW1cgDr0J2+P8oUOfqg1a4210szxFK4rddb4ilS5xEKExfSmca0safB0puGSpEsa
	 WLDbL4suvpS2FfU/hyEDehX5ZURGtK9Jq+Hnr+nZoK8JERRdyvZHV5eeTts9wUmD+yeTM
	 F7TWWzWCh8Jq5f2JeNus+8TthjQhLV/4SU3c6zCukhcDHu5lod4hqr8iGIt20lBGjZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036531;
	bh=qyvtxJ0yUJ6U879+G4md6btxsiTp9E6NjNE1vVLrWKg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JljOdnlcsF0E+eO1rws/pDPPgDXxtodUVutA6KH5qCHgfSdYPiLwzPl/iQn7osKyy
	 kLiSPIssvZy1GhEuZRuNzYgRN4XfoUVu/LIRC3IF7s4GdzE5+CykPS9IaQwl6tYy1Q
	 rq3DoABrZjuYGIguFfPVGTDXm5K0BZig2+3CG7ivKpMDoITEuQYmCK3glITH9uO4Jw
	 6EXIiHCCG4pjD9MPSPXhZMPFnkgT3L7GXp/Bmz+I6skmfhylMHEGGnkV4ZwVlLNy0v
	 2cdp5DahBmHIcVVW4WUs/busmpDi6F7znrFR4EFlX6BEP+3oBB34LrYQLkGTBQP4lu
	 PeVy6zMSXDedg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37C3817B0;
	Sat,  3 Oct 2026 14:08:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C180D282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7D19411D6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2U1Lsb9DWNR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BCD041197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036528;
 b=Rla7KHN8APoemS8q3nJtnHkfzhsWzU7mHbZHp/X0dfKcDuqIK38VM/JnW2Kro0cDfUGk
 k30/xr1LgDAdkqiNoEfE0MYRbT7JteGjO4LSQYzB73Oa6ME3CWaVQ+PoeYskoBwGlENc4
 c0+5j7mnm/MC3LLS+d/uD8v/B3oPqs5vsf6/0btOztxYrUsU5vE/JJFTiHvUPZWB/18PP
 g933tE12PltakDOMB0qAxpHskSo3oSvlltQBGljUOfGSTnsHhK6zUJ8LdCNPFfHKuABuV
 0b1Le2KfDZh0kqfBI17Le9a91v/DeJetst2NPhh8XdzbI9DQjZlhR/U1znbQXxFn2pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036528;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=m93mekmLc4nkTVKuwJ9o+IGcQNadvjClNFpPDjPeXzU=;
 b=RT20Ktg4vLLDA+bLyzc5nj3fX+8O/uqlsCTev4Fe9NdVXjt1sUeHu2bdKl/NM3GcYZKK
 l3yvcLr/BZsE7X6W0wfDX5b6u92Hp5+FekIenLOuRXbyhiOw0x79aP4R0993iLaRNvl4u
 MMXe2TV47Tt0vOkAgfCISJRojDNqpCXv9dpvvcUnPdRkbrQebX+RKf6FOSd7h79Vwn10C
 9uxkNmDOxzyP8uoPHOWzDhqKv9S4oOISd25UG1HBCLU8JUCZZdI+Vcjg+sgvr4JlsX23a
 GRbNNl2JKF6VUkMf9iwz1QF93r1EiUBkXEZS01xDWjfOaycR/SEugpuinPhJlhKMy7g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vmdaSwo8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BCD041197
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D35194E41129;
 Sat,  3 Oct 2026 14:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A10A604FF;
 Sat,  3 Oct 2026 14:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EA38103282A8; 
 Sat,  3 Oct 2026 16:08:44 +0200 (CEST)
Date: Sat, 3 Oct 2026 16:08:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <asEMZ8GKN5jDsNr6@windsurf>
References: <20261003085435.2467456-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003085435.2467456-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-orjson: bump version to
 3.12.0
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

On Sat, Oct 03, 2026 at 10:54:35AM +0200, Bernd Kuhls wrote:
> https://github.com/ijl/orjson/blob/3.12.0/CHANGELOG.md
> 
> Upstream added code which uses the MPL-2.0 license in version 3.11.6:
> https://github.com/ijl/orjson/commit/f12e56208a4a9e56cab3a48f5d761c146393be24
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
