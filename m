Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C377EC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7177F4112F;
	Mon, 17 Feb 2025 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfnJRlQcQLag; Mon, 17 Feb 2025 21:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 518AB410E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 518AB410E4;
	Mon, 17 Feb 2025 21:19:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 934FBC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 813BE80F6C
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABKcW3_RXb_Z for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 21:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CACD80E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CACD80E87
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CACD80E87
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 21:19:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4395a06cf43so29857935e9.2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739827187; x=1740431987;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yrkMhjx9WW7Bbo0Bd3U+POpnpmjs0gh72oO9YLMfM38=;
 b=aMXNSSIefTii2ai7LKffDqRU2073hey3NgWkyqqD0l/gcnUjL9zU26B5kKTjBgFFGR
 sr3JitHkNuTLTY5my7zPyE62hWIs5kc5TBA0mUvqVFs+MT9gBSJRCb/1JbRPY9k1noKv
 qRk06IeEK37IOcZkUODW7jNVYqKUl5lw8/UTyzhQamXdalWBpjRHPK0uYoEz4mMIxnoo
 mj6pefKhCKvcUkcqceh9lE+x2LGybxFLVp5/QJggdvkCM2d4GsdsEFQMuYRXYd2hFbVR
 3h/LBHk87+kDUC2uJTQ8mJw/KphrhRDmgVP4EnlqHjhgmgGc+MI8w1O9L8PXkgPvOkDm
 DTjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfFFMu2lOniwp44Ezs+3ajtaLppcRwiovJEWEY3GHy1P6TRpkJ+Qg/CLguu+loF0unccpO4oHrQ20=@buildroot.org
X-Gm-Message-State: AOJu0Yx6MHFafZhL9pKV0FhG5Nax7GYHZWLvqXy0TSiLrVLcuGDGlm/A
 tTRp7afxYsi2rGjvPyzDw0EeHvLGo6AoRmL3ZAR6lDPu1aTKWjDtmmRMMc+p670=
X-Gm-Gg: ASbGncvy/pP4v/KD/DPWzWPOPyl4cLzfWUiRp9pYBYHn0xAVdf5vLfLCKCG+o5rMxNj
 rUm9o3AN0Y21XxwqehZcGOsDS7gX7Af8Tbd8Ly3FoGHF3nSDm70274tXxQVkVi2S4b/ZYp+1knY
 Xx2PwBruDHs9i691h5CJ7kx8FWygQU1QgD7kWbfbElqzz5wSQ3DDh2INRpE7gDWE/bvbvj3rxT0
 46yD/J/jYI3Ggs3VqIDhLdfYIWwa1uzhjgzrVUJyR7vSjw6DUWiujuxwUl4B9WcjKmpGWK1bygi
 OHiiuG+auFToUfFaYDpK3j2MODh2DytmWhf6aFX+t9vzmktChnNBgBQ3xs9INAfgbx61O0pP2E4
 2f7hirlBi4oD7BzH8922DyY3KLpSNvHi2gjP7nOqYg92jgg==
X-Google-Smtp-Source: AGHT+IEzsPXuWssD4QnmOeb5xgL64fCCRnyOuQOmEagHnY4x3tQ56gLJElSr9CO6X9uMtX8WvpvMmg==
X-Received: by 2002:a05:600c:1c01:b0:439:5b36:b4e7 with SMTP id
 5b1f17b1804b1-4396e6ead58mr86788235e9.9.1739827186897; 
 Mon, 17 Feb 2025 13:19:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f23asm161912525e9.7.2025.02.17.13.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 13:19:45 -0800 (PST)
Message-ID: <940016c1-23aa-4a59-a168-dcc6ac5e144f@mind.be>
Date: Mon, 17 Feb 2025 22:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
 <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
 <8e84d75f-32f7-4095-80f9-0c1279d3ab10@mind.be>
 <SA1PR12MB561507917041F98A96EC4044F0FB2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB561507917041F98A96EC4044F0FB2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739827187; x=1740431987; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yrkMhjx9WW7Bbo0Bd3U+POpnpmjs0gh72oO9YLMfM38=;
 b=KJq9nECR8cmkHYxgHZXSsGo0cpMLMTLtp81eIJL31pg6eokc/cAM0h0EfmrPJGEHFu
 jjUuVg3KSp7kKFbB/52gxdPyOhjKxNwf5+/oa9JALiu8lgtHY9WNZj6LgVyEaaEBb7YY
 pOycUS5yZLoH0m4T/a1qpGreCbfeDmRgLLNCUTFwvRBkXCkLYk6wrn8P9iRLcpyrCJsh
 0GIFR19ZK9B2JmvQ33ShtwhO+Z3Ytww+uf8vPSNosvgT6c9Sq2RL67/cMJ7H8iwFEux4
 RDrUp9AHChHS+a6yBnLGvQz6nJL/gyYa4VxYhgCkaJ0kBrflOY+7+YLUd4ZAIi5IVyob
 /E+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KJq9nECR
Subject: Re: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 17/02/2025 12:14, Frager, Neal wrote:
> CFLAGS and LDFLAGS are already defined as part of HOST_CONFIGURE_OPTS.
> Is this always the case?  And are they always the same path definitions?
> 
>  From what I am seeing, I believe we can do the following with the autotools
> infrastructure.
> 
> pkg-autotools.mk:
> 
> define $(2)_CONFIGURE_CMDS
> 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
> 	$$(HOST_CONFIGURE_OPTS) \
> -	CFLAGS="$$(HOST_CFLAGS)" \
> -	LDFLAGS="$$(HOST_LDFLAGS)" \
> 	$$($$(PKG)_CONF_ENV) \
> 	CONFIG_SITE=/dev/null \
> 	./configure \
> 
> Could you verify this?

  Indeed! This redundancy was introduced by Thomas 15 years ago in commit 
b07030a708293756e25edd6432ed02cc53ff758e. Before that, HOST_CONFIGURE_OPTS defined

CC="$(HOSTCC) $(HOST_CFLAGS)"

which is not actually sufficient in many cases because configure wants to parse 
and interpret CFLAGS... So an additional CFLAGS=... had to be added in the 
configure call.

So yes, please remove that redundancy!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
