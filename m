Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AC2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EEA41B42;
	Sun,  5 Nov 2023 21:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EEA41B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYTWtWdEeZ9r; Sun,  5 Nov 2023 21:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D696041A06;
	Sun,  5 Nov 2023 21:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D696041A06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 596781BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2380541962
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2380541962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3B6Keycghzd0 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:06:40 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ACA841952
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACA841952
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso551024266b.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218398; x=1699823198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4JGwTw50T2FAFnVJATtu83jInTYW26lgoVvPUAGrMRc=;
 b=DlBFFiaz122XtUSiBp1n71rz5pXx8yistfaBNgFkOeYu6IY7CXzhwB/dNWeBVtZrZF
 GJSbVMJR74LMz8mkln/WoCm2qJGOlzRfIVZoiBEQRECGCMmI8h0ClehIlmwBSvzpqN9l
 PgmWRUFKoljUkoz89r4v7XYapTVp8FKIw1zt8xXjTtFCc1tUmjrUNpXdLX5AjI6eEigS
 Jk82B+N6AaoY1LiAUzr0HbTXwhSGgj0nnfAgix60WeL2Vgua9EG3n4TQwy2cwvS6fnHf
 C225BxWIIkMZHEeTdPNIqxwA4q1JnPz6eqzxlbY0leZ50c16HWwwtPyRVxxQ53WKwHIg
 sI0A==
X-Gm-Message-State: AOJu0YxWlxpO5LI3EE/z0c2lXUS9AloPiWq1J5QyKppkA4x9oRwT1soi
 9S6dZi1pRYDwpzNJLjkORFJUXQ==
X-Google-Smtp-Source: AGHT+IEKcONPDl8eCBzwuB46yubEELvUy2WGPFOqElq8wqwpiXW7z3yugdxpxP1bdn7swr2Bo+oMig==
X-Received: by 2002:a17:907:360a:b0:9dd:c54d:1ee9 with SMTP id
 bk10-20020a170907360a00b009ddc54d1ee9mr4618837ejc.53.1699218398343; 
 Sun, 05 Nov 2023 13:06:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b00992e94bcfabsm3343523ejb.167.2023.11.05.13.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:06:37 -0800 (PST)
Message-ID: <33971cca-66eb-4b4c-a4e8-6544800a26df@mind.be>
Date: Sun, 5 Nov 2023 22:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104233418.2678749-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104233418.2678749-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218398; x=1699823198; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4JGwTw50T2FAFnVJATtu83jInTYW26lgoVvPUAGrMRc=;
 b=e3o2znlZIXsXtEa0QYYKbYyGsGKqGx7HahXx+uaWe/DITiPVpaNG19tB2mF7aUJ3v6
 kiOnhKhCfGJHXgxV4IhNFL4Sg0OSriLjnC23IlX3yU9+3C/Knn4KeoOZXEJD9onpRK71
 Cn6pFD5QxTw9xNbKsTj6mDdyV3y6DWhcvrtyIO+vvCUT4wH6RU5EcAVQBtEVwUCvNR35
 yM28BczrY959KNki7M3MuzWx72UG7tWJQorJRtPXhS+Fg4k9tWq4ai/Iw9KWLteMUnaD
 VcwL/sSdl4fWQBMRU0y84N2HP2LjSq6cGRDJClmDsC50Lj6bcCPCqbFNGq/lhZtqGS2u
 wZcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e3o2znlZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 00:34, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiojobs/python-aiojobs.hash | 4 ++--
>   package/python-aiojobs/python-aiojobs.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
> index 511953713b..8920e3aecd 100644
> --- a/package/python-aiojobs/python-aiojobs.hash
> +++ b/package/python-aiojobs/python-aiojobs.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiojobs/json
> -md5  18a5b38cc13b2d59a91fdfec64588b4c  aiojobs-1.1.0.tar.gz
> -sha256  f0c43dfc4de359052a67df309b593732c32028deef1bb787c7a363da29accde3  aiojobs-1.1.0.tar.gz
> +md5  529a4367f9bc63a482a2962ba54bfd51  aiojobs-1.2.0.tar.gz
> +sha256  a4bcfb6a2d21ad08dea904e9f73040b37657d0c33cc8d77e683e47de5fcf0b12  aiojobs-1.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
> diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
> index 075d807d8b..be0acd3fbc 100644
> --- a/package/python-aiojobs/python-aiojobs.mk
> +++ b/package/python-aiojobs/python-aiojobs.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOJOBS_VERSION = 1.1.0
> +PYTHON_AIOJOBS_VERSION = 1.2.0
>   PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
> -PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/99/75/b6d3678d804fffda81ebbac6214c35a4417d5ddbd70ffe7958ad951e64d2
> +PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/e0/4685393810a267c09edef41ddafd0dd28108d95e1b91019b1843fc6e5b83
>   PYTHON_AIOJOBS_SETUP_TYPE = setuptools
>   PYTHON_AIOJOBS_LICENSE = Apache-2.0
>   PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
