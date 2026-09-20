Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E93FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42FA240CF7;
	Sun, 20 Sep 2026 13:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvtnW6PP3L44; Sun, 20 Sep 2026 13:24:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9EC6A4082A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910660;
	b=HrQFGAHEYK2eheGOOrAOu1+HT7ISBd80bJeH0bdg/RBbSSyYkgqMsxM0AKxU81eAONWS
	 BmBAIyu1hYePzO+Zm64N6vcyyHA/egpieZqBWmBO+QYBzimX6Pw9MAsrVr67ax2oquWhW
	 E6CYaPJEwDfqvbH2OoRA1Yqj/66VjWGnKOyWUyxANKKgpXZLAdCwf3IS1dm9XiMV3qBBo
	 ykMW20CtfbteK25rg+UAwC230lyiwdD0jkSPGjES4EBJwaoCQxGnSEH5sx685EHm1wEl4
	 bCDmoXkS23DVocA5Sek0Cjaw97qoyHxL0utBhfYCnbNWspxblteYeXEHR/Bd5TK6k1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+Gv9lnhBastRBRf2UIkzyUU0zeHAy2dj2F978XgBu2M=;
	b=EyFcNfFYI7Zu2+dlFTlB4X06Ubmsq6Gi8ZkzPdUQ0yT/8PojlD17oM+Oh8aVN3ZepQbC
	 gWiqu8brcUYTEs+Y4WA2Potm5DgjL2AmOy4cCdPCIiTNS10YarRQ+UqEO41lqGe3ieLUJ
	 rhfgx8b4mE6W5hG9Z6D8GWKfVYw1ywn9wHMG69wm6e1fN2BSQi6NHddhF9XrQco8fLsPo
	 7Gdri7bip44AKCvryyP4NQ/vuIA6u1+Xy7croEm/LLSyS2aN4IO8Cg5Ipm0K+/MbmygfL
	 33wc2N7FLtVnTvUV/i/ru3xoTiME6C/gAA+HhD6MuqojNLy9tLR668iHJpAnQY9U/Eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910660;
	bh=+Gv9lnhBastRBRf2UIkzyUU0zeHAy2dj2F978XgBu2M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Aw1qsgKM30KsYdwLP3KtKGUEf05QMSag/LTq5wPjom/vhGkPqcOapP4SEVXIpoNYX
	 dw8dN0tTW8wJqrGBUw6N+KFigewMzo0jukBj2Y6NnNIYHNYNHSADHEClXzCuLSUmba
	 aHvz82ml0j6XfjcQF/qnUAh9/jtJQ4NDyqx+1CyOz+IoObwSwzCx3M/uJAb7F2vAyy
	 N4xE/2wH6qRGSiBfMUfplrxQLTCl2g1xWSkNNQGpq7ltW9TKnSbEhDsF1OUJ3nPgaY
	 Atfxf1BeoJJ0Cere8mKFAnO9VElRO1IxoVXWCoIQ9Sf/bnsFP88qwKon53U0XkoyRR
	 SKxSzbaF77VWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC6A4082A;
	Sun, 20 Sep 2026 13:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FBC392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2D480E4C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrLAUMSoIdPS for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:24:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B6A580E4A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910658;
 b=Vz8+K55UmWMKvASMut778b78GOTYOe8g8B/kC5v/rfQ1iVVgISjxPT2iUwKsUQz01A2O
 re7tb9AUn254UoDhvIEQbSaaHHqW7b6fyFr85063rLb7+ru3QFk9djseQCvXhv9kYdzDa
 FXJhwsLHCz4Glp5ryxelFoeGRY0lhZaEF0sKPtcQPi/JgL1KkdzvZVbEX+sFUZTfraK8L
 kM/B6406mjsedwIN/A+L5mlHgCLC+l/qKRM8bnWiOMh0HZSbQxXDEY04lkFwoejEbuTzd
 s+dAcUXTShvG5GWmWnAGKOMhvsGKH4ev3i9QTsKnnVhEnbaPG+ab4AMTfE0W5CJ1UiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910658;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=mZKn2dWzcgnlHa3Wv12N6gPz1DiB1WJbeksotROzmys=;
 b=QlxFgXtQzs9KneQLnuQhyQXFTmOWICi/3q+pIBneMZRNM1ECJ01Bm4G1V5X/foE/JxqF
 P17Knw03MeUiuiuTlHoOpIkQgv7NUCtVH8V++fIsasycvdLLz8iG9+Sn8r4dMNBCpSgU1
 Xta/FoAW2k1HQHlWdC8aEavLE+MTt+2ut+ZQoD8ybvdj+lu03utwgyOa4knbe8QVeNbaB
 pmYc6GWnjc9YSdFV8eucFpNpXJtQe0pTWq7ebGYc9/XlAr+P8/a+sQe/+iWCwZzL8vnmM
 UV4tNBsJGI3kSHWESDOdS4/NHAeXeKvj3LfWra9ACj9+sQXEF6pE3Fu174qTwB0czwA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cie5yMKe; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6A580E4A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:24:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1xNKT92aeP-00QZaL; Sun, 20
 Sep 2026 15:24:14 +0200
