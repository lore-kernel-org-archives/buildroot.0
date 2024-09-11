Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CBAEE499C
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89EF408E2;
	Wed, 11 Sep 2024 19:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoWh5K3SfbbN; Wed, 11 Sep 2024 19:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEB740902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEB740902;
	Wed, 11 Sep 2024 19:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61D4A1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5004E40902
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJkY0-DVUVOv for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AECD6408E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECD6408E2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AECD6408E2
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:28:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so954975e9.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726082915; x=1726687715;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tfG3FEqW3SrkpTBv4U0AqB/Wt5EVXXhz+6QeY1Ss1qk=;
 b=EI3els7XoxuqNJT/roaZv8F8nSKo7WOBA2OiTM/KthdQ1m/vApCn62hazTp2oFQvfO
 DiXWUMqoUsGBuEI6WQCqPrhjA/Otsq8CmTQGNbZ6NSVBf7J2DfKoY7fXKkfX6W4+RXMO
 rnbsgOm6gdri6oEuIBb5ZVcl9/5QEJaeN+oonynEopr/E55SPYNl6JsgGmBKoYSu6ZjE
 uRlPmBNINluqlNyqMML78oft5Qim6iIcXSX+kcsrbEBXNRATEOpHqlNH21eReCWyy+CM
 HEmHNv8DrrL9UmiBdT3Fc3ntiOVwIJTvyj0MvZ28+n2yJDi4eGizaPiByzo/9QcsXAe8
 Oaaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+TlXEduHdwWOeAATPt4abXwZSRkMrj67KwDtVNHGUI2ag34+8mdo4rBzQswDHSNE/uGFOPmoDe4U=@buildroot.org
X-Gm-Message-State: AOJu0YzIf4SOuuNjqAT1Utajh8Rx2Vini/APJBDHmFIFyimCPgAZxHo1
 YPWXP/4nIzn/5nCca1dGm3wkUAJRVOVJ331M/C+ZfaS4eVufJX6OOlna+wH52a8=
X-Google-Smtp-Source: AGHT+IEc/08dzJCc/XNum9mEKrwYl2x+6j2BWx+zBDwZ9s3aTml4CDm5hTbDQ9vKNylky6EgUmcTzQ==
X-Received: by 2002:a05:600c:1992:b0:42c:b197:96d8 with SMTP id
 5b1f17b1804b1-42cdb511fdbmr4392075e9.5.1726082915224; 
 Wed, 11 Sep 2024 12:28:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc1375189sm62486485e9.1.2024.09.11.12.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 12:28:34 -0700 (PDT)
Message-ID: <3ce45583-973c-4504-bbaa-01953daf27a0@mind.be>
Date: Wed, 11 Sep 2024 21:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Kiagiadakis <george.kiagiadakis@collabora.com>,
 buildroot@buildroot.org
References: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
Content-Language: en-GB
In-Reply-To: <20240816091119.38036-1-george.kiagiadakis@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726082915; x=1726687715; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tfG3FEqW3SrkpTBv4U0AqB/Wt5EVXXhz+6QeY1Ss1qk=;
 b=FhxL73Gm5XGd6q9P5sDviyHQkkecYnLUiATgm4h6i63ipsShggHUsUDgUrrjP5LcZl
 2R3WmVAlcgSqHY1oITM+1u+T6cN78XGM587/fX3wGheJCRSy1MICyeDQAWJ8uFybYRLw
 xl3vqCuFADlzyK7rqNCf/fns1jeY7VW9hemZPYke3273LD8JjJADUIx/7ADC/onEjUp9
 UZhIfjc8VKtACaKPuXJNl2f5ElbP7fhboi/jGfkrWuTupzjuxUVUZjOUVK/JQgcCnnMM
 bH7dd7Y4Nm+i0jHP8UMJJbNM1TFUMxSmbqqnWsgx9isuiBplm+RpeR9Lwj72D3IdipGp
 LXVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FhxL73Gm
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

  Hi George,

On 16/08/2024 11:06, George Kiagiadakis wrote:
> Disabled roc & snap dependencies, which don't exist in buildroot.
> Added libselinux dependency option.
> Added missing libglib2 dependency pulled by the bluez plugin.
> 
> Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
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

  I don't understand this bit. libglib2 is already a dependency of bluez5_utils, 
so it will always be selected when bluez5_utils is selected, and it will always 
be built before as well. So why is this dependency suddenly needed?

  Regards,
  Arnout

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
