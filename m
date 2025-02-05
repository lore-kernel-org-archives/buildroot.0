Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A1C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C6B60740;
	Wed,  5 Feb 2025 10:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3tLSPw0gmU7; Wed,  5 Feb 2025 10:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA6C60AC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA6C60AC6;
	Wed,  5 Feb 2025 10:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C0812A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 984AB80DA8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIYVQUvgHpdO for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 790DB80CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790DB80CB3
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 790DB80CB3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38da713b9daso1633228f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 02:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738750195; x=1739354995;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LtX7esXg3yT5y/WwoAHl1G7Uj34EVqKQZJ407sibHok=;
 b=HjFLRy22L5X1hulsPFXqaHpH1EReDLQpeVEObYt5KelMLWxKjr0C5p1Eqt14N/quuY
 9xpC9ztPIP/NgaYh+NpqiKn4XJBYCPN5OUAYXf9USCVUlY0cpC3/t5/ctYATykOrOoYr
 DgyEIJbKyxZC3r+oD4Fqdh0lXeievHeeQGwzCPBq+vC21K/+uR6mzQD8ZmQ0WPgJ6xkY
 9vJ6CTqua2zjef83CyZev83hxyelwNv1XrNuZ69UEmD2q82k4g4fFbZqtTtxguhDEF5G
 8iH7Pq+gZ8p0j4rN1vLUl7wBw9orfWlpRr4VfXvzKI54mSyNQg5RSd+Run/eXE1ImJKc
 97ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH8yeVEelgD4MJWLxaFgixaTKfqMecdLvDT6aqFhQCr8QpOpaJRdp7B89WwZBCcry1ZZrXAM8kvDI=@buildroot.org
X-Gm-Message-State: AOJu0Yxd9do4F91vyKGYOPtcReehx+uwAmA55xgDG74qJfoeJ9Pvv2j6
 oBuITJh6J8tyE7jhKtN3eRiQ/SDXGfjN8zw17eEwjof8v/XJyfRkLt4kcPOfj2Q=
X-Gm-Gg: ASbGncufGMrwCY74SdwK+zzrGfy9T40SzyydbsjE77ckm545fJy3QimpgmXuNEq402X
 1/FQE8/hXgkuVJCz//yS8mUD9E9xVTvD7eGY2LbL9S/2Ky3IKNAY1tEGPTjw4YHA71tMQNHktPv
 qDVaURPlzKzlmffZSxlGflp8HSmatQFV+zHqalsT95ecjgwtAuwVpfxVfTnAIGQ+iOMjJVpgA6T
 4xsnOUiJhZ1BsEtTjUvtw/jCS4dK2uDouY8v9JtACBELpZBYBWyg8TxLxHedcPTfPx1YRO4cNMa
 MSOnvZMUIgrz592uZ+kzB9rP6clxIIdboVtMJeM2POi+UQw=
X-Google-Smtp-Source: AGHT+IGNEsw1Kf78uNEIWWbC1wfM9p34UYGqg1nAndM7krxmcWZYFEp2Ef5+2iHMNlkP5kOVgO6KmQ==
X-Received: by 2002:adf:ef89:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38db48a42f8mr1671199f8f.28.1738750195420; 
 Wed, 05 Feb 2025 02:09:55 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5780sm18493918f8f.67.2025.02.05.02.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:09:54 -0800 (PST)
Message-ID: <753764bd-5d57-4176-bba3-80d2803f67e9@mind.be>
Date: Wed, 5 Feb 2025 11:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain
 <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241107191634.378670-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738750195; x=1739354995; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LtX7esXg3yT5y/WwoAHl1G7Uj34EVqKQZJ407sibHok=;
 b=a8CwLT5YzoSjGm1zv60XZaDNo7XYiW9zTzqn8cyZSf40bcoP6N7I+sBFlgwZ4PpHeN
 E/o+wYLYSiyHd53dKcTAHQztFWNT4kUyjlKHNpA4pz0fgYw6pkaBM5X3WnFScPxxcR+C
 DsSxik9gPPIlbmt+8WCLZPQ6X0VMvgQK/wFBzyHWnoAzbOx+b69p33NdiKENRiUUHbtM
 AvjkrYuAHF4yL4t6znbKs+ltsqNM68eG8x+RUESfDHQwS7L2K53GSPfBzlEqQKeoyYz0
 FAnnzPRCWkrFznkcsq5jp7y4cdzN7edKTqCx0yFmZv3M8GfO4rUtSg+xpw28ybVIuuPo
 eePw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a8CwLT5Y
