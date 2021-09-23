Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC4BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 13:58:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1796460F44
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 13:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1796460F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30ED401F5;
	Thu, 23 Sep 2021 13:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMdrMyisjYim; Thu, 23 Sep 2021 13:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA67E401CB;
	Thu, 23 Sep 2021 13:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D92531BF2A2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5AA7421D7
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 13:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofDEw_r-qRtA for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 13:58:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13CE8404ED
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:58:13 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id EE6CD22436;
 Thu, 23 Sep 2021 08:58:12 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1632405493; bh=WfYzl9qeUYN7YYziebZ4caWbooL9Txli4f7YN3KZiBE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dcqI7uC/ae91qBbhB8Xv0nFU3x6l39iSpPJ5p4x0I8ETPsPGOQH84pwISFCP9LZkS
 bJ1RQAmQq5/fKJ0fDTHJwiGAnyIub7PlaGiTflUzUu4oRIN0d/pKj+QTyg4g1qkUqn
 OuYme8kerU0y1zwxw2e4LlJEgEB1oSxVyKLgKjx8=
To: Peter Seiderer <ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
 <20210921223932.5d85a71d@gmx.net>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <25e4db09-93fc-43e2-74ae-0efba65fab96@xes-inc.com>
Date: Thu, 23 Sep 2021 08:58:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921223932.5d85a71d@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

All,

On 9/21/21 3:39 PM, Peter Seiderer wrote:
> Hello Vincent, all,
>
> On Tue, 21 Sep 2021 08:08:10 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:
>
>> Peter, all,
>>
>> On 9/20/21 4:41 PM, Peter Seiderer wrote:
>>> Hello Vincent,
>>>
>>> On Mon, 20 Sep 2021 16:19:57 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:
>>>
>>> Thanks for the info, only did a quick read of the PR 1619, the problem
>>> seems U-boot specific (not the buildroot default case) and there is
>>> already a suggested U-boot fix (submitted by you)?
>> Yes, sorry I was not very clear in my email yesterday (I was sending it
>> on my way out the door).
> No problem ;-), the hint was/is very valuable!
>
>> Yes, u-boot is affected, though I think edk2 may also be affected. The
>> u-boot patch has not yet been reviewed and may not make it for 2021.10
>>
>> I just wanted to give a heads up that bumping this package could have
>> consequences for some configurations.
> So there are the following possibilities:
>
> - never update rpi-firmware to not break legacy u-boot (and maybe edk2 and
>    maybe linux-mainline and maybe ...) setups
Definitely not recommending this.
> - delay the rpi-firmware update until up-to-date u-boot (and edk2 and ...)
>    are available (as this bump seems to fix some other regressions e.g
>    'kernel: Second attempt to fix the CPU startup failure' [1]
>
> - apply the rpi-firmware update now and hope that this email thread is
>    found by all people affected by the u-boot (and ...) defect, but
>    keeps the default buildroot/rpi users up-to-date ;-)

Probably no reason to delay it if there are no default configurations 
that utilize the affected packages, but not sure if it deserves a 
mention somewhere like 
https://buildroot.org/downloads/manual/manual.html#_known_issues so the 
issue is more clearly advertised until there are patches to fix the 
affected packages.

I'll let the maintainers decide what to do. Again, I just wanted to make 
people aware.

> Regards,
> Peter
>
> [1] https://github.com/raspberrypi/firmware/commit/9f9708199f8809ecf16119d0716375bee7b7d8d4
>
>>> Regards,
>>> Peter
>>>
>>>
-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
http://www.xes-inc.com

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
