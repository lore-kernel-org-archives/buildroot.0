Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACFC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38596826FB;
	Wed, 27 Jul 2022 15:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38596826FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmF6xdyl630e; Wed, 27 Jul 2022 15:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC0381985;
	Wed, 27 Jul 2022 15:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC0381985
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7B71BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB2724013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2724013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NzZLho_aaUa for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05EE44060E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05EE44060E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:04:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b26so24782016wrc.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dPlUaV5u5TqiiUI/yd+SaLByMFvcos+eUxkwWFwMNrw=;
 b=yFoIz0jH+8yoaxhuL5FF7SEomC3P8e8ovSeWLbmh49iQ62xX4mXhC97ro11qhVF/QN
 l5eCtaApy2abwUrtox3ARdmdMUfjH+xZgCBfyhCPWtfc322kNLEbJ/f54EEUtgrOZflR
 d/s5V87HGkb2Iut9BcaRERDw+MfKGhmuDQTjqBC4XMX+9NH/CzrOAwhh9SM0g59gGzOc
 o/Q/fMrgj5hnOjxrfgR4qFrO6Lx7lPeI+1mvM9rg5eYAHzJBZDCeXxZOXOhXD3nqSMd2
 DQKWN6UDbaSrzBl2lReGMEFujJhSdZG8KZvuz/zw7yFMxud6BfRNJpx+QoVwLjVYJef7
 SEcg==
X-Gm-Message-State: AJIora9Bty02mQSZMD1AxE8C8Z7bn1zPi6CIg4vfyhQU5tN80GTiFZkj
 hwdJHRuZ/6twsu1/tH3hXOM6gQ==
X-Google-Smtp-Source: AGRyM1tt7lvzvTPjFB+wpyAsXZQNSVYBDfP1gu+InER/ZrRHQKZV1vKRgpF00O+/dTYQUscS4sUysw==
X-Received: by 2002:a05:600c:1d92:b0:3a3:2167:b8e5 with SMTP id
 p18-20020a05600c1d9200b003a32167b8e5mr3421813wms.24.1658934257075; 
 Wed, 27 Jul 2022 08:04:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b003a2eacc8179sm2714968wmb.27.2022.07.27.08.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 08:04:16 -0700 (PDT)
Message-ID: <c892c6e0-03d1-e07d-9f46-5c035035f8ea@mind.be>
Date: Wed, 27 Jul 2022 17:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220109221650.777610-1-nolange79@gmail.com>
 <20220109221650.777610-3-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109221650.777610-3-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dPlUaV5u5TqiiUI/yd+SaLByMFvcos+eUxkwWFwMNrw=;
 b=HE1NH33lNkzfjD1Ec6I/3W2BSqs21MuBtKyJ2GDC1fUH76VDWjojURdzLvbSJnPmRo
 Xytmun7ag2Tz7wRVBJB6akJabawyf3/k59IhOnMbVVg4BOqqt0AlaCpSuwF8CwgntDsd
 ADyKC6EN468qVEdzJxHiPPY+YYh7m5cQp4ziJoETuHpLX5Gp+bws3osQBIAV+iOCIWS5
 Ce23Xrel6wt5S/5SuC8u7ok8S0XI52eGqgY5fxq3FKdPwbDsnGsvCYGcyz/35DqCkmYf
 2zXU/t6RtnMrlGn9akVST+2Oe70SE8hS6rDu6htpyTXKElZcAITscW1q7l5/VZeEyHO6
 VDdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HE1NH33l
Subject: Re: [Buildroot] [PATCH v6 3/4] support/testsuite: de-duplicate the
 systemd runtime tests
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 23:16, Norbert Lange wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Of all the systemd init tests, only one does some additional tests, and
> for just this lone wolf, we duplicate the test function.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/init/test_systemd.py | 32 ++++++++--------------
>   1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index f0cc52bac8..80c6776f59 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -21,8 +21,9 @@ class InitSystemSystemdBase(InitSystemBase):
>           # BR2_TARGET_ROOTFS_TAR is not set
>           """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
>   
> -    def check_init(self):
> -        super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
> +    def check_systemd(self, fs):
> +        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
> +        self.check_init("/lib/systemd/systemd")
>   
>           # Test all units are OK
>           output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
> @@ -35,6 +36,9 @@ class InitSystemSystemdBase(InitSystemBase):
>           output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
>           self.assertEqual(len(output), 1)
>   
> +        # Check the network is up
> +        self.check_network("eth0")
> +
>   
>   class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
>       config = InitSystemSystemdBase.config + \
> @@ -46,9 +50,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
>           """.format(infra.filepath("tests/init/systemd-factory"))
>   
>       def test_run(self):
> -        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("squashfs")
>   
>           # This one must be executed on the target, to check that
>           # the factory feature works as expected
> @@ -65,9 +67,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
>           """
>   
>       def test_run(self):
> -        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("ext2")
>   
>   
>   class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
> @@ -80,9 +80,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
>           """
>   
>       def test_run(self):
> -        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("squashfs")
>   
>   
>   class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
> @@ -94,9 +92,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
>           """
>   
>       def test_run(self):
> -        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("ext2")
>   
>   
>   class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
> @@ -125,9 +121,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
>           """
>   
>       def test_run(self):
> -        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("squashfs")
>   
>   
>   class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
> @@ -155,6 +149,4 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
>           """
>   
>       def test_run(self):
> -        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
> -        self.check_init()
> -        self.check_network("eth0")
> +        self.check_systemd("ext2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
