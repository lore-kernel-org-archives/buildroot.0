Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC36FA0C22
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 04:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF9B484E63;
	Wed, 15 Apr 2026 04:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXy2AVfJNCsA; Wed, 15 Apr 2026 04:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8EDA84EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776227486;
	bh=vcBLWQn8igYLFOVuMOFTUc1ju7h8BESEaQSbVnmvNV0=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNe/Mf26il1QFb63HrD6givuw9r6/c7EVOxMb9GaLqUV60K7qYcjEx7x8Sq+hacCr
	 x3SzjRxPUm/UHQDszzRbFeZGUx+iUZXw+mTBUZP1cTqgTrFDAVJQqt1Mt2JIr0rSA8
	 nF6XLsnGaFxp1ahVa5MIHQ/IYMd2cz/j6gdy+k1P/whqpu+Ok7f35wL8x74rLioOlI
	 h2Jb1jIH06IrpcWSV+99cGo/IfO7cpmWP139vFtaFBVWIhmScuBGDsHhQCOQzPLvlJ
	 3XSKEf9LcP3DMjZm76C1K7ynRDwwvPY1xnGn6DkdKHRO3CmOE2MAqvGWEDHojK0y1C
	 Rbdzxsi2hLjPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8EDA84EAC;
	Wed, 15 Apr 2026 04:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E803237
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 04:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34ACA84EAC
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 04:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-sVPdBlSQ0k for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 04:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C90484E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C90484E63
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C90484E63
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 04:31:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 599A2440A90;
 Wed, 15 Apr 2026 07:30:37 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd@kuhls.net>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260414154407.334265-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 14 Apr 2026 17:44:07 +0200")
References: <20260402180534.2780167-1-bernd@kuhls.net>
 <20260414154407.334265-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 15 Apr 2026 07:31:18 +0300
Message-ID: <877bq8deuh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1776227437;
 bh=YYS47m4lFmaChGKqEbgby8gPFc9BuCtyyaCZaWdOn+E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aVCkcHazj8a9GkcP42tF15QOD31GYEV5H9oZwbdXTUYs7FY0O24bS6Clh1rWp2FVb
 70VYiGRUXTJvYK/scDcmALsumgWsiyn5B47A+qSs7xXh14WBZxSz7HdE8Pc6E4vZQ4
 xTiyix6lgNbxbUZjjaMmIuGrNEtVC0/STzkYlJ1nHNreRHxrvD/qO8cWR193ImK/Tp
 efHGc/9c8GuosHVcrQg5RlEYhcFZMtkRTea3/mMNzicFOKYD+HA9GcWF6Lonpp+ui8
 G5fcu+lQaGxrq5hu9dMtAUrXumQbabv1ZQZ5Vmv6dIn5DyeQDOEDnXbX57I6Llom+X
 GmaztxCSNlh8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=aVCkcHaz
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: security bump version to
 5.8.3
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

On Tue, Apr 14 2026, Thomas Perale via buildroot wrote:
> In reply of:
>> https://github.com/tukaani-project/xz/releases/tag/v5.8.3
>> 
>> Fixes CVE-2026-34743.
>> 
>> Switched to sha256 tarball provided by upstream.
>> 
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
> Applied to 2026.02.x. Thanks

Not in 2026.02.x branch as of commit 8f19b5b8096f ("package/leafnode2:
fix build without pod2man").

baruch

>
>> ---
>>  package/xz/xz.hash | 6 ++----
>>  package/xz/xz.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 5 deletions(-)
>> 
>> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
>> index 99daa5e9df..488a3d55dc 100644
>> --- a/package/xz/xz.hash
>> +++ b/package/xz/xz.hash
>> @@ -1,7 +1,5 @@
>> -# Locally calculated after checking pgp signature
>> -# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
>> -# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
>> -sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
>> +# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
>> +sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
>>  
>>  # Hash for license files
>>  sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
>> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
>> index 8aa0716b18..91eedd7a83 100644
>> --- a/package/xz/xz.mk
>> +++ b/package/xz/xz.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -XZ_VERSION = 5.8.2
>> +XZ_VERSION = 5.8.3
>>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>>  XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>>  XZ_INSTALL_STAGING = YES
>> -- 
>> 2.47.3

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
