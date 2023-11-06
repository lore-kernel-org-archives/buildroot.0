Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45935C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE874612A7;
	Mon,  6 Nov 2023 20:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE874612A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SP0JIuZN5_1b; Mon,  6 Nov 2023 20:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B49961223;
	Mon,  6 Nov 2023 20:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B49961223
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED851BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535DE41DBF
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535DE41DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXMzeHwO0Ltb for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:07:48 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2231341DA9
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2231341DA9
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9d242846194so722059466b.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699301266; x=1699906066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXp1it542wR9SMG6HeLfOs7V5HOvh775g0eMYxUKc20=;
 b=s0DGCEYtSLcpGgYDp2GlH1mSczlBJ8WF3nnX9bXvlc8ou3wApIpHcBlNPrvx8GZRUB
 qCQTuWi4a0uRX+0t8KbZRjnurOCssIgYPoPaY++IMiKIOvTO0m/BJsRsOf1mAH6Nm7UX
 aZMUaajLf4nwjpEQy2sQ+3Q1j/1r86vsi/1qnlVaMKWMrppc0TT4aP11cRmUFb02+PZb
 I1EEVnbJXYiD5VtY5GWexnu71P9n194T0LCp8cP5hCx/oS5Zy1gvXdkB2C01qWDPeVkE
 BLOTwbUNzN52MoxPRyL+QNC88q8H4Ryy/TKTKFtcMn0Fy3H8Jm31/7uLTNTn1A5jKsaM
 6y1w==
X-Gm-Message-State: AOJu0Yxf+JqjeQIyzTgLG3UyB3waauGMRWbNRI/h1UBa9p9ReiomOJ2y
 JWzem8WN7nXo8wzNcvuNdAQGJQ==
X-Google-Smtp-Source: AGHT+IHJff+NwyJMIEe0MdAzoI0dY03bstBoxNndsUNV+c0OW9Ro+bzMudlLjKfIQRNXmFZ/enbKHw==
X-Received: by 2002:a17:907:a0e:b0:9bf:b129:5984 with SMTP id
 bb14-20020a1709070a0e00b009bfb1295984mr12959307ejc.77.1699301266048; 
 Mon, 06 Nov 2023 12:07:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a170906084e00b009b8dbdd5203sm201118ejd.107.2023.11.06.12.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 12:07:45 -0800 (PST)
Message-ID: <dcdce00c-b9c7-4c9b-89f0-a3e81cf0f093@mind.be>
Date: Mon, 6 Nov 2023 21:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 hmaied.benabdellatif@etictelecom.com
References: <20231106143037.6900-1-hmaied.benabdellatif@etictelecom.com>
 <20231106203008.0743dabf@windsurf>
In-Reply-To: <20231106203008.0743dabf@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699301266; x=1699906066; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXp1it542wR9SMG6HeLfOs7V5HOvh775g0eMYxUKc20=;
 b=Z56/WkUuyNlu/nEW1bXefhKAzMS9cSyixP/6+BsGBWJkyK6GNUdGwypD8bSlzc0pGN
 I+j/LkdTH+PTQ07skdjkHKIemUcoxqxwaLaazh7GQpkWoEXW3m/msyPE/QVrmdy0pCpV
 vhusbmHU57uj0x+GHRPUqTExz0dsJpI4ohbdqh99OKsYa/x2Jbocsr5oIW7lNN3DzHw3
 chNGk57Oux+eVy0/25VKpOAtTeIUeKQV5h1dwcAZLBFzCFZKVdwlpuGlJb0IaHMzjWVY
 q9rxiB5WSsK9Cz/jDm7zi8qbnwib3CGC1oxnujluJW0knXQ6fRMV35lUR68o1nH8vd/x
 bS9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z56/WkUu
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openldap: bump version to 2.5.16
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
Cc: David Bender <codehero@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/11/2023 20:30, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Mon,  6 Nov 2023 15:30:37 +0100
> hmaied.benabdellatif@etictelecom.com wrote:
> 
>> From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
>>
>> Stripping when cross-compiling and libtool static behavior are fixed in 2.5.16.
> 
> Could you clarify which issues you are talking about here? I don't see
> any build failures of openldap in our autobuilders. Do you have some
> specific Buildroot configurations that are failing? If so, which ones?

  I think Hmaled means that the 0001-fix_cross_strip.patch is no longer needed 
because it was fixed upstream.

  Regards,
  Arnout

> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
