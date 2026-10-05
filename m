Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E622CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244A240587;
	Mon,  5 Oct 2026 11:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4r9wWGC2bsag; Mon,  5 Oct 2026 11:58:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A8EE40588
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791201503;
	b=Xn2hbWaFB1KwfRcKyh4aTdr063fFN+Wd60S8fE+4MyP/iWBecLOah7YSQh9uW8ua9jCw
	 tJg7F35tWWR6tb3c6/8XSSlzha7/Dad4/ahKT4oCaF7yFZqIFzvJf5iST0s0Nl++SljV6
	 aUED2tQLdniJME2eUzrHHQgt5ZMq74DMWDXgjMf1VZKw2tT8gv6jC1U+N8aWh1U1/2yQG
	 xJflcdqadYt+cJy9DofzAWVvK/WucDot3FzVptP1dz6Y1m/U46pNAheX95oQZiPm9LfIF
	 LaLOc9F8tY3Hx8Aq9D1MJOik7sv9GHPTlQZDCfxr5lsyfIxZDbA+bVkb7EY5/mwmd+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791201503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JS8LwVmCL7HxktQEsZ88Ba3gOt8Xrvm52J1XYsgNyjA=;
	b=Unlk5Qy3/LDfWmipu2ahHp2Btf7w4y6sa4DGoxg76874hkJCX0flcns9rilN2W0iuDYp
	 m7x4zzSAIxxz0gKXfrwMHPCa4wM4Iq4zjXIhSpOJwXqB3icgClYK7ajtst1eKTBK9b6TC
	 rowDOuJXs9mo6fQLSv55CzihsIAjz5KdlfufM0f47uoX3oIXGbjm2G/jzzWVP/9hItgAz
	 xwtHmKe8e7+tLY3oaBAs63ixboAmqE2mLAoySUm/ytToUDLiAKt+//IGGo3k2H8f6rQ2x
	 JX27UdWdHJGRQz8KvKFRmW/nr8JGWy7FhagsvaukyPTFNMvfjsloApL+RQbweWWiBtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791201503;
	bh=JS8LwVmCL7HxktQEsZ88Ba3gOt8Xrvm52J1XYsgNyjA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N6la2EFmmlPnJUu4EwcD1JBzlORafRHfPvOm/T6RXAYgFoMa8qTOXwKuR3H0siLJY
	 tHpk4PBYFiOuERXUIArd1zKBHCOuvPadpHZBBPCgSp5TMVEDm2ojWFnbKMwnAdCHvH
	 vA7Sm+IwS1VlZCmLemUfMsmO0JvJrTTyCc/Y54a2U7FWQHrUplgFtmFeocUkt14TPB
	 RFL3C0WmFmTOdGL2meLWJcunNmyqnmN0bIkV3JAS3NU1k5GQHRG/yjECPmERLWkTt7
	 cSTa54DBZzTzIRAvg9SmaGT1dNuAJzhCkS+C6CRLpzEAeezk302e7ME7MdJOcPNWL4
	 2HangHXMn7//g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8EE40588;
	Mon,  5 Oct 2026 11:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BEB32F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19A1809B1
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BQI92PJVLWi for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 91C998096F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791201405;
 b=oYPEVg7E+SXsyWs60TJafkeeq9R0VKGZu/nniHvRyUDTzqka+4v5IqYqe/BOLiWYWCNr
 UE0aGuebmI9+yKXcH1ZsCih3IGcNQOVfwijDwpmnRBXIHg2FAQDtQzHUX3Ow1CH+S308q
 WGQd9rgE92LQtyBBL7ua7cjnV7h2x3L6OTm65r8t7sXfQ0Qqj1vFg0+Wcu0DPA01YRNu8
 pRnrICLUsPH0rEa6uN+1sJDgheshdPrIIXe+KH/AHTT14taCdr2ME4uAs+2ROaHpsQASa
 Z0IyDT4KQF+x0vcrpT/Q90rMtpMHJgQdTzhI2KLU6BWJvWdT8KWt1s1GHHevBkmIjGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791201405;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=IJcw31KIXKnSnBWDcZ0BcbjcG775DvyJpapQrh8MAcs=;
 b=prU8KX0sVLheHJbkOpZ3bZ0IZkw4ZZ2VCuXdhDpeMYTfR12e9vLKJKYKP2+fQlmHoN88
 Y9NpmuGMciY8tIuG8hfTog6eozaG4rSEVj0Tow35ZbKGMuj2qBMq7cGJ9zW+f4W70Bqnt
 gKgBIs+ibGCUMRvKMGo+ie9GAY539Drurg6QL/bL1h/9HWD5jo8oq6uDeyU5d9aAugQCB
 AjMVVXradYwhUorWUb06mvZd0iDrRTMkwIAtxpL2grF7Yg7u2cbmHCYRkhcuTFOQE6G9f
 RHxwhoehk3nDc6NcR1gPWe6hNtJZIhqfra8S1odOMCvX+I/NYDFbYMdnE0ZGyei7YbQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=X2qvy1fd; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91C998096F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:56:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1wkPEM3nj8-00nLio; Mon, 05
 Oct 2026 13:56:37 +0200
