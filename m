Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7583ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4666E40256;
	Sat, 17 Sep 2022 20:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4666E40256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCrA38c_CRMM; Sat, 17 Sep 2022 20:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7837B4016B;
	Sat, 17 Sep 2022 20:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7837B4016B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12BC11BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF47681776
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF47681776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sdBPUTVEdRd for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01C68141F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D01C68141F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:13:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t7so41161113wrm.10
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=z6z6hyMeto4JuZUClURWinZ6XXzjGNg8cvlp1kOyhRA=;
 b=0v7lYRliA4lRfBh+7H2IrTFM+DSCRYcGyLc89CI8LoLG8j5pC8/YrvOW1ypGswOssD
 1oTWGp3c67k4q+7SzKCa+ovdSMVTGQWGOBQTPYioWv4RK4cISFLID17K/6kwUyCfVOzn
 0RVnmF0t4kFhUSzamE0ZLJz+tkL1eJfHbXOwusAk5S3+bvoFgyp/fAZ+Z1+X1VCd6kYD
 2j2D3J6LnbjRyi2QOUh03B1946/YbMXjT6lNWwxl05Ki9HJStkgS5PC4Uqyfz/HS01s7
 0SW0iEtGvHubVLCM4WmuhxPgKF5d/iBoUXTrtJjPItcPpyTcJMmEV5EgmLyE6Dcz6SDi
 E4dw==
X-Gm-Message-State: ACrzQf2yqthA/8iJVZjwZ0y61UkN918QEUf9eBPF2CSsOFas97ZRuCw5
 OZQG4F62ZpN5X6D62X7f8fkUvw==
X-Google-Smtp-Source: AMsMyM6HNmn4i3P4lxsYNo/xXkGYaa1QFddgp+p6WxRazDiWd28o/Bu15bGNW94CKIbKvrQzQwUvpQ==
X-Received: by 2002:a5d:5504:0:b0:228:b90c:e5e0 with SMTP id
 b4-20020a5d5504000000b00228b90ce5e0mr6409868wrv.624.1663445627668; 
 Sat, 17 Sep 2022 13:13:47 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfbb11000000b0022762b0e2a2sm8785696wrg.6.2022.09.17.13.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:13:47 -0700 (PDT)
Message-ID: <f51ade4b-6fca-79af-f936-095dd7bcab2e@mind.be>
Date: Sat, 17 Sep 2022 22:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <446f8241f76f0bb59b032b5368e3028e769830f9.1660931225.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <446f8241f76f0bb59b032b5368e3028e769830f9.1660931225.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=z6z6hyMeto4JuZUClURWinZ6XXzjGNg8cvlp1kOyhRA=;
 b=e1dSqoY8fu/8504A6DZd0n5CbMDh/mXCao3h19ceY1/+JFvOxpihJudFyH5M3nzdhd
 LgZn36idAjw+9kktATWijwesSu/2Ltfpvq1pC2Qd7PILFZDAwar7MUP0q4LY9bOEQTWi
 K/9zNHmN4m6gjaxyQOgbr3sw9PvaKQql2I20WmzsFsVi4AYY7ieIH87/UlhT8l6lNaWp
 S3QcoHqaNaLJ8xzEL4JAxMw41ybXe0ZjIR9CqXrEraWZI0dzn0esTfXhnFLEk4MPKgMC
 GcguE1FGdOwfIb5jUtjHB/8P6L6yGtPba9Xw0F0m+YRn3zXC86vs61ETJM9YjyBMD6YN
 6sSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e1dSqoY8
Subject: Re: [Buildroot] [PATCH 1/4] support/test/cpio: test for pv already
 done by listing the cpio archive
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2022 19:50, Yann E. MORIN wrote:
> Since we do not pivot_root/switch_root from the cpio, whatever we get
> in the rootfs was exactly what we got by listing the cpio archive.
> 
> Drop the test for the presence of pv, it's redundant.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/fs/test_cpio.py | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
> index 3f661e370c..9a529f1edd 100644
> --- a/support/testing/tests/fs/test_cpio.py
> +++ b/support/testing/tests/fs/test_cpio.py
> @@ -57,10 +57,6 @@ class TestCpioDracutBase(infra.basetest.BRTest):
>                                self.builddir)
>           self.assertEqual(exit_code, 0)
>   
> -        # No pivot_root is done, so pv shouldn't be there
> -        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
> -        self.assertNotEqual(exit_code, 0)
> -
>   
>   class TestCpioDracutUclibc(TestCpioDracutBase):
>       config = TestCpioDracutBase.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
