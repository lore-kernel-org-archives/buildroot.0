Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE72C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE88C40B63;
	Mon, 20 Jun 2022 19:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE88C40B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhwIYYD4zsYF; Mon, 20 Jun 2022 19:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3C04405B3;
	Mon, 20 Jun 2022 19:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3C04405B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 960BB1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45AF760FEE
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45AF760FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDn8Mkgv1t23 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D428660F71
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D428660F71
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:40:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g26so1705561ejb.5
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RAK9jUIXGkKtW7BDrHMBxxnliKKE+9YJmgMQLyU+cUs=;
 b=dFwzfGPGQC63v7YTpEQwYch4mAzk0fdC6ONK5xdwZ92eBGHE+8guEDvHn6c24yjP9b
 Hgrr7xZrp+tqnhAR4gjWo6ZHZurqKHRiixWk4Gxf/g9K+BnQyWFLeWFBbqRPwfLREac7
 y1TElsJQc1+lntAoVpNQP7wKhGtFjqscSja29Em7sUA3bCOPa5jNxFCTfqAHwK2HPHDl
 Xnp2g4HXuqk467HX95GOQRXKv30V8auGutgGuVsgz8F3VIiQ4JZIeCf6YL+acWOmCsjI
 iKOU0mBK1P0U3Fn4B3krThrC1B4CRbPDU7vx3fInKBQQu8/nkgf+sgF3KE08k3aZCSNk
 l88Q==
X-Gm-Message-State: AJIora8lFiRdPdbx8eVmUMJEHFMeqSeoV0MKSXaDPr86KVcPl3L3Pq6W
 121MaynEA7Dw8Z44oBFtdJ9Tnt1S84/ZqA==
X-Google-Smtp-Source: AGRyM1s/MlaGBMDMX9Dnti2HKXUkI1Ej01M2SHcxI/oVy8Notz0k1FvQh1qV9N2CJCeCuxb4Agrn6Q==
X-Received: by 2002:a17:906:5256:b0:711:ee4d:fbe4 with SMTP id
 y22-20020a170906525600b00711ee4dfbe4mr21315049ejm.312.1655754000908; 
 Mon, 20 Jun 2022 12:40:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090626c300b006fe9e717143sm6330119ejc.94.2022.06.20.12.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:40:00 -0700 (PDT)
Message-ID: <4c9eff36-58b8-c617-b4e9-c52826aeca32@mind.be>
Date: Mon, 20 Jun 2022 21:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20220530151612.3072914-1-thomas.devoogdt@barco.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220530151612.3072914-1-thomas.devoogdt@barco.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RAK9jUIXGkKtW7BDrHMBxxnliKKE+9YJmgMQLyU+cUs=;
 b=ILOpV7S7p6LZ+1bjBv79HBSoOMpAmGyAvOgbyI+3Uhh5GvqhjM7oIiqnAA17OcHiGt
 3P+i2l2/bzeC5tdM7VqIIbVhRQqGrEviQuDUE/1yeTlArcKzaXvElzgg300zQkL8A21E
 DCVHhBn6YqWO2lY2zJAw4ZSzuHfMSQI7ROdz2WQFQD+h6q4VbsUt+MO4ESDK9Ejr9jrZ
 SywtLKYMQZtHdg0YywCI9hmdKbTuqGz8MFJEhwLk2TUisqBE71fnKurls43BpynC5+kn
 eds91lXSSV6RwNBZ5zh+r4P3DiP7uX1w2lJyvlg6Xw80j0KpDWrJpyLmjHQ1Bpa7ojLu
 GmhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ILOpV7S7
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Thomas,

On 30/05/2022 17:16, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> 
> Allow host tools e.g. qemu-img to be built.
> Similar to the BR2_PACKAGE_QEMU_TOOLS option.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
>   package/qemu/Config.in.host | 6 ++++++
>   package/qemu/qemu.mk        | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index f9cdb9b703..2aa6991263 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -102,4 +102,10 @@ config BR2_PACKAGE_HOST_QEMU_USB
>   	help
>   	  Enables USB passthrough support from guest to host.
>   
> +config BR2_PACKAGE_HOST_QEMU_TOOLS
> +	bool "Enable tools"
> +	help
> +	  Say 'y' here to include tools packaged with QEMU
> +	  (e.g. qemu-img).

  For host packages, there's no rootfs size constraint, so there is normally no 
reason to have sub-options. Only if it would dramatically increase the build 
time, it's worth to make an option for this feature.

  In other words: simply do --enable-tools unconditionally.

  Regards,
  Arnout

> +
>   endif
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 1bcffc2340..9623068c93 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -348,6 +348,12 @@ else
>   HOST_QEMU_OPTS += --disable-libusb
>   endif
>   
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_TOOLS),y)
> +HOST_QEMU_OPTS += --enable-tools
> +else
> +HOST_QEMU_OPTS += --disable-tools
> +endif
> +
>   # Override CPP, as it expects to be able to call it like it'd
>   # call the compiler.
>   define HOST_QEMU_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
