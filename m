Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B38C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1FF811C3;
	Sun, 14 Jul 2024 09:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mxcnYPE0E4L; Sun, 14 Jul 2024 09:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD41811CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD41811CF;
	Sun, 14 Jul 2024 09:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8691BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B25E605F5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYzmT5kZHYKS for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA5EC605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5EC605A9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5EC605A9
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:01:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367963ea053so2766140f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 02:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720947680; x=1721552480;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ll6D04IFkeFDKsZpxF17Bf7X9KELZKuNxW6/o185pj4=;
 b=EecHWKYC0OLXrpyqr3n+twoNStu9dpvz9yxIjxVo8mDMkS66AU67YEvOMuNxfR2niS
 axz78wpc8hkFvNE59eVVffpMQy1wgO5MXU8uSqmayNCyCUxPYb6ERfiIMvDwFu2gDVLn
 GgevN/ZLrM6ghdvYJb0YIKIX5ME8VfGDXvZhtx2eS91ioFjre6Globrq8ni8rutCC4u6
 rkm7hzbLaeN3ajKD3yUzeNJc5D2QSNm4m19Kyud0SDHuVBj5/2Ax7U/6jgfk5JTgmDb8
 qo0hPAY1ZRNQniNwowo5/sWca/mSx5YsbULjuKO8dBBtZm08Bc2O4Zc2gfEmetUXe69N
 aBIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Lv6oFMKRvs4/0EUWdS77MW1aCiQNswsPI3HT3N3y5qls1P72Vx2s6UuC7PuUeLZRniye/ASnvWgUqF8dv7V9/6FHvk1SFA==
X-Gm-Message-State: AOJu0YzDmUKyqe2emEzFky9MFqSp13a7jzpNqI2hjgr7p6M0U/PECC5Y
 X0Vx1al6zIi/09EYh9ToDBA6Ks6p8GAPtQx6SbMLkrBvBIQXYxlY+RSVkG1FkY7GL0eyoR2fa6S
 u6mc=
X-Google-Smtp-Source: AGHT+IG/ieXFVLyBCPyucgmkxZKMiULSG64Zk+cRzvHAxlkgGgXOSIx7Qth7kSh6LTknhBRQOkxnWA==
X-Received: by 2002:a05:6000:154a:b0:366:e9f9:3d1b with SMTP id
 ffacd0b85a97d-367cea46470mr16807398f8f.9.1720947680409; 
 Sun, 14 Jul 2024 02:01:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef44a9sm44709535e9.40.2024.07.14.02.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 02:01:19 -0700 (PDT)
Message-ID: <a9dc034e-0761-4dd2-88b5-6c045d78c379@mind.be>
Date: Sun, 14 Jul 2024 11:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <c69c41c0fbdd9495fef8c5bbfadd7069cd2ff48c.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <c69c41c0fbdd9495fef8c5bbfadd7069cd2ff48c.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720947680; x=1721552480; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ll6D04IFkeFDKsZpxF17Bf7X9KELZKuNxW6/o185pj4=;
 b=OBnNyhqHtWR8QH5rpXFWsJd6DSh4avrPzMjuaamubRgIaqv2Wo543t4GvikdibZ4Pt
 +4sXK7CDEUnsbu6C/TWtZ5CRqmIsaU28/+Jh52Kcq8LMkseGUys4aFJFxfEaf/3oKYX8
 BIJfMWnQKwAsBRWz+ze1XaWaZdbzOIEP5wOji8HpDONjK17f4SqpiqcdL9uTvxeiOXke
 TnOrlNAhsmnHgHiahExGRQ432kxoqd1hKPs9iHjAhB+Xsk7KBHS5ZhhHYKUaLhEMO+2s
 +ZU5PkfRAIzsAXt8wXOnRoJF+H/LkGUaUH6T3pCQ2qZMq3InMctCgl0p9sAfo24SfNg0
 bWjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OBnNyhqH
Subject: Re: [Buildroot] [PATCH 17/20 v2] RFC: package/anvil: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:05, Yann E. MORIN wrote:
> Thie is an RFC, because it has only been build-tested to validate the
> cargo-unlocked case; there has been no runtime test of anvil.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/Config.in       |  1 +
>   package/anvil/Config.in | 20 ++++++++++++++++++++
>   package/anvil/anvil.mk  | 30 ++++++++++++++++++++++++++++++
>   3 files changed, 51 insertions(+)
>   create mode 100644 package/anvil/Config.in
>   create mode 100644 package/anvil/anvil.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bfbec1c21d..3f4fbf0543 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -313,6 +313,7 @@ endmenu
>   menu "Graphic libraries and applications (graphic/text)"
>   
>   comment "Graphic applications"
> +	source "package/anvil/Config.in"
>   	source "package/cage/Config.in"
>   	source "package/cog/Config.in"
>   	source "package/dmenu-wayland/Config.in"
> diff --git a/package/anvil/Config.in b/package/anvil/Config.in
> new file mode 100644
> index 0000000000..eb65a9fb53
> --- /dev/null
> +++ b/package/anvil/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_ANVIL
> +	bool "anvil"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on !BR2_STATIC_LIBS  # wayland
> +	depends on BR2_TOOLCHAIN_HAS_THREADS  # wayland
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_MESA3D_GBM
> +	select BR2_PACKAGE_HOST_RUSTC
> +	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_SEATD
> +	select BR2_PACKAGE_WAYLAND

  I guess it never even was meant to be merged because there's no help text here!

  Regards,
  Arnout

> +
> +comment "anvil needs udev /dev amangement, mesa3d w/ gbm, a toolchain w/ threads, shared libs"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_PACKAGE_HAS_UDEV \
> +		|| !BR2_PACKAGE_MESA3D_GBM
> diff --git a/package/anvil/anvil.mk b/package/anvil/anvil.mk
> new file mode 100644
> index 0000000000..7de9f3e06d
> --- /dev/null
> +++ b/package/anvil/anvil.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# anvil
> +#
> +################################################################################
> +
> +ANVIL_VERSION = fb44b240ea4a3aa39a6b92f5bede23301ab9a26e
> +ANVIL_SITE = https://github.com/Smithay/smithay
> +ANVIL_SITE_METHOD = git
> +
> +# Upstream refuses to lock their package:
> +# https://github.com/Smithay/smithay/issues/496
> +ANVIL_CARGO_LOCKED = NO
> +
> +ANVIL_SUBDIR = anvil
> +
> +ANVIL_DEPENDENCIES = \
> +	libinput \
> +	libxkbcommon \
> +	mesa3d \
> +	pixman \
> +	seatd \
> +	udev \
> +	wayland
> +
> +ifeq ($(BR2_PACKAGE_XWAYLAND),y)
> +ANVIL_DEPENDENCIES += xwayland
> +endif
> +
> +$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
