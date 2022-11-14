Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7D4C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 08:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDCE40994;
	Mon, 14 Nov 2022 08:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEDCE40994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vF_lpEbRsexn; Mon, 14 Nov 2022 08:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C699F40992;
	Mon, 14 Nov 2022 08:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C699F40992
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9676C1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 08:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D4C40990
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 08:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D4C40990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZyWIl8ptir-s for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 08:09:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2442D40982
Received: from mailproxy02.manitu.net (mailproxy02.manitu.net [217.11.48.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2442D40982
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 08:09:00 +0000 (UTC)
Received: from [192.168.178.43] (aftr-82-135-82-46.dynamic.mnet-online.de
 [82.135.82.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy02.manitu.net (Postfix) with ESMTPSA id 034AFC004E;
 Mon, 14 Nov 2022 09:08:56 +0100 (CET)
Message-ID: <4d44fddd-6773-8b73-fbbf-ad734663c2c0@grandegger.com>
Date: Mon, 14 Nov 2022 09:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <3b6d0a97-f4d9-9f03-7d25-e769e27bb57c@grandegger.com>
 <20221113225503.158e605e@windsurf>
From: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <20221113225503.158e605e@windsurf>
Subject: Re: [Buildroot] [PATCH v3] package/udisks: add config option to
 support mounting in /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 13.11.22 22:55, Thomas Petazzoni wrote:
> On Thu, 10 Nov 2022 09:38:02 +0100
> Wolfgang Grandegger <wg@grandegger.com> wrote:
>
>> Support mounting in /media instead of /run/media for compatibility
>> with the Filesystem Hierarchy Standard (FHS). This is also required
>> for backward compatibility with udisks1.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>
>> ---
>> Changes since v1:
>> - explicitly disable the option if not selected
> I'm not sure exactly why, but your patch didn't apply cleanly. Maybe
> some whitespace damage caused by your e-mail client (we recommend using
> git send-email to submit patches). Anyway, I fixed up the conflicts,
> and pushed your commit to our next branch. Thanks!
>
Thanks! Obviously, this simple patch was prepared and sent in a hurry, 
sorry!
I will try to be more carefully next time to avoid extra work!

Wolfgang

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
