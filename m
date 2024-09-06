Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF611CE7AE0
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 07:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BDD6062D;
	Fri,  6 Sep 2024 07:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdFodOGnUIRo; Fri,  6 Sep 2024 07:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CCD60B8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16CCD60B8F;
	Fri,  6 Sep 2024 07:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B052A1BF5AD
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 07:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E1CF812A4
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 07:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJNdJWkVVFbj for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 07:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AA1A80B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA1A80B3F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AA1A80B3F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 07:32:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42c7b5b2d01so17219425e9.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 00:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725607973; x=1726212773;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wopN3JSNYYrVDoufGVGVthbihOUby6hieAbfsbnbd6A=;
 b=XGZL7ibFcmfkhyTD+CwEw90LpteMrN0OPJu1xKB1m49JU6aBjJB/EqgxdFHYVauQcZ
 vaSHpEjJgLYMo+zTmQpBzOiJC1uqYgen26zR40w42MBA40BIIy64oBA8w7k5L3qrvQC5
 7lA2h8QvLopYRmhCO1GujIbQeS+MBkAqqaddMVvPIuXKmjYBssEkvDxnYKkRul/JqguO
 ccFYDxIfSQHP6iAJOskNVblXkOuryFu/3TQwPTiZ3sKcGIysRNGWjrTolrYKrSqExX41
 fUmrx+zkOqKkPyyCZ6j/ezFZPbRo5r3JMvNMPlQms6nQc/ChzXFT9iXehXiuz9yNkRab
 0i8Q==
X-Gm-Message-State: AOJu0Ywn1jCKHQ7wVR+xoG5GFZ6Utzy8BlwthT8rUC9egfCeUNquq09z
 oLOBqPUE9rrjdUosn3mVJQpi2EeWSBUbhAQe4IuV6rWRjo6oiVz9Xki59A9/M/M=
X-Google-Smtp-Source: AGHT+IFqAg/az7bzfZRtTqz0BlsW5xfQDK+nmqj7E92wUpeAx4jiDQbF4lHzHhFrTA/AO+rYYjRxkw==
X-Received: by 2002:a05:600c:3506:b0:426:6ee7:d594 with SMTP id
 5b1f17b1804b1-42c9f97c854mr13309505e9.7.1725607973447; 
 Fri, 06 Sep 2024 00:32:53 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05d3039sm10964055e9.24.2024.09.06.00.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 00:32:51 -0700 (PDT)
Message-ID: <64bc1313-a569-4f0b-9545-99c222ea45b4@mind.be>
Date: Fri, 6 Sep 2024 09:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240904205354.504964-1-yann.morin.1998@free.fr>
 <20240905213522.2a476624@windsurf> <ZtoM6k0EaDsZa4mV@landeda>
 <20240905221703.2c85a70e@windsurf>
Content-Language: en-GB
In-Reply-To: <20240905221703.2c85a70e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725607973; x=1726212773; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wopN3JSNYYrVDoufGVGVthbihOUby6hieAbfsbnbd6A=;
 b=f1roAgXEbn9upleOyhyNTkJElJZHc6z+7orv9TCRrc5jNK68QuspK6u5RJRlnaHUVj
 DAM7QMtYgh8Vjb9AGfDJ3u88NTZ/KVSgYz9RqM3tczbbFxJ9kld70AxwWEIELxF+mefa
 DHe+BwxXcCSWLqbRhVowqUnAFnLMCRqDEprcXpkJ1msC1lNS1j9KJUR8h02sidwjrapA
 WaxuPTAhWkrPxpEurp2pm5GVZ7V5z9nKyIdlGX8jMYKbSH0VOSsYqYeSQS34oPE3Gryx
 V0gbQfH1ntW+KmjIb/Fuy+UEF5MDE2rqSwQULVNGu97XKUasRRAaEw+fMaJ/99AptTPv
 x3hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f1roAgXE
Subject: Re: [Buildroot] [PATCH v3] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/09/2024 22:17, Thomas Petazzoni wrote:
> On Thu, 5 Sep 2024 21:56:26 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> The thing is that all the other lists are space-separated:
>>      BR2_ROOTFS_DEVICE_TABLE
>>      BR2_ROOTFS_STATIC_DEVICE_TABLE
>>      BR2_TARGET_TZ_ZONELIST
>>      BR2_ROOTFS_USERS_TABLES
>>      BR2_ROOTFS_OVERLAY
>>      BR2_ROOTFS_PRE_BUILD_SCRIPT
>>      BR2_ROOTFS_POST_BUILD_SCRIPT
>>      BR2_ROOTFS_POST_FAKEROOT_SCRIPT
>>      BR2_ROOTFS_POST_IMAGE_SCRIPT
>>
>> The list goes on and on, notably the options to specify the lists of
>> .config fragments for the kernel, uclibc, uboot etc...
> 
> I agree, but these are Buildroot menuconfig options, not something
> passed on the command line.

  Indeed, since you pass it on the command line, you have to quote it to be able 
to use spaces. While in menuconfig, the quoting is added by menuconfig itself.


> That being said, it's a matter of taste, so I will not oppose to the
> change.

  I don't think the comparison with $PATH is very relevant in this case - unlike 
PYTHONPATH or LD_LIBRARY_PATH there is no PATH anywhere in the variable name. So 
I don't think people will automatically make the association with the colon 
separator used in PATH. Thus, I wouldn't say that use colon is the path of least 
surprise. Quite the reverse in fact, because, as Yann said, *everything else* in 
Buildroot is space-separated.

  So I think the proposed situation is fine: documentation says to use spaces 
(like everywhere else in Buildroot), but colons work as well.

  Note that this means that colon is not allowed in BR2_EXTERNAL directory names 
- but that is not so surprising, colons in file/directory names are a problem 
for Make anyway.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
