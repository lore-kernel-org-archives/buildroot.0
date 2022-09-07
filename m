Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D24CC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE2982AB6;
	Wed,  7 Sep 2022 15:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABE2982AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PAdUNQNJzyU; Wed,  7 Sep 2022 15:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F0482AA9;
	Wed,  7 Sep 2022 15:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F0482AA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4F251BF25B
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 15:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA4682AA9
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 15:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA4682AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6SdVGPTEer2 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 15:55:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC9482AA7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AC9482AA7
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 15:55:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33F10E0004
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 15:55:34 +0000 (UTC)
Message-ID: <3fd34d2f-fe1b-d58c-4d1e-9f8c1e9a2408@korsgaard.com>
Date: Wed, 7 Sep 2022 17:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
 <20220802104049.560f9001@windsurf>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220802104049.560f9001@windsurf>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/08/2022 10.40, Thomas Petazzoni via buildroot wrote:

>> So far this solution seems to cover all problems:
>>
>> --localstatedir=/var \
>> `grep -q -e '--runstatedir\b' configure && echo --runstatedir=/run` \
>> --program-prefix="" \
> 
> Meh, I see the idea, but it doesn't look like a great solution :-/

It is ugly, but effective.

We're now >1 month later, but the issues are still not fixed. Thttpd and 
wipe uses autoconf 2.13, so they are broken and this libgpg-error issue 
is possibly not related (I am unable to reproduce it here though):

http://autobuild.buildroot.net/results/658/65882e1f266e818fecef2892c9493d3b8e1e912e/

What do we do for 2022.08? Revert the whole runtime path logic or add a 
new-enough-configure-script detection logic as suggested above by Norbert?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
