Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9754E7717D
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 00:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C3460754;
	Tue, 10 Dec 2024 00:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynmAg3G1OAtP; Tue, 10 Dec 2024 00:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663FF6075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663FF6075D;
	Tue, 10 Dec 2024 00:08:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 468D2ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 00:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2490B405F4
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 00:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cN-aUN7FL1X for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 00:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2928340012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2928340012
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2928340012
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 00:08:48 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-841a9366b08so158314039f.1
 for <buildroot@buildroot.org>; Mon, 09 Dec 2024 16:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733789328; x=1734394128;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8EdbrhMKVspFL9G8bXONwyp0X5Kf9mIPjC4UA1PfgM0=;
 b=NcRfVPOgvRY34IqfeS47xZh3oDyQW+i+125J1R+zdwvNgxCXiDD9snI4ef2/VAPMZe
 jUwhUbSokt9ruqywTu0vuv/OJoj+dZ2bcIxtJbw+vOJUbanSrNulRfes+pRB8cEbb35K
 w3goRSagypSi32yBP5QeT1qKXcGEl5fqNna/JOKpF2+ZjDqt5Vx9cODbbCxhq5HbPKKs
 ytKogv6wTkvet3vRwAm2WS/av2WVZkzL/X3I0wloHExcGqn033iJTEw5JHNOmoHOzoLV
 /rZBTtCbwFHRNXXy5f/jnVBcRoOoOzw59Sx6Of+hgEb0YqAYyQC4XoESw4KQMkqFJdhR
 ZPpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX76uZLhqKsUY49v6fByJ/KAavBoSsaDnWqVW7jA4eFOyo2p53VguEMmHh9/diyd/e6KlbE+A9oLmo=@buildroot.org
X-Gm-Message-State: AOJu0YyQsAlMUni3a8iXeH/3Zys8BpDQpKY0e3fEXE02vISGBG+FfYPF
 xKKT/imwnI/brwuVMkpegHmLtxnrRTUlpFzdlQd35Iw3rcTYGMOtBHOCFosJ
X-Gm-Gg: ASbGnctuN9Iz2H8Ukl/cKM6qHz6HvwXaoSPjU5VHQQr8QDl7GO8GgqjWeiYH38NKWJx
 jhLq9Q/BrHLL2OiPdY1sSxAobxBQnuJ4qcIJnSuReiuhuIeHOsMS4EAO6ua6224+H+ljCvFDcpf
 mOqqS2Qq5Iq5vbQLw3wmJENdOS58cIwg9S/cmESy61Vi8PY6Tq3hjjyjF3zcvgFMEG82IcAe/Vj
 j6ET37DNVMvuHAMCc27gHfbvnwtMYfqQ87ddx10aub2RuESGrk0Vd/7rv6yRkse9MsQJWRXZm9q
 BxILw6gT/Uu4XGqzHa9dh397Ctu8
X-Google-Smtp-Source: AGHT+IHUf9FC2jIHi+2Q/jigSwNRK02qkqw6z0Oi4XMXjBrqxl9oi1YRL4V0ubjgMN9+NYnpGd+ZvA==
X-Received: by 2002:a05:6602:9:b0:844:bb0c:b8ab with SMTP id
 ca18e2360f4ac-844bb0cb93dmr103984739f.3.1733789327868; 
 Mon, 09 Dec 2024 16:08:47 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e2c17e5bd3sm727466173.136.2024.12.09.16.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 16:08:46 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 09 Dec 2024 18:08:45 -0600
Message-Id: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, "Robin Jarry" <robin@jarry.cc>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Vincent Jardin" <vjardin@free.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2
References: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
 <20241206213002.24669-1-vjardin@free.fr>
 <20241206213002.24669-3-vjardin@free.fr>
In-Reply-To: <20241206213002.24669-3-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733789328; x=1734394128; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EdbrhMKVspFL9G8bXONwyp0X5Kf9mIPjC4UA1PfgM0=;
 b=Q4YaAzlZ3Qa6HPx1J9vQzFTHvKWpwGltFrIvUUJZKx5XtQw923mTJoxFjtR38ddpYL
 CPQ4clz3fhNsXCL9fLbDgpRjecIeZ+mY+veFOkhcYmWevtlM0h4v4lbLuKsICbrlQNZJ
 rRAYVTLVdTT7bTo2IbpLCneM8bIT0wUQuwnlKXB13ZZibL4fPCy1XJcWMgUj2/oupzA6
 nze2Z+bXwJ/kvcxxEnaivR4HcG0Wm0pO/uCxv8GNI1ksHCFI8pGmkE69faUWvCyKX7WD
 inOElj6eMuA9KETu0f5xkRjNzkxdvc0nPaO7oIA9omKTLtVmZIXJaWqpTpOp4OBOKdAC
 usTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q4YaAzlZ
Subject: Re: [Buildroot] [PATCH v5 2/2]
 doc/manual/adding-packages-meson.adoc: tags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On Fri Dec 6, 2024 at 3:30 PM CST, Vincent Jardin wrote:
> Described the usage of FOO_MESON_INSTALL_TAGS=YES which decreases
> the footprint of the target since only the runtime will be installed.
> All the other development header files or libraries will be installed
> into the staging folder.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Suggested-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  docs/manual/adding-packages-meson.adoc | 5 +++++
>  package/pkg-meson.mk                   | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
> index 01891e03cc..b7c987ddd1 100644
> --- a/docs/manual/adding-packages-meson.adoc
> +++ b/docs/manual/adding-packages-meson.adoc
> @@ -124,6 +124,11 @@ will therefore only use a few of them.
>    +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>    +pkg_config_libdir+.
>
> +* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enable meson's `--runtime` and
> +  `--devel` installation modes for the target and staging folders, respectively.
> +  This configuration is necessary to prevent meson from installing development
> +  artifacts into the target folder.
> +
>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 4568f8690e..a4e77cde42 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -235,7 +235,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
>  		$$(MESON) install -C \
> -		  $$($$(PKG)_SRCDIR)/build $(if $(filter YES,$($(2)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)
> +		  $$($$(PKG)_SRCDIR)/build $$(if $$(filter YES,$$($$(PKG)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)

It looks like these changes accidentally got applied to the
wrong patch.

>  endef
>  endif
>
> @@ -247,7 +247,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
>  		$$(MESON) install -C \
> -		  $$($$(PKG)_SRCDIR)/build $(if $(filter YES,$($(2)_MESON_INSTALL_TAGS)),--tags=runtime)
> +		  $$($$(PKG)_SRCDIR)/build $$(if $$(filter YES,$$($$(PKG)_MESON_INSTALL_TAGS)),--tags=runtime)
>  endef
>  endif
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
