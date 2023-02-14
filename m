Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C294C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2514860FA3;
	Tue, 14 Feb 2023 21:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2514860FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-Yb1E5JVuIo; Tue, 14 Feb 2023 21:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C99460F88;
	Tue, 14 Feb 2023 21:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C99460F88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2631BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03C9260F88
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C9260F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ban3YpCb4-sU for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:30:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B48DE60F86
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B48DE60F86
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:30:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id mc25so6050018ejb.13
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3aPZ2PAN+aI9vT8eqtKKMG1AbGOqyp8C5hiP6V5GYVE=;
 b=g/txhse6tZC58Db8RaxXoQncX1sbIxhJuaTSh3nyzIKghXkvNjpGITQGClM6bOztsx
 b/Cf9hgACnT7Xy31+cjiqniVbUUkGuWaCd/yqMwwibSigP1hc31dd0YRiq13d/1B0I9b
 AVuDmWgEU3TC2yTes80kSqkihQ7N9VVgZySBkClUDWAkrrrGYYDOuWcBAB/iFz3/SZrA
 lKwJ2JJ2q0wRB5hdqL0f7g1kORhQtzrmEjBnYESLRl/BJ0F/GNh2/tRNrXjFjDX8cYUZ
 yahw+P0OnL+6DikPnt926XgOkjBmbpHqwp823/JV8FFjGNOaz471TXo/iL/CH9xB+aqC
 y/0g==
X-Gm-Message-State: AO0yUKVagqm2bshJItR/4nudUMcvRQkBzkK/yB3oFeI6cl4SUISA5caA
 7kJw7MRHwFFRhqHmLtcZj20sJg==
X-Google-Smtp-Source: AK7set+Iu4/8M7YiqXptbFlurbFX+UhyY3xu1aEKYCedjsIMd5XUbNiatSREqhvNZQO1DCAZ++SLsg==
X-Received: by 2002:a17:906:6089:b0:88d:619:15fc with SMTP id
 t9-20020a170906608900b0088d061915fcmr4181378ejj.21.1676410255861; 
 Tue, 14 Feb 2023 13:30:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170906088400b008b126051fbdsm1916765eje.47.2023.02.14.13.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:30:55 -0800 (PST)
Message-ID: <4f51a196-e922-1e9e-6fbb-e81b35dc9f73@mind.be>
Date: Tue, 14 Feb 2023 22:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230210215548.1050371-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230210215548.1050371-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3aPZ2PAN+aI9vT8eqtKKMG1AbGOqyp8C5hiP6V5GYVE=;
 b=DAuraLlfX7SCu8b7nZvH7RBP8VNq/EEmPFhyQVlrue7KlJLFWPOCjplg+oYC5x0Ftu
 WC2y+ZNyfSa/jXA8kpiaUhnb7Ewi/hblZzGt/Ja2AktaWzg5svQxiCrSuPtMXRgOrHjH
 dKQBWi8kVIdTke6P3fe498UMxjY/qHGAKwu/kbIADKTwuevHRvpZ/dNlur0imfdt95fG
 bQ54MyMPMk0tL8n4P8R2LSkFSkwzhgYHGUVW4BK75tpxRi+5j3aOJ7uQ4Bb94GPqysfy
 ZWr7frs7oh9N6RDquXFNXtvnd/7F9TiS78LiyOoKgEXc7WKZTu6cZNoYR6JpKiF8oHN7
 ankA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DAuraLlf
Subject: Re: [Buildroot] [PATCH] package/erlang: do not hard-code the Erlang
 Interface Version (EI_VSN)
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/02/2023 22:55, Yann E. MORIN wrote:
> The note above the erlang version instructs to refer to another note
> further down the file. However, even if it is not too difficult to find,
> it is still located a bit too far away, and the reference is not very
> explicit what note we should look at.
> 
> When we introduced that variable in 6c1d128844c5 (package/erlang: export
> EI_VSN so other packages can use it), the rationale for hard-coding it
> was "to avoid spawning a shell every time the variable is dereferenced".
> 
> However, that can get a bit confusing and hard to follow. Also, that in
> fact spawns a shell only once for each rebar-packages, so the overhead
> is far from being too high.
> 
> The EI_VSN is only used by rebar-package packages, is derefrenced from
> the rebar-infra and not the packages themselves, and is not needed by
> erlang itself (it knows its own EI_VSN), so we can de-hard-code it, and
> rely on build-time detection, by looking in the appropriate file.
> 
> We have two files where we could look:
>    - lib/erl_interface/vsn.mk in the erlang source tree, but it is not
>      installed,
>    - .../lib/erlang/releases/$(ERLANG_RELASE)/installed_application_versions
>      as installed by erlang.
> 
> We use the second one, as it is cleaner, for a package, to look into
> installed files, rather than to look in the source tree of another
> package.
> 
> Although both the host and target erlang are the same, we still look
> into the corresponding file to extract the version. This is so that it
> would be easier if in the future we ever manage to rely on a
> system-installed erlang that could have a EI_VSN different from the
> target one.
> 
> We can't re-use the variable ERLANG_EI_VSN, because it now needs to be
> $(call)-ed with a parameter. Hopefully, external packages that use it
> directly rather than through the rebar infra, are not legion...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Will Newton <will.newton@gmail.com>
> Cc: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>   package/erlang/erlang.mk | 8 ++++----
>   package/pkg-rebar.mk     | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index ac2c204a49..5d6b69057a 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -# See note below when updating Erlang
>   ERLANG_VERSION = 22.3.4.22
> +ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
>   ERLANG_SITE = \
>   	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
>   ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
> @@ -36,9 +36,9 @@ ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
>   HOST_ERLANG_DEPENDENCIES += host-autoconf
>   HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
>   
> -# Whenever updating Erlang, this value should be updated as well, to the
> -# value of EI_VSN in the file lib/erl_interface/vsn.mk
> -ERLANG_EI_VSN = 3.13.2.2
> +# Return the EIV (Erlang Interface Version, EI_VSN)
> +# $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
> +erlang_ei_vsn = `sed -r -e '/^erl_interface-(.+)/!d; s//\1/' $(1)/lib/erlang/releases/$(ERLANG_RELEASE)/installed_application_versions`

  Since this is only used by rebar-package, I think it should move to pkg-rebar.mk.

>   
>   # The configure checks for these functions fail incorrectly
>   ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
> diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
> index e4e3f3bb6c..4b993dd970 100644
> --- a/package/pkg-rebar.mk
> +++ b/package/pkg-rebar.mk
> @@ -32,10 +32,10 @@ REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
>   #
>   REBAR_HOST_DEPS_ENV = \
>   	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
> -	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
> +	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(HOST_DIR))/lib

  Since we support only one erlang version, we could just as well put

$(wildcard $(HOST_DIR)/lib/erlang/lib/erl_interface-*/lib)

or does that directory not necessarily exist yet after erlang has been installed?

  Regards,
  Arnout


>   REBAR_TARGET_DEPS_ENV = \
>   	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
> -	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
> +	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(STAGING_DIR)/usr)/lib
>   
>   ################################################################################
>   # Helper functions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
