Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52946C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F1D8271D;
	Mon, 10 Jan 2022 07:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MR72JmGQzQFU; Mon, 10 Jan 2022 07:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581DD82730;
	Mon, 10 Jan 2022 07:14:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF0611BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC94B60C01
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2oOfGyoxoHS for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C15D160AB1
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:13:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e9so23373181wra.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ikHXzb2ObOstjoLCvey+T7KDt8gje93vcD2rqTVzU7w=;
 b=WPefZK4Gb1JW67QEJtOUmkMY2sQLv1w63TYVS6QggXfvbrVAwyFCiTa0U5G7dwRqlP
 Xvqv/9y6FEFb5m2Tt6pBKVMjPlOOu1X3TKTIyaVE/9zqISD9aPxIsplfFnQT7rmqbRbW
 Oo08/R3t6YxiX+XFNAzTiDZXmzRbfBY/7nHPaaL++o5LQeemL+GgeET7AZV27jCaw89P
 67jzlqSK/j+RQK4DFDKB/5p7kuYvCqYNTIEbeSSH6Es0giColFuaqFZpiBb5xafekdLp
 TylNf9Y61LcIt5YkeRUzUfrMB/GqHuMUXbLZuxc2elIvWADihbX28/IkCY1bQ3K/M9br
 W8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ikHXzb2ObOstjoLCvey+T7KDt8gje93vcD2rqTVzU7w=;
 b=UP1aD2LS3cMoo9UNGdxwQ/s+oYvWWV0j1nsDm+6SKuFvcalKPYCem/YZmR5S3pkQlY
 0p6QA1UMtKpBaWzhUFNyAQyvVK8R24ue3fPtsXhQrZqJb2nADR09ZoXnYbPytowVoUec
 Phcn7oAsuAzbS9RBnf0zERx4+N7ABtQMQK4byohVvoLPdJRo7EDhGVPqxnCrKLkedAb6
 YK7lAGXIVbjnIS0vlDHr58O4Jt1HGNEBX7h6pFvjvSplN11MPoRaNCwChZ1+Ym9QbKaT
 eTpPAHh6itA7bJ1dnjFmkkf/zhggYZfoLzu3+bJYK+PPYTHCT09XHWAHJrjkm3wxGdCy
 zhWw==
X-Gm-Message-State: AOAM531vllAVBWImYjtS2Ezo9JEA5WNd3owy2o9jNjaZLo/WBAWQPmx4
 kZSP2FtleXDXf9wDlfueq/uT9A==
X-Google-Smtp-Source: ABdhPJzgaIPPaLeTReMeMJ1rwstzB6rAI+KEUSE+ZMK/UjG8n7vvBkiF4eFm8sZUdKR+KZgcn9BoGA==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr12877943wrn.290.1641798837060; 
 Sun, 09 Jan 2022 23:13:57 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id p62sm5651274wmp.10.2022.01.09.23.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:13:56 -0800 (PST)
Message-ID: <db9bca01-8c19-1e3a-309a-32201e7bc76c@mind.be>
Date: Mon, 10 Jan 2022 08:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220104204126.3631293-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104204126.3631293-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: add avahi optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 21:41, Fabrice Fontaine wrote:
> avahi-client is an optional dependency which is enabled by default since
> version 2.2.0 and
> https://github.com/cminyard/gensio/commit/5ab117c9743fd4719f610cf9f1ba45023cc25d7c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/gensio/gensio.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
> index 389de1e263..b4936d5f21 100644
> --- a/package/gensio/gensio.mk
> +++ b/package/gensio/gensio.mk
> @@ -9,6 +9,7 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>   GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>   GENSIO_LICENSE_FILES = COPYING.LIB COPYING
>   GENSIO_INSTALL_STAGING = YES
> +GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi)

  In the commit message you talk about avahi-client, but here it's avahi-daemon. 
That looks a bit weird... Can you explain?

  Regards,
  Arnout

>   GENSIO_CONF_OPTS = \
>   	--without-openipmi \
>   	--without-swig \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
