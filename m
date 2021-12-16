Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F65FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEBA83F6F;
	Thu, 16 Dec 2021 20:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QG0MphoRhdpz; Thu, 16 Dec 2021 20:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942FE83F7B;
	Thu, 16 Dec 2021 20:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C37D51BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2E246105F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0o8P7PvK-yAm for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A6826105A
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:35:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z9so17582edb.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HRlnZgdzkyWirWgg6UuW7QgOg7QbEeK4RMxHinlOJhw=;
 b=dj2EyC0zUNwoihWgSEKWVVKPKIKaJ8RnbeJrzHiCkzkUtO/4CxUulpmqDfAuiI9azD
 JtxdaPrxBk8bh8f2w1LyH+xNd9VYZnGDMXnJ4AlZCped56dAmqtOt9Ev3weRlDWa1YaG
 p10im8izopB2tBWpbyz11p36Pu7HP/mG5RPu4U7OVDdcRcvGmkRExz8awkTaeqvDLkCc
 0SfB7DgtKEkUs25uIyUBOyJ6hCShnrFnDir01PL5TWOYvWp69xq0LpY1GMEFZts4FvmA
 oR9bJVLlNdESsXXQj4oQd3xz2vHG9wzPiF4RHSf07BTXT4+EABtBf34Iw8WZbY8lYEXs
 N4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HRlnZgdzkyWirWgg6UuW7QgOg7QbEeK4RMxHinlOJhw=;
 b=YqK1BA35Ha8Kek7K2kLM2N9KqRI5WQWhYGL0e1LbEr6MeUr7qZUJpsviOz3Wrh4bdf
 xdpD1uZHdHwWuIYwB2RUK9t9mPBLLcWuw1ktNS2gaxwzx6gvHCwYsuyo21NYWT1JvOzH
 H3LvOUQz9LrCWtZPDk2O1m4eXpP2qWsaHCKPx8FfVj0tzsWKWKbOPQhWrj8ZHxe5Eyp1
 UYYaL296HrbEK9cXSLE4N25QzcgVtKIXPmTwjX4VIu9fwblnYDAOXDLd7vgUZMgOj3sF
 jgpw1CdctzW1j8bFje3nl+KYrd7QcyFxBULjgFTVTmrFYFJa7VsWtiR6U2VbyqIkcIMe
 zQrw==
X-Gm-Message-State: AOAM533AcpCexv5edW0Fn+IrWCQnQbWTWQ9gA5FrkXEFL78ovMDObx5g
 c0RpnoiJYg6Dg7J3P+q/DB/hHA==
X-Google-Smtp-Source: ABdhPJw1C8/iYZn+zfkNs/OJtWLE5aJdNsE2GBFte8CZcHrKeUU3MsOWSKVctAATeFal6ymFCSAFoA==
X-Received: by 2002:a05:6402:c08:: with SMTP id
 co8mr10593494edb.53.1639686945826; 
 Thu, 16 Dec 2021 12:35:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mr38sm1620948ejc.109.2021.12.16.12.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:35:45 -0800 (PST)
Message-ID: <3fbde65b-853a-ae70-1962-32ebbd1cc616@mind.be>
Date: Thu, 16 Dec 2021 21:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-2-thierry.bultel@linatsea.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215180021.274991-2-thierry.bultel@linatsea.fr>
Subject: Re: [Buildroot] [PATCH 2/3] package/dracut: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 19:00, Thierry Bultel wrote:
> dracut is the tool used by desktop distributions to
> build initrds. In the embedded world, it can be
> very usefull, too, for instance when wanting to
> create an initramfs for a system recovery mode.
> Whereas it is definitively possible to achieve
> this with buildroot, the process is to have a
> dedicated buildroot configuration for that,
> and perform a full build. Instead of doing that,
> the idea is to use dracut to pick the needed
> binaries/shared libraries, configuration files,
> or kernel modules from the 'target' directory.
> The advantage is to save build time, and also
> to have a consistency between the packages versions
> taken for the recovery and the production filesystem.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
>   package/Config.in.host        |  1 +
>   package/dracut/Config.in.host |  8 ++++++++
>   package/dracut/dracut.mk      | 22 ++++++++++++++++++++++
>   3 files changed, 31 insertions(+)
>   create mode 100644 package/dracut/Config.in.host
>   create mode 100644 package/dracut/dracut.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 0e8b071a2b..42f671a78f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -15,6 +15,7 @@ menu "Host utilities"
>   	source "package/cross-ldd/Config.in.host"
>   	source "package/cryptsetup/Config.in.host"
>   	source "package/dbus-python/Config.in.host"
> +	source "package/dracut/Config.in.host"
>   	source "package/dfu-util/Config.in.host"
>   	source "package/dos2unix/Config.in.host"
>   	source "package/dosfstools/Config.in.host"
> diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
> new file mode 100644
> index 0000000000..8ed41d3719
> --- /dev/null
> +++ b/package/dracut/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_DRACUT
> +	bool "host dracut"

  Contrary to cross-ldd, I *do* think that it's useful to have a Config.in.host 
for host-dracut, because that is indeed a tool you'd use in post-image scripts.
Even if there's a dracut fs, there are probably still use cases not covered by 
it so it's useful standalone as well.

> +	select BR2_PACKAGE_HOST_KMOD
> +	select BR2_PACKAGE_HOST_CROSS_LDD
> +	help
> +	dracut is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework.

  Wrapping is not correct here. Please use utils/check-package before submitting.

> +
> +	https://dracut.wiki.kernel.org
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> new file mode 100644
> index 0000000000..8de89603a5
> --- /dev/null
> +++ b/package/dracut/dracut.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# dracut
> +#
> +################################################################################
> +
> +DRACUT_VERSION = 055
> +DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
> +DRACUT_SITE = https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut

  Use BR2_KERNEL_MIRROR instead (at least, I think that should work, right?)

  Regards,
  Arnout

> +DRACUT_LICENSE = GPL-2.0
> +DRACUT_LICENSE_FILES = COPYING
> +
> +HOST_DRACUT_DEPENDENCIES += host-pkgconf host-kmod host-cross-ldd
> +
> +define HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
> +	$(SED) '/unset LD_LIBRARY_PATH/d' $(HOST_DIR)/bin/dracut
> +	$(SED) '/unset LD_PRELOAD/d' $(HOST_DIR)/bin/dracut
> +endef
> +
> +HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
> +
> +$(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
