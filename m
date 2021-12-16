Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEE6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA6B61062;
	Thu, 16 Dec 2021 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3iFRfXi0b5Q; Thu, 16 Dec 2021 20:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEC96105F;
	Thu, 16 Dec 2021 20:31:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA111BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38800417DA
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqXqMB_qdBxQ for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:31:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 097FA417CA
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:31:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g14so90232075edb.8
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uOpDnhfbkRzSoq3HeaPnOKjsaPP6ShvHzWNqqGPdUZs=;
 b=bC9tRptHb7Akx156f5hKD2YAMx13BrCd78+yY+czWaC04IPaUrQNP2Ksrpa97xTHx7
 mq2IWmIRYK/ZcwoPaQF+bPzipKRCbP8Qg4IoaDJYQMVjGsqv0trwSrI+nxuDOB2ucbOi
 uSDb94j38vD1tZiQkeEVux9zg0U2+CchQan+/L2CdWcNGOPxIa2JhO0iLzgmTs3+o2yn
 URa4j0Zr5KrlS00tM2+jeF2S5AkB8MqVHuEzhm/IBlawc0Oe/LzWX5FwWVnysarLS2n7
 97JRWxHs3/50xu+xUSIIg/q0iPny9HFhlPsFLG3/8AFwIU9paf5Jl69+J9Z0PlDjIAhm
 lLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uOpDnhfbkRzSoq3HeaPnOKjsaPP6ShvHzWNqqGPdUZs=;
 b=Ztoror5svs/S/SS3HejiTIIvQCwCVYywdBYPvwPT8S42r9wgKOlkTNAmXElJXQak8I
 FKK8m50fLw1whUFQ5HxJroWxf1JLQE7f5wbt429FAukJOXLofSZ/i3Q38k3sOvh6Vtgb
 GJTeqJB9NJFTMnrfj9xwL5ZOr8hufYruHz3250etnB26mkog1qOBS/qLjXRMJ4iNuYIJ
 fCyAcJPgsS6k80eIBB3DVUiavcwje5gbTbz1aDttHvWmmmh4QsS/siG96BNuWVVcSfD+
 4Fp+SimvJEiG66cf1p7HnKu8dttnlg5gc6RjwEEA754WTzx5tEymAKNSU4WFUfln0mJV
 uuvA==
X-Gm-Message-State: AOAM5330uD1YdaEfQAazCl4JGh/dEQzbyREDZpJjIyDeSnrrsFIB7muv
 Ch+MFxaHjRC4qAEFhizcGsTlvQ==
X-Google-Smtp-Source: ABdhPJz3XWQ1xRYB9YKbugez+Gp0f25zI0nK1NXuWOtWeT6Nmp4yrPPiCI5NPUx+dr8lb5EWXUKQQg==
X-Received: by 2002:a17:907:160e:: with SMTP id
 hb14mr17574983ejc.694.1639686683103; 
 Thu, 16 Dec 2021 12:31:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm2094516ejx.32.2021.12.16.12.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:31:22 -0800 (PST)
Message-ID: <c0ae5edb-ad84-ecc3-8e3e-77e0d11b34e1@mind.be>
Date: Thu, 16 Dec 2021 21:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
Subject: Re: [Buildroot] [PATCH 1/3] package/cross-ldd: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 19:00, Thierry Bultel wrote:
> cross-ldd works just as ldd, but supports
> other architectures. It is needed by dracut, for instance.

  I vaguely remember that at some point we considered adding cross-ldd, but 
instead opted for a different approach. I can't find anything in the archives 
however. Adam, I suspect this must have been for gobject-introspection, do you 
remember anything like that?

> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
>   package/Config.in.host           |  1 +
>   package/cross-ldd/Config.in.host |  5 +++++
>   package/cross-ldd/cross-ldd.mk   | 20 ++++++++++++++++++++
>   3 files changed, 26 insertions(+)
>   create mode 100644 package/cross-ldd/Config.in.host
>   create mode 100644 package/cross-ldd/cross-ldd.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 6e5a5c5fc5..0e8b071a2b 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -12,6 +12,7 @@ menu "Host utilities"
>   	source "package/checksec/Config.in.host"
>   	source "package/cmake/Config.in.host"
>   	source "package/cramfs/Config.in.host"
> +	source "package/cross-ldd/Config.in.host"
>   	source "package/cryptsetup/Config.in.host"
>   	source "package/dbus-python/Config.in.host"
>   	source "package/dfu-util/Config.in.host"
> diff --git a/package/cross-ldd/Config.in.host b/package/cross-ldd/Config.in.host
> new file mode 100644
> index 0000000000..237af701d2
> --- /dev/null
> +++ b/package/cross-ldd/Config.in.host
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_HOST_CROSS_LDD
> +	bool "cross ldd"

  We only add Config.in.host options for tools that are expected to be useful in 
post-install scripts. I don't think that that's the case here though?

> +	help
> +	ldd drop-in replacement for cross-compilation toolchains.
> +	This is the officially supported version mentioned in the dracut documentation
> diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
> new file mode 100644
> index 0000000000..9326a508bb
> --- /dev/null
> +++ b/package/cross-ldd/cross-ldd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# cross-ldd
> +#
> +################################################################################
> +
> +CROSS_LDD_VERSION = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
> +CROSS_LDD_SOURCE = $(CROSS_LDD_VERSION).zip

  AFAICS there's no reason to use a zip file. Just remove this line and the 
EXTRACT_CMDS and it should work as well.


  Regards,
  Arnout

> +CROSS_LDD_SITE = https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/archive
> +
> +define HOST_CROSS_LDD_EXTRACT_CMDS
> +	unzip $(HOST_CROSS_LDD_DL_DIR)/$(CROSS_LDD_SOURCE) -d $(@D)
> +	find $(@D) -name cross-compile-ldd -exec mv {} $(@D) \;
> +endef
> +
> +define HOST_CROSS_LDD_INSTALL_CMDS
> +	install -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd
> +endef
> +
> +$(eval $(host-generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
