Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC34CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E10856E3;
	Sun, 12 Dec 2021 14:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CqAq1GicfQB; Sun, 12 Dec 2021 14:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17881856DF;
	Sun, 12 Dec 2021 14:11:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 435EC1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30A794019A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uguEZZlrcpEJ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 536834014E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:11:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x10so26862729edd.5
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=0HQyPW8c7LvSPb8bzX87ro/GPhG3FR57/R1mIh/R/iY=;
 b=PpDWZ9rurVsn9mu3YWUaffztdLid8WXd5yIiIy2sRRi6qOUyAt9sFMp6qX40KeU2zU
 Ztpe9zy61UWFnJVtCD70uFLuutOBEa0c/5oc1DFnGSHea1ts5bUHCc3HNn+AdPJ4SgFz
 wsoyJWy8TyqCx1wcmnf9TLBifY11ECIu/4uajAehW0uQGkVmKV7VQ05VFG4JdJWlLR9p
 hruh8/B8QG3B95KGHGvZGfYjzQ2dWW+YfbpZa++PeSd7MCR58d8HK3UJUWsNd3737rZZ
 KGindQ+mBf1qbRnQ7O/pxkkfbdxAhU7dn1oIERomGFxL7dgSpruPG6ua8A2G2Z2tVNSt
 iz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0HQyPW8c7LvSPb8bzX87ro/GPhG3FR57/R1mIh/R/iY=;
 b=m8UhyBJsR3n+gAQHzd+CId9Z4R0B2h3gVho6HkrBiWE4HQnRBXzPXwhhnRoC/u3N6V
 l+uqbEnY3fgar/TKABkcWpPYj7RX/gumvf3QZLT1U2E5OCOh+vif9UfkEpB1zqcVDQQe
 KD2mWFrxePWKjiAPOn2h2cQszGXbnkF9gf4PwG6X6vyvqkHW+D0ji1xs4R1aRyfTJ1Mm
 PNKKhiB2w+DoPoef5Ef6aSjC+EKOlW/+P76ajmO6m2ww/9nsVq9iwthaIhJ7nmmMdH2s
 iR5HpDXrFBc+kiahKbq9U0yno/M4XfWsPVWbSizYhfLdPSzXhE6YpQzYCm5pI6Jr4pMI
 E0JQ==
X-Gm-Message-State: AOAM531tOKCfLvIIUQFFIz7aez+PtP4pXboyWbZNsfnQQVH5yhMNUajs
 gvFUGGvf93+S/9WfB15i0zImrrFbq/wupA==
X-Google-Smtp-Source: ABdhPJxjBO2ugeXbXhF5kQzo36N+Wbxs6WKgG73cgfadSQRlARaIgPl8n6dk64siv9K+syBQXur+Jg==
X-Received: by 2002:a17:906:58c8:: with SMTP id
 e8mr36924301ejs.380.1639318259578; 
 Sun, 12 Dec 2021 06:10:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p7sm746699edu.84.2021.12.12.06.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:10:59 -0800 (PST)
Message-ID: <51ca9b0b-4b30-29b6-c85a-fa8a37502d9d@mind.be>
Date: Sun, 12 Dec 2021 15:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211209222104.222786-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209222104.222786-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/findutils: enable selinux
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 23:21, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/findutils/findutils.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
> index 918591c53f..3237e5502a 100644
> --- a/package/findutils/findutils.mk
> +++ b/package/findutils/findutils.mk
> @@ -15,4 +15,11 @@ FINDUTILS_CONF_ENV = \
>   	ac_cv_func_working_mktime=yes \
>   	gl_cv_func_wcwidth_works=yes
>   
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +FINDUTILS_DEPENDENCIES += libselinux
> +FINDUTILS_CONF_OPTS += --with-selinux
> +else
> +FINDUTILS_CONF_OPTS += --without-selinux
> +endif
> +
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
