Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC50A106FD70
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49DB60F89;
	Sat, 14 Mar 2026 20:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4r3jAiDewxt; Sat, 14 Mar 2026 20:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB5360F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773520246;
	bh=jldhMgUe0iyCmGbMCUdyG3T+yE1ogpzAcdzqwmUrzUw=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iLq4z2X/IR2rOdRH8/ZPpznS3bSItocpSvwZusJ/9yU9vmrH1q4CfFxn4Ly0iFflH
	 t7YTuT+d41wPzz1DJx/6NqLh5jWSjTQsNPlCxZnZWWR23IF7a2lHWoe4T0hJ7PAnsD
	 tABEa0cM83tejV7ydYxsmIbBBn51jO1PJBNGC17RukhWQpfHBlnVyRYUo0rHYF43Ya
	 obwaXpRDZ5aRSR3DzO/JZlkCHS9xa4WZbhzYs/RwRUXJ3dsBuu+ll6gFAXySed4bqd
	 J5xkgBw8qeo/XRPKfAYaC4wZVVieRm5L2+swuNqvVOl+m3Ni/5vrz/deD2NhBubt49
	 J/FL5DM9cOJzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB5360F7C;
	Sat, 14 Mar 2026 20:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 617DA1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E4940479
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYdNDbzzOHbL for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFF45403C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFF45403C6
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFF45403C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:30:43 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id D5F2A440588;
 Sat, 14 Mar 2026 22:30:25 +0200 (IST)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,  Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <20260306195347.8941-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Fri, 6 Mar 2026 20:53:47 +0100")
References: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
 <20260306195347.8941-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 14 Mar 2026 22:30:39 +0200
Message-ID: <87h5qiqhlc.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1773520225;
 bh=ccgRA1oCQsDwQDiJ7ErsiTtjwozif8rYRENrVDt4MZs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=yhwgzMB++TTGsiueXKX1P2AO6MK0cAk2QypLme+/O0h1ovMcTnI+GNNxP4145Cz0J
 Ewp2L3XSnpMl075ph+o9pt+whHgx/3PIRPQI1IAHPNfUoo4uRQV4CSJq/Zf09WJ3oW
 SMPuSS1e/XmWU9muNUX6dsuSAHKNEjNsI7OlsJ5X/NERN0w8RD/fjCHU8bl55E88UN
 yMMhSo73nRp+SoeH0DBkm5uBdJvSITKXOx8hsWPxC+wGw4Wf4RVW54xisW6/CkSHKi
 MXO+7SyvBktq5boMa6IBBB8mbShwqk9lSoYifFWwXl4hbhnvcMVSxdxNn2R41Rxvzp
 VLtyYwpFs9HFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=yhwgzMB+
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.1
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

Hi Tomas,

On Fri, Mar 06 2026, Thomas Perale via buildroot wrote:
> In reply of:
>> This fixes these CVEs:
>> CVE-2026-26103:
>> https://github.com/storaged-project/udisks/security/advisories/GHSA-c75h-phf8-ccjm
>> CVE-2026-26104:
>> https://github.com/storaged-project/udisks/security/advisories/GHSA-fcvx-497g-6xmw
>> 
>> Release notes:
>> https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.1
>> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Applied to 2025.11.x. Thanks

Not in 2025.11.x as of commit 0e13702babe60 ("package/libvips: fix
static build").

baruch

>
>> ---
>>  package/udisks/udisks.hash | 2 +-
>>  package/udisks/udisks.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
>> index a62e6b5ed6..8a70b90a67 100644
>> --- a/package/udisks/udisks.hash
>> +++ b/package/udisks/udisks.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
>> +sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
>>  sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
>> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
>> index c9b66872e9..43d066c9e1 100644
>> --- a/package/udisks/udisks.mk
>> +++ b/package/udisks/udisks.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -UDISKS_VERSION = 2.11.0
>> +UDISKS_VERSION = 2.11.1
>>  UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
>>  UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
>>  UDISKS_LICENSE = GPL-2.0+
>> -- 
>> 2.47.3
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
