Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A8BEE6454
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 07:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B124024F;
	Thu, 12 Sep 2024 07:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOr6m1efCAsN; Thu, 12 Sep 2024 07:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 909DB4028C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 909DB4028C;
	Thu, 12 Sep 2024 07:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 017B81BF2F7
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 07:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0FC340C17
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 07:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFYfMMIScAFx for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 07:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FE4240BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE4240BFF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FE4240BFF
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 07:08:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-374bfc395a5so307216f8f.0
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 00:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726124921; x=1726729721;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1o88IDXEDeqOlBenzTne2gPr+9wBQV7A/q51DsLPPk=;
 b=FOSQYx+pD0unvKrfrtvDxu7GOlCDeDPX2BDpN64VAJ8PUMGyC9YPTwDaJiX31YdONX
 CfrGcwOvSoWZim8F1tl7nW1r1gsPGIxngBxJbZa942BLtM1i4dg0LTiNCvCSjwTHqJtR
 WvpN8tYr0FD+vhniAki5aMIhPz8QRHjvdJ00EmhyQOFuyXhF7G+cxgMtv57gbFSGRzAo
 KHRKYnsiUYysImOWML1lvUC5uuI0woBGdoxarB0KWU49p3bK4CwivIUCp717xM7GKcTc
 L37harkM+7MuG2hlB2eVW177wt8wS0HVx38HvcJxTEIpnbEGiL6vqK7jbKrDUda3LDHo
 4sXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFiiV0VDu6/GwayyWiYtS62u2VS0MlLKt/foho1DNc/SoOUc116m8o6k5FBfkItY8Pxix7MR/zNHA=@buildroot.org
X-Gm-Message-State: AOJu0YyIF1va9EQGR/9IO73doHfljlM9ecKEmvoxMFlxFf69w1hUFaMj
 TiTnXltD9hvqpHeAbqaraGr01h++A+GmH/E7xPaag2XrfJC9Nlf1A9DEuDLADGk6QdzG8+RZg3z
 x
X-Google-Smtp-Source: AGHT+IHCtTBHKxyQYSQnRBiKrEM3yQZ9PxhWRGjDOkwuAGar2D6WXiAeto91YK3bTpkUMI/2Ko+FTw==
X-Received: by 2002:a5d:5548:0:b0:374:cd3c:db6d with SMTP id
 ffacd0b85a97d-378a89e647cmr5151390f8f.6.1726124921148; 
 Thu, 12 Sep 2024 00:08:41 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a340sm13476046f8f.24.2024.09.12.00.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 00:08:40 -0700 (PDT)
Message-ID: <47ae0ebb-326b-483d-87ea-3f5230e4ff71@mind.be>
Date: Thu, 12 Sep 2024 09:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Kiagiadakis <george.kiagiadakis@collabora.com>,
 buildroot@buildroot.org
References: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
Content-Language: en-GB
In-Reply-To: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726124921; x=1726729721; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h1o88IDXEDeqOlBenzTne2gPr+9wBQV7A/q51DsLPPk=;
 b=IXLqWWrz1tAPiURi3jsgjjU/fdcI559Yc+e7BRHRnrGXEdsSJkC3vW0TPz5QrMB2Mk
 uVG3bjPJaEef+wdimbjmdLFHE9hWXJSvrwaA0OcmrVpy7yp9rwJEFq1KTepTkfLYQQNi
 gYWQbTxMaYln1kyAyeL/zvZUgADMhA5B8AiGH6SEX7o/bH9BAe+0ErDILO0VxAycouJg
 Nw0n8gZHw2ESRNtXrZztWO/vhsMfGjOHd6Hv86tu962a9qvuWxMny3r99BOmny44tMHH
 ur3soFWuAci8RBzrjOM+/O/n5UhaPiLsE3ENnA7HXgLSfqwPgVQMly8poOvCa9Z+8F46
 3XBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IXLqWWrz
Subject: Re: [Buildroot] [PATCH v2 1/4] package/pipewire: bump version to
 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/08/2024 11:06, George Kiagiadakis wrote:
> Disabled roc & snap dependencies, which don't exist in buildroot.
> Added libselinux dependency option.
> Added missing libglib2 dependency pulled by the bluez plugin.
> 
> Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes since v1:
>    - None
> 
>   package/pipewire/pipewire.hash |  2 +-
>   package/pipewire/pipewire.mk   | 17 +++++++++++++----
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index 3370d86641..8ea3890675 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  2b6e0c4d2e544f5030fa7f4ecf1edd9e5eed15dda1c97135e8a1fded9f3425fe  pipewire-0.3.81.tar.bz2
> +sha256  b3817f7b9abf14a6dbcb6ea18b186ba8771f703cb395e4a38366b4e051c40054  pipewire-1.2.2.tar.bz2
>   sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>   sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index f0f3cd847c..8df2d03758 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PIPEWIRE_VERSION = 0.3.81
> +PIPEWIRE_VERSION = 1.2.2
>   PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>   PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>   PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
> @@ -34,10 +34,12 @@ PIPEWIRE_CONF_OPTS += \
>   	-Dsession-managers=[] \
>   	-Dlegacy-rtkit=false \
>   	-Davb=disabled \
> +	-Droc=disabled \
>   	-Dlibcanberra=disabled \
>   	-Dlibmysofa=disabled \
>   	-Dlibffado=disabled \
> -	-Dflatpak=disabled
> +	-Dflatpak=disabled \
> +	-Dsnap=disabled
>   
>   ifeq ($(BR2_PACKAGE_DBUS),y)
>   PIPEWIRE_CONF_OPTS += -Ddbus=enabled
> @@ -105,9 +107,9 @@ else
>   PIPEWIRE_CONF_OPTS += -Dpipewire-jack=disabled -Djack=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC)$(BR2_PACKAGE_LIBGLIB2),yyy)
>   PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
> -PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
> +PIPEWIRE_DEPENDENCIES += bluez5_utils sbc libglib2
>   ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
>   PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=enabled
>   PIPEWIRE_DEPENDENCIES += modem-manager
> @@ -239,6 +241,13 @@ else
>   PIPEWIRE_CONF_OPTS += -Draop=disabled
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +PIPEWIRE_CONF_OPTS += -Dselinux=enabled
> +PIPEWIRE_DEPENDENCIES += libselinux
> +else
> +PIPEWIRE_CONF_OPTS += -Dselinux=disabled
> +endif
> +
>   define PIPEWIRE_USERS
>   	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
