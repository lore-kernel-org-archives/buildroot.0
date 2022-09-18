Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15769C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4B38417B;
	Sun, 18 Sep 2022 10:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4B38417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_kZ6YyafLnG; Sun, 18 Sep 2022 10:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B504584050;
	Sun, 18 Sep 2022 10:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B504584050
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76CD11BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F51A60E3A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F51A60E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQ0PsT1N1QpL for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:24:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D06260E36
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D06260E36
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:24:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 v185-20020a1cacc2000000b003b42e4f278cso2617720wme.5
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q5XsoHrFLKqkKMehHsIcgEiVy9/TcTD4KyORAr7SPbU=;
 b=XPzLWjWW/yL1d8XEFrSDve1gmd0+ka1LqEUzUYtzbL3My8hrf9JemVLryRMz9YbCAK
 XUWypCwW4exyS950XZ+0KOpB7DSJZe/IZ5WWgOSU17gDrV+NNkKlGlj066HG+c60JTJ7
 H0oHW6ubukn4qKq9YC2nNVwEfPR10KKTjxcv/jjzeJt7dSuUTTPFG/fQ/kr6hBKIUNYx
 0xtwoP4uVd29zqtv6suRdMxoR9dA1AHGH/V4sXuiJSG8bvvnkYI7lMqBuVy08gDdanWt
 Z/uWPx38V6T3GUiGhS/c5eyVCRHuhCDhlaw7RFw9im/8nuLXa2nP5JyuDXP3bUwiC3hd
 RgHA==
X-Gm-Message-State: ACrzQf0HI1zGvA+RkdKz2/245xtt0olwNw/gWJBJVADwaF2bFFoludME
 /uG/dG8lnxTkIpky/Trztm5AHKdynlRiK1mnhy4=
X-Google-Smtp-Source: AMsMyM6+u1mbl7YAUD+7cahTs/wGjKXPDEhIpZapwyLagZhFl7N51xPDh8uwSh2Sum6XMbh7t1LYeQ==
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr7434713wmq.193.1663496697686; 
 Sun, 18 Sep 2022 03:24:57 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b003b48dac344esm9285456wmq.43.2022.09.18.03.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 03:24:57 -0700 (PDT)
Message-ID: <7173ba89-de17-4108-89d6-f61af2d2aac1@mind.be>
Date: Sun, 18 Sep 2022 12:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220729000904.1295295-4-joel@jms.id.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=q5XsoHrFLKqkKMehHsIcgEiVy9/TcTD4KyORAr7SPbU=;
 b=ADUncPc0LkG5D+C6HH7mJ4G5ag1k5joGHmQvVDZwBHb346FwLJ8k9rZjDse3RHpc7/
 chXehuTJyR6WVOtTta6pYrEr/mWBYbF90kUs4M6pH5LN0ogk9Zhrcgom2yCM+K2K0UCG
 6AnpMojommy7FQam+vo2EJMs1g3Qc74krX9DU1dwaWvnBiyp0bZLUctRNSKC+fJ1y+/v
 rNgxisjsiRS+82cliuwlik1aBwEMvFBIKi4NdnylLTG7IYE9oq9RuKjAqUxvkcTd7IaJ
 APQi7zFplNeN4LrqTjZHiRerPolegQBBqhQ+K2R1K2PDe+tyWh8qwewVsbOq0zRkVdHB
 PBQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ADUncPc0
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 02:08, Joel Stanley wrote:
> Invalid configurations lead to build failures, such as trying to enable
> ppc64le for the ppc970:
> 
>    http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/
> 
> In order to run a ppc64le userspace a kernel that runs in this mode is
> required. The only CPU supported in buildroot that can boot a ppc64le
> kernel is Power8, so mark all of the other 64-bit capable CPUs as not
> supporting ppc64le.
> 
> This drops the comment about libc, which is true but doesn't tell the
> whole story.

  One more thing: powerpc_generic still has that comment, shouldn't it be 
removed there as well?

  Regards,
  Arnout

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
