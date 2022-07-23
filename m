Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4672241916;
	Sat, 23 Jul 2022 16:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4672241916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8K_vhle-OmF; Sat, 23 Jul 2022 16:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86F2416F8;
	Sat, 23 Jul 2022 16:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86F2416F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F05B61BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB0014055E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB0014055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lz1emKcZq5ys for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B68404DF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5B68404DF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:56:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so6190991wmq.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r6NKMzICQHGVi9UIxUeN61nRAanXvZYj0TN64raCaJ4=;
 b=k29v0i+tKEpAX8ci5auR+6UI7+sOOBdKebo7mwSVSy6bpqKGZA6eJH8cILuZulmJl5
 aQMg307SsRyxivCwQUxzZCvwTRWSr924gMO8+0o2BFu3zVzvPnOc5UC+M52A3erSi4v+
 fOBM8TWqVxmbyMZsXAN46hGGSHG5SJF2oZ7ZvpAD9AjvA/VUf3uMzNhDtXVAPpPqdVEK
 ag5xdAH+gSznVLQbI1SjB64CfQmPrBZEQFMZSa0ZBbxp4FXQ0szpgRk+9atJEu3DJenO
 MU8IOhCxQepV2/R76avYiZCAQeT9G56QbmviPPUz6UEom0UeDgTcR2l479Up3M9YOP8y
 415g==
X-Gm-Message-State: AJIora93B/1iQH80R4qK2SSu95HkFxVMW1/tNoZouTiljYIHnqzH7qwq
 ADpXVabmMj1LQ4gmsYuyQdVXvQ==
X-Google-Smtp-Source: AGRyM1vUUXhqZE9h5p7sLXKV8PYyJGEUJjxSHoAPBeJIGriw8vZY9wlwtH0P8PVNNkD3A8HmtSjnkQ==
X-Received: by 2002:a1c:21c3:0:b0:3a2:fdba:3f39 with SMTP id
 h186-20020a1c21c3000000b003a2fdba3f39mr3508464wmh.194.1658595371714; 
 Sat, 23 Jul 2022 09:56:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a5d58db000000b0021d80f53324sm7316878wrf.7.2022.07.23.09.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:56:11 -0700 (PDT)
Message-ID: <bdadf135-c8ee-74bc-f3c5-bf323565c150@mind.be>
Date: Sat, 23 Jul 2022 18:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r6NKMzICQHGVi9UIxUeN61nRAanXvZYj0TN64raCaJ4=;
 b=A2eKasRtxwCj6apc13PJbglR7N6Jl50fbOqFH5WfGzP0FpNMmcPL4JK6PI52JoYL9K
 WhKgrDsob2Ictm0lzaWL7j7NfN9Ybknzw7hMzz7HUOtinEC5w2JmKCSQ8zrlxeLBf/5G
 59dcQE7C7Wek+iyY03b7ew/1zRtVMkqEOy7o2s10j+tCZ6Y6uqDmls3zQwBPU9eHjp+I
 SsaBo7Kyd3R/uT3CAJWXw24zqr/2GrXpu/9h43NcR4oqXjJ3OGfQ6wjMf0suXh/UG2uz
 o303I77zl/3GECnyfJ0qYnXpiHt9zk33Wt5C/LSQmIqgOhxSxn3SZ8Lt8IginL89VgGE
 h9hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A2eKasRt
Subject: Re: [Buildroot] [PATCH 1/3] package/netsniff-ng: libnl is optional,
 not mandatory
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/06/2022 23:24, Fabrice Fontaine wrote:
> libnl is optional, not mandatory, since version 0.6.2 and
> https://github.com/netsniff-ng/netsniff-ng/commit/20a5e15443bfbbb7e6624a754832cdce19d462a0
> https://github.com/netsniff-ng/netsniff-ng/commit/b073c8e5fd7f8c723680b659bd81afd231ef32f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   package/netsniff-ng/Config.in      |  1 -
>   package/netsniff-ng/netsniff-ng.mk | 11 +++++++++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> index 5d1407baac..6b043362ba 100644
> --- a/package/netsniff-ng/Config.in
> +++ b/package/netsniff-ng/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_NETSNIFF_NG
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> -	select BR2_PACKAGE_LIBNL
>   	select BR2_PACKAGE_LIBPCAP
>   	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>   	select BR2_PACKAGE_LIBURCU
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 27bd707c84..3bc11b55b9 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -13,7 +13,8 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
>   NETSNIFF_NG_CONF_ENV = \
>   	NACL_INC_DIR=/dev/null \
>   	NACL_LIB_DIR=/dev/null
> -NETSNIFF_NG_DEPENDENCIES = host-pkgconf libnl libpcap libnetfilter_conntrack liburcu
> +NETSNIFF_NG_DEPENDENCIES = host-pkgconf libpcap libnetfilter_conntrack liburcu
> +NETSNIFF_NG_CONF_OPTS = --prefix=$(TARGET_DIR)/usr
>   
>   ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
>   NETSNIFF_NG_DEPENDENCIES += libcli libnet
> @@ -28,6 +29,12 @@ ifeq ($(BR2_PACKAGE_GEOIP),y)
>   NETSNIFF_NG_DEPENDENCIES += geoip
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBNL),y)
> +NETSNIFF_NG_DEPENDENCIES += libnl
> +else
> +NETSNIFF_NG_CONF_OPTS += --disable-libnl
> +endif
> +
>   ifeq ($(BR2_PACKAGE_NCURSES),y)
>   NETSNIFF_NG_DEPENDENCIES += ncurses
>   endif
> @@ -43,7 +50,7 @@ define NETSNIFF_NG_CONFIGURE_CMDS
>   		$(TARGET_CONFIGURE_ARGS) \
>   		$(TARGET_CONFIGURE_OPTS) \
>   		./configure \
> -		--prefix=$(TARGET_DIR)/usr \
> +		$(NETSNIFF_NG_CONF_OPTS) \
>   	)
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
