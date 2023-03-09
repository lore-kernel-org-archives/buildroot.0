Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF14C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E776178B;
	Thu,  9 Mar 2023 20:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E776178B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rzokNfuGgX0; Thu,  9 Mar 2023 20:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF4FD61793;
	Thu,  9 Mar 2023 20:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4FD61793
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF261BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2459761793
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2459761793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBvymbbN9EVs for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:24:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A8E16178B
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A8E16178B
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:24:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id da10so12010646edb.3
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678393469;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJLQ9bNB5pxwLSJbeO6alsOUaS66Ehqx+Lsizv6uEaA=;
 b=fN+efXkYPPqHewuiXFDlxJAi+LPVJltzH9oHD+L05l4VaKakFJLXPr/To/ZN2JEfS+
 gb546ynJdENj0AnFAw5jmE6CmIEN7YIjafw3+Q2fjxl6nuwbGdDfkKXrF/WiDL1pZhWs
 vmc8hbYRZrWEy4F/kBNZKC082a8e2RlwzSRYCA1RNbA8cJ8zQudsASQHWdYo/D9Nb4By
 EhCYpa9QZgw9XEtXxL5NGwWMW31SAKlbhPuPHp7EpMIF1rCpWsxOwxRQ8Ih5B7NjZwn2
 KQB5D7JU63swiidLElQq6jWN8QWY7L0NAf2kEvl13Dc+QCTHCwh58GAO+0KLEX5CEdGs
 16SA==
X-Gm-Message-State: AO0yUKXBPVRzx9t8/fd8L0k6RFG2mhWTeNN7MNYc8ZuuqbBck9l62t+N
 q7Jgd2AgQK9vFn9vI7OV4he2cg==
X-Google-Smtp-Source: AK7set8GBc5/Grv2UH1XSo1kN9MZCAS3YYwoaYjK1cPAa6SDk57MwPu9v2CwCS4k6Mdirt3c0v7+WA==
X-Received: by 2002:a17:907:1909:b0:8b1:304b:8e2c with SMTP id
 ll9-20020a170907190900b008b1304b8e2cmr23752224ejc.0.1678393469011; 
 Thu, 09 Mar 2023 12:24:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a170906851800b008b95c1fe636sm9198518ejx.207.2023.03.09.12.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:24:28 -0800 (PST)
Message-ID: <15a3ea2d-7f82-125f-c473-5d1049352483@mind.be>
Date: Thu, 9 Mar 2023 21:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230227210823.10437-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230227210823.10437-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678393469;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJLQ9bNB5pxwLSJbeO6alsOUaS66Ehqx+Lsizv6uEaA=;
 b=ZtzH8YLv27Hq5Dt/QGO7mmoF3cOJwwaTcwtCqEJKcUiS/AACGVtOh03THc64ECuEXh
 YVZMJ29o2sym6gynoBWqzVYm/4c8tx35aSL4+qJ9mzKZnmnmPpcw17rFAfIiSsZzWxhr
 3+IRhcTIcHfioejhNUfmpJevbpbjibrDg/k3wAFzlixS+JbysLSgXIwztAo0WbAJGnpK
 /dGsnl1Cd7i4mOUuYcIcuvN4tMZmOaMl0U11emPL5zG4i7CFhAlFRFmUoI27UiKoYDDz
 b82zlhh+XDESDtJHC/pCKWOodF1hQjSw5xOY7hdg6ILOCHe3MoX8xgbUwzYuhWRya97h
 dMyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZtzH8YLv
Subject: Re: [Buildroot] [PATCH v1] package/speechd: fix gettext version
 mismatch
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



On 27/02/2023 22:08, Peter Seiderer wrote:
> - fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
>    BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
>    SPEECHD_GETTEXTIZE
> 
> Fixes:
> 
>    -  http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992537f92d3
> 
>    Making all in po
>    *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.19 but the autoconf macros are from gettext version 0.20
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/speechd/speechd.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> index dee94a6752..ec62980986 100644
> --- a/package/speechd/speechd.mk
> +++ b/package/speechd/speechd.mk
> @@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
>   SPEECHD_INSTALL_STAGING = YES
>   # speechd source code is released without configure script
>   SPEECHD_AUTORECONF = YES
> +SPEECHD_GETTEXTIZE = YES
>   SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
>   SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
>   SPEECHD_CONF_OPTS = --without-kali
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
