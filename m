Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41278C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0156F83F2A;
	Mon,  6 Jun 2022 12:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2_ouIqaW4vi; Mon,  6 Jun 2022 12:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149238305C;
	Mon,  6 Jun 2022 12:45:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF9CF1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE8E960BCA
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fciM9qk644B for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:45:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC36F60ACB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:45:52 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fu3so27241486ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/b7UmR0nghbzGsxlvhW50kN7WNxclXeHORNzVyzk6kc=;
 b=cqA3Oi+B7nMRu/2qLa4E9Qd6g8NLVjC8RzCA//TE6LR+GgpBPdSuPmMkWZ6ZEqm/8e
 s/OrNtnjlu/pqTzToROzxE0GjkU32gUGl6BOqN3pUHzcrenZCtl/a2pMj/oo7iNcEf8x
 uu8c3+oM4hxqzHl8NG1gPX4HfpwYLrP7bfYmVDJh3ciqS0MtsCAWxjKAddyOOZIr817M
 R9pbxJ3qkVP7R7a0hkcM8FcCY0LnoitcysTopRFfiBD2SrVXWGH0KbkSsQ6G23gRuR9c
 uYWuvlLHL5DWozBuvyj0mB69aJJQIqd5OHrez8Oj3YrNZt/7asjvuXRcQEf+8hNp3x4x
 gyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/b7UmR0nghbzGsxlvhW50kN7WNxclXeHORNzVyzk6kc=;
 b=nfbzR3QJrJ4jYEVdD3ykgj5eDrGfytSsaZXZ8wrYXHagGeAPSxqv1cFSlNcrjkx5VP
 X8eaml7F7crQcW133d6z8ufWVht2ErGeqUJDEBFsQ1YejOkoRPSfG9II43IUP71937z1
 PE8StlUyzAA/uQX+pehEctA33jDNNqLO7g+RstADCsEt9PRRhlp8ZyyzxNpMrF8eTxiQ
 w/ee4RlIPxkIoHTB8K8ZIH5UzX0/EV70Z81s1ShfzGd1aZUXzZexlg1oG6g6Zs3urNKW
 bVSZio/9MOpr4KEmxeRrqoP6eyl+FWKhhgF8UvvjNQdPERchFpbALHDxLwyM7anxFz5O
 PKhw==
X-Gm-Message-State: AOAM530J7mhI1XBpvjf3hnqMrVGdmhpzJWXtuXVXY281HppidqHvvJoJ
 IAFSCLXSyNkhCvby7+mHeEMYsR9twQ0EYg==
X-Google-Smtp-Source: ABdhPJxCfBVb+NHgkbha3/S0HaKzeqW+PEmRwj6+uaeS10bDUp3zAfs+UkrfS/6mf27dmePKidPO6A==
X-Received: by 2002:a17:907:8330:b0:711:cfc4:3a3e with SMTP id
 mq48-20020a170907833000b00711cfc43a3emr4461407ejc.483.1654519550819; 
 Mon, 06 Jun 2022 05:45:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fg16-20020a1709069c5000b006fe8d8c54a7sm6283156ejc.87.2022.06.06.05.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 05:45:50 -0700 (PDT)
Message-ID: <19fedf90-9c79-bc27-81a9-b23c790942fb@mind.be>
Date: Mon, 6 Jun 2022 14:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220602162449.4160788-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220602162449.4160788-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: put back
 libuuid dependency
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



On 02/06/2022 18:24, Fabrice Fontaine wrote:
> Commit 8b47feff2ff8ac37355431cb0414822da2c87ea1 wrongly removed libuuid
> dependency resulting in the following build failure:
> 
> checking for UUID... no
> configure: error: Package requirements (uuid) were not met:
> 
> Package 'uuid', required by 'virtual:world', not found
> 
> It should be noted that <uuid/uuid.h> is still used in one example:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/examples/C/glib/add-connection-gdbus.c#L17
> as stated in
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b:
> 
> "We still require libuuid for building, because it is used by an example
> program. Maybe that should be changed, to avoid the build dependency.
> But that can be done at a later time."
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ac25c42d73161bf4cdfae3e53de8826f0b8dbf9c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/network-manager/Config.in          | 2 ++
>   package/network-manager/network-manager.mk | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 1370c81c9c..39114daf18 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -13,6 +13,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
>   	select BR2_PACKAGE_GNUTLS
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_LIBNDP
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   	help
>   	  NetworkManager is a set of co-operative tools that make
>   	  networking simple and straightforward. Whether WiFi, wired,
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 81d6eedf0f..3c39ce7d6d 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
>   NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> -	host-intltool libndp
> +	host-intltool libndp util-linux
>   NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>   NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
>   NETWORK_MANAGER_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
