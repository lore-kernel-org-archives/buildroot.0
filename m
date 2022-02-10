Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B421DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 16:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4181B402B1;
	Thu, 10 Feb 2022 16:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkXJMjp23V50; Thu, 10 Feb 2022 16:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1513540184;
	Thu, 10 Feb 2022 16:44:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEA11BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3934040184
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Du58Iw-1qk3 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 16:44:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66F1340132
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 16:44:54 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ICYunWGVLNVvLICYunM7cK; Thu, 10 Feb 2022 17:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644511492; bh=M5Ak16jMDhgKgNhvrGKSpFy5poudZ+p74eayAM1dVjc=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=cyzpv1XCv/QU/clIyqB/GV9alaA4c+kjCG8pZDGlan9MioctDGo8yCQxGI+PFzgJq
 iobwRBhGFfoMUTtlaz0D6sB7NQPKVlJHeYkIyQQbZ3Lv6mI2ccvvtc+W5XiHYSuqBN
 OmY5v6aDOLpIJNJBXJ65Sgp8eG/mqG6m7YLSElHQR/bTWDO+XAoKzlNShHjJLY77wF
 LTibjRcVYCQ6Zrs8EqbD0wUWBoGEIDIjtIvatBcklq8PnGIW9VKifL1CT8+zxk31Fd
 XrXQkXahUUA9jTQiMeTSv4dQsT//1/sPR/RDden2YyM/m+JCJ63CAleZemr6lWxzEs
 EuuZK7f+Chctw==
Message-ID: <05091af5-9095-1b40-29c5-b2480b859ae2@benettiengineering.com>
Date: Thu, 10 Feb 2022 17:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Oleksandr G Zhadan <oleks@arcturusnetworks.com>,
 buildroot <buildroot@buildroot.org>
References: <4b667326-5aca-538b-9b36-7f0d5a400e9f@arcturusnetworks.com>
 <f7c3a3ba-721b-c02b-a0e0-d07538117fba@benettiengineering.com>
 <fb40e506-9418-3389-8bb7-dbcd0ca1a3dd@arcturusnetworks.com>
 <2920974c-149f-ea4c-9b79-9a1b862fce95@benettiengineering.com>
In-Reply-To: <2920974c-149f-ea4c-9b79-9a1b862fce95@benettiengineering.com>
X-CMAE-Envelope: MS4wfM2skQ37jJv+OWx/1sRHyH9go9GBSGCEo7Es6duT8UqwFAFaD7sfDM8JDzNbAoHUrUMqQEgXfXmVg2aT6lxXG32I6Y+IJvP2aKr1XUWYTdv38Jp5BAPZ
 d3mirA2Ojmyk2dhbyOGr67dcVjcDMY3EICK4DT4ubZQbLau95g2xQ2iXFFBINREvBYNpyc4GXxDopz6KL6+Qf/F+OAm3uKW5LxU//DrFTQLL2YUzqYf1FbqA
 G0V18wPDjtMRReDGsNYuPh6Z+Y+Ue65AW5a45hogpxEIwgQR9Tx33gM9prA3LRe7
Subject: Re: [Buildroot] [PATCH 1/1] board/arcturus/aarch64-ucls1012a: bump
 u-boot and kernel version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oleksandr,

On 08/02/22 19:25, Giulio Benetti wrote:
> Hi Oleksandr,
> 
> On 08/02/22 18:31, Oleksandr G Zhadan wrote:
>> Hi Giulio,
>>
>> Thanks for the quick response and your notes.
>>
>> New V2 patch file attached. The patches are based on today's `git clone
>> https://git.buildroot.net/buildroot`.
> 
> good
> 
>> Patches created with the options you suggested: `git format-patch -M -s
>> -o . -1`
> 
> Ok, but you also need the flag -v2, so this is the command:
> # git format-patch -M -s -o . -1 -v2
> 
> And then you need to add what's changed after the 3 dashes. Check this
> patch as an example:
> https://lists.buildroot.org/pipermail/buildroot/2022-February/635926.html
> 
> Take care of adding 3 dashes and listing:
> ---
> V1->V2:
> * changed this
> * changed that
> ---
> 
>> Unfortunately I can't send it now with 'git send-email --to "buildroot
>> <buildroot@buildroot.org>" 0001-xxxx.patch`. If it doesn't work for you,
>> we'll send it later.
> 
> Yes, we need it sent like that for reviewing.
> Anyway I've checked that the attached patch now applies correctly, so
> you're on the right path!
> 
> Best regards

also, please register to patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/
and tag your previous patch as superseded:
https://patchwork.ozlabs.org/project/buildroot/patch/4b667326-5aca-538b-9b36-7f0d5a400e9f@arcturusnetworks.com/
and also the V2 since you've been requested for Changes, so you can tag 
as Change Request now and once sent V3 as superseded.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
