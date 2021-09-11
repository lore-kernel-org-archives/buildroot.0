Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF84C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD574610A3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD574610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDF360814;
	Sat, 11 Sep 2021 20:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2H8Rlngeb9Y; Sat, 11 Sep 2021 20:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83131607D0;
	Sat, 11 Sep 2021 20:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E983F1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48EC81ABA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7yRXc6J2I9I for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:33:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC58981B04
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:33:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id x11so11780827ejv.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZcXkerztmHIPvHVerPX/JHo3XwAkG0VSDFFPftJR2TU=;
 b=bTH9vCFrwks1kG6Yk9YWYvH5KDtnAydv17eK7JOLQoblhoVAvcvwNsGIQNxKRcbm4p
 9UVsAw0Y0F75uKy6ZpbWMLcT4b8YMrSktXjLq2wYG/GBzfMtxJFByvS1trvUtJ7aJhIU
 ybRnqBXC8nki3yqnARiBzf+LdorVSfUZZEOT0px+KsFWdVh+Bn0BPKqH+H3ZntV4qH9i
 k+hBqjUFvduK4hMzP0kJWANevJXi80RW61wNJX8aOgD1EsyfdINyD4zlmAEOcRr8BxV/
 yz057daBJZEeHTnZMzKAer/2Ml7Ga3+3nfHiRTCwSexWi+HicaiCQBuk6oRWMNF7Q1k9
 ZQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZcXkerztmHIPvHVerPX/JHo3XwAkG0VSDFFPftJR2TU=;
 b=6gJlP+e4UwjvXUZmmUS4pfgNuptidOitdJZr9Qa/ny4SXpHBNDXxajHtjygvDXiXOi
 r4GJgzD13ftEL4v1YjzhWTgr1m+jsIzviDfJP9NPjM+5GTLohd4QfJqfFB5aLRcWCE04
 40FoW/qnbYRGZXBBT8748oqOfD03QHsZk/L9C3QHkFnLld2VLjWqhF7u0W3Yxmp+2IYF
 10wQBCatxAcgK9EMHe2dtPBjYpsvlWWLUAfPE5QTttH/XYmoV8I07idTnnOC9wmw4MKW
 YaL3NG3AnTrnZrXEQVIY7p6pSKb5C9T6O/rGFA4MgjNTkGn7Qguxubb7HFXiN25Oulvm
 iDmQ==
X-Gm-Message-State: AOAM532dOpN8E/YD5z5JDs96U5XdvTf3wi31OneXEeYPHKnRcKxhdPvy
 jFebhIpS27/jgYyLvtkVxgWRekUdvF5L3Q==
X-Google-Smtp-Source: ABdhPJwegSKf3cuHGCRSbDwWWWAaQa7Z1BbLGExtrUSw5NwQsMQu/wX1oZuMP6NrTYw4MleIdvWQuQ==
X-Received: by 2002:a17:906:1454:: with SMTP id
 q20mr4572654ejc.446.1631392403089; 
 Sat, 11 Sep 2021 13:33:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm1169671ejv.95.2021.09.11.13.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:33:22 -0700 (PDT)
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <20210904204025.15457-1-james.d.knight@live.com>
 <DM6PR08MB3993E4A5806B31ECEAEA154AA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <27f80df3-0ef6-8151-7fec-4e88527bf835@mind.be>
Date: Sat, 11 Sep 2021 22:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB3993E4A5806B31ECEAEA154AA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 3/3] package/rpm: introduce rpm2archive
 option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 04/09/2021 22:40, James Knight wrote:
> Adjust the inclusion of the rpm2archive command as an option, to allow a
> developer to opt-out of building/including the command if it is not
> desired/needed for the target.

 I was a bit in doubt if it's really worth adding such an option. Why would you
not include rpm2archive? If it doesn't take a lot of additional space, there's
really no need to make it an option.

 That said, it doesn't really hurt, and if you do want rpm2archive it's
convenient to automatically get libarchive selected. So applied to master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/rpm/Config.in | 15 +++++++++++++++
>  package/rpm/rpm.mk    | 14 +++++++-------
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 9da8d51df0..2af04b41b4 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -19,3 +19,18 @@ config BR2_PACKAGE_RPM
>  	  The RPM Package Manager (RPM).
>  
>  	  http://www.rpm.org/
> +
> +if BR2_PACKAGE_RPM
> +
> +comment "rpm2archive support needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +
> +config BR2_PACKAGE_RPM_RPM2ARCHIVE
> +	bool "rpm2archive command"
> +	default y
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_LIBARCHIVE
> +	help
> +	  Enable rpm2archive
> +
> +endif
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index e9d2adf690..5c04d47f10 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -73,13 +73,6 @@ else
>  RPM_CONF_OPTS += --without-libintl-prefix
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
> -RPM_DEPENDENCIES += libarchive
> -RPM_CONF_OPTS += --with-archive
> -else
> -RPM_CONF_OPTS += --without-archive
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  RPM_DEPENDENCIES += libselinux
>  RPM_CONF_OPTS += --with-selinux
> @@ -101,6 +94,13 @@ else
>  RPM_CONF_OPTS += --disable-zstd
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
> +RPM_DEPENDENCIES += libarchive
> +RPM_CONF_OPTS += --with-archive
> +else
> +RPM_CONF_OPTS += --without-archive
> +endif
> +
>  # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
>  RPM_CONF_ENV = \
>  	ac_cv_prog_cc_c99='-std=gnu99' \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
