Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717F0EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 05:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B907A4099A;
	Wed,  5 Jul 2023 05:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B907A4099A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3IAtOmVXuVK; Wed,  5 Jul 2023 05:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D644094E;
	Wed,  5 Jul 2023 05:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D644094E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F7E1BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB4724094E
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB4724094E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVjqyxBIJiM5 for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 05:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7171A40944
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7171A40944
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 05:21:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbac8b01b3so2107215e9.1
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 22:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688534499; x=1691126499;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iPV1AOnL2ns6Jz7nuGZbBfhyqN11q2hlHCZZuHdN1Yo=;
 b=bswhZy9+oL6gK/JiPOmqvDHga8gMhGHUSF7bPmcqzBif2G2lThjjlF4QyPlCnSn0kk
 et+E1w0OHTF0P/MP2hSw8lXiC9Nufylu1PoxM3Zyr6YUVR+Q/GSZkzRN+DyUSZdwoyJ7
 jPr5+yiPy9u9Qo80sAo86YamoZ6zCXsCZJDaErx9M4mowij0kK8Ygt3uuPeUalQAuB7/
 8G0aGtex6XKbV7jYMAmxNtKODGafm9ByUuM7yXXCfAu633kSdPOLZu+46y+pV4jliV9M
 TPHQAfGFm8yZUYyqk4O3xNTUH8GfqLyJKVk9tGwmyqQEoXACP5P3ueHo5iOpefLOIAdr
 Fhhg==
X-Gm-Message-State: ABy/qLYr4QOlgcd22Uub4oMFpx4T4CwZjPGpRuoxOM8HlFsBZ4ngtFk1
 wVeS/+8e12JRPbz+aEI/HVBMTJvwBl0=
X-Google-Smtp-Source: APBJJlEx4IgMT3ta/YwjJ9MABBwbYzp8OHhp222gZsk4DlF9qVO+ipVijzWvFchM5Pd0a1VMdc6PTw==
X-Received: by 2002:a05:600c:314a:b0:3f9:b867:4bb with SMTP id
 h10-20020a05600c314a00b003f9b86704bbmr1076766wmo.2.1688534499068; 
 Tue, 04 Jul 2023 22:21:39 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c220900b003fbdf8292a7sm958699wml.46.2023.07.04.22.21.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 22:21:38 -0700 (PDT)
Message-ID: <be0548f0-8762-0e55-6441-02897a7b22df@gmail.com>
Date: Wed, 5 Jul 2023 06:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688534499; x=1691126499;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPV1AOnL2ns6Jz7nuGZbBfhyqN11q2hlHCZZuHdN1Yo=;
 b=A3zZ3vVyuaAqGd6sBfJSxX54v4qYjgdzTLHpb3ZLQ+m64v+IWJsTYtLqGJyOwHG/OA
 ejATQpAI4iPegHHFRL6z3zP7q7tku7+QHdJkOCm9Vyrjusp5WZRppqofV+OKSOB3PoVZ
 Bhp3kM9Tz3l166d+ukLXRHRb7ZbxnxqTZDeCpLkNfk0fWIs0QNxXRonewv5M6nnrmiwp
 akYTNxmMN7AIt4wh4FmB7Rrdi4UouYFd2NVsO3yZNjTnJTRLzAYF9GdRb2pn0pOk7Tkz
 osk/T/4o7GJZ3aMrklJTHt4knv2xcPExVNvmAytew50Dzl2CGhQrYR1gmmik6v80D8+x
 vm5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=A3zZ3vVy
Subject: [Buildroot] Linux kernel make target
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

Hi,

I'm unable to find an option in menuconfig which allows me to specify a 
kernel target for 'make' - is this possible? In other words, I can see 
how to specify the kernel source location, the defconfig etc, but I also 
need to specify the target - in my case it's 'make nanopi6-images'.

Is there a way to do this?

Thanks,

Nick

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
