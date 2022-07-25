Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A921A400EF;
	Mon, 25 Jul 2022 19:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A921A400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wf6h9CC_pK2l; Mon, 25 Jul 2022 19:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA944012B;
	Mon, 25 Jul 2022 19:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA944012B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89D931BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B23283122
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B23283122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7zkDvvk7I2d for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A9578305C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A9578305C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:46:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z13so17435752wro.13
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=opf5/pACOO4aohl4Epr6UazUvzh5Z0w4glYQSGjrSNc=;
 b=nueyQjswpsgZkYXULvMZute/0y4o5fAVJkvcRcYRqOpkfZiawPSeo7niS8YdeZUUnX
 F0oBIgDbS+c5DdOaWRRIcNAs5ucQrcT1kbH0kBOuV+xNt24hZLyRlKq/ytCBIfY2zKe2
 n22G6x4C4MI0rMeg8rq5IyLcZM91PYNz35ZsEa8QYk9b0Q2s9vNGbFX+2uS8is+QdClR
 f9bFNfXFPorTOOqRy2JHlMGK4xoD5/L8fUPSfKo7t2ooSxmfV7ph5P5Xy02J6uyR9Mmg
 LJ9OQkr/w9074sWdykiLnhXE9H6nAx2aYcpkbyXyzAmHa9+nOslloHJ25pRxK/nc5MQF
 hIhg==
X-Gm-Message-State: AJIora/0hnBcmzRYB+7fcq3dbcOI0O0NLTyz4i6CNCqAaoZLEmVIEgiY
 vyc03qb3r8J0nxBZjeIxWEYJjA==
X-Google-Smtp-Source: AGRyM1sJoRag+CbV7XvcsYjSTnF9ejtN1EqMOinP4tNB8mVp/2xBj+AJbODCiyNj/fuirMRmZwm2Lw==
X-Received: by 2002:adf:e2c8:0:b0:21e:74d2:b3e5 with SMTP id
 d8-20020adfe2c8000000b0021e74d2b3e5mr6787465wrj.630.1658778407409; 
 Mon, 25 Jul 2022 12:46:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d4486000000b0021e47fb24a2sm12723789wrq.19.2022.07.25.12.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 12:46:46 -0700 (PDT)
Message-ID: <442218f4-71ee-da50-a695-640b4d675ef7@mind.be>
Date: Mon, 25 Jul 2022 21:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
 <20211110190005.GN2084998@scaer> <20211112233603.274a7af2@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211112233603.274a7af2@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=opf5/pACOO4aohl4Epr6UazUvzh5Z0w4glYQSGjrSNc=;
 b=EeruZtpVmRdBsr53wCCFP3V5IMb2OPqZ68CvbCH5O3HJdfq+/iSBy5EG8i9m383BWP
 gIokztCh23Ec1KxcXoKb2WKYgu4PgQ4b/BQqKWHLeXIt5bVUbgVPsB/drZZrC171GHFt
 lpA+ARoW4PtoqGFflIEFAJXoQ2oarpRwjx5SDREPRk6dSdCk0xlHeamt3MRTeb7DXjcS
 Wrdckpy9xBYesqCwyT05eawRHxPsaAwQN0yBA+RlD9iVEkGMQINqzLZqM/NPb102RX0M
 Dwc9TcKrpdIVmjbV9dP1AAjwmtpA5U4mct8t0JZLaaXRT+mLi5slLFLuuGW8jHHUrEA3
 L5CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EeruZtpV
Subject: Re: [Buildroot] [PATCH] fs: allow strip binaries when create rootfs
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
Cc: Tan Xiaofan <xfan1024@live.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2021 23:36, Thomas Petazzoni wrote:
> On Wed, 10 Nov 2021 20:00:05 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> This is a simple approach to the problem, indeed. However, I think the
>> choice is not needed: just keep the boolean option, and move the whole
>> stripping out of target-finalize and into the fs creation step.

  We all agree that something needs to be done about the fact that you only have 
unstripped programs in the build directory...

>>
>> Thoughts?
> 
> I'm not sure about this change. I understand that's it's an easy way to
> have all binaries unstripped on the build machine, while having them
> stripped on the target.
> 
> However, it makes $(TARGET_DIR) move further away from what will
> actually end up on the target. I tend (and I guess a number of users as
> well) to look at $(O)/target to see what my root filesystem looks like,
> what it contains, etc. So all the post-processing steps that we add in
> the root filesystem generation logic kind of "hides" this
> post-processing from the eyes of the person looking at $(O)/target.
> 
> Furthermore, I believe this change is going to break "make size-stats",
> because make size-stats looks at the size of files installed in
> $(O)/target.

  ... but this is really a showstopper for the approach of this patch.

  Therefore, I marked it as Rejected.


> I think the long term idea instead was to install all packages to
> STAGING_DIR, so that we have an unstripped installation of all packages.

  That is really the way to go, but someone needs to work on it...

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
