Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EEBC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE374072F;
	Wed, 16 Sep 2026 21:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qjxfnm4Rpaz; Wed, 16 Sep 2026 21:35:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E9F240411
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594530;
	b=s8Ub8bbwfyTpIQ8qhtjo5xn9xRZL3KRnAoiGuRPyT2X2O03swjb/ptOLX438UMyHFUom
	 LJ2yP4Q6mTLFJasPw4NHq16nqKFJWX7bPjnIpqKPWSf0jTAB1QuNbMSu/SDX1gkkqHwnt
	 9veuga6H6Ju3bArVYAqpsFsRJSoTZzf0UbSDIkJWwqWS4EQz6EowR7eVI9SxPZs0m3F8v
	 bl+NNftTrH93F8wh+wdI9veY+XzdN+/RCR7PHno1+/3ECKSDwXA67wlyW1ZI09NCBqjC9
	 X+gbrfj6TPCHXh8F/JOV+Caiz1m1yty+Cxz4J44+kMh+SeJYDx1fktpAkZJGabtWMYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594530;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZGrHU38Csx8jUTZ7hYK0kTb6qvUMx23g9MCJnPEduQs=;
	b=iVq6HmQ/z+aE/0sDwm2l9yum3jH4/6cymav/uPcEtvUzj1IKaSoGhY6y11eubcw9gUax
	 sWlC5ALzM7WYMedn2hG4Sj1/V2SoLRiYVZDgzOoD19ISDT2H6UPh5nm2zsT1WwHoUilT6
	 Y9O3uHlOA+FylqPVabyE7BHkf9X18zb2JudauM5GkytMYzHENs3EU8COj7sJgbr5tcNG6
	 h1Bay+lXlfBDc95ZdufxGlj+M5t6b9SkPtkZ09xrPM1QgosR49y3sdw7rZVDGJb7XqkNE
	 4pQIRb93JlJGgdJeI9aDMZKL5lwSf7x2WbUbagd2U7lm1TlZ6M7RHOEUDuVj9HxRfsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594530;
	bh=ZGrHU38Csx8jUTZ7hYK0kTb6qvUMx23g9MCJnPEduQs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j/C4DZQicrDD9tJaqSybQctjMM9w+vo/3yItT5nPVgZeuOOji1R3UZTyuOg3Qfs9I
	 jZTvGOJPNaDBa6cQy/WmzcNNdkL/2dR0wjIINurEx+Ew4rnox+BnrNGuMBj/WCUxy4
	 AP0KZe+lGgQRHECQSuf9M3eldV9zipsX6gYWOKsp+qf39ygZJKM0VAwEN43XrC+WGK
	 zZroOsjlLj1/5igLObHOrg180gtJEQ5wwE9JXSEptuwkPAV9nQYEfElw9ZeDHPYGnw
	 1NxpJHW66TDK+cEYfjsGP/ZIx6xpsu0E693RoanVeWWq3yg/vKczNqsVeB2fF08tL8
	 jK7P8D/ZGsfKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9F240411;
	Wed, 16 Sep 2026 21:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 235E72E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0928C40411
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJWdUJnqMbAj for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:35:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 05810403EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594528;
 b=PJONWfgdxLyme9kvlMoHxSJIdHePLnkLw3ByAJnosqiDIlxw8CWyf6u73Sd4uI0v0JSB
 AIJwJ7jeHC3ESfifyPUTzf6dwgYbzZiCVcN8KHs1r7WYUH8s0FgaK68dTsShCIc2mEhI4
 VovkHglLFKJtB9GSody/Nxd5VNV5A/jkr+DGaV9YDg46yogu8PIqvsRA7CDqlAgMd2AK8
 +cBGK2KtAP+KacLzeyX4nbljLOf+VYCgLUIweEOC6NRcn0PmyEMY8o8dbSpoGOQCRsDGG
 QCBdJ1/f4daDc3QBviemdmZv9HOWBuaG6lE+pw5TZH8a/XSCtcjrzDo+1fFLh5tnNFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594528;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=iHYujJO08fJXISxtRaG5QW4Vplet6CTI64X+0fa7P/w=;
 b=ChVbuRhfsx8yIoeyViRsp7iXBamHmHsOPQ1GC7RnzDxtpBNIE3ZdxpSvRBCQBv747Ucz
 31FBUZw1q78YggSVps8r756hqoTY826NbBXMIQSoQYfOg5Tt/6izoQrltWDwQxwmt+UZe
 OpFfmrF/0OEivpAeWzinR1XAT7f+BNlBf2sAbCSobv3Hk1xS1UxRO6PmM5wwEntqw4z0I
 BGUxBuuHYSjcLjwUeHuIejTQlqrOpzmRTl8l3Ko4P2LnebpDQhEenvh/Q7ALqLVdtb1GT
 NRCvR+8M//ngui9QnMcPp5u+kYDI1n+cPlcv7352z/l/S9wC63fU9sVZjeQ7luaZeWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kkq2WgTQ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05810403EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:35:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5C952C5CD6B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:36:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CDC660337;
 Wed, 16 Sep 2026 21:35:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BD1B11C79AB4; 
 Wed, 16 Sep 2026 23:35:18 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:35:17 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <aqsLfxHIUxIthJ4W@windsurf>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820105705.1502630-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/fcft: use release tarball
 instead of archive
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Aug 20, 2026 at 12:56:59PM +0200, Rapha=EBl M=E9lotte via buildroot=
 wrote:
> Codeberg has changed the way it generate hashes for at least some of
> the generated tarballs (see [1]).
> =

> This change affects tarballs generated by Codeberg, but not release
> artifacts.
> fcft turns out to have a proper release available, so use it.
> =

> [1]: https://codeberg.org/Codeberg/Community/issues/2861
> =

> Signed-off-by: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>

Applied, after adding a Fixes: tag pointing to the autobuilder issue
being fixed. Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
