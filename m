Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB9C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8920341EB4;
	Fri, 11 Aug 2023 20:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8920341EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhJqBCwyLHKV; Fri, 11 Aug 2023 20:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 714FD41E86;
	Fri, 11 Aug 2023 20:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714FD41E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFD5D1BF228
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A672660D5F
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A672660D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWRYsIeuOtXH for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 20:59:39 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C231B60AEE
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C231B60AEE
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb724cso21670635e9.1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 13:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691787577; x=1692392377;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YQdIhuLHKQHfqcfvCo0qw9Ckdiee/SA8+3Oul8nKOHo=;
 b=Ib3+tYAyvX4S9rjlIxNTm5qV32nWvAfJcmL227srigktcJxK8K+lPCj9qEvQIC3n5P
 DFJ6TyLhAXDWynyOJZlFVPMT+ch5WdpALGGUOHu0ueNMTX1sa/AHfqYo4FFBCHl8kBwL
 25IHxjwN9U/TN6/PUGkXEAl6K4oppYNif6dqIEAvhMn7tB3znqXeNqzFja3TiB2rkaYV
 jKSLLyclSi4/AeyjdTW8OMHUOPezvpolnjxQt0SFKopCrTe6NF9YCfwGOVhqumdDLlHc
 NP+4xaoSECTM/an5ZicI/NecD2lSsXwEEyiXNg8blCPIDJXya0bIbfQ3cOv6xEPIHcKd
 SsZg==
X-Gm-Message-State: AOJu0YyfobxTkvpXevYnxyR+B13DdyMX5XyrAmwPsckDK9HrZY99SyxA
 butde8FKGkUKsvw29wjBi94cHdnhZjTVqg==
X-Google-Smtp-Source: AGHT+IFcLGJtlPwNw6L1t3nddy9YdXKq1E0VBJjT24eZJkzK/mMay17piiqginEGoGUOAxJ/13F74g==
X-Received: by 2002:a05:600c:2301:b0:3fe:1f98:deb7 with SMTP id
 1-20020a05600c230100b003fe1f98deb7mr2487427wmo.35.1691787576610; 
 Fri, 11 Aug 2023 13:59:36 -0700 (PDT)
Received: from ?IPV6:2a01:e34:eca2:2100:1908:92af:1110:d41c?
 ([2a01:e34:eca2:2100:1908:92af:1110:d41c])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003fc06169ab3sm9072035wmi.20.2023.08.11.13.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 13:59:35 -0700 (PDT)
Message-ID: <bf3eb1b7-2bee-4cbe-bc43-49660535c94c@gmail.com>
Date: Fri, 11 Aug 2023 22:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <20230811162546.8088-2-robertoxmed@gmail.com>
 <10318288.nUPlyArG6x@kilian-aisec>
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <10318288.nUPlyArG6x@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691787577; x=1692392377;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YQdIhuLHKQHfqcfvCo0qw9Ckdiee/SA8+3Oul8nKOHo=;
 b=p9VJ2a/74rNpbB0KVxOL/oxJPvtd2SYyAE0GbZh3mG+1Lw4JO8MwahHpyOvc/5WJJn
 ILicdQZyZPJ8MiGiMUq75KornDfhObckbO4nj6ntuOQmRaMjN3SM4E7QgCYIXgwkeGTm
 hAU2oS4h+PkVy5/aYcfDMN5/oPrawnTV5XtrFN3Hsb0VHStgBiqGyIjJ2YAC1SIq8cQO
 QUHnJ8n9msb4e9qd+O4MmwckWwZ5Wmxro2ntoMsVRWWY1efngUlTQOozk+LrziiFdS8Y
 bKG+m+3qVAfp4abeggj1ic7zrdbnt4feOUyLfP+YMwDJykfn86FEo7SQKo7luL0qcvmi
 7FWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p9VJ2a/7
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

Thanks for reviewing as usual.

On 8/11/23 21:02, Kilian Zinnecker wrote:
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 6ffa3ee693..5ebabd01cb 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -2546,6 +2546,10 @@ F:	package/mhz/
>>   N:	Robert Rose <robertroyrose@gmail.com>
>>   F:	package/grpc/
>>
>> +N:	Roberto Medina <robertoxmed@gmail.com>
>> +F:	configs/roc_pc_rk3399_defconfig
>> +F:	board/firefly/roc-rk3399
> 
> I think when it comes to repositories (i.e., board/firefly/roc-rk3399) it is
> best practice to add a trailing space. I guess this way one can easily
> distinguish directories from single files.

Noted for the trailing slash.

>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> 
> I think 2022.04 is actually the current default version of buildroot. So
> unless you have reason to freeze it to this version on purpose (e.g., because
> older and newer versions are known to be not working with this board - which I
> don't believe is the case) you could simply omit these two lines.

Actually in v2 of this patch, Thomas requested to set a fixed version 
for U-Boot (mail from 08/08). Which made sense to me as TFA and Linux 
have a fixed version as well.

Best,
Roberto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