Subject: Re: [Buildroot] [PATCH v5 1/4] package/kismet: bump to version
 52bcb902e36b2df1562cfbe644b113362248d029
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/11/2024 20:16, James Hilliard wrote:
> We need to use the latest git commit as the last release does not
> support compiling with the newer protobuf releases.
> 
> Add optional mosquito support.
> 
> Add librtlsdr mosquito support.
> 
> Fix python-setuptools dependency which should be
> host-python-setuptools.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kismet/Config.in   |  1 -
>   package/kismet/kismet.hash |  2 +-
>   package/kismet/kismet.mk   | 21 +++++++++++++++++----
>   3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 2e1e0cfbd0..aa05e045d5 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -42,7 +42,6 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
>   	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
>   	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
>   	select BR2_PACKAGE_PYTHON_SERIAL # runtime for Freaklabs Zigbee
> -	select BR2_PACKAGE_PYTHON_SETUPTOOLS
>   	help
>   	  Enable Python and Python-related tools (RTL_433, RTLAMR,
>   	  RTLADSB and Freaklabs Zigbee)
> diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
> index 543515858e..2d05a6791b 100644
> --- a/package/kismet/kismet.hash
> +++ b/package/kismet/kismet.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f08548e26ca65fa1e567b1debbea1ca4d0e7206bddb96a4f639c90171873e8f7  kismet-2023-07-R1.tar.xz
> +sha256  2dccf9b5bbf5f4e6b04a44bf8cfecf80db8dcfa52a8183dd1166396c3ca04660  kismet-52bcb902e36b2df1562cfbe644b113362248d029.tar.gz
>   sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
> diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
> index c448233d60..f182fbe328 100644
> --- a/package/kismet/kismet.mk
> +++ b/package/kismet/kismet.mk
> @@ -4,9 +4,8 @@
>   #
>   ################################################################################
>   
> -KISMET_VERSION = 2023-07-R1
> -KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
> -KISMET_SITE = http://www.kismetwireless.net/code
> +KISMET_VERSION = 52bcb902e36b2df1562cfbe644b113362248d029
> +KISMET_SITE = $(call github,kismetwireless,kismet,$(KISMET_VERSION))
>   KISMET_DEPENDENCIES = \
>   	host-pkgconf \
>   	libpcap \
> @@ -37,6 +36,13 @@ else
>   KISMET_CONF_OPTS += --disable-libcap
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
> +KISMET_DEPENDENCIES += librtlsdr
> +KISMET_CONF_OPTS += --enable-librtlsdr
> +else
> +KISMET_CONF_OPTS += --disable-librtlsdr
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBUSB),y)
>   KISMET_DEPENDENCIES += libusb
>   KISMET_CONF_OPTS += --enable-libusb
> @@ -58,6 +64,13 @@ else
>   KISMET_CONF_OPTS += --disable-lmsensors
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MOSQUITTO),y)
> +KISMET_DEPENDENCIES += mosquitto
> +KISMET_CONF_OPTS += --enable-mosquitto
> +else
> +KISMET_CONF_OPTS += --disable-mosquitto
> +endif
> +
>   ifeq ($(BR2_PACKAGE_PCRE2),y)
>   KISMET_DEPENDENCIES += pcre2
>   KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
> @@ -69,7 +82,7 @@ KISMET_CONF_OPTS += --disable-pcre
>   endif
>   
>   ifeq ($(BR2_PACKAGE_KISMET_PYTHON_TOOLS),y)
> -KISMET_DEPENDENCIES += python3 python-setuptools
> +KISMET_DEPENDENCIES += python3 host-python-setuptools
>   KISMET_CONF_OPTS += \
>   	--enable-python-tools \
>   	--with-python-interpreter=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
