Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E73C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62DA940189;
	Sun, 27 Mar 2022 15:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INgKbHhR6fid; Sun, 27 Mar 2022 15:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39CE440179;
	Sun, 27 Mar 2022 15:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C02B1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 996DD81AF5
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjyL6Lgck9tc for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9473981ADE
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:36:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lr4so15567035ejb.11
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=d3y3Oh5mysMspo0VZ4T9Ogg0VwrRXHdTmjKOu2VRkMs=;
 b=X3ko6zZ4KGwgpov3cv4UsRE0/CNaaV12Hd3cbBORCZP/qb0uoWcCW8DiLFKpvR2lam
 X2fs2YYxreth7XloLdgnK6OibdNvxO24mqRcPe9XSaKLfnvG/tl58YcRDn3Y5UJ9YL/m
 EtIzt7CQlnBTkBVtC2kFHTZeLsIbtlaFBfl1JN2zNYY6tb000NqDxPpcJ2xkbgwMP63R
 ERKQQsvprJolNOTdrpCyGdTjui3rWEzIQIdSASZ7TB1yL96Vpp3vk7YJs2jdo3iffiuX
 a5DmjcYvNLTtMjrV9ekMN9egnkHXr+RSbl4nTfAjuqzwdcEJmqPQp9FgH41ly38UKCf/
 flRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d3y3Oh5mysMspo0VZ4T9Ogg0VwrRXHdTmjKOu2VRkMs=;
 b=8IyFqlYiGoMUea6lCfwv1Bd/evRfdKI3JfwsJt3qiFFi7tpdtrcuwos36pK68K8Shz
 zazF3ZX+dqMTzO8KaLouc9uZtivTwtWXZn0OHoTFQDcc95eDe7dEw4uMceJQHBwAh9hX
 2nYnRyd+JD2O0UeHoFigbKPwluELDbF61XLvXc3TvVi7LCJV+KB+Fk7PAw8Qj5jPk+7f
 q8TCylR6UkbXh+6eOZ8PUglYleghQdoZq7Zb+JXmqDSMyYn5ejpBk0Yon6OcOL27qHQI
 1rT9TC5qRPMsDFHhPuHluA7Te941y9UHyS3KtUgMJgkXZGs4Nl6BFjIkx0Cf8I02IqdL
 5WFw==
X-Gm-Message-State: AOAM533w+SdnmoBFRBYfvmuMj4FRmjguSyOiyb5iSjO/TMl0OeQ7OBA7
 QZHVtZ01YTer1AwsbDMStiPi+QAfZoXhzQ==
X-Google-Smtp-Source: ABdhPJyPJi0s6gNNltX2lZze/vLhAlj5HaBXGy9SCaQz3n2eyhLpuO1ca/lF3UQdwOz+CDCaVseYFA==
X-Received: by 2002:a17:907:1c99:b0:6e0:cd77:9b2c with SMTP id
 nb25-20020a1709071c9900b006e0cd779b2cmr9207550ejc.288.1648395389833; 
 Sun, 27 Mar 2022 08:36:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm5870325edb.32.2022.03.27.08.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:36:29 -0700 (PDT)
Message-ID: <e237cad0-a15a-2469-92c4-4b757d9f0755@mind.be>
Date: Sun, 27 Mar 2022 17:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220318082446.18552-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318082446.18552-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/spidev_test: fix
 spidev_test.c version in Config.in help text
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



On 18/03/2022 09:24, Peter Seiderer wrote:
> - fix spidev_test.c version in Config.in help text, version update to 4.10
>    (missing from commit 'spidev_test: bump to version in Linux 4.10' [1])
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/spidev_test/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
> index 44990c66b6..2f3fcf4090 100644
> --- a/package/spidev_test/Config.in
> +++ b/package/spidev_test/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
>   	  proper operation of 'spidev_test'.
>   
>   	  The version used is based on your toolchain headers version,
> -	  if it's older than 3.15 then 3.0 is used, otherwise 3.15
> +	  if it's older than 3.15 then 3.0 is used, otherwise 4.10

  There was an EOL whitespace here (which gets removed again in the next 
commit). Not a big deal, but annoying for me because I automatically run 
check-package on each individual commit.

  Anyway, both applied to master, thanks.

  Regards,
  Arnout

>   	  is used.
>   	  This means you won't have quad-pumped SPI support if your
>   	  toolchain is too old.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
