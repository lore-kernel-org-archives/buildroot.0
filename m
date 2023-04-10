Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A60AC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 14:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C394181F0D;
	Mon, 10 Apr 2023 14:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C394181F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_PEzN_z6mwb; Mon, 10 Apr 2023 14:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD05581F0E;
	Mon, 10 Apr 2023 14:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD05581F0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF921C3B71
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258D161156
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 14:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258D161156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHphbOI1Gp8v for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 14:57:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFD460757
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFFD460757
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 14:57:53 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ud9so12883951ejc.7
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 07:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681138671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEuXLETHw62pnraz7xNg+zW3A6a+kEKHR1S6uNSieo8=;
 b=7+1ddfrK4T1SS/R63xQbQFWsXi0a7P7lQJXmd4tZkd2MZ7lOWgmsCkyP0yN3BYCIk4
 i1N4Zj+j8JY3oBvmn+Xo4u2YLC+Ij0t4RTqn+WbcEJCe9awRybHUYlD0Zo+vAmKmjnPq
 BHcIOvqW/7gfW/xMjfhSIKRHdI8Dz83s6JhctUkkeNhT+lcWT3qQRK2LMSxQTeAlBJUl
 NkgTStMwy7jVQbjXexc0FP4uRL1I2M4R8ddOqYnQTUWKXIhfEgx4B1dSbPVK8wzkZJ75
 Fnm8IDAOxY1LBNsl4Wdy7rbdMNAcS8vnCWhaGFX74HiuZ9o6y4TUzlh1i4gXYhdq7p0B
 KdHg==
X-Gm-Message-State: AAQBX9d7tiBlfeKrDXGTnwvYvN3eS/4HfIZldWwW1RcSylbqsUwCq/0J
 QqJR9awmYm45GuRS2Rowszoa6g==
X-Google-Smtp-Source: AKy350ZcEJ27Rv2CwMMe7dswWZ56hyOU1EIaJP6ztHyLQN2hjTuu4h46xXSm1DfX6VtNE/avXojRkQ==
X-Received: by 2002:a17:907:7b9f:b0:94a:5d8e:ddbf with SMTP id
 ne31-20020a1709077b9f00b0094a5d8eddbfmr6384673ejc.14.1681138671552; 
 Mon, 10 Apr 2023 07:57:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lx11-20020a170906af0b00b0094d0f572571sm266941ejb.128.2023.04.10.07.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 07:57:50 -0700 (PDT)
Message-ID: <2e28cd63-1af2-cfc0-fe46-32ec6d6954df@mind.be>
Date: Mon, 10 Apr 2023 16:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: unixmania@gmail.com, buildroot@buildroot.org
References: <20230409000929.391071-1-unixmania@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230409000929.391071-1-unixmania@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681138671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LEuXLETHw62pnraz7xNg+zW3A6a+kEKHR1S6uNSieo8=;
 b=Ps1AwBxmKSEblYVD2/8ENxBy1KP5PJmulBIfN9fPOjkwT3GvV+nSakbXE/SYygqW6j
 113hO4LxharwEsP4AfooJcotZSTz3pUO8H5cDcogFVBOZkc8HC0+OAyrsZyPRpksxuZt
 NbT0qiMbcksRvbj7tP1tz5MQYK3aAIlV3LvIxT2TvyxL2bs1FUjnIg1tq63Hj08XpOah
 6OSNUQuoJXWweRpORU8cY+HU4uaAfYezHYlchzS2rI5bGycJtUPpd88F3kgXl6xUQHbY
 x5fM4CWXEXcexWYURnje9Mopr76Z4bGiToc1aUxoJdGIcTSq3m2nM+DRWEQYOf5kn6eV
 c5aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ps1AwBxm
Subject: Re: [Buildroot] [PATCH] package/qemu: install keyboard maps only if
 necessary
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

  Hi Carlos,

On 09/04/2023 02:09, unixmania@gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> They are required only for system emulation, so pull a patch already
> reviewd upstream[1,2] that makes the installation conditional.
> 
> 1. https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06428.html
> 2. https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06438.html
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>   ...tall-keyboard-maps-only-if-necessary.patch | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch
> 
> diff --git a/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch
> new file mode 100644
> index 0000000000..91ea1e86c9
> --- /dev/null
> +++ b/package/qemu/0004-meson-install-keyboard-maps-only-if-necessary.patch
> @@ -0,0 +1,36 @@
> +From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@redhat.com>
> +Date: Sun, 1 Jan 2023 21:00:57 -0300
> +Subject: [PATCH] meson: install keyboard maps only if necessary
> +
> +They are required only for system emulation (i.e. have_system is true).
> +
> +Signed-off-by: Carlos Santos <casantos@redhat.com>

  We need the SoB for unixmania@gmail.com on this. The SoB is a short way for 
you (the private person, not the Redhat employee) to assert that you are 
entitled to contribute the patch under qemu's license.

  Also, please link to the upstream patchwork entry here, like this:

Upstream: 
https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/


  Regards,
  Arnout

> +---
> + pc-bios/keymaps/meson.build | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> +index 158a3b410c..bff3083313 100644
> +--- a/pc-bios/keymaps/meson.build
> ++++ b/pc-bios/keymaps/meson.build
> +@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
> +                        build_by_default: true,
> +                        output: km,
> +                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
> +-                       install: true,
> ++                       install: have_system,
> +                        install_dir: qemu_datadir / 'keymaps')
> +   endforeach
> +
> +@@ -56,4 +56,6 @@ else
> +   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
> + endif
> +
> +-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> ++if have_system
> ++  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> ++endif
> +--
> +2.31.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
