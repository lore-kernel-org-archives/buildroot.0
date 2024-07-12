Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB78C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852578133D;
	Fri, 12 Jul 2024 08:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95jwSj9pLrDG; Fri, 12 Jul 2024 08:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E9181354
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E9181354;
	Fri, 12 Jul 2024 08:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD4EB1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A95D81354
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USSmZW6XjnCd for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 921A38133D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 921A38133D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 921A38133D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:44:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso1120545f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720773880; x=1721378680;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JY5zVysvuMcGo2R3MrLeL2I0YO3YFI6e5eO0ym9jXOM=;
 b=mqY/HTD9t3nUmi+nUnC/goXrbUXZWehZ/rCLYx39bBgFmKUuVgCfOY7H3Xr/uqUiDO
 Q7I/KkfTm2Yq17njdQQA8SMt7yTLVjPk3ubYZzh6V/z36ncBEoT62FQ40fBucP2mYG05
 wS1RzRUuabCDSepZbwAH1qGLux/k2X5N5LENh3M0WBks+jy1xX9Kt5q9/7ncWdq4J9ty
 DT/gi7UBT7LLo9psrdszZPNj4VlnM/zp8iqawgN7Xn7SL90fW/CQjEtMuNeZ7d+3nXp8
 VM1vYVCeBrvRdhodHvfX02o+x73dwX84+5Y1yEDz/A1Tl9GaVuIAchyYYzk99MVLl0Y0
 yNFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUruXTV4vbs80CMWzXkO4OoWpeJJtZWgNNUjvPM1FwxUAoOYNMNhgP0+6AzpmNfe0lsVLRIRw2ZBVouC5BxrNZU5skHQP/hBw==
X-Gm-Message-State: AOJu0YzthSfItsimLuk7VVfOgNTojmzLefuFOzD9IIKCBeK3G/2hZSK3
 WotvZ6VdXp5xw2lM6TEhj3LnLKxJH6wco3qU9ydtV0xhot7vs41TVsY6WYZ0DWA=
X-Google-Smtp-Source: AGHT+IGxbQDn8bPtROLpecqYwKw0wKDP+iyBT6R5IcihjK69v/Mw7kZ65TMX3J70HBYwPDDmqDv6TA==
X-Received: by 2002:a05:6000:188f:b0:362:ccb1:791f with SMTP id
 ffacd0b85a97d-36804e9df8emr1150152f8f.10.1720773880434; 
 Fri, 12 Jul 2024 01:44:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36807af9a99sm127646f8f.117.2024.07.12.01.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 01:44:40 -0700 (PDT)
Message-ID: <d5d058a6-5ce9-4fd7-9d8c-4f8961744307@mind.be>
Date: Fri, 12 Jul 2024 10:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-3-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240704123452.3535612-3-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720773880; x=1721378680; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JY5zVysvuMcGo2R3MrLeL2I0YO3YFI6e5eO0ym9jXOM=;
 b=b9HDG/21qMcIk6LmJfrVHDbJVoZBclDBKdgUrH+xKC2AwhObXWGevj2RE+WmGrtYwa
 iDqUyIJfe9Wyo+vTABa6sCDfGof0yYYPaNsUDw2jIa1wwp6+eMaWbYr/e27ZgENo/wMt
 VCmijPbGzbN3pTWpc+Q20VpUJzaCoeTu0MvPRQFgoItM4VBTczuOXQxDeTYQiyTwAxQR
 seFpCqpn14eLApuHSqrMgAohr4Qd8NncWS3+iDQgDnQWwDDINWZND6IduLg/qeXsFX+y
 OQZxYdI04XqH2Y05H1MgsH1VScS0B1IxqHERrzPKUhct1T9ZbuOWT8QO+DgOtVwzaVjo
 3Wkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b9HDG/21
Subject: Re: [Buildroot] [PATCH v3 2/3] package/xxhash: add host support
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/07/2024 14:34, Heiko Thiery wrote:
> The host support is required for ccmake
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>   package/xxhash/xxhash.mk | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
> index 7708ba1e19..97bb2ca722 100644
> --- a/package/xxhash/xxhash.mk
> +++ b/package/xxhash/xxhash.mk
> @@ -15,6 +15,10 @@ XXHASH_INSTALL_TARGETS = \
>   	install_libxxhash.includes \
>   	install_libxxhash.pc \
>   	install_xxhsum
> +HOST_XXHASH_INSTALL_TARGETS = \
> +	install_libxxhash \
> +	install_libxxhash.includes \
> +	install_libxxhash.pc

  I think we only need these separate install targets because for the target we 
need to handle shared/static libs. For the host, we don't care, so we can just 
use 'make install' I think.

>   
>   ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>   XXHASH_TARGETS += libxxhash.a
> @@ -41,4 +45,18 @@ define XXHASH_INSTALL_TARGET_CMDS
>   		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
>   endef
>   
> +# we are a ccache dependency, so we can't use ccache
> +HOST_XXHASH_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
> +HOST_XXHASH_OPTS += DESTDIR=$(HOST_DIR) PREFIX=/usr

  For host installation, there should be no DESTDIR and it should be 
PREFIX=$(HOST_DIR) (without /usr).

  Regards,
  Arnout

> +
> +define HOST_XXHASH_BUILD_CMDS
> +	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D)
> +endef
> +
> +define HOST_XXHASH_INSTALL_CMDS
> +	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D) \
> +		$(HOST_XXHASH_INSTALL_TARGETS)
> +endef
> +
>   $(eval $(generic-package))
> +$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
