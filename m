Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CA8C432BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 11:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307DE60F36
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 11:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 307DE60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7EA6400C7;
	Sat, 14 Aug 2021 11:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15cDLC1YCiVX; Sat, 14 Aug 2021 11:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23854400FD;
	Sat, 14 Aug 2021 11:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02F4B1BF228
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 11:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72D7605EE
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 11:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tybqjxgu_ApM for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 11:35:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE6A605C5
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 11:35:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26CC51814BB; Sat, 14 Aug 2021 13:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1628940906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=olNOv8psLHgIeVCAdy/v830MNJ9ijXxNqaz9QiOSLf4=;
 b=Cw4E5iCPBIMVs890Ud93FMDdrpIJLNWpdn2VIqwCLRNcLyGdc+utT/nWSVJ8Nm89/2uFzN
 oawemoJoUTP3XCX5GgDnr7+7dhAjhLQSKoHRBKhBkcXCU3VZdcZSOr683uThyLlZEfCxSV
 XX7TdV5X4hvHF2abwPG7YjhBO7agWCs=
To: Asaf Kahlon <asafka7@gmail.com>
References: <20210813212813.4931-1-buildroot@heine.tech>
 <CALFsTFV9cMZHPHfD-73-z3JuNNEs87=_DPNKXvayjKXLbtj7oQ@mail.gmail.com>
Message-ID: <56c837aa-fd93-14db-0fe0-b94455e7c018@heine.tech>
Date: Sat, 14 Aug 2021 13:35:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CALFsTFV9cMZHPHfD-73-z3JuNNEs87=_DPNKXvayjKXLbtj7oQ@mail.gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump version to 1.9.2
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Asaf,

On 14.08.21 07:50, Asaf Kahlon wrote:
> Hello,
>
> On Sat, Aug 14, 2021 at 12:28 AM Michael Nosthoff <buildroot@heine.tech> wrote:
>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> ---
>>   package/spdlog/spdlog.hash | 2 +-
>>   package/spdlog/spdlog.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
>> index 5d1ff2f520..02756fc98c 100644
>> --- a/package/spdlog/spdlog.hash
>> +++ b/package/spdlog/spdlog.hash
>> @@ -1,3 +1,3 @@
>>   # Locally calculated
>> -sha256  944d0bd7c763ac721398dca2bb0f3b5ed16f67cef36810ede5061f35a543b4b8  spdlog-1.8.5.tar.gz
>> +sha256  6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38  spdlog-1.9.2.tar.gz
>>   sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
>> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
>> index ee875ae560..b5dfc0c7b4 100644
>> --- a/package/spdlog/spdlog.mk
>> +++ b/package/spdlog/spdlog.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -SPDLOG_VERSION = 1.8.5
>> +SPDLOG_VERSION = 1.9.2
>>   SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>>   SPDLOG_LICENSE = MIT
>>   SPDLOG_LICENSE_FILES = LICENSE
>> --
>> 2.32.0
>>
> This patch seems fine, but it's not really independent because the
> compilation fails until a newer version of fmt is used.
> So ideally there should be a small series with both patches.


That's interesting, 1.9.0 compiles fine with fmt 7.x but 1.9.1 and 1.9.2 
fail. I don't think this is intentional as
there are #defines in the code to maintain backwards compatibility [0].
I'll report this to spdlog. But for buildroot I guess we're good to go 
when bumping both packages at once.
I'll resubmit as patch series.

Regards,
Michael


[0] https://github.com/gabime/spdlog/blob/v1.x/include/spdlog/common.h#L38

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
