Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C7C4450A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E476660858;
	Thu, 16 Jul 2026 11:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hx0_T4MnEa35; Thu, 16 Jul 2026 11:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A08D6083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784201647;
	bh=K7Bf8NEIhQKqwGjuiXmW8Qzit2a58rwP5zfgiy4jLXo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FI99qdLzA1i23szOWFocGOochmL+sVV6lkeRY/hyKB0kZGz2d8NvYJIJYyh5l4iTr
	 6fcM2dg/tJg8AJP8+LDcEnhgyl31uFBrfwnchoh8uKkMhNJjsBzBsWS3O5gjiWOHhz
	 AaXUzcQzlrQrkrQgQO5cXJS/GAX8vzA+WUO9BWM9lrYbb+nUUBR30cHs3qSt1ljnAt
	 o/gJoAG3A0FJmbKK5Uleohjvs/PGIgdk0XG9PYbRK2O+s0ztDys7kJ8XSOogUXchsi
	 PgleXaGQ9cviza21e1K8GJq5VpmYz2ha6JgtSPwR4Pz3u0DAwfhrENF/D69DTvg/zt
	 zNwdfCjOqt2zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A08D6083B;
	Thu, 16 Jul 2026 11:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4321320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 11:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9710407BA
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 11:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpZfw5S4_yVH for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 11:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D010140788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D010140788
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D010140788
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 11:34:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C999B97776D; Thu, 16 Jul 2026 13:34:00 +0200 (CEST)
Message-ID: <ecd077db-2ded-4ba5-bf23-eec72b143ed5@rnout.be>
Date: Thu, 16 Jul 2026 13:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
References: <20260715193512.46B9288999@busybox.osuosl.org>
 <d69f1972-f7e5-a606-5ec3-9c82324726f8@heine.tech>
Content-Language: en-GB, fr-BE
In-Reply-To: <d69f1972-f7e5-a606-5ec3-9c82324726f8@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1784201641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=r9k8IGdTqmLtGc2LA4/nwjLhZYNk00RA/Z92ovIXr3o=;
 b=MKbvxUuiKQFGP79gZKjMDGGN+0GeHrry6BDvuQmK/assetxb1FpoG9pFhFFG5D7RgGmVOH
 U91cx4YcUglSmkCaWLntMboYddFz/JRJPgDqzwke3k1Z4qWSax7zKLbqv+KmfIHwD5I04D
 EjkZShNjJWBWo+xYzRG4mjUJZS8bHq7QPx9nLrzx+XJOmeXetS5rVBc1IX2SplQ47KQB/T
 Ypp1mLEnV59CxDvyUoaks/prd4C4EEo9/UKcxDVQ65hsmTeNOvq8neHRmunX8qUt5WW8iT
 TUArMvOy+vU3Ws5A5e3Uk58cz6cCU8hUe1u08NMOr7i5oTR/SJ+iDVnIgud2dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MKbvxUui
Subject: Re: [Buildroot] [git commit] docs/website/download.html: remove old
 stable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2026 09:06, Michael Nosthoff wrote:
> Hi Arnout,
> 
> I'm a bit confused. Was there a change to the policy described in [0] that "The first release of each year is a long term support release, LTS"?
> I couldn't find any announcement related to this. Can you enlighten me here?

  Oh yes, we changed that to a 3-year LTS (instead of 1 year) that is started 
every 2 years (so with 1 year of overlap). See [1].

  It looks like we forgot to update the manual. Thomas, Titouan, care to take 
care of that?

  Regards,
  Arnout

[1] https://buildroot.org/lts.html#releases

> 
> Regards,
> Michael
> 
> 
> [0] https://buildroot.org/downloads/manual/manual.html#_releases
> 
> On Wednesday, July 15, 2026 21:33 CEST, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
>> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/931803d24d37243af45c76fb8087e77141caa544
>> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
>>
>> Now 2026.05.1 is released, we no longer need to advertise the EOL old
>> stable.
>>
>> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
>> ---
>>   docs/website/download.html | 26 --------------------------
>>   1 file changed, 26 deletions(-)
>>
>> diff --git a/docs/website/download.html b/docs/website/download.html
>> index 57183da23c..35d8c28dae 100644
>> --- a/docs/website/download.html
>> +++ b/docs/website/download.html
>> @@ -70,32 +70,6 @@
>>               <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
>>             </td>
>>           </tr>
>> -        <tr>
>> -          <th>Old stable (EOL)</th>
>> -          <th>2026.02.x</th>
>> -          <td>June 2026</td>
>> -          <td>
>> -            2026.02.3<br/>
>> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">
>> -              Changelog
>> -            </a>
>> -          </td>
>> -          <td>2026-06-16</td>
>> -          <td>
>> -            <a href="/downloads/buildroot-2026.02.3.tar.gz">
>> -              <img src="images/zip.png" width="24" alt="">
>> -              .tar.gz
>> -            </a><br/>
>> -            <a href="/downloads/buildroot-2026.02.3.tar.gz.sign">[PGP sig]</a>
>> -          </td>
>> -          <td>
>> -            <a href="/downloads/buildroot-2026.02.3.tar.xz">
>> -              <img src="images/package.png" width="24" alt="">
>> -              .tar.xz
>> -            </a><br/>
>> -            <a href="/downloads/buildroot-2026.02.3.tar.xz.sign">[PGP sig]</a>
>> -          </td>
>> -        </tr>
>>           <tr>
>>             <th>Long-term support</th>
>>             <th>2025.02.x</th>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
