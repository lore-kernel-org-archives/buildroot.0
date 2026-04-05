Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EFCE9D812
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 18:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAC74094B;
	Sun,  5 Apr 2026 18:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgZoA4COXmC9; Sun,  5 Apr 2026 18:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A07A4097C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775415579;
	bh=JxEA+PUju6TOOkEVEiVt+H7o7N8yJHPTkgqglOs410A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LQeIkgx3hn7g2naXTX10IOSnDh2z5KHlUZQ4IlJYdg4CZSJOmPoy9grqnL0w8VXCy
	 xN4t/PMJBcMAwElydHmpWO5F+aB89EwH9/n1ks3FjJKbIfYFnV5O7yHVj/kCvQNjkx
	 +u4t0vKzJ0nPTEgP4x16NrmX36dLP3Q0JERYKyZE57ZEAw1fSQE+yy/JO/AWDnAXXo
	 QO4ZJ5Nw4Lgwbwy36psKSfK6YTamSO64ShmHVzTvLm5WfiV70nQD04x4F+py2K68Xb
	 2mSyrK729JgCNABzrVQr7oLlKLcMID7DVVrsUfBRfx/1EIzVF2XrzCbrHNF44C15vT
	 NgLyPqLOTioXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A07A4097C;
	Sun,  5 Apr 2026 18:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 084132EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB3BD40095
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T49WbRP81Y2v for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 18:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B3724006E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B3724006E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B3724006E
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:59:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1vZZyd1p7C-00bQCh; Sun, 05
 Apr 2026 20:59:29 +0200
Message-ID: <53879b2b-8c85-4bb5-b391-1f14d9e13151@gmx.de>
Date: Sun, 5 Apr 2026 20:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20240831191919.370005-1-fiona.klute@gmx.de>
 <e09aa58a-2cb0-4ef6-b9fd-1a6a6fd15a21@gmx.de> <adKU-16ILEg2aWbt@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <adKU-16ILEg2aWbt@landeda>
X-Provags-ID: V03:K1:VhQuOhnULRcDhsf5+zOjjLbAx5jlKcdAbDCwCmCeuV4YSkMLBrw
 HDEi9xSQAOYmGmEwWQOFI3zfHTiLK0xyb6t+EUdxwCYzZAmtwopKW7wHr1JuDcNN7utxLFU
 sZFEFpwFoCPSl0uUAdFdYefUI+U5PTx/cJYs3M0j3Q11gGHkrqAxRuvToFHtqHLKyDvRvRQ
 DNtken5AQuVO7Zk9hqtCw==
UI-OutboundReport: notjunk:1;M01:P0:iJLNp/VFiR0=;tXllzvh9MKcRW+09lBDfx+sMzkz
 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
 gV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1775415569; x=1776020369; i=fiona.klute@gmx.de;
 bh=+n8ildHLJDXVbcnP4xRPqSkxAeqaXyFkRfHVBjMn0Ts=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FRDHv26fD8txo+hzmhU/4PGsR0MGk1p7ND03vtZ/ck9rXvz35WGOmSM9FbbRl8I5
 ofotCgduU9Pv7/Pgg0DNPlURy7hlp7uS6S3pGihzmBQF5TqRf7lEA9Q/7OUAZrTnU
 TDzBKQM7qNlkKR7pf5K0wyXmbU9K+39ph4dFfN4aniR0ZZJgias20SsQU2yaOOKEB
 3I3G13gmu0xqY9zo99W5rleboA360BO5xem/nVF8wZ+C1ouVBxTokARqe8aFEjVsv
 g+sS7WcZNm2fjwfZ0I2+bORreu/YrlQk+UIjK7uT/iqLEmk1Q1DRkvOrnIBhX9suB
 WWvuivW0VbDZ6OuyNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FRDHv26f
Subject: Re: [Buildroot] [PATCH next v4 1/1] utils/docker-run: mount and
 pass BR2_EXTERNAL dirs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

thanks for your review!

Am 05.04.26 um 18:59 schrieb Yann E. MORIN:
> Fiona, All,
> 
> On 2026-04-05 17:48 +0200, Fiona Klute spake thusly:
>> Am 31.08.24 um 21:19 schrieb Fiona Klute via buildroot:
>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>> The BR2_EXTERNAL environment variable is passed into the container,
>>> and each path listed in it mounted. This allows using external trees
>>> when running a build using utils/docker-run. Testing the existence of
>>> the variable instead of a non-empty value allows passing an empty
>>> BR2_EXTERNAL variable to disable currently set external trees.
> [--SNIP--]
>>> diff --git a/utils/docker-run b/utils/docker-run
>>> index 1adb02d74e..9579f83ce2 100755
>>> --- a/utils/docker-run
>>> +++ b/utils/docker-run
>>> @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
>>>        docker_opts+=( --env BR2_DL_DIR )
>>>    fi
>>>
>>> +if [ -v BR2_EXTERNAL ]; then
> 
> As this is a bit unusual (but perfectly legit!), maybe a little comment
> above the code to explain the intent:
> 
>      # Test the variable exists, not just that it is non-empty,
>      # to be able to propagate an empty BR2_EXTERNAL.
> 
> But -v is a bashism (that's OK, we're using bash in the shabang), but
> the more usual (and POSIXly correct [0]) way is to use something like:
> 
>      if [ "${BR2_EXTERNAL+set}" ]; then
> 
> (an empty string evaluates to false).
> 
> I prefer we use standard constructs when they exist, and are not too
> cumbersome to use, rather than bashisms that do not provie that much of
> an improvement.

Reasonable point, I've changed that in v5.

>>> +    docker_opts+=( --env BR2_EXTERNAL )
>>> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
>>> +        mountpoints+=( "${br2_ext}" )
>>> +    done
> 
> Why the loop? You can just append-assign the expansion:
> 
>      mountpoints+=( ${BR2_EXTERNAL//:/ } )

I discovered a reason while testing your suggestion: We need to call 
"realpath" on each element (which my previous version didn't do either). 
BR2_EXTERNAL may contain relative paths, but neither Podman nor Docker 
allow those for bind mount source paths. So that's fixed in v5, too.

Best regards,
Fiona

> [0] https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_06_02
> 
> Regards,
> Yann E. MORIN.
> 
>>> +fi
>>> +
>>>    # shellcheck disable=SC2013 # can't use while-read because of the assignment
>>>    for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>>>        docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>>> --
>>> 2.45.2
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
