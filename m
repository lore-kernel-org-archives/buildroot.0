Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61099CD8CB6
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF1236F52D;
	Tue, 10 Oct 2023 20:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF1236F52D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrcO7yYZdbUR; Tue, 10 Oct 2023 20:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85E061446;
	Tue, 10 Oct 2023 20:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85E061446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2301BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25AC980F26
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AC980F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhO363bMkQZ5 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:36:10 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D62DD80C67
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62DD80C67
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so786596666b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696970168; x=1697574968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3cmCRfz19v94HZ3guHfV0g3UKm3MMwAh52LafBGRoU=;
 b=ZWhdsyAwTxtT7/zMVdvB5BzHXUIgVdzV9TJ4AEUjtoEdV4PcGlqjlYjiVmVe1FvN2+
 zxTzQnatvcBxAbrxZLFpO7xDUHZeSVnd0U3hfv+F4ZJrIPEpiNMyToZtOS3HNIqkeEb7
 8HRW5ZZF2CYZvPP9SJbARI4KECPz9EJRbsS+U3TGz0uN6ugzzrcvWW+RcJrqGZzubFvh
 vCj2Y9l7NAdgWzp8G8whaoomlFl9wquV6fpuR5oDHRjKyphuJsre7j0gg8pf3GIbnsxa
 yBFGJ+VuH3qKY2JQuJfTTwMqVyOl1r6TaDDeaN7v2TYHjtSS5k8CAq5B5xMFgX83nn6M
 IPWw==
X-Gm-Message-State: AOJu0Yy6J/k5BAK/iUOZt1pALAr6g+XPO6ZL7uPG5MsIW4JnWQ/Ad4k/
 +X4qBzDeo7bBJHNqdqf62sYj/g==
X-Google-Smtp-Source: AGHT+IH/yVWUUCAQgqRCT/ATxkZY8SVVNcDoPip9t1vH0Xg58LbKZME2bsc2Z+Nb6YcEoFUZAn4j4A==
X-Received: by 2002:a17:906:32c8:b0:9a1:abae:8d30 with SMTP id
 k8-20020a17090632c800b009a1abae8d30mr15719207ejk.47.1696970167809; 
 Tue, 10 Oct 2023 13:36:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lz11-20020a170906fb0b00b009b97521b58bsm8919643ejb.39.2023.10.10.13.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:36:07 -0700 (PDT)
Message-ID: <a525a75f-1f83-bbb3-3ec4-214f3b9c69fd@mind.be>
Date: Tue, 10 Oct 2023 22:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115125253.280257-1-nolange79@gmail.com>
 <20230115125253.280257-8-nolange79@gmail.com>
In-Reply-To: <20230115125253.280257-8-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696970168; x=1697574968; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3cmCRfz19v94HZ3guHfV0g3UKm3MMwAh52LafBGRoU=;
 b=dC2iBZ/q8Cy2hQags0yDGw2aujE94mjHPd1oZagHBJrdwhcEohkMzG48Tv7rQho40m
 DY52k7K47yNQS/j9FQC4BoLfb4kKMdVgAA7fdsX0+ONezRtpf0+RtMt9E7tj5UGdhIcD
 n5nwWIHwpinNkqxN0BoDYNqx66wFOcIzjqL2cnMy0MgrXQdSPRSgfsB4CbMVOeeisaf+
 8K663RkuxBmV1irIasYW9VPlPsW7Kw8FUsAUAw2ka6nV+Q1OgQJDktOT/5IJzyJouUXd
 HwfUpF95t+r3fRPUilcK2hWDYyhdDRb/toq/LHIRdfLTKlvi3IcMkIV/xb1dLq1cENQL
 1c/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dC2iBZ/q
Subject: Re: [Buildroot] [PATCH 7/7] package/systemd: create the /boot
 directory
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 13:52, Norbert Lange wrote:
> The gpt-auto-generator can generate the boot.mount unit, and
> report an error if this directory cant be created (read-only fs).
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/systemd/systemd.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 420197005c..0074fa8791 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -603,6 +603,7 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
>   endef
>   
>   define SYSTEMD_PERMISSIONS
> +	/boot d 700 0 0 - - - - -
>   	/var/spool d 755 0 0 - - - - -
>   	/var/lib d 755 0 0 - - - - -
>   	/var/lib/private d 700 0 0 - - - - -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
