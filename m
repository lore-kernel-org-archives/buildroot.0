Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CBBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF0860524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FF0860524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC3B42486;
	Wed,  4 Aug 2021 01:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54vcx1lbZyp6; Wed,  4 Aug 2021 01:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743C14247D;
	Wed,  4 Aug 2021 01:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 123831BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D3460664
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzThwHSFGsvv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DF00605C9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:45:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qk33so635331ejc.12
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwIQYcf5s93OtaQ1B90+K7pq+iXupLBrv2TmrR11tyM=;
 b=XjIZ1QGurYRspYkgPQfXI2Y7ATyazrMSjckW4wkMfalmqTV04BhAdKZqrZHDTCVQNN
 1tb6FAOpxPIQaQ9XlicSzSyOuI18SJDYpnJjqAfj28EvLKvbQWhBJcZXjZ6VotO7i82T
 0LftA1ZeLGHxDbcJeP/QQokKEOhku7OR0ThbCQhp2sMN2I9AZ67FwkaMfjhhZEt+Rj2v
 qAwIBVrhQRbIEJY8kU+L/t17nZGJ3gq/eVAhFUM19YOIIP1mp1S109tFpJuq+Bb1eu/b
 b4HkbbptUmI48VuFhk8hQub2YqrWDHOwXP9V42q5EoE7aUQoZYGlGpM9Qusu5hqc8xyE
 VpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iwIQYcf5s93OtaQ1B90+K7pq+iXupLBrv2TmrR11tyM=;
 b=Odvy0Bayt1aq6WTr68Ry+DEgSxI/2WU8uTplJGy9/U3O4+j4s94cW+zqkUaNu+/6Ip
 kKLhIupejUl8XBIHnCBNUxmvUkBqldI2hvxHUve8Kw9ipsEA39F7ePFpUpyAf8AeBcOm
 +7kt2qdfCee3SA9WfbDtWvNUl0w2or93eJ0nPAdKoxUAh/qEAsHd1b1b7dJEf6iCXThi
 voaNQ4RwwC657MgJOqD/nMYfBpKZ9aKUEG6SJROxSs27U2UXhlAuMM+PBK0SwgYzu11f
 7tKqHvQ6NthQwoZ4FzXt2PT8RXwpAKJQWIgqZjC8MxOuh0dgN6UBs3aTzkz3gWJbENDQ
 6zVQ==
X-Gm-Message-State: AOAM531FeZYYx8CtYg+G72KF97993Gl9p66mtZlfx17eHz1O1v+STLHi
 lmPNo73CWefQljFVXu4PqzGPrQ==
X-Google-Smtp-Source: ABdhPJy/ka9jJW4Q4dP6EcNzqvl4M0cw/YfNpIaFtux8TPcnmhVs7o/Nk5MSllDcZY/Wm5kD7zu5xg==
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr22971287ejb.80.1628027154302; 
 Tue, 03 Aug 2021 14:45:54 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id dk18sm81486edb.88.2021.08.03.14.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:45:54 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803135041.4090636-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a660a2ce-35b3-6c07-1432-64808fda5002@mind.be>
Date: Tue, 3 Aug 2021 23:45:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803135041.4090636-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix build with
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 15:50, Fabrice Fontaine wrote:
> Fixes:
>  - No autobuilder failures yet

 That's extremely unlikely, with James's autobuilders there should be dozens
already after a single day. Are you sure that the build fails for this package?

 Same for libodb-boost.

 We can let this soak for a few days and see if autobuilder failures turn up. Or
you can simply copy&paste the error from a manual build.

 Regards,
 Arnout

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libodb-mysql/libodb-mysql.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
> index a9040c65f8..88b6f4cb31 100644
> --- a/package/libodb-mysql/libodb-mysql.mk
> +++ b/package/libodb-mysql/libodb-mysql.mk
> @@ -12,6 +12,8 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
>  LIBODB_MYSQL_LICENSE = GPL-2.0
>  LIBODB_MYSQL_LICENSE_FILES = LICENSE
>  LIBODB_MYSQL_DEPENDENCIES = libodb mysql
> -LIBODB_MYSQL_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
> +LIBODB_MYSQL_CONF_ENV = \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
> +	LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
>  
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
