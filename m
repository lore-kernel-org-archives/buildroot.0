Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A42C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A618940ABD;
	Thu, 21 Apr 2022 19:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxutOSUNW3VQ; Thu, 21 Apr 2022 19:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C0B240A8A;
	Thu, 21 Apr 2022 19:10:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9212D1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FEEF607F0
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrYQJjxc4AfJ for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:10:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70FC46F5E9
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:10:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ks6so12000621ejb.1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zpDaN/iS/FnG0CdEXRTfv6F73PHQS5BPKhNXKIUbHQk=;
 b=GkeugdsdzSHNRj4stcvefzdbjDPKWhe+I3SAoBoYPyQCF8hOcVRQXgIwrkHBrTx5ZJ
 DH6apc2I5x5gcef8nlGfxedSUj5ljZsv2XaVlXOeUaOzkXkrUmUnq5hpFRVeVcpQhNwh
 DnzcR5TC4cZn2JSqELepn7C0A9AOh6Un7nqbITLzYWPe536fSqijnCeQdkXjfsh8dBIL
 PRxsIqhU/nOXsXMZBFIbpm8nHKBgBei7GowcqrcLfNSsb50vTxQEoAe3SeL1tMay5RIE
 ltZvrZL7Dk4tNaVFFJ9KMVUy2XIK3G5dyOTgh6q2avGmiSeZC+XuwDdxGqOz2kQkY6vK
 2+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zpDaN/iS/FnG0CdEXRTfv6F73PHQS5BPKhNXKIUbHQk=;
 b=O+6zactlSNnu0wKdY2PVJ9NtQloMIMPW4aynbpe8aiavLbbszBjP8ifIYiA8a+7gF6
 xg4FeiKhD4AJyfsJsQ+B4iba8g4PdTiXLnvi6QXSEhE9Fcqpls8fS6vlDhkqz2tvUsjw
 T/djEFqrPu0K/TU2YTZNEgeSvT6TnSasGXtOAzvmlgzy2GIOHGYNZFbN3p5JFyzyqDAg
 IpmxB9/X7g6VyoJJhNww0/Y2wXqmiCLl/NeN/oVOkHSx+X0YELvexnFJlaJbAafb5Gbw
 48n9KMFvS4GnPsY+LwWv3aBcHc9i2f0VyDwjiLjvZSv7n04RCH6kaUWc1ZRYg0+BVAxk
 Wh/w==
X-Gm-Message-State: AOAM531ywJQM30JwfXv7yuObGaOzemt5J9UE25AsjkdevAL5eK5GxlM5
 EsIEhbh8qq7+nDZlgUT0pRTggg==
X-Google-Smtp-Source: ABdhPJzzODW2jQd/636hTX46+dg+NS2Hfy2cH3a6Eei8HivP+7hUITWqiqEHAU+GsSCcxIrzNQ3tDg==
X-Received: by 2002:a17:906:6a0f:b0:6f0:1d08:3640 with SMTP id
 qw15-20020a1709066a0f00b006f01d083640mr913316ejc.264.1650568210623; 
 Thu, 21 Apr 2022 12:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b006d5eca5c9cfsm8122576ejo.191.2022.04.21.12.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:10:10 -0700 (PDT)
Message-ID: <93748e61-33c1-20b1-2eb0-7d669962b752@mind.be>
Date: Thu, 21 Apr 2022 21:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416145712.1956653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416145712.1956653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: fix build
 without threads
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



On 16/04/2022 16:57, Fabrice Fontaine wrote:
> Fix the following build failure without threads raised since bump to
> version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
> https://github.com/warmcat/libwebsockets/commit/8eca7e17f27c8588170c5fa5fa3e6b14eb90e35d:
> 
> In file included from /nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-caps.c:28:
> /nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:68:11: fatal error: pthread.h: No such file or directory
>     68 |  #include <pthread.h>
>        |           ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5d011b65e530339eb3f4d06a08caabc6a73b403b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libwebsockets/libwebsockets.mk | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index ea483bf58b..b05418e86d 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -21,9 +21,13 @@ LIBWEBSOCKETS_CONF_OPTS = \
>   # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
>   # amount of pthread mutex code is built into the library.
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> -LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=1
> +LIBWEBSOCKETS_CONF_OPTS += \
> +	-DLWS_MAX_SMP=1 \
> +	-DLWS_WITH_SYS_SMD=OFF
>   else
> -LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=
> +LIBWEBSOCKETS_CONF_OPTS += \
> +	-DLWS_MAX_SMP= \
> +	-DLWS_WITH_SYS_SMD=ON
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
