Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE6B142726;
	Fri, 10 Nov 2023 21:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE6B142726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0B6KRQI6lLhD; Fri, 10 Nov 2023 21:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE65426AA;
	Fri, 10 Nov 2023 21:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE65426AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 625661BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4807183B3E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4807183B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFIfGUtcGDDR for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:02:26 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FF6D83B25
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF6D83B25
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9d10f94f70bso401417066b.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650144; x=1700254944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uh+bIA29zNWMg9sd2xL1vooKZcOCBgRtbDDqOIbTpY8=;
 b=rX5Hy+U6C24RAqCCqjzXbwsUO+jILi3KEUA/hO3sxnMyfEXkDaTQFwNM9wZ+F3q4Qz
 AUUw+5PSQhn1gIpYy1kA9j0LrVt2FginEEEgdrNmW4C+blbtBY0f1eNACumrnRofXbMt
 9OFV6xoYOt2lWH0VzNgI5abi5ZSqtN5z3J9ycDg1YawnIHypvXcnqdnZcPsyjy5Oi3/d
 hhm+Jphz9z988rtEFuN4nbifzlgOZqQQf2ZjtZG4zS1h4EmOKD6nxE7FQN7Q89k7uc+7
 d/Ut5P9cBo9lEjDdbofA58oyLPRBzNFDYchYvsEAFfsS0uJsPEWynGHzepolUS/ybUIf
 mgCQ==
X-Gm-Message-State: AOJu0YzAV8aX0PQMmsGxV2q4DnOnmcoV4etU6dNCwUBbpmkR4z5cXw8P
 nDnXMQX39XkhM2NshA+o3Y4inQ==
X-Google-Smtp-Source: AGHT+IEhWcpB+uPMJQsoaLG6UVQMYn5GFtA8Kpy9wr5UB2T1I9XRWFzIM9tcheIb/6gNzlrHbetK4A==
X-Received: by 2002:a17:906:7cb:b0:9ae:673a:88c8 with SMTP id
 m11-20020a17090607cb00b009ae673a88c8mr94750ejc.21.1699650144330; 
 Fri, 10 Nov 2023 13:02:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dv22-20020a170906b81600b009e5f2e02e68sm77988ejb.222.2023.11.10.13.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:02:23 -0800 (PST)
Message-ID: <d366dd82-5067-4908-871e-db80210c740b@mind.be>
Date: Fri, 10 Nov 2023 22:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105054502.2846404-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105054502.2846404-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699650144; x=1700254944; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uh+bIA29zNWMg9sd2xL1vooKZcOCBgRtbDDqOIbTpY8=;
 b=XHbn8uYSKCYrFpCQc9ph+qz1tQEppn++hr/CIXnWVR7dref2WMye57lgNlId+b8yGl
 0WKbCPVGziI02BtjWFgt1zgTlsk38XvWUCkz4LRdwhxBLknAepeFOpZys+2sIiF8f6mJ
 jeJdA0EyKTtetr/EJFVZnAjZPXRH4yO3CdYzStR1PIe9R1xmTzWkHp9k9J3N3k2vyzXd
 s8b2h2pNurr/5EZS0olusThbD1m2lzhEtMUPw3hj+kAt419LkFNVPDAgGHY7W9/PNe6M
 F6OuyK8urFWas0ddGib1f4qO3Z4xPM7Ks4s36yPlHHjqryeyotNn1Ec5dLuJont4c8is
 jGWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XHbn8uYS
Subject: Re: [Buildroot] [PATCH 1/4] package/python-calver: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 06:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-calver/python-calver.hash |  5 +++++
>   package/python-calver/python-calver.mk   | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-calver/python-calver.hash
>   create mode 100644 package/python-calver/python-calver.mk
> 
> diff --git a/package/python-calver/python-calver.hash b/package/python-calver/python-calver.hash
> new file mode 100644
> index 0000000000..ebc054e617
> --- /dev/null
> +++ b/package/python-calver/python-calver.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/calver/json
> +md5  e1fd924b9bf953c0b28c49bdfe117d7a  calver-2022.6.26.tar.gz
> +sha256  e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b  calver-2022.6.26.tar.gz
> +# Locally computed sha256 checksums
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
> new file mode 100644
> index 0000000000..2fd5468ed4
> --- /dev/null
> +++ b/package/python-calver/python-calver.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-calver
> +#
> +################################################################################
> +
> +PYTHON_CALVER_VERSION = 2022.6.26
> +PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
> +PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad
> +PYTHON_CALVER_SETUP_TYPE = setuptools
> +PYTHON_CALVER_LICENSE = Apache-2.0
> +PYTHON_CALVER_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
