Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79632CA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27DC480B4A;
	Fri, 12 Sep 2025 12:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8L_pDrYoWan; Fri, 12 Sep 2025 12:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C20B80B50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C20B80B50;
	Fri, 12 Sep 2025 12:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FFCB12D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 12:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8A15405E1
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Cr1BLvhzLlO for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 12:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40296405DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40296405DB
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40296405DB
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 12:50:19 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A00AF440F5C;
 Fri, 12 Sep 2025 15:49:51 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <20250911192608.2672637-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 11 Sep 2025 21:26:08 +0200")
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 12 Sep 2025 15:50:14 +0300
Message-ID: <87ldmjesxl.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1757681391;
 bh=as2fVL8n5OEN2FVm8csKJxj8NEjN6/vfxjLkeY3PgSQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fow0Q3c1iCuxYj/6N1VrQllARsofl3nOe3zICh3wvvuXPP1qIurEUU4byzcZ6bJ/M
 G7B1K3nbMYmjLfw1MNx72Fy1woVSVXSbSAxpVdPLCKeV5aFSG4DvEpU2y+IxIec9BO
 JRIbEg9lMA2H/iLFmIBXA83ClSDVIe1B5m/n7mmUTX4r9dB1ItOtaHELe6FfqR8wC8
 jAP2hFRwmyKJthnUzfOGOXJuk2z5oCTu77c6FpKWYPdclIx0QZq93osX70qCEBZ7k/
 f/o6BvnIB7ihuk4rIXipSmdix15cH3l1ag1s9eRa93uP1T2Q1fAgjLnSmpTDUy5Gn5
 EL7039/PrDfWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=fow0Q3c1
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, Sep 11 2025, Thomas Perale via buildroot wrote:
> In reply of:
>> Apply a patch from meta-openembedded fixing a cross-build issue [1].
>> 
>> [1]
>> https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
>> 
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405 (TestIozone)
>> 
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>
> Applied to 2025.02.x & 2025.05.x. Thanks

Not in 2025.02.x or 2025.05.x as of a4ac42f4e7a74 ("Revert
"package/firewalld: add missing nftables json runtime dependency"") and
02f4d62bbf95 ("package/python3: do build-time detection of non-working
toolchain"), respectively.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
