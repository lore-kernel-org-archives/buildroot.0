Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9A4C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECAFD60F0A;
	Mon, 13 Jun 2022 20:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpT9DToG0GlP; Mon, 13 Jun 2022 20:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B16160EF6;
	Mon, 13 Jun 2022 20:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D96E11BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F1941638
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyp1jzBdKjiD for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:23:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8BCE408BA
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:23:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id o7so13302868eja.1
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=AD8DpbsUJRCV/Ghm80UchHnOLxUR8kGrnI0ok9dh1EM=;
 b=bEmyCIFkx5nju/09j/+XMZqsM2VeIvI1/ziYrNEcGq1AEUdGFcDsmmb3ipLXxAfUqx
 06JyXl59g2ByvstsY8ViEY2qhmja1gkzauOqlWEpZyzZZAZvBpiz0tdytBBoFhT4giqN
 Ub85j9CrQz/n8HKsmiMybZ+36VgbQLnU1uOjRQm7Qc0/4xlQAE3c2OSsRPNEQbgCLYV+
 jdtr5ITpJoFrC3PJkPWJEdDOARlrXnsEBHfUYfwgwk26gUL7Esh/sm3Qdo0C1yGtloQM
 ra4TwWU0/4cRuj5ySyWfFvlOP5aIXFyoIcXrSMIrhPR31n4VJ4HU1aUk4/wo84/dbbWp
 RMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AD8DpbsUJRCV/Ghm80UchHnOLxUR8kGrnI0ok9dh1EM=;
 b=W0nLPemNVY+1miksuQDvFxCpwGm6sdzI7dnulBL2M5MO5kaYFxJHMmHzd/3y4GUq/l
 mZZL1r4zCBAPEo8u+8AFwq2o6XPf9b200STJHzcVJerSpeKkLhr/AujxxeZPqVpCK7d4
 HjZFG1TTpxq3cleBgxs4Bu9+XHDv7BLtEQVys50Y3/zmpOLxLcDXZ7zqdhY4I3z2RbP4
 rcUtFRa8g0DjO4ShvdUFLnaoP0AvnEKq6ITolBaleVIiF42cBkyybmAy/XSFIF2fU2bT
 NKWZZ5smz6mR29WW+yWMifeoHA2Iz8SEG71+jYOoOsyZftLm1K0E1blBKGDP5BZWKh0T
 1Lqw==
X-Gm-Message-State: AOAM531Sc6AL7fsRo2JtIujevrBAg3sEIj90SLeER8wy9ASEu/sPZz9T
 xwPGmDcWSocsyeXRiaAmZ5fQ5TFLZAa0mw==
X-Google-Smtp-Source: AGRyM1tgJ0VS5FfaQp3AaqwK3KizD1+jnTMOyKI6nQYPkHVmgPXiTkT/MhcXHfx6V7pIBhehhqF9bg==
X-Received: by 2002:a17:906:fcd1:b0:70a:a374:905c with SMTP id
 qx17-20020a170906fcd100b0070aa374905cmr1290113ejb.583.1655151833982; 
 Mon, 13 Jun 2022 13:23:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 lu33-20020a170906fae100b007041e969a8asm4214453ejb.97.2022.06.13.13.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:23:53 -0700 (PDT)
Message-ID: <9bdf5aa9-2d2e-1123-9b69-34e1c0b832b7@mind.be>
Date: Mon, 13 Jun 2022 22:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220609212824.2942413-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220609212824.2942413-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/luajit: add BR2_aarch64_be
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



On 09/06/2022 23:28, Fabrice Fontaine wrote:
> ARM64 big-endian is supported since
> https://github.com/LuaJIT/LuaJIT/commit/3143b218946395834f0bfef741061ac6ef3f5b56
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/luajit/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index d890d65b10..31e9e0243e 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>   	bool
> -	default y if BR2_arm || BR2_aarch64
> +	default y if BR2_arm || BR2_aarch64 || BR2_aarch64_be
>   	default y if BR2_i386 || BR2_x86_64
>   	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
>   		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
