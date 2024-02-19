Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC4BC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49B9840359;
	Mon, 19 Feb 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E94kdgNEjvm5; Mon, 19 Feb 2024 21:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1C440B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1C440B8C;
	Mon, 19 Feb 2024 21:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51E121BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F42840800
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlnCz1-lWn6Z for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 240BD407F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240BD407F6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 240BD407F6
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:30:40 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 05A542C80033;
 Mon, 19 Feb 2024 22:30:37 +0100 (CET)
Message-ID: <04a28a98-2699-44b6-b5d5-697a1a6fe893@bubu1.eu>
Date: Mon, 19 Feb 2024 22:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240219182604.1287000-1-buildroot@bubu1.eu>
 <ZdPEzH3kvBYikWcY@landeda>
Content-Language: en-US
In-Reply-To: <ZdPEzH3kvBYikWcY@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708378238; bh=Lez4SNjeIYtYCLCCNUXQz9PopwDTaE8pKH7rxEnbRTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=c36c4Gghn/8Cq7Byp3/7uuOQ/+T0Om4Pbr/Uh2ROQa5sUGyLb2uNVWJuGAngmyjIu
 c04Tip9RMtYVuK8S513MzWF6+UQPL9cpxdiEl7+Whn0Emre431LzdMaVBgBG7LA1+h
 /fL1trhuOsECFjKJR3rDAXmLSwn7nzBNM6HL833CwXPL13Qhlw/WVX2/JPxRUkAnDC
 xn2wlpzLcFGMJcNUeiLFH0Rjc+f0JqgvZtN59Po9cFY5GZbbqXliG44G5CqO8N7SCQ
 TRe8NVh2wm9O5WiUfCB26K/fgc10CdfLyJPUpruc/3BezZ+XwMenR4wTvpjICKpOqO
 ItSCtpKjDbqTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=c36c4Ggh
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to version 254.9
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 19.02.24 22:14, Yann E. MORIN wrote:
> Marcus, All,
> 
> On 2024-02-19 19:26 +0100, Marcus Hoffmann via buildroot spake thusly:
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> 
> Ideally, a little blurb about what changed would be nice, to highlight
> critical fixes, or to just mention random fixes. I looked and there were
> no report of security fixes...

I looked through the commits as well... on one hand there were too many 
to sensibly list them in the commit message (232 commits in total, IIRC) 
and on the other hand nothing really stood out besides "a random bunch 
of fixes", so I didn't know what to write :D.

> 
> I initially did not plan on pushing, but I forgot I had it applied
> localy, so it went in... I could have reverted, but that's a minor
> version bump with no report of security fixes, so it is good to have,
> I hope.
> 
> Please watch the gitlab pipeline for any failure of the runtimet tests,
> just in case this minor version bump breaks anything.

So if I understood that correctly I can add myself as a maintainer of 
the runtime test files and I'll get an email when that test fails? Or is 
that not how it works?

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.

Best,
Marcus

> 
>> ---
>>   package/systemd/systemd.hash | 2 +-
>>   package/systemd/systemd.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
>> index c0f4638803..e5588f06a2 100644
>> --- a/package/systemd/systemd.hash
>> +++ b/package/systemd/systemd.hash
>> @@ -1,5 +1,5 @@
>>   # sha256 locally computed
>> -sha256  1e1e42c597b4f992679aa964a0c5c23d970c58fed47aed65c11878b332dc5b23  systemd-254.6.tar.gz
>> +sha256  3d23003ea886dbffa5bc84ad72c6edcbde62d32dbdec506e308624e1da509cb0  systemd-254.9.tar.gz
>>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>>   sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> index 528fe60b1d..c6b006d1fb 100644
>> --- a/package/systemd/systemd.mk
>> +++ b/package/systemd/systemd.mk
>> @@ -19,7 +19,7 @@
>>   # - Diff sysusers.d with the previous version
>>   # - Diff factory/etc/nsswitch.conf with the previous version
>>   #   (details are often sprinkled around in README and manpages)
>> -SYSTEMD_VERSION = 254.6
>> +SYSTEMD_VERSION = 254.9
>>   SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>>   SYSTEMD_LICENSE = \
>>   	LGPL-2.1+, \
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
