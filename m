Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE7CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B5B416D2;
	Mon,  6 Jun 2022 12:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UQYdv4jTk5w; Mon,  6 Jun 2022 12:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AB73416AB;
	Mon,  6 Jun 2022 12:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCD251BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE6440122
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTMFlyH8iNgq for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D057400DB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:42:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so15692547ejb.11
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lv9y6M0FpJ8KMxwDn2KWxwrBw1sobpZsN25/YGDljws=;
 b=XAnf3s5CHnVOdfR5+ckH3Eb/8KuGlEbewTIsI4geuRcO7QgmrioNrnSBwc1Zi1HMPO
 LdNIi+5+rCydPbh2w0ODHUhNmRJE/16lgIwBwejRzXwCjJuFhwUF+TnbcFZKdtgX8qF6
 L5TnZM4qbVDscdGNbKR1XjYtOR/cnu/Qw9lhWh2NOg9RgAEqRWhfYQfNUR2hx9piUCMR
 kzTCUA05CwxMvGSyTnh0aeTshSdEiSym/qrjXxuosNdZ92LooOM5xEXONTJdyf+NUqvu
 xKCaa5fhDa0C8MJgo8nWp1rkzjrf48St6xj/549SoZIwrVlWVWb6dJoqdKCJQf29cEAC
 4B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lv9y6M0FpJ8KMxwDn2KWxwrBw1sobpZsN25/YGDljws=;
 b=xP3mo4fZJ9KNx2qvVUURZD3ZYknAcEWcWgeHmYGvGJKGGlgEtOKgYVBk4LRfj8zU0/
 rw3vvSt3844puwg/n6cPoGRcmLesg3kNt7eqTc+IHH8IPPwygX9INJ1e85v/qXk3k71x
 cYbanQWvfPQU7aDeEiS1cKzFSrQMgJsJqUbQ4AKDUsRU/sIYaHtCJJv+sZbfD/XKpQQL
 OIduTjpwqrwnjXIOcpC13xNdsUOFD5wpbwCwRo/TLASALON/5uxxY3R76iOwy/8xqIsb
 KlqAopdqF/WWekNrbOy1f3FO//nVuLXQeLVpEoHe4LpAhWfviJVBZGlnZJad9wXOFivn
 fjGQ==
X-Gm-Message-State: AOAM530z5QadGJk+9NdGCx0D11AjJoECDb4g6YKvxGRECl7aIymeABmh
 XNFMsq9lgXm+aqvSnv0CWyx4q3OFPVH7OA==
X-Google-Smtp-Source: ABdhPJxxfljdKFbhw/QXgs4dRXpCVci7ICviGWl8wITkwZpJdhqC2NYZGdKY7/a3P7xw65GCxc5mzA==
X-Received: by 2002:a17:907:dab:b0:711:d56b:4eb5 with SMTP id
 go43-20020a1709070dab00b00711d56b4eb5mr2181110ejc.93.1654519371635; 
 Mon, 06 Jun 2022 05:42:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b006fec69696a0sm6244101ejc.220.2022.06.06.05.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 05:42:50 -0700 (PDT)
Message-ID: <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
Date: Mon, 6 Jun 2022 14:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2022 23:55, Angelo Compagnucci wrote:
> 
> 
> On Wed, Jun 1, 2022 at 9:21 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com 
> <mailto:thomas.petazzoni@bootlin.com>> wrote:
> 
>     On Fri, 27 May 2022 12:33:32 +0200
>     Angelo Compagnucci <angelo@amarulasolutions.com
>     <mailto:angelo@amarulasolutions.com>> wrote:
> 
>      > Default configuration file is wrong for the default compiling options.
>      >
>      > Fixes:
>      >
>      > Successfully initialized wpa_supplicant
>      > Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
>      > Line 1: Invalid configuration line
>      > 'ctrl_interface=/var/run/wpa_supplicant'.
>      > Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
>      >
>      > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com
>     <mailto:angelo@amarulasolutions.com>>
> 
>     Indeed, this option only makes sense when
>     BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y I suppose. However, in this
>     case, it makes sense a lot of sense to have this option in the config
>     file.
> 
>     Should we have some kind of logic to add this line when
>     BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y ?
> 
>     Maybe something like this:
> 
>     # ctrl_interface=/var/run/wpa_supplicant # BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
> 
>     and a bit of $(SED) magic in the .mk file ?
> 
> 
> No need to have this logic in my opinion:
> * the option has a sensible default when enabled

  Does it? AFAIK, if ctrl_interface is not specified in the config file or on 
the command line with -C, then no control socket will be created.

> * If a user really needs to change the default, he can add that line manually in 
> an overlay file.

  Yeah, but we prefer that if a user selects 
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE, that the control socket actually appears 
in the expected place (/var/run/wpa_supplicant).

  Regards,
  Arnout

> 
> 
>     Best regards,
> 
>     Thomas
>     -- 
>     Thomas Petazzoni, co-owner and CEO, Bootlin
>     Embedded Linux and Kernel engineering and training
>     https://bootlin.com <https://bootlin.com>
> 
> 
> 
> -- 
> 
> Angelo Compagnucci
> 
> Software Engineer
> 
> angelo@amarulasolutions.com <mailto:angelo@amarulasolutions.com>
> __________________________________
> Amarula Solutions SRL
> 
> Via le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 (0)42 243 5310
> info@amarulasolutions.com <mailto:info@amarulasolutions.com>
> 
> www.amarulasolutions.com <http://www.amarulasolutions.com/>
> 
> [`as] https://www.amarulasolutions.com <https://www.amarulasolutions.com>|
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
