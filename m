Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB3CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0424B83FEA;
	Fri, 12 Jul 2024 08:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbvXcjZBANeC; Fri, 12 Jul 2024 08:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC940845D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC940845D2;
	Fri, 12 Jul 2024 08:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 804161BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D00C845D2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNjgpTTSONog for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BCAA83FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BCAA83FEA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BCAA83FEA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:38:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso12868635e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720773516; x=1721378316;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=shVs8VnPxEVcVKEYZ/pxvp4p5mrVZo6DgwknUayTDCI=;
 b=EJNgNVUTT1sNF9sg0zead38GFB3DGAYPiRFHxTu+/100whX/0h55wHCxxIx/6tqTEO
 jDc1ao3CQOgK6MbIwpmtTfyUsPGryGbyYPZxwzq8KqRdjw/APW+FCEwSSSJK4XCLoOLg
 yuHQaGHtGFOLZ4n5hWzyF9MIRjCwOIpyjaTXFMMCuuZwWlhS8cpImcSL/Q7gTWm6Llcx
 jxTn5U5z7m7gMzLtPmC698AXb4ksuepTQ80eHJi0rzAxrIQfMv7qoRFRetJB4YV4fT1+
 uWb2YbUkxf7mPRFwbLHA4VFDdFxh0iVDobkI2HeH+MvPhrwQOPImkqsH/2SgF/zl782I
 ooCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl2EJdbMhISvOI0PJjFOY6JcOCAQk6h1pGHGIt/l4eDezI3Zc5/pcRRHEFtfCg6QTQol7Lr2qC1nDE4D9WWoJg050CFWB/bA==
X-Gm-Message-State: AOJu0YyvRZLjYRlPZIAJlRGrqe7cUL9EIqSWg9Za6gMiJzdemm2jvn0a
 2qjMVx7TtesdgFbmc49ZXAZtEbIVIhjHo5RiQGr6beFPmzOChxE/s5WzOywZAiM=
X-Google-Smtp-Source: AGHT+IELmqR42vWH55g2L81rh1sPKIMr6QPXr+7HijAPnKWsbECR3DScyJ8rpqMVTBoj2JN1vkZ8GA==
X-Received: by 2002:a05:600c:5349:b0:426:6861:a1ab with SMTP id
 5b1f17b1804b1-426708f19a9mr68123945e9.39.1720773516539; 
 Fri, 12 Jul 2024 01:38:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25a962sm15025465e9.12.2024.07.12.01.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 01:38:36 -0700 (PDT)
Message-ID: <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
Date: Fri, 12 Jul 2024 10:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240704123452.3535612-2-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720773516; x=1721378316; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=shVs8VnPxEVcVKEYZ/pxvp4p5mrVZo6DgwknUayTDCI=;
 b=Vv2s0PDcTcS7KRwasgqGmJQZiCybSeu/xIMyo9LEeGf6eEjDDAD75bcm5GQYhMJjEb
 TUt4XEPIQoCviIGUAXE9OryEdsZfNJueHBXOHsZ2XKRBtwB1Rxc9hR4TdPnuHSRhu85D
 IZUHFPIA/A39c/e1AALXg3hDwfGMYkPjuyOEEj4mhj6V9wBH0RbbWr/4urba9zEY2gBN
 CjeXU7HdfSfhSagGtYaj1BBws4QV94lFBKnEaULidXMqZ3sDwR8v/4StJboIBtL/kYkr
 kWdKoX8f3VCxx9DB9TWe6uLoIF/qzkBi3MW6uLPOfky9v/JCw8tlilvjuip5fYZJ/OLD
 TfhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vv2s0PDc
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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

  Hi Heiko,

On 04/07/2024 14:34, Heiko Thiery wrote:
> This package is used and required for ccache update.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> 
> v2:
>      - on change
> 
> v3:
>      - fix BLAKE3_LICENSE_FILES and corresponding hash values
> 
> 
>   DEVELOPERS                 |  1 +
>   package/blake3/blake3.hash |  3 +++
>   package/blake3/blake3.mk   | 20 ++++++++++++++++++++
>   3 files changed, 24 insertions(+)
>   create mode 100644 package/blake3/blake3.hash
>   create mode 100644 package/blake3/blake3.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 90d1a111ab..46fe3cd2e1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1359,6 +1359,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
>   F:	configs/kontron_smarc_sal28_defconfig
>   F:	configs/kontron_pitx_imx8m_defconfig
>   F:	package/altera-stapl/
> +F:	package/blake3/
>   F:	package/ipmitool/
>   F:	package/libnetconf2/
>   F:	package/libyang/
> diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
> new file mode 100644
> index 0000000000..2a00d19b02
> --- /dev/null
> +++ b/package/blake3/blake3.hash
> @@ -0,0 +1,3 @@
> +# sha256 computed locally
> +sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
> +sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
> diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
> new file mode 100644
> index 0000000000..76e4e32e7a
> --- /dev/null
> +++ b/package/blake3/blake3.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# blake3
> +#
> +################################################################################
> +
> +BLAKE3_VERSION = 1.5.1
> +BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))

  Why do you put the refs/tags here? It was necessary in one or two packages 
because of a conflict with a branch name, but I don't think that's the case 
here. I admit that there's a certain elegance to making it explicit that we want 
a tag, but then we really should be doing that everywhere...


> +BLAKE3_SUBDIR = c
> +BLAKE3_LICENSE = Apache-2.0, CC0-1.0
> +BLAKE3_LICENSE_FILES = LICENSE
> +
> +# We may be a ccache dependency, so we can't use ccache; reset the
> +# options set by the cmake infra.
> +HOST_BLAKE3_CONF_OPTS += \
> +	-DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \

  Why is this needed? And is it even a good idea? In pkg-cmake, this is defined 
as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any 
ccache. In fact, this changes it from "as" to "gcc" which I expect is not 
correct at all...

  Since you said you could respin this weekend, I will mark as Changes 
Requested, but it's possible that your respin only has some commit message 
changes of course.

  Regards,
  Arnout

> +	-UCMAKE_C_COMPILER_LAUNCHER \
> +	-UCMAKE_CXX_COMPILER_LAUNCHER
> +
> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
