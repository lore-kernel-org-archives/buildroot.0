Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6C5E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1733A82133;
	Thu, 21 Sep 2023 19:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1733A82133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqF4BNtC7cYO; Thu, 21 Sep 2023 18:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A37F8200A;
	Thu, 21 Sep 2023 18:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A37F8200A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 697731BF228
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FA5C6136F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA5C6136F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSpCqP3dbuF1 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:59:55 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F0C6136A
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F0C6136A
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a645e54806so162109266b.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322793; x=1695927593;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6pKnzvrfwjITBdYr74+SIgaVr89vAKe1lPCbRsnRu4=;
 b=J7HgEVN7OdJ8j7gA4J6THaEXN5xSStcj3WNhiztE/qlATCS+8klJvOwswDtlNM++xl
 94oWFAHdPM0WR4+Dxx5hOQkvRKNedk4Ni3ytefEe+S2PZWKgl1A1Q5l8mL4gYIYyMKrw
 vjj5UXYpQ3kJq7ZekiSCETmqmtA1pKqSRyGapSOdSrUau9eqeeUdazz0jD+VUUzJyVFx
 LpHfB5N34X8QywXlX9YkSuLKSCPgGQvS+p4VE43hdsr7m3ybGEVPjBj/AvKB9s9l2Kvy
 Fi65ed8KnvBfcTgkMvTOW5+M7bzd5mDQJxu1FAOXoLstunlSOl7GrXE8lhLsSo86Q//7
 I7qg==
X-Gm-Message-State: AOJu0YzGNQ/OYGvjd21dL+fheXuruLxTtqWjhO93qnuqALaI4A/dH83s
 2wtqnt77nuuzU436v5iCn0d47nPeUeDvrxnJMmw=
X-Google-Smtp-Source: AGHT+IFb5JOp8V8/5/dbT5oE+c067FzBEiy3REi79ubn6LY40kDOg9Q1GZN/5ngZUri20o8XjATF6w==
X-Received: by 2002:a17:906:20ce:b0:9ae:505d:310b with SMTP id
 c14-20020a17090620ce00b009ae505d310bmr4732437ejc.39.1695322793389; 
 Thu, 21 Sep 2023 11:59:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a170906b09200b0099c53c44083sm1467150ejy.79.2023.09.21.11.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:59:52 -0700 (PDT)
Message-ID: <c35ee278-76a8-e9fb-dbc3-9092f975e0da@mind.be>
Date: Thu, 21 Sep 2023 20:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20230918075936.785341-1-angelo@amarulasolutions.com>
In-Reply-To: <20230918075936.785341-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695322793; x=1695927593; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n6pKnzvrfwjITBdYr74+SIgaVr89vAKe1lPCbRsnRu4=;
 b=U9t8YDM5jTWwfwmXDZXQn2L7vT0Wyg7mh7nuvDKRLtDYEA0KMMp+N9h4uGJh0l3S5m
 qgm4FdeqGGvfSAadB7XwIlPUTq/SNHw2nIS9T1HQTpCjMjsSBPPCOA9Bz5Rd1xL7HSjX
 SZsH/7/fT1BPXrVVCd2BDDqC8WvSvBQbxjRCTCGaBnGIVvlw6CPaXZns5nW/I5uh2WQl
 ParWOdWYqlkfxr2Of3VOIaAX+T4CU3GZCnEoQgN1+7Dy3RdwpEeL56WfM76pugblfcpd
 BV65m3VjAYO1//VwENYddD5VS2FUFpkh4/B725jH6J3eD4kKa8r1OT3ljEhcmAcvy/91
 cP+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U9t8YDM5
Subject: Re: [Buildroot] [PATCH] package/python-can: bump to version 4.2.2
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



On 18/09/2023 09:59, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-can/python-can.hash | 4 ++--
>   package/python-can/python-can.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
> index 73be230201..35e752ea54 100644
> --- a/package/python-can/python-can.hash
> +++ b/package/python-can/python-can.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/python-can/json
> -md5  d8365b7a09e49f47dac0da75d8518808  python-can-4.1.0.tar.gz
> -sha256  3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9  python-can-4.1.0.tar.gz
> +md5  26d799fe952cb590fba03f3d26ee66a4  python-can-4.2.2.tar.gz
> +sha256  6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f  python-can-4.2.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> index ba98337d5d..012c82682c 100644
> --- a/package/python-can/python-can.mk
> +++ b/package/python-can/python-can.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_CAN_VERSION = 4.1.0
> -PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/90/55/898e69e37d5d4692bf21ba8750e095493d2ecbb29be7394d5cb735f0ab0f
> +PYTHON_CAN_VERSION = 4.2.2
> +PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/dd/f1/327caaf05b6bca594250053058a2adac537a88dfb5c41bb5498cfda9de78
>   PYTHON_CAN_SETUP_TYPE = setuptools
>   PYTHON_CAN_LICENSE = LGPL-3.0
>   PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
