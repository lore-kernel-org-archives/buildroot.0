Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F70EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA6641550;
	Mon, 19 Jun 2023 19:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA6641550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suaytcADXQEG; Mon, 19 Jun 2023 19:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89514116F;
	Mon, 19 Jun 2023 19:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89514116F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5844C1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 304EA410A3
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304EA410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTFHUuR04GEO for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:39:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C45240988
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C45240988
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:39:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso261643666b.0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203553; x=1689795553;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZTc4C+wDHc3D7u0Ui7Vbr5RB46eTyym8ZNo9pNtoIw=;
 b=ddBK9AyIme7GgCUkaldnvV/l+F84AIS/RZ1TkHmOoNrqL97mU54zTbIfAq4wdhJoDU
 d0aUvyrSS+tLi+9L8BTvuSnAQLvFkcmH2gqXenxsUIQ9rJOtXfAxuN6hA4s44oEekCM/
 NuZBE8v2al7yXTjh5GneefOoH3GVfNZnAdkU+NTlKmbUxaQuKfzH0jzSQEuvRucRQ/w5
 OrrwyTnmROFFc0C6cLMP6S70tVH03+2J+meu/tFBPYDKT9bsdgk1SMsZAVTGQTWztbxM
 Acbm2TOsmMYFk8tFwj3CFys25bL3w9ALOeEiaFH3K+jxLhJBvL68gRay5HXbNIjnLRET
 A6LA==
X-Gm-Message-State: AC+VfDz6Z8S87XUKm3cMD8U8sZQqbmCzUqRua44qmbNYrOUroZIY97UB
 wBZ/NazDXx+p1GYFh//PtJV4b+h1ZlYBY0t39t4=
X-Google-Smtp-Source: ACHHUZ7H190gAGu+SmAjAvMqSIJou4uZB0ajMA5zLJfnnFsp+CjvnNjgVlVtzPM69xBL3tgU6egFxQ==
X-Received: by 2002:a17:907:802:b0:974:fb94:8067 with SMTP id
 wv2-20020a170907080200b00974fb948067mr15628702ejb.23.1687203552994; 
 Mon, 19 Jun 2023 12:39:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a1709063e8800b009534211cc97sm104223ejj.159.2023.06.19.12.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:39:12 -0700 (PDT)
Message-ID: <89b7d939-129e-70fc-a89f-347688181b6a@mind.be>
Date: Mon, 19 Jun 2023 21:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20230614144202.21459-1-fl@n621.de>
In-Reply-To: <20230614144202.21459-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203553; x=1689795553;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CZTc4C+wDHc3D7u0Ui7Vbr5RB46eTyym8ZNo9pNtoIw=;
 b=Xaxq8+NWnSOJeY0/vG/5VgMNyBo84SVMc3WaOLNrTVsRY++oIQieP+DRs+JUeFqvc1
 xjPfgrK6DjJqpe6ewHHph/MmbfyDamqe5ILkpEOdRfstWjKP3P277JF6jhNGjYTJdj4c
 E/A+vkhPE80UrIeg+aQdeb0hbMEdg/gkK3ge4aLICfbvA28uul9ZP6T6W/L3mb/C/U4I
 zwaGnsdP2r375QtbXhwSQBxsfMzjAqslcTQq2kr/BA9vRw9eYo+f6bUr3tixuCHzXVFh
 K1fqrOWYwfb646bFaKk1mj61AjS/LDl8hCh4ewwPux6Np1xaDzLZaOJjBqw5dc7ZOiI+
 o8ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xaxq8+NW
Subject: Re: [Buildroot] [PATCH 1/1] linux: make kconfig depend on host-make
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/06/2023 16:42, Florian Larysch wrote:
> Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
> $(BR2_MAKE). However, this also implicitly sets LINUX_KCONFIG_MAKE.
> 
> Thus, when host-make is being used in a build that has
> PER_PACKAGE_DIRECTORIES enabled, the dotconfig step will try to use the
> make instance from the host directory, but since it is not listed in
> LINUX_KCONFIG_DEPENDENCIES, it won't be available yet at that point in
> time.
> 
> Add an explicit dependency to LINUX_KCONFIG_DEPENDENCIES to have it
> copied over early enough.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index cc36b5251d..1c4fe45ac9 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -88,7 +88,8 @@ LINUX_DEPENDENCIES += \
>   # only if the host does not have them.
>   LINUX_KCONFIG_DEPENDENCIES = \
>   	$(BR2_BISON_HOST_DEPENDENCY) \
> -	$(BR2_FLEX_HOST_DEPENDENCY)
> +	$(BR2_FLEX_HOST_DEPENDENCY) \
> +	$(BR2_MAKE_HOST_DEPENDENCY)
>   
>   # Starting with 4.18, the kconfig in the kernel calls the
>   # cross-compiler to check its capabilities. So we need the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
