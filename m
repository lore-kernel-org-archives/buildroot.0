Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56113C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E78A80C50;
	Sun, 27 Mar 2022 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJBUkjSMCByV; Sun, 27 Mar 2022 16:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0079D80C05;
	Sun, 27 Mar 2022 16:23:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEF61BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0B2A40189
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOz-1ll89TL0 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:23:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCB1340104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:23:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r13so24116543ejd.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dy+419vzaIR/5C+I9CNyYRSo+tZbTvezZdpnZqUA7EI=;
 b=FC2JKTgrXfUTO4f0uGYEkmDYN+YMCjaBq2xAjtn8SHdLHppsecqVS3LYopzNd5jYhq
 bU0rreojF3LgzCGwZJCZwfoB6laLxByNcl99P+5WfYf/fpiGFeptDjFVCMPhAjRsg0DY
 TB003BpO9KpXJNxUI8mSGOWbU/PQeDuM8QFNmIGbXUSNAnx4OJVmtTHC3ERW2+aq+zFD
 3qiaJKtavGqyfodAWPx0Po2qoQQThWDp3tdNUoHmKL5CyboGElJIBqyVW1n0X9FoeFNc
 LJTPFrtUI8FRpFvdKJdsZ6LR544QHEmhhd4euwSbRIr5WDefyL9g9kn5R9IEADKj4yxE
 Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dy+419vzaIR/5C+I9CNyYRSo+tZbTvezZdpnZqUA7EI=;
 b=nkkrgWrWEVGDXbWvQEZ6yhT+WUI3k5fpA5NrmCK4pn18IiUsj9JORdrnVolh4kNSFE
 wP820eh7tfB6cbqV3WUSS9BRghV/IELoLPMeiHTpFHTqP0PT+AULJ7DPc9GxvSryR7kt
 +/cbGRh3CKrkK/9Bdkz8lgIs31a3owP3LkdJ68LI5AE1cuSaWz65CSINkDpPIU4sV02V
 QBHHRGswmOIcE/0A94dR20NOlNksn/VA6K17CrmvLorPCA7k6SfM0BWjO7TsCv9Yo0iL
 NSiEjQAlXILILtrbr+jA+eFXvqn0HSMoChfdtBz5/2ZodFmFlyu1ueoa2/Oz+XVCSwvA
 a1AQ==
X-Gm-Message-State: AOAM5322TjuEf/5NoSeLZ8EW1EtHY6sIElNdAVJcShvYWigONG5KV+3V
 310C/bVkEM5aY0VkUIoauAYDnA==
X-Google-Smtp-Source: ABdhPJzI1tFMySt2krA48ti2JNTKaiH7SPuSw9SuPWNA5OHaWHscZYnNB25C6/73ILQmaEkl4LKH3A==
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr22983956ejc.77.1648398212007; 
 Sun, 27 Mar 2022 09:23:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hd35-20020a17090796a300b006dfbfc80ce1sm4870071ejc.128.2022.03.27.09.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:23:31 -0700 (PDT)
Message-ID: <a31bad2a-2c3c-aa19-f612-ae895f576708@mind.be>
Date: Sun, 27 Mar 2022 18:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220324055602.3021498-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220324055602.3021498-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: add cmake dependency
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2022 06:56, James Hilliard wrote:
> Meson dependencies and variables can be provided by cmake similar to
> how they can be provided by pkgconfig, for this to work we need to
> ensure that cmake_prefix_path is set for both cross and native
> targets along with the cmake binary path.
> 
> See:
> https://mesonbuild.com/Dependencies.html#cmake
> https://mesonbuild.com/Dependencies.html#arbitrary-variables-from-dependencies-that-can-be-found-multiple-ways
> https://mesonbuild.com/Machine-files.html#meson-builtin-options
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-meson.mk                   | 2 ++
>   support/misc/cross-compilation.conf.in | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 85de98e03a..9e70d49b60 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -79,6 +79,7 @@ define PKG_MESON_CROSSCONFIG_SED
>           -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
>           -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
>           -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
> +        -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
>           -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
>           -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
>           -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
> @@ -136,6 +137,7 @@ define $(2)_CONFIGURE_CMDS
>   		-Db_pie=false \
>   		-Dstrip=false \
>   		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
> +		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
>   		$$($$(PKG)_CONF_OPTS) \
>   		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
>   endef
> diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> index 18cf258a8e..1977a83501 100644
> --- a/support/misc/cross-compilation.conf.in
> +++ b/support/misc/cross-compilation.conf.in
> @@ -8,6 +8,7 @@ c = '@TARGET_CC@'
>   cpp = '@TARGET_CXX@'
>   ar = '@TARGET_AR@'
>   strip = '@TARGET_STRIP@'
> +cmake = '@BR2_CMAKE@'
>   pkgconfig = '@PKGCONF_HOST_BINARY@'
>   g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>   g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> @@ -18,6 +19,7 @@ c_link_args = [@TARGET_LDFLAGS@]
>   cpp_args = [@TARGET_CXXFLAGS@]
>   cpp_link_args = [@TARGET_LDFLAGS@]
>   wrap_mode = 'nodownload'
> +cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
>   
>   [properties]
>   needs_exe_wrapper = true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
