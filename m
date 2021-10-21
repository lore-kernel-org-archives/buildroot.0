Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9810DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:53:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F20661037
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F20661037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5DEC4022B;
	Thu, 21 Oct 2021 20:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LC2GC03AEdZJ; Thu, 21 Oct 2021 20:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E34B401AF;
	Thu, 21 Oct 2021 20:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 704671BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5F8401AF
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAYHtMLEn8_3 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:53:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10E5F40186
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:53:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 5so201814edw.7
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7nJO9sLAl4e1QmCyQjREOvUCGOLrMbOgoIwz3VNELIk=;
 b=fTcHCF6Qh2TT4B4vw9HliQFiqZHdE+J6NHKvVRDyC1UOgTxNRuswC4RKoet/a7koVH
 3jVjkN9N6BdSwjdTua7iewN+F0UcaHoKQcxib6rlxruFuEmzck6/bsXvAR22hdi1PWQl
 3xbCQH1XxM5UJcPWu+X/wxN8s2V3ZxrOjto+WUBrQZsDX4bqzy1T5XRGFUoy9TEqd3fs
 1gNAHNdkhwVaCVqzhBH1HrqUlUwBkzCiWw2Rz+xNYTu7hX9YTYbMiY1yLtw6O1bUpgL3
 GUuHN3LZmTjYoCD/gyWBcMLraobmZDmyt12jggpplTdYtXRxOWnPf9ogVOrJ4T1ktvYZ
 eC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7nJO9sLAl4e1QmCyQjREOvUCGOLrMbOgoIwz3VNELIk=;
 b=Ilkxw/zhed1XgM6h7Mz7FSFg9fP/XWTPsNsDIhQ06a19VoLcUKyUWxM067hxMXtN+K
 LiFdkujYtnKPjKiy8MSpcCU4pg4XOOBI5wYyZFgP2TOGTQhgcQjNfxgn34JK9K+aSbfZ
 tJyg6j44lVLw+JDpVlLlztPyekXOKu2wCd7OKNiFnd6XCv4et0BjosBjf94JlZV8Z86i
 32ZmQ1+KUNK7pRN7eZtcAwVbSYP4vSCg3bgE7O2IrvBQcNbJ9y8EH8A5GFjl0QNe50JI
 j0i5/yiSgXTBX8Nd0+EgJycHjzUeYzHUM8DhIVr6keTkVe8yNdwSwljyfWIEWrvgoU0P
 GBkQ==
X-Gm-Message-State: AOAM533QxDKIP4wvtthX11aXPqfPjxI7t+FsFS5dUpy56pM/TNxnBdZz
 lSLe8iFck56/cgfDQavdsEtihA==
X-Google-Smtp-Source: ABdhPJzlMjp8LOghyrpXgavMUAyynfKEyMyQiPz0jpRHj+YMsRrTnTFXtVKI5GiACGQNu7UyNoigSg==
X-Received: by 2002:a17:907:e94:: with SMTP id
 ho20mr10206775ejc.243.1634849617243; 
 Thu, 21 Oct 2021 13:53:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id eg42sm3370053edb.61.2021.10.21.13.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:53:36 -0700 (PDT)
Message-ID: <e71926c6-9b57-d7a8-e0ae-3326a4c79596@mind.be>
Date: Thu, 21 Oct 2021 22:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211012174838.1222576-1-aduskett@gmail.com>
 <20211012174838.1222576-4-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012174838.1222576-4-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/4]
 support/testing/tests/package/test_python_pyndiff: new test
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
 Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 19:48, Adam Duskett wrote:
> A simple test that runs nmap twice to create the files scanme-1.xml and
> scanme2.xml, then runs pyndiff on both files.

  Nice approach!

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   .../tests/package/test_python_pyndiff.py      | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 support/testing/tests/package/test_python_pyndiff.py
> 
> diff --git a/support/testing/tests/package/test_python_pyndiff.py b/support/testing/tests/package/test_python_pyndiff.py
> new file mode 100644
> index 0000000000..86d6c38f8f
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pyndiff.py
> @@ -0,0 +1,29 @@
> +import os
> +import infra.basetest
> +
> +
> +class TestPyNdiff(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_NMAP=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYNDIFF=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        cmd = "nmap -F 127.0.0.1 -oX scanme-1.xml"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "nmap -F 127.0.0.1 -oX scanme-2.xml"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "pyndiff -f1 scanme-1.xml -f2 scanme-2.xml -t txt"
> +        self.assertRunOk(cmd)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
