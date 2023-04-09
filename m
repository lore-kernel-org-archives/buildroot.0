Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA42C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 19:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14FB410BD;
	Sun,  9 Apr 2023 19:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D14FB410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeurD7Yo875D; Sun,  9 Apr 2023 19:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48E3410C2;
	Sun,  9 Apr 2023 19:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48E3410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 970DF1BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69BC981E3A
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69BC981E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGQpd4k_ZsS7 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 19:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE60A81E14
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE60A81E14
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 19:08:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso6893206wmo.0
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 12:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681067335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jrG0FRiHXpjWFQVSwRa0jqI2dcNXzTS3FXNGbqcSSXc=;
 b=pr1eV57yufeulxuOaS6EgdcEY3MkZ7JzW2Aa7OtF9410Evh99qraL//Ut0A482LqA2
 BxgPNLhzPy0YIkV8wUY3cgxsW0XvyEr/fkeGGJD7Ar8I80brVbg19nbAFzgVEt4zOd4f
 R1Yte6qSlhhroT/CfXpU4DkGHCQi/tuymwlzfpwLE3KisBLFA1hyMj7jnzRYZcGDqt3i
 WB+pjihLk04+rGtZ2aOjexIixsBly/LMTRfYSKszSgKFrOElWmnxAB6Iu9AoAPOBf5Ux
 oeEs9cJB/SnwUTXBGJewSr61JCiD1EYQ6+os/qJDdXJKS7Gi2B3PW8XYwTym9EBdqqS1
 PWOQ==
X-Gm-Message-State: AAQBX9dTsjYe9G1GEchQqCIoGDec1vs8q28fegDjpI6NcVZx8l4kDsT6
 LdOsKa8+7L2InfkWfbUcrkDtyQ==
X-Google-Smtp-Source: AKy350bBhVSXOHHNp9WgX/4gIsKgMxMrMUFQW4d/CrTaa8yHC6pTLYD/Er35J4s/+q1pVSud6msdzQ==
X-Received: by 2002:a1c:f303:0:b0:3ed:711c:e8fe with SMTP id
 q3-20020a1cf303000000b003ed711ce8femr6250753wmq.2.1681067335662; 
 Sun, 09 Apr 2023 12:08:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003f080b2f9f4sm5880353wmo.27.2023.04.09.12.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 12:08:55 -0700 (PDT)
Message-ID: <766845f0-429b-6032-200a-3513152bf110@mind.be>
Date: Sun, 9 Apr 2023 21:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>
References: <20230405202149.1411245-1-pevik@seznam.cz>
 <57ffe44f-3428-6c29-5ab9-2bf525ced0b4@mind.be>
 <CAB1t1CxkXFuZ6uN33V-2EvX2EvL=VziwDQ0yq-kRgK5dXD1nPQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CAB1t1CxkXFuZ6uN33V-2EvX2EvL=VziwDQ0yq-kRgK5dXD1nPQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681067335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jrG0FRiHXpjWFQVSwRa0jqI2dcNXzTS3FXNGbqcSSXc=;
 b=PaYlGafGOYS2qImWAWIIOst4AtVEphViInM7z+Sz7U4heBYR1MjNiNEiJFzZ9GaVTM
 vLb7VaD1bFCP1pO+fG9QcpcFy4Vxv9/d8Jq2wuTWnvt2x9s4ttyE2xM1eGsRxnJtLWFE
 aVfOOtsm+5r/4MyG5z0hTT8UQBrJ70ZshRxof+Rmoa01Nweq9UR42aDGO0NkVmT25kdJ
 SH4RRa/IqgWir2efk+RcINEY5QBWyTwJK7uDZCYhwHnpScQKR/bUSl3gJTpxHYcYIdS0
 mwhnPnuBpiRs0MXLI8Yp6MWpDOY288Em1k5LD3zR+PPaZUCU8bGeuNi+WnfttLKwMI9S
 FvfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PaYlGafG
Subject: Re: [Buildroot] [PATCH 1/1] ima-evm-utils: bump version to 1.5
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/04/2023 16:37, Petr Vorel wrote:
> On Sun, 9 Apr 2023 at 16:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
> Hi Arnout,
> 
>>    Subject line should be package/ima-evm-utils: ...
> 
> thanks for correcting me before merge. I'll be careful next time.

  I keep on forgetting myself to add the package/ prefix :-)

  Regards,
  Arnout

> 
> Kind regards,
> Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
