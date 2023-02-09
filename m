Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0852CC636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86EC0608D8;
	Thu,  9 Feb 2023 20:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EC0608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDB4mVbbDIS4; Thu,  9 Feb 2023 20:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B102560E40;
	Thu,  9 Feb 2023 20:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B102560E40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A61FC1BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE8F608D8
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE8F608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D301TxbEoIzX for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:19:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BCD260E40
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BCD260E40
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:19:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so9909832ejc.12
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCYeAPh4n8fK0FuYE3logjdTyLyiwU/jlnmdolxSB6U=;
 b=lwUwN9lG1Fczr/HCRcbRnoCISwMJ8bOn3sH+cjRNyPNT8+O0xIhwPrUy9TeBpeKJMW
 R6IkTjJ9W7oZrqSxAEW2SKBEvbyF/510cJ1NnQkX0OTWNXrRGPh8qMJe4r6JQ0lmPClf
 VPHVbqlwNmZtTymjkWwaFqMd+hvPcAOcur2CQwwKfaRawKjOZJL1HH2XwWc61cQ4dd98
 7XlXNWQj/OZ5L7faPesx4Ytx/zkCfb1NXxhWeTFsCBAjLXVzCblyiBgsg8t3vQ1/cYCY
 SW4hzJam13fAkcXvOSGLidleMJ9PQ4jKg6yjnud6IM4dkJL6my96yCctBaknKmi9pwdz
 CVIg==
X-Gm-Message-State: AO0yUKXWtAheLyUlmbYLU6+q7CWSCiWauftx6fqFH5cc0Ed8yjI5KOGK
 U7GyxhO9ridW6XZhT6bL5VkEEw==
X-Google-Smtp-Source: AK7set/Tnb2wP/EcRw//vcU98sd9oHwEbfRRaBbltrcoePHKtWp4DYBX/+ClaCKf1HiW1f2sHBJ8jg==
X-Received: by 2002:a17:906:25d9:b0:883:b1b4:e798 with SMTP id
 n25-20020a17090625d900b00883b1b4e798mr12387971ejb.10.1675973990357; 
 Thu, 09 Feb 2023 12:19:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 og15-20020a1709071dcf00b007aea1dc1840sm1301071ejc.111.2023.02.09.12.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:19:43 -0800 (PST)
Message-ID: <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
Date: Thu, 9 Feb 2023 21:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
 <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tCYeAPh4n8fK0FuYE3logjdTyLyiwU/jlnmdolxSB6U=;
 b=Sh1x9EBzm6A5IaGNiLgfYc9lafH5f2CjwrWxbkCwefrLvH9W2ej1fkCXqvGWdY84DR
 pG/q3qL/1tZBrEpBIoSD+UFnsCrXQ9EZIN6n5waBQMSq7YnxKv1ygQFsz2DIWwpoS2JZ
 RYWm/bzvVkcGRZkoZgpyp0AJ5WyVhWgVH/gNCo5g0aZghaJAUI7haCYTs4peY4wffdlh
 KrFUKDfzOrZGPLmdYc2Tl74ucc0VhYf/+DyfsrAJt9pdjJ45qdzETu4X3G7nVvGtpBBb
 gqG0J+wS+/L2moxa3jbl25a96BUOrvgO2pGF/CKLJ/EzMXuty+qmJ+AL1HnE2PPySw9Z
 uhzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Sh1x9EBz
Subject: Re: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run:
 add support for --branch option
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



On 08/02/2023 17:46, James Hilliard wrote:
> On Wed, Feb 8, 2023 at 8:15 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Tue,  7 Jun 2022 17:12:11 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> In some cases it only makes sense to run tests against a specific
>>> branch, such as when testing new genrandconfig flags.
>>>
>>> Add a config option to override the branch selection.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>   scripts/autobuild-run | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> We looked at this with Arnout, and we don't really see what this would
>> be needed, and actually it could be annoying to have people test
>> "random" branches. If you need extensions to genrandconfig, then the
>> autobuild-run script should be backward compatible with older versions
>> of genrandconfig to be able to support older branches for a certain
>> while.
> 
> There are a number of other reasons this is useful, for example some
> build hosts(for example my asahi-linux build host) have compatibility
> issues in older branches so it doesn't make sense to run autobuilders

  If there are compatibility issues, the fixes should be backported to the 
stable branches...

  Regards,
  Arnout

> on anything other than say master.
> 
> To prevent testing of unwanted branches I could modify this to restrict
> the branch override to only allow selecting the branches listed in:
> http://autobuild.buildroot.org/branches
> 
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
