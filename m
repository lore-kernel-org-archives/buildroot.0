Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCF2C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B886612AC;
	Mon,  6 Jun 2022 13:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rF4u6dgnL7d; Mon,  6 Jun 2022 13:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6461E612DD;
	Mon,  6 Jun 2022 13:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 185421BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0795E83FA3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDAZL6YkLYBS for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08C0F83F84
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id n28so18731724edb.9
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XmOZ5xMCrn9L9/Bq+JUY+bQdbEMwKGvw4g94ecBLQTA=;
 b=QXggk+tyYiqyTIQuqMXIvFOULbFKgAaOAoiG2qdrh0Beu4FMnNLvaPQaalh1zWpf3r
 zxnPWkvp8gwiV5UxXr0n8fuf9Tz9FKZGnICvPVjykDO4NKbCEaPF4AqAkpat/XaegSVc
 ZmKy1Z+9AbTEKoSiIU79Caai0mrcqIGdYFoPI364rWRRbJvxQ+iPwmlacmRedQ2VqrTY
 BUJFi872aNeEfmvxx/pN1ofIjaqi4e5G7epvvIsRMtOoo/l6ZRMHekokvvaOCCNx/mCr
 pVcOn+9BKlQr5ZVzMxY/HaY6tP6qggptaVomQd4GeOOOsf5zKwwgoEK1zMmMDMAlEjSZ
 aseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XmOZ5xMCrn9L9/Bq+JUY+bQdbEMwKGvw4g94ecBLQTA=;
 b=07rd7LjWddbhifmN8kVrjHcsWNRYhnwDNezvjB3IYc2EDt8Y8KpYyGM1jv7EbKlDU5
 z0a1JCtWlP0IAOEOughLyHcO9kw5RuWr0XvDmEwwbG3yfb9wERsugZGLNJS4RWauKa32
 OhyyNYR0sDV2Y/yxtVwxBvOEnpL/A9FyQvswIP9axI8a9T8RneT5hN7vhpqFHSGfGzc4
 PSBvQe/DsCzBd9V1HPJrJSj9/RpSJK3ktTF6Rg1je/1CbpvMUmT0F6mDLTiYAKtrDFiI
 FmaHzNMHaN8H35Onng7iH7TwwVM8wtqoXRPOmJmosXsu/sigcMSvYdHHMo5Dtxdbe/6Y
 v89w==
X-Gm-Message-State: AOAM531qgqS/2qUHIrGog7wGq7dFar0qQ3w0kyYoN9kqtIKWYlavkg0N
 6bMESDvQT3uLoK07KHGyf0npxw==
X-Google-Smtp-Source: ABdhPJyM/gA1z0OhjwM9sOqoqMCXUFdYcWu5Ia+YgES8fxF5vbkPHLcn6nCy4OpSwS2Kq5YbI2sBLw==
X-Received: by 2002:a05:6402:500a:b0:42d:d109:b7da with SMTP id
 p10-20020a056402500a00b0042dd109b7damr27035626eda.289.1654520616237; 
 Mon, 06 Jun 2022 06:03:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05640234c600b004307c8e1c3fsm4157990edc.34.2022.06.06.06.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:03:35 -0700 (PDT)
Message-ID: <89902d41-5741-34eb-632f-a2379e83897c@mind.be>
Date: Mon, 6 Jun 2022 15:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606121312.592311-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606121312.592311-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix armeb build
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 14:13, Fabrice Fontaine wrote:
> Fix the following armeb build failure raised since at least version
> 6.2.0:
> 
> ERROR: Unknown target name 'armeb-softmmu'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dbd1417fb638ad41e9f23941141bbeb9c999fb05
>   - http://autobuild.buildroot.org/results/a6f97308aa2e634ed3d5b80b33b4663aa16c4693
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qemu/qemu.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 6c69aee7bc..55cd0cd0e0 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -278,6 +278,9 @@ HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pi
>   #       xtensa          xtensa
>   
>   HOST_QEMU_ARCH = $(ARCH)
> +ifeq ($(HOST_QEMU_ARCH),armeb)
> +HOST_QEMU_SYS_ARCH = arm
> +endif
>   ifeq ($(HOST_QEMU_ARCH),i486)
>   HOST_QEMU_ARCH = i386
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
