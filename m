Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1000AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6FA60BD6;
	Sun, 25 Jun 2023 19:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6FA60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiTxM0BjCQfv; Sun, 25 Jun 2023 19:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E364960B0B;
	Sun, 25 Jun 2023 19:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E364960B0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 415981BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A20260B0B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A20260B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FX8QP8hrrPbw for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:10:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B1760ADE
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32B1760ADE
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:10:12 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-987341238aeso301905866b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720211; x=1690312211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a4zQInV2SsttoFLOUTGSGQC+pceG73vK3+d+L4W2bvA=;
 b=kxuZPq7XxWOp7iGmSJTsieE/ssYtDf+24iwdRpevdZH45xAN0hKbr0PyYw+ttl8Tya
 PSaFkZgvtzZGnXuqqiI0lWSR99l6VATuD4pzteTrSGWo1X1nM1E5libQ7gmkFYBpOISL
 OgSo3fCIqrRdTkxlO8hh/1rt7VxC5bV4OaHVOZl9hY/XEQEmMM8GHWuHFOlkECUXmaED
 yYS7osA43r/Irvrd6QE1tC9ZWKNWPRdIEArJcp/YMs4LOkvgwDk7FHXJqA8kt+/uyKc8
 WFrZxwTGsZ0qC2XLE7EvJU/DwnA/hvOZXAtF0QngKyAdAvyidjVr+Tgi1QogI1nzk8fR
 6vEw==
X-Gm-Message-State: AC+VfDyVQiWO0k888ascDHhW4hoL31R7N9Vsy8SaWPem5GAi7N8LDu0Q
 aawfdJ2Vl4lcNDloykGZx6giHA==
X-Google-Smtp-Source: ACHHUZ4vaIDd6JC3NTJ842/+cFIh485MQYT1qOp3KS70HyyBgRNl/3TDeMEdS0td3kfWSvJnonRqyQ==
X-Received: by 2002:a17:907:6292:b0:983:ba44:48af with SMTP id
 nd18-20020a170907629200b00983ba4448afmr25080472ejc.53.1687720211224; 
 Sun, 25 Jun 2023 12:10:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a50ff11000000b0051a4fcf7187sm1978439edu.62.2023.06.25.12.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:10:10 -0700 (PDT)
Message-ID: <81baeb2d-8816-cb62-8c34-14868d7543cf@mind.be>
Date: Sun, 25 Jun 2023 21:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230621160050.359493-1-bernd@kuhls.net>
In-Reply-To: <20230621160050.359493-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720211; x=1690312211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a4zQInV2SsttoFLOUTGSGQC+pceG73vK3+d+L4W2bvA=;
 b=NoQKsxFlJwumoqIJoc9rQZh8rPCIrIoip2SIKFQmL1aXvC4fw7cnAr0kWXn4WRnbhS
 1RJcxdfBc4W8u3wakh2ceosqC4iTrjLgsOE9P7gYi1FtJYgiIzc9gA+Lvg7Cm5BE9h6F
 9RXj/bj/agnxleWnxMbcOZowCeHz3IQb12Wg4NArLWGvnu7QQAMsZposGjJ0hwj0WsV1
 i0kfiS8N7Rp9NK93kgeKboka97bfuxNqcnT4tnmm+Vq0e0WsKRLurpgqa8XKv4Vpvqgo
 2a3ASJly1qeHdHWL7tJIs/OzMdEz3X7P8t/bZzMMmzSqzHtdpwX0LVATle/dj4S1Kuh0
 0HbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NoQKsxFl
Subject: Re: [Buildroot] [PATCH 1/2] package/gupnp: fix build with newer
 versions of libxml
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2023 18:00, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b26/b267c4137edebc504757b6275824c748cce3d894/
> 
> ../libgupnp/gupnp-service.c:1005:9: error: 'xmlRecoverMemory' is deprecated [-Werror=deprecated-declarations]
> 
> libxml2 deprecated the function xmlRecoverMemory with commit
> https://github.com/GNOME/libxml2/commit/51035c539edf67de93ced3cf037bb1f2b298e526
> first included in versions 2.11.0. Buildroot bumped libxml2 to the 2.11
> branch with commit dfe1ca7872a45bcdc825ff0900d7fd929097a635.
> 
> Instead of backporting an upstream fix [1] from the master branch to the

  Why? It's not as if the patch is big.

  The advantage of backporting the patch is that it gets cleaned up 
"automatically" when the version is bumped. With the -Werror modification, we 
have to remember to remove that again when the version is bumped.

> gupnp-1.4 branch we follow the Gentoo way [2][3] to disable
> -Werror=deprecated-declarations in meson.build to prevent future build
> errors.

  If this is the answer to the "why", I'm not convinced. It's just pushing the 
issue forward...

  Regards,
  Arnout

> 
> [1] https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d
> [2] https://bugs.gentoo.org/907384
> [3] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=ba8214a9700716349d8d7a3c8543889ced116c3d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/gupnp/gupnp.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index f41f26d2dd..da04eae682 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -15,6 +15,12 @@ GUPNP_INSTALL_STAGING = YES
>   GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
>   GUPNP_CONF_OPTS = -Dexamples=false
>   
> +# prevents build errors with newer versions of libxml
> +define GUPNP_REMOVE_DEPRECATED_DECLARATIONS
> +	$(SED) '/-Werror=deprecated-declarations/d' $(@D)/meson.build
> +endef
> +GUPNP_POST_PATCH_HOOKS += GUPNP_REMOVE_DEPRECATED_DECLARATIONS
> +
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   GUPNP_CONF_OPTS += -Dintrospection=true -Dvapi=true
>   GUPNP_DEPENDENCIES += host-vala gobject-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
