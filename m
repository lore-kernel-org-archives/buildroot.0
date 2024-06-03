Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C72C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E4864080B;
	Mon,  3 Jun 2024 18:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChPDHLPcSUnb; Mon,  3 Jun 2024 18:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC6740806
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC6740806;
	Mon,  3 Jun 2024 18:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8F81BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24895812F1
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVF30wy4jDGm for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12C5281FCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C5281FCB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12C5281FCB
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:14:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 15B6413F899;
 Mon,  3 Jun 2024 20:14:16 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34384])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Jun 2024 20:14:15 +0200
MIME-Version: 1.0
Date: Mon, 03 Jun 2024 20:14:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <Zloux27_r6DqP0JF@landeda>
References: <20240531194025.122135-1-ju.o@free.fr> <Zloux27_r6DqP0JF@landeda>
User-Agent: Webmail Free/1.6.5
Message-ID: <d8ea34fee435e9e86a3033554cf72c2c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717438457;
 bh=GIzH0zDUAak9ZzLAXo0GeDLsGRYbgojhOMKY98P/2Qc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YJMJQpxzpmCX1jO0Kz8yksXCQXvYNvHg1D41q8pH19MwR0yN7uCpyen+GKHLF84ff
 ZRIViDd3tegkjwfbgQS3HZmLK0S4zEeXB8g6mlYhRjnDS7S3Fq0WL/YMLhpp9w9zMD
 atCZ06KICK6e+O5+oH9lYriFtZj6oso/HasEuTl+sLgqw3eh093y7lvK7HdkQ5lW9/
 4IkkiYDHD61LGbPtyYJRZTE3Ab+VYQOOY/+Dt67efmrZyKnrJvJAIp3tez7fYnc6Ok
 xqJ5Prj8NCpUgPdEZXeDhLOZWdrERW5PQYdDabsBaEwo4svZbwY1P6M+WKbOgQnRDz
 yLOPG54SLb0kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YJMJQpxz
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional {Graphics,
 Image}Magick++ support
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 31/05/2024 22:10, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2024-05-31 21:40 +0200, Julien Olivain spake thusly:
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  package/octave/octave.mk | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
>> index a087961be97..6a21bef7b87 100644
>> --- a/package/octave/octave.mk
>> +++ b/package/octave/octave.mk
>> @@ -26,6 +26,16 @@ else
>>  OCTAVE_CONF_OPTS += --without-bz2
>>  endif
>> 
>> +ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
>> +OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
>> +OCTAVE_DEPENDENCIES += graphicsmagick
>> +else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
>> +OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
>> +OCTAVE_DEPENDENCIES += imagemagick
>> +else
>> +OCTAVE_CONF_OPTS += --without-magick
> 
> This is material for the next branch, so should we just add
> --without-magick on master, for correctness?

To me, this is another instance of the grey zone between what goes in
"master" and "next". Peter accepted the same kind of commit in master:
https://gitlab.com/buildroot.org/buildroot/-/commit/c1723c0dfda041efb3da1d4da94909cbc0003e77

The branch "next" was already opened.

I understood that such a change is then a "fix" of Octave
automatically detecting the presence of those dependencies. The build
is not broken. It is just the support that might be enabled or not,
depending on the build order.

So I don't think there is a big differences between applying this patch
on master, or next. You can also apply on master after the 2024.05 tag.
If you apply now on next and disable on master, we will need to also
update (or resolve a conflict) while the merge next in master.

Tell me what you prefer, I'll send a v2 if needed.

> Regards,
> Yann E. MORIN.
> 
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_READLINE),y)
>>  OCTAVE_CONF_OPTS += \
>>  	--enable-readline \
>> --
>> 2.45.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___        
>        |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There 
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
