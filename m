Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2951CD70DEB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1B84066F;
	Thu, 28 Nov 2024 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7fbWOjgepZ6; Thu, 28 Nov 2024 20:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B4040674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B4040674;
	Thu, 28 Nov 2024 20:35:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD8A712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF6740102
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJwQePNuf-Mq for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9325400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9325400DC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9325400DC
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:35:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 86586B0054E;
 Thu, 28 Nov 2024 21:35:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59364])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 Nov 2024 21:35:49 +0100
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 21:35:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241128211817.6c68520d@windsurf>
References: <20241126182855.38704-1-ju.o@free.fr>
 <20241128211817.6c68520d@windsurf>
User-Agent: Webmail Free/1.6.9
Message-ID: <18522091953e830b634abf3bbe776b17@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732826150;
 bh=KhOqTDWTGOZVA8PNcLwR6rB/SQ4eog4mizTQkeuIv/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A0i0PeYeoux8MI078r6J1zDg8htI8vujd4SwzU09frCs82VsSH2+pI8wOaf07i8NO
 hfK3VW/AjxSlh14wQPJzEJIhETi5tY5ApoD/rBLqzH9PaoZDdeW/BLvGVmsaDbIGhA
 GpTWRlL2EClbOjXn2BAKZZYVlIKMTdFr6YDuSauKFNhmF40Y0OQacZ14vD2GuQ/eoV
 ZQjegocrE9KKH5TgkSfCx4g7hvDoZb6PFH9CtwS5lI/HyyKLgso+/K1vC3Vx/jDfhr
 HEPsEX19fEDCMIn99GdwuMrOWiPKgJ36Y6TycoeyhndCCIxI4yuuIDrkh+TcWvw7QR
 YdVxp8ifmj1xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A0i0PeYe
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve mosquitto test
 reliability
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 28/11/2024 21:18, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Tue, 26 Nov 2024 19:28:55 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> The mosquitto runtime test can randomly fail on slow
>> runners, see [1].
>> 
>> This commit improves this test in the following ways:
>> 
>> - the mosquitto_sub subscriber process is now started in a subshell
>> to suppress the job control messages (to prevent any spurious
>> messages when the job stops),
>> 
>> - the standard error is redirected to /dev/null, to prevent the
>> printing of any messages,
>> 
>> - the mosquitto_pub publisher process is started later, by increasing
>> the sleep time,
>> 
>> - finally, a new sleep time is introduced between the mosquitto_pub
>> publisher process and the check of the mosquitto_sub subscriber, to
>> make sure it will have time to write its output and exit.
>> 
>> Fixes: [1]
>> 
>> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8453386454
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  support/testing/tests/package/test_mosquitto.py | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Thanks a lot, I've applied to master. However, I'm not a huge fan of
> those hardcoded "sleep 5": it makes the test longer even on fast
> machines, and it doesn't necessarily resolve the problem in all
> situations. But I think you had yourself mentioned in some other thread
> that it would be nicer to have some kind of retry loop instead?

I am not a fan either...  This will help for the time being.  I have
few patches about a retry loop I need polish before proposing.
I also don't want to include retry logic everywhere like this one:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/support/testing/tests/package/test_mdadm.py#L125

I currently add new functions in support/testing/infra/basetest.py for
those situations.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