Message-ID: <728a8896-e885-485c-9e66-1c3a8cb7300d@gmx.de>
Date: Sun, 20 Sep 2026 15:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20260920113231.2342852-1-fiona.klute@gmx.de>
 <aq_NM15i7OLrpmRK@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <aq_NM15i7OLrpmRK@windsurf>
X-Provags-ID: V03:K1:d47FyFdZo/Dim32tt3PzkTWrs30lwLts3jehecrR8rjM9+VbReF
 EWmgFpNxzO4C2iuzgG5C5jwwJgzO0CdRuwFvk/vIMsLoMSWvHRGBCggpyn7fkDqaoXBsAj8
 UTX72ERvX6Avrpq2Egnz4Lxzz0Skj0B2/4igGobtdNo/9Dv0U3n4Wsp7G9dlZfb9zH6h9Cg
 kSVX3HWiy9Vx8tW7Gb04g==
UI-OutboundReport: notjunk:1;M01:P0:Ch65+9W7ncM=;lahC7zeItDSmkWMJBh+OCgzMAPl
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/kbd: requires shared libraries
 if using uClibc
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

Am 20.09.26 um 14:14 schrieb Thomas Petazzoni:
> On Sun, Sep 20, 2026 at 01:32:31PM +0200, Fiona Klute via buildroot wrote:
>> Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
>> (included from release 2.9.0) libkbdfile unconditionally includes
>> dlfcn.h. uClibc provides this header only if shared library support is
>> enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
>> and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).
> 
> Hm, you bring an interesting problem to the table here. So far,
> whenever <dlfcn.h> was used, we simply added a !BR2_STATIC_LIBS
> dependency. Just check in the tree:
> 
> $ git grep dlcfn
> 
> BR2_STATIC_LIBS=y with glibc is not possible.
> 
> BR2_STATIC_LIBS=y with uClibc indeed brings this outcome, as in this
> case, we build uClibc without dynamic library support, and therefore
> dlfcn.h is missing.
> 
> The interesting case is BR2_STATIC_LIBS=y with musl. We do allow this
> configuration.. but in this case indeed musl will still provide
> <dlfcn.h> and allow loading dynamic libraries.
> 
> I'm not sure how to handle this. However, for the time being, for the
> sake of consistency, I think we should handle this <dlfcn.h> usage of
> kbd like we're doing in all other packages: by adding just a
> !BR2_STATIC_LIBS dependency.
I suppose in the musl BR2_STATIC_LIBS=y the dynamic zlib, etc. libraries 
kbd might want to load wouldn't exist, so while the build would work, 
it'd fail at runtime if handling compressed files. But it should work 
for uncompressed ones, and depending on !BR2_STATIC_LIBS would break 
that (by disabling the build of kbd).

Question is, does that matter to anyone? I don't have any production 
builds with static libraries myself. If it's not a problem I'm happy to 
respin with the simplified requirement, otherwise I think keeping 
functionality is more important than keeping condition style consistent.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
