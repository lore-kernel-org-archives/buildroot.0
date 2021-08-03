Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59098C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D83360524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D83360524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E77404229F;
	Wed,  4 Aug 2021 01:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gbjFQCZFg9j; Wed,  4 Aug 2021 01:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507BF4227B;
	Wed,  4 Aug 2021 01:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C46A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBCB240179
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZRLeiNtC8hl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:38:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB6CE400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:38:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id e19so630587ejs.9
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xLPWXNRvZsalQWtXsQDdgoHEwWtKWyPBODC00XEiA8k=;
 b=Duh1bMJsJ2GvTgW127gbF7g0QueviyG1RCenIug0gqChsIW9LLyrjbEk3KrWNipMcN
 qjepaEAZ3nTujLWZsUURxiGnNWRcZoHUkYQUYWRG+nJGPudQWlmGLx88Qx+Rzti2f5CX
 sYg7OxQZ+1bp/i+mYWHrl8jyGZNLGh3Jq1R2JDzJ8vjLCMRkDSm3U1I7JC3hWx3Ri089
 fY++vmh0sLl73rlVVl0I597s3LalzglG8Kgt+53wl563rGgvXO1+kfEPUnfIqtO2X3SM
 v4yxY5G92TXPf7ZFzaDUqJrIJHFbJrCyJ2s821rmOVkVdfCaur80J+TAbPBDEJUnWK6f
 I2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xLPWXNRvZsalQWtXsQDdgoHEwWtKWyPBODC00XEiA8k=;
 b=T53iMUuUIEEC1u96DRiNIJ+i0iE8YOkQAgH3Ih51OkOK4vNHdGSZ72QBpcAPm5zruL
 Dh9mnIt775Hu90JO+jSUjbl9srOv3QjpJT+3gRNKOPRN33nX1oZTK6dEufbzS1/aRlxc
 kIb72zxEW57Adej+Oy3EkQjqyumWD8oqAHRXKT1QSKgC2OyQW+abw15V5e9DiiZdna86
 UHU0VbvdDnC+Ak/0j3KkUQqan9zBJ6SipjXZkXjlhdVX62Qdx8KIKLKsgUytwAS7w6Gk
 CvDipxl6Ji6B7CBeeAnnqwb/B/zEB3+j2u9CEwRzvKgb7ZvzUm+YO3zfTgtzWlaTF+w4
 4zzg==
X-Gm-Message-State: AOAM531ebVlvTnE+1844yprIMK3O/832UCqi77TYa6XhNV6/dJih/BFS
 SDOR4P4vJpBHfoYg2K0H+UaPEc27OHEagmukrro=
X-Google-Smtp-Source: ABdhPJxWeliV01byU7P7FGj6KmEnVcgWetTAZ3aevXp06UnYYTMEjlwZngNJZ24q9i6n0KHbOe1VIQ==
X-Received: by 2002:a17:906:350c:: with SMTP id
 r12mr22839637eja.44.1628026697990; 
 Tue, 03 Aug 2021 14:38:17 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id p14sm82419edr.20.2021.08.03.14.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:38:17 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803134633.4009691-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a6440dec-4cc4-4447-12da-6d36f7a1699c@mind.be>
Date: Tue, 3 Aug 2021 23:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803134633.4009691-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-pqsql: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 15:46, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> configure:13698: checking for libodb
> configure:13772: /tmp/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=2 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
> In file included from /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/exception.hxx:15,
>                  from conftest.cpp:26:
> /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
>    38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
>       |                                                 ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/73b06d7f923e5a7294377951f212b89b6cb0946a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libodb-pgsql/libodb-pgsql.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libodb-pgsql/libodb-pgsql.mk b/package/libodb-pgsql/libodb-pgsql.mk
> index 038f7878c0..014116883f 100644
> --- a/package/libodb-pgsql/libodb-pgsql.mk
> +++ b/package/libodb-pgsql/libodb-pgsql.mk
> @@ -12,5 +12,6 @@ LIBODB_PGSQL_LICENSE = GPL-2.0
>  LIBODB_PGSQL_LICENSE_FILES = LICENSE
>  LIBODB_PGSQL_INSTALL_STAGING = YES
>  LIBODB_PGSQL_DEPENDENCIES = postgresql libodb
> +LIBODB_PGSQL_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
