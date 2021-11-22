Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844D2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D1F605EB;
	Mon, 22 Nov 2021 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhU7Qb0lBmkf; Mon, 22 Nov 2021 20:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8030B60732;
	Mon, 22 Nov 2021 20:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E45C1BF5AD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E0540235
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSqdwVKevzpy for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 20:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FFE2400FF
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 20:53:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y12so82507428eda.12
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 12:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SJPzUGBHKNbuyoqleN6wfIhA3WkzghIRVyP37xFwwYY=;
 b=hHyKecRbQfPZDOTn4h+QWDTxD16Arocbr+IBLZtiBCHeXGYCI/sAC46zQOLO0/uvr3
 rKXi8HZGCCaAqJk8kJPxQ9h1vXv84NraSzEnkOm+wRblHxq2XG+E2LUmWUHXNCU7qINY
 R2SuQIl838W2T5qOmyL9UT/t9vbfago3WztLVQvoLf2y9ZzhgpE+N3VeNI0430vJBYO4
 u6HgsrexNADRt9chNuHAj+MLrwI5Jym5y1MJAOrKmXWseEqDtW2IOfickzs7J2pBy84N
 ffKnznKaplfq33e1TQbkm3esAJk+BrikNm2DzSXqucw5jDHaFSaIA1PryvdJJ43daEHF
 z0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SJPzUGBHKNbuyoqleN6wfIhA3WkzghIRVyP37xFwwYY=;
 b=RTx52N87ISczqT6v5AZXKNHnjXFNYu+lpU51nNlii4Wy/+qrFfN1cEpC8+uAOBwWMt
 e5LAWtxmAejR8rWiLZ1jN2gUOHwR5SbUW4iL6qYahJfFapD8qvqicSRY4wJp4qMHOpfd
 Ygt/lKCOdvxOeC8GWR3kuW9ar0ujj26H3VsXeKX74TRp8kAi7V0RBBXMx9GAGVoBwgEk
 +ErEy6K/bXtmUf1rpeEQZy9PYeZm2coeeG7m7EmbGSML4zbC6PDxAaM8n+dJn5FR1VHc
 hlbhdGck0hzmYenzpG1o2+NrDsVWiPvts5H4bbNly7KLY27PMH3x5isfMoxD73jcu7Ep
 z7QA==
X-Gm-Message-State: AOAM5302LieVl+hmORYjKphzfp6ZTYxkow+FUY6TznnO2YcIPWXmoblO
 zQ9fvJ57yk3MedXCV9vX8yOuAg==
X-Google-Smtp-Source: ABdhPJyBgL7lI6sg8L73+bq84kAmMFIzpyPfiKrVEnXh/Y/gOegupi6JYVakUMpcwNd2POX1QV0AMA==
X-Received: by 2002:a05:6402:2d9:: with SMTP id
 b25mr70284345edx.383.1637614400396; 
 Mon, 22 Nov 2021 12:53:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id my2sm4186613ejc.109.2021.11.22.12.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 12:53:19 -0800 (PST)
Message-ID: <ffad9a85-953f-0663-261b-57ffc46224ca@mind.be>
Date: Mon, 22 Nov 2021 21:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
 <20211119175553.2413433-2-fontaine.fabrice@gmail.com>
 <20211121204348.5c21a803@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211121204348.5c21a803@windsurf>
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/boost: threads needs date-time
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



On 21/11/2021 20:43, Thomas Petazzoni wrote:
> On Fri, 19 Nov 2021 18:55:53 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Fix the following build failure with gcc >= 7 raised since commit
>> 4e267a7d3d5d350710a81ada188a1629348e4b4a because until cmake 3.21.3 and
>> https://github.com/Kitware/CMake/commit/1ad0c5ae53fc0c4f774166337f0e9c93c578cf9b,
>> cmake assumed that boost threads depends on boost date-time. As, we
>> can't patch all cmake in the field, just select boost date-time.
>>
>> -- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7
> 
> So just to work-around a CMake < 3.21.3 bug, we force this select in
> Boost? This doesn't feel like a very good solution :-/
> 
> Even in Buildroot, we're still using CMake 3.16.9.

  So what we could do instead is to bump CMake to 3.22, and set our mininum 
CMake version to 3.21.3. This is going to hurt the build time for some people, 
but I guess it's better than forcing boost date-time?

  On the other hand, boost date-time probably has a very small additional size 
cost compared to the rest of boost, so this patch is probably a better ad hoc 
solution. I'd just add a comment in the Config.in file to explain that this is 
just a workaround, with a longer explanation in the commit message.


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
