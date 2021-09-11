Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7425FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:46:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324AC61050
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 324AC61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6A361BF7;
	Sat, 11 Sep 2021 20:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjKVYP9n0rXj; Sat, 11 Sep 2021 20:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55969608D1;
	Sat, 11 Sep 2021 20:46:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F07C61BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0774042A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-E-vMVX9SNV for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BEB24028A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:46:15 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o20so1090698ejd.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p+ccQpPSToQIwTXVaBSPtdg4bGjKXXAAjJS3OTt+hWg=;
 b=GAMLfLX3aY4EYigR9kcw7Ef5ntSs0xiGsMytIHIbcg4Az/+4oIGQSy4RHxRzw7V6cG
 FBTypQXgWNcdCBhxXdoxFhL3n8SYUsVU0Xx+WZ988LjZLA69tpAJLDzwITZ27h+CSmCT
 XgjMPozBEisyUHLeSz8zJvqYcZLFo9tRKSmQFwWCnEkKGjtCDMpxv170SyeszuZfYIXO
 RQcZCiDM7RwU1tOSNhuFRnFRvHdRgIdtf9R4cdjZ/n6JomvEf//SCfvUIBJ1H3J3bdZM
 BM1wKmjnj80hdxkfz1ohXKwWqL1mCG/nCAY40EOEAgn+rWeYXt/vroGLVsxhRF01QXSz
 rOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p+ccQpPSToQIwTXVaBSPtdg4bGjKXXAAjJS3OTt+hWg=;
 b=A6hmHVHX9k8CrWCUVybs+HW5CxZYmi9Rk2WvV5nOeZINU+vQ30/xj+VokNtWKFELEv
 vmZwBtmjT05/I7whs9NDfxw0EihP6TFhBKBY0ajLvw1SdJbaNX6YfDJh8fwSS5ROfsVZ
 bDoMZfps+iPyxIwmz+9rX6h70jND34SQ81Udfi2kK/cPy1jAwLHeQbNd1QYJdPTqi6EV
 QBBjygy3MAEYto2o1WEEKnyfGyLhH37wTf4I98i2xGrB0j6gVJtho458/XeX5dVhfNQu
 Ka/ZkT1D7TFHMrD132kWqziwgqKS0O1RHau9oFa95k7PMJcw1d0cstw9pj0hgHouL7uP
 DOBw==
X-Gm-Message-State: AOAM533XJutyPQ+7Kl5gWL+/yrUKyEbQOn6Rx1jIZ44QaVG9fSRaQZbi
 ZsWZYWbvnvu6A/PXqSo4Paw5WQ==
X-Google-Smtp-Source: ABdhPJz5+2VYPeroGNZMrBHdl82DhkfDjK8/MUQa4vUndf/sQrrmZEDKwjb0Sr1TRyDfsk7TAXhbHA==
X-Received: by 2002:a17:906:af6d:: with SMTP id
 os13mr4359583ejb.278.1631393173685; 
 Sat, 11 Sep 2021 13:46:13 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e18sm1175822ejx.46.2021.09.11.13.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:46:13 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905084045.557846-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <72032431-eacf-e155-6ce8-6f4c06e3a933@mind.be>
Date: Sat, 11 Sep 2021 22:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905084045.557846-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 10:40, Fabrice Fontaine wrote:
> osm2pgsql needs C++14 since bump to version 1.5.1 in commit
> a71661ffb216c7423dcd02ec9e8d703252dbcbad and
> https://github.com/openstreetmap/osm2pgsql/commit/d35dd358d6e4a88a792be60c85bf55d2360c1a71
> to avoid the following build failure:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/osm2pgsql-1.5.1/src/db-copy.cpp: In member function 'void db_copy_thread_t::sync_and_wait()':
> /home/buildroot/autobuild/instance-1/output-1/build/osm2pgsql-1.5.1/src/db-copy.cpp:108:16: error: 'make_unique' is not a member of 'std'
>      add_buffer(std::make_unique<db_cmd_sync_t>(std::move(barrier)));
>                 ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/30ae4b9405454919437098d29abbd743638c9423
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/osm2pgsql/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> index d31191b3a7..315f496d8e 100644
> --- a/package/osm2pgsql/Config.in
> +++ b/package/osm2pgsql/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_OSM2PGSQL
>  	bool "osm2pgsql"
>  	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
>  	depends on BR2_USE_WCHAR # boost, fmt, libosmium
> @@ -23,10 +23,10 @@ config BR2_PACKAGE_OSM2PGSQL
>  
>  	  https://osm2pgsql.org
>  
> -comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
> +comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.9"
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