Message-ID: <7e0e1beb-52d4-41e1-85b0-d5e0c6662406@gmx.de>
Date: Mon, 5 Oct 2026 13:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Peter Seiderer <ps.report@gmx.net>
References: <20261002151226.867507-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261002151226.867507-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:hOfJja9Sz4e6zVzRtQRtrmKYIbMi3JHixF4kg1iAtjhCrNsLGD4
 A/oYxAc2TDmExUOdnsixKCkObbphBYbYTuHwjDZhfrO+HeuDVdB6wKWGD6sgtEHvQvRD79s
 rQ+5CJypY7OLnhP3XRt+KHeGzn+q2JJa5j7ROVifhiNmEGzZV4QHWBC3mtOQAT3CFk70TbZ
 OHoM8ikfPMRj8wLRVXrog==
UI-OutboundReport: notjunk:1;M01:P0:cejyicSitDI=;Wx5fdmT12WuxQVsOCdYBhef+/Xq
 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
Subject: Re: [Buildroot] [PATCH 0/3] Bootstrap package for libudev to fix
 device-mapper rules
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I hadn't seen that a new eudev release has been made on 2026-09-27 when 
I sent this series, and it's now in Buildroot (since 
f6c2c6a086ae1a5857f99514324ebf4038dab31a, thanks Peter!). So maybe a 
standalone systemd-udevd option isn't needed after all, assuming eudev 
will be maintained upstream. If anyone's interested in it anyway I'd 
still want to make sure these patches aren't in the way, otherwise just 
the bootstrap (patches as they are) should be enough to fix 
dm-crypt/verity with systemd. :-)

Best regards,
Fiona

Am 02.10.26 um 17:12 schrieb Fiona Klute via buildroot:
> Hi everyone,
> 
> this series adds a bootstrap package for libudev from systemd. The
> reason is that some packages that may be in the dependency chain of
> systemd (depending on configuration) depend on libudev, at least for
> optional features.
> 
> An example is lvm2: It needs libudev to allow using udev's built-in
> "blkid" implementation instead of calling "blkid -o udev", which
> Busybox's blkid does not support. The issue I saw with Busybox blkid
> is that systemd never considered device-mapper block devices as ready
> (seen with dm-crypt and dm-verity). Setting
> BR2_PACKAGE_UTIL_LINUX_BINARIES=y is a workaround, but shouldn't be
> needed when udev has a built-in for that purpose.
> 
> Unfortunately adding a dependency on libudev to lvm2 creates a
> dependency loop if cryptsetup is also enabled: lvm2 -> systemd
> (libudev) -> cryptsetup -> lvm2 (libdevmapper). The bootstrap package
> breaks the loop by providing libudev from a build with minimal
> options, so lvm2 can be built before systemd. The library used at
> runtime is still provided by the main systemd package.
> 
> That said, the new systemd-libudev package could relatively easily be
> extended to also provide a standalone version of systemd-udevd
> together with libudev, as an alternative to long-unmaintained eudev
> for non-systemd builds.
> 
> A combined package for bootstrap and standalone systemd-udevd would
> avoid duplication of most options and variables from systemd, at the
> cost of complexity in the package makefile. The main point I see in
> favor of a separate package is that it could be updated independently
> from systemd. I'd appreciate opinions on what's the better option and
> why. If a combined package is preferred, I'd want to rename
> systemd-libudev to systemd-udev before merge. :-)
> 
> Best regards,
> Fiona
> 
> Fiona Klute (othermo GmbH) (3):
>    package/systemd/systemd-libudev: new bootstrap subpackage
>    package/lvm2: set unconditional dependency with "=", not "+="
>    package/lvm2: depend on libudev if enabled
> 
>   package/lvm2/lvm2.mk                          |   5 +-
>   package/systemd/Config.in                     |   7 +-
>   package/systemd/systemd-libudev/Config.in     |  21 ++
>   .../systemd-libudev/systemd-libudev.hash      |   1 +
>   .../systemd-libudev/systemd-libudev.mk        | 195 ++++++++++++++++++
>   package/systemd/systemd.mk                    |  11 +-
>   6 files changed, 232 insertions(+), 8 deletions(-)
>   create mode 100644 package/systemd/systemd-libudev/Config.in
>   create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
>   create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
