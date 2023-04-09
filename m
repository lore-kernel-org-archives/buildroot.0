Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9EAC77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C087403E5;
	Sun,  9 Apr 2023 13:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C087403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL4tOUHJUMF5; Sun,  9 Apr 2023 13:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A724014E;
	Sun,  9 Apr 2023 13:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95A724014E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA6621BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 936A160B29
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 936A160B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpFqbPD6CBYz for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927FC60AA8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 927FC60AA8
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:40:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l26-20020a05600c1d1a00b003edd24054e0so3051410wms.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047643;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd28av6L6LNFhbLngwTqGjbgNcSt+kIlAujRXjb8Ch0=;
 b=BiCXUjOOz23SsgbyItrjJr4W1cTE12KlQQwT4nwZuRsnznMWcVjBoGH5G5fbZ2+oE2
 wIoeq3Qm7eB+/YJQxtwpNBuzUY3GoNdvSGM4zDOQKzEO5HFTALDOdrhM2ymSUl6GzhwA
 xyqKGfmbDQ/xsvbN4ao2K25dUIfttub5/188VzhWE8aetr9zn8ikvUHdPqLq121p61sN
 K96g6w4WP4Avj8mdtsnjpMbQZ1pyLXQVL9E+kf1qpQuMMaNDLHyrm8Bkjwhw/cxeCzGt
 1kwzon7KNIx2I9LQykw3ObL6oyHlT9aQLLoOTAW8vCxbieXSAHTFSsXug3IuoSa8QDZS
 uu7g==
X-Gm-Message-State: AAQBX9eqqdA8BwDXOdwbYnP2Vfaq8+1Z/Hutsoeak+Jxji5JiUZJ4Nyt
 ryrmi8v0npKQEZy6EB6PbzeB2kZpDo3jFzeJqDo=
X-Google-Smtp-Source: AKy350Z1V9oyHYaON3q1vz4XBZKek6faCoM+nxWfS/94neplZh1gkLybS2+BNvfHoYShDo6xdxKBOw==
X-Received: by 2002:a05:600c:cc6:b0:3f0:3070:f4ea with SMTP id
 fk6-20020a05600c0cc600b003f03070f4eamr4714238wmb.11.1681047643525; 
 Sun, 09 Apr 2023 06:40:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bc5c6000000b003f072b22dbbsm9746116wmk.16.2023.04.09.06.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:40:43 -0700 (PDT)
Message-ID: <5197e56c-a37e-5afd-2f3b-1e19f965eb4c@mind.be>
Date: Sun, 9 Apr 2023 15:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20230408052434.1413424-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230408052434.1413424-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047643;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd28av6L6LNFhbLngwTqGjbgNcSt+kIlAujRXjb8Ch0=;
 b=LNpzRmSBgNVdYF4lXDQMw+5k8ja0YSGKaw4jq9+hp6jllWgufDJgavbOAHjtMfP+NQ
 a0pwnbtGuY4evaPiMxYgpewUN1E0ihprQoevVup7Qd9BtB6QGFuqGBGMfk7Bg3te4fzQ
 k6YCWrjR33yz2lWOSG+KKKYlReMeUsXU1DR6R80PSWssQqjDi0kWzkYcgg1iabwObk5f
 ZzOvupeA3bIavL1RIhxinxXEfMs5zNjeUJ1DGmDQ7Hwmq2M3OiYAGFT5K53ZnNaSm9KQ
 LoseaXUNMwQm46qCT/Jp8OMQ7XtyFOjGerMIvMKWceqlUD/ZEuF++CwR1Vo8nTXb1ObG
 wtOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LNpzRmSB
Subject: Re: [Buildroot] [PATCH 1/1] package/libite: bump version to v2.5.3
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



On 08/04/2023 07:24, Joachim Wiberg wrote:
> Fixes, from https://github.com/troglobit/libite/releases/tag/v2.5.3
> 
>   - rsync() does not copy single files correctly
>   - copyfile() does not handle empty source files correctly (error)
>   - copyfile() does not properly create destination dir
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libite/libite.hash | 2 +-
>   package/libite/libite.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libite/libite.hash b/package/libite/libite.hash
> index 8b622d87a9..7dac198ab8 100644
> --- a/package/libite/libite.hash
> +++ b/package/libite/libite.hash
> @@ -1,5 +1,5 @@
>   # Upstream .sha256 from GitHub
> -sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5  libite-2.5.2.tar.xz
> +sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
>   
>   # Locally calculated
>   sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
> diff --git a/package/libite/libite.mk b/package/libite/libite.mk
> index 66a8253c62..1cef992e53 100644
> --- a/package/libite/libite.mk
> +++ b/package/libite/libite.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBITE_VERSION = 2.5.2
> +LIBITE_VERSION = 2.5.3
>   LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
>   LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
>   LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
