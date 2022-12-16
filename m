Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2358BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 869516110F;
	Fri, 16 Dec 2022 09:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 869516110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThO1CZ03Yq3x; Fri, 16 Dec 2022 09:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFDB561113;
	Fri, 16 Dec 2022 09:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFDB561113
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C383A1BF30B
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 09:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B368215F
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 09:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B368215F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glmGNipPBS6x for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 09:42:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1BAD8213B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1BAD8213B
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 09:42:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h11so1865202wrw.13
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 01:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJdeNgHt1glHtH0rBYnCrTMYB6c3SqIeTTsB+tpWiTQ=;
 b=ivpGZ7YrnbMDZnVkWNEO8Upgr1rx6usYzdG04vUrk2/W+olyQFMJe96SPwvTT4OhgP
 kHhOOzGa5bbXp5PVTeLzbQxo2/BXlq+sjDzQe9N2/0SYKwJ92j0k7f866AiNu/aFG97d
 RxK1hMIkxIsKGgfYXwwZhgi1WSc0bKx3Ob3MqIUtG388wxwNvVvvqXP1rjBZ2xk8tDnz
 O3mnF8LTzTaKfx82J4jnYWdIzT6JnFGPdYWQ3MvH4354hVzesgm/hEGW80XfR13SIrzA
 ubRQuAfqOY/uKEqUoHWGhPhtDJDIUwtR+dcng5/I1cSuaWpoH7HbLL68A52tCJVba35d
 nZzQ==
X-Gm-Message-State: ANoB5pmX8M7FLpYCEgQ8U83HvDzYxptYf5TsYlawCLlF+XL5prKQxSjM
 FhzdUcr1+1vWJy2e2/IZNIWUzq3hp6H9yA==
X-Google-Smtp-Source: AA0mqf52IdCzp9Vqsy5AtYRhBu45rHDzvhXthogGn3HyMyQrDBoBoZ9ZAMpItKbKWRBU98Aw/eb3gg==
X-Received: by 2002:a5d:55c7:0:b0:242:bef:809e with SMTP id
 i7-20020a5d55c7000000b002420bef809emr18736374wrw.1.1671183722807; 
 Fri, 16 Dec 2022 01:42:02 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a056000170b00b0024258722a7fsm1861370wrc.37.2022.12.16.01.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 01:42:02 -0800 (PST)
Message-ID: <41c39dcc-95c8-d949-9fe1-f53882e680ac@gmail.com>
Date: Fri, 16 Dec 2022 10:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Nicolas Carrier <Nicolas.Carrier@orolia.com>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
 <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
 <AS4P251MB0612D4DF753A307318923B9A841C9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <20221210082857.GP2855@scaer>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20221210082857.GP2855@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJdeNgHt1glHtH0rBYnCrTMYB6c3SqIeTTsB+tpWiTQ=;
 b=C15iHGnrRmlHhutY/ukPKOrzRnWFqDme73w8RgCfL3zwPU7qneStTL/Ibl2UFyNeoF
 VyS8IECQccRH4upaPGYujRnYtngI2AL9bU5rICfZhCZCFNAaCiQ49Q/EG8H9m8Pqtv+x
 MrWFfaMh8zOwv1+T5Mpv11wOLnm/9n62SK1JmgslRs6rEH8pBpiiiqBRlC8XsxvCymyo
 EFd+gsgomUnIFXGzuevYLa52ZiQoxbKfIHQKHOU3urOWnyE47XrT7iRqJ9mU9Csl3Qft
 eybqgrrvb+tYfQBpA5YTmOsUd1aRJ9gGbSE/bFlOSNGm18BAl1w0YaXosk+ANt7ZMCpV
 P1cQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C15iHGnr
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,
I added your test and executed it, but I got an error:

======================================================================
FAIL: test_usermod (tests.package.test_shadow.TestShadow)
----------------------------------------------------------------------
Traceback (most recent call last):
   File "/tmp/buildroot/support/testing/tests/package/test_shadow.py", 
line 53, in test_usermod
     self.assertRunOk(f'test $(su {username} -c "echo $HOME") = {new_home}')
   File "/tmp/buildroot/support/testing/infra/basetest.py", line 94, in 
assertRunOk
     self.assertEqual(exit_code, 0)
AssertionError: 1 != 0


I used the following command:
./support/testing/run-tests -d dl -o output_folder -k 
tests.package.test_shadow.TestShadow

Did I something wrong?


Regards,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
