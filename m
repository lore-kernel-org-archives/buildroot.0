Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D158C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:28:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEE4603E7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFEE4603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A873060A61;
	Fri, 30 Jul 2021 13:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2QZGdU8IUjH; Fri, 30 Jul 2021 13:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2C560751;
	Fri, 30 Jul 2021 13:28:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86AC01BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8251040231
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TXMjwtD8aXb for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:28:02 +0000 (UTC)
X-Greylist: delayed 00:09:53 by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05403400E5
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:28:01 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 2928E22425;
 Fri, 30 Jul 2021 08:18:08 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1627651088; bh=gdw9I6xqLjBZfDkHloKfQu0Efx7iArTYdbJk62nMel0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W6DcGKTZsspdkQF//FYuBIJugLCts9MO+sNheTYifNUMGCrppOMaDUDDCkNYH1p/A
 vaOmoSTxQA9LkixtpVhbZB4ZL4NLbaycI0Q671jFAg5dqVeOXtIxLjaAp4c6kMsog3
 0cYa0BbfZdod7P2D+52El2mgZ0EIzzl+kbFv7UM0=
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@paral.in>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
 <20210729225000.750b323e@windsurf>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <8c1b8dac-e1a2-77a6-d540-9310847ded63@xes-inc.com>
Date: Fri, 30 Jul 2021 08:18:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729225000.750b323e@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Ryan Barnett <ryan.barnett@rockwellcollins.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Christian, all,

On 7/29/21 3:50 PM, Thomas Petazzoni wrote:
> Hello Christian,
>
> On Thu, 29 Jul 2021 13:17:09 -0700
> Christian Stewart <christian@paral.in> wrote:
>
>> This works fine in most cases, however, this causes inconsistent hashes.
>>
>> On my system, the hash is correct after re-pack. But on 2 of my users
>> machines, the hash ends up different.
>>
>> So something specific to the host machine must be influencing the hash
>> of the repacked archive.
>>
>> It's either something in "go mod vendor" that's not deterministic, or
>> maybe host Go is being used instead of the one compiled by Buildroot,
>> or perhaps it's not possible to always get deterministic hashes this
>> way.
> Meh :-/
>
I think Yann already calls out what may be going on in this patch 
https://patchwork.ozlabs.org/project/buildroot/patch/20201219153525.1361175-5-thomas.petazzoni@bootlin.com/

The tarball format will need to follow the same or similar format we use 
for other source packs by using the PAX format and trimming some 
metadata being included in the archive. GNU format tarballs are not 
guaranteed to be consistent across versions.

See: 
https://patchwork.ozlabs.org/project/buildroot/patch/bcb281853f0da8cd970446f4afed093b317dcc82.1609239666.git.yann.morin.1998@free.fr/


-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
http://www.xes-inc.com

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
