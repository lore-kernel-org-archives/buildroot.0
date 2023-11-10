Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D83EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C194193B;
	Fri, 10 Nov 2023 21:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C194193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-ianOv8KXSK; Fri, 10 Nov 2023 21:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D747B426AA;
	Fri, 10 Nov 2023 21:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D747B426AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878FC1BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FCA383B3E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FCA383B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-l_3v7tapYm for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:04:14 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3205483B25
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3205483B25
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c7c7544c78so19020781fa.2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650252; x=1700255052;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VO3O76ZX619MbDJtQkJe02BwZo3tU7fWlam7ihuSMw8=;
 b=AgA/mQBvJgfu18y5hDayrsZHSghXPJQ4cxaSv6aNGXzWJA67oz0VqCtTn7shQYRo7y
 IPx0sOViAxisGBF5d2J/qOvgz2cJmtbVNhqp4Nl2AgWmz/AITnH7NFpRU53SYW/YFJVU
 a5Z+C7Q1Rhstntp041dWGK1y0W/XKnB2p/wM7w6E+qnzp2PRYv8HKYATUjZ4dY7aTikq
 BQgNHY7BfNlC0haBIz9Nfg8SU2OryD0hNb2f+lzZdM/NQEzhOYbMV30HJ8yHOmz5qAnc
 gbex0RqghlUMy+c6QKORv5wsQhidfwa5sNCKn8ywQZNaskAZlHSeGu6O7HJoSnuu1Nag
 KCyw==
X-Gm-Message-State: AOJu0Yze4SX+RmEcgORGm3kcP3jk96uoER8zm++lw9G2PY/xeVXoMBkG
 LkkYJ0BwKkWhn80L/KCHUp0AwQ==
X-Google-Smtp-Source: AGHT+IHkhLsPAXO+uq8pRCJ2p27mU8UUTPzk04mPIfaH/kv7pE6zt935skPOJuA+0gaW5TZgH0UPew==
X-Received: by 2002:a2e:a262:0:b0:2bf:7fad:229b with SMTP id
 k2-20020a2ea262000000b002bf7fad229bmr260389ljm.37.1699650252085; 
 Fri, 10 Nov 2023 13:04:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dv22-20020a170906b81600b009e5f2e02e68sm79795ejb.222.2023.11.10.13.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:04:11 -0800 (PST)
Message-ID: <0ba6d565-bcec-4653-8979-c8d42c7f191f@mind.be>
Date: Fri, 10 Nov 2023 22:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105085546.2919443-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105085546.2919443-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699650252; x=1700255052; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VO3O76ZX619MbDJtQkJe02BwZo3tU7fWlam7ihuSMw8=;
 b=WuECA6IUxIWejNPCbqNF1qAeScHSBxTkC1Q9cDr4qy7VTFiQ3jWTX5FAlocQkWsXpJ
 jJ+212QeUmMGDmBbi7WQg3BjrUN75wiIo1d3B+J6t3ZdX6juIPTsxMU5sQsGwB3cAfNz
 kQCQfWS0ZdJPDwCbuhdOZKPMezvlLiws0SoPAzd38gJ1YWxk355W1LinkCP5vFixbtWr
 HCGWccPIHm0cdOFFmCp7eSO3+0rOaAOZOdZKIFiySCQVtJ83g25ZiTUeirvvKzbygpXO
 tZV5pgRGAtn/74Zxqeoss1dRmV6h0khmgT6Ewxpi9GXsKnxhxIh6x5eb1PWnIKJwQr0G
 Bt/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WuECA6IU
Subject: Re: [Buildroot] [PATCH 1/3] package/python-referencing: new package
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



On 05/11/2023 09:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                               |  1 +
>   package/python-referencing/Config.in            |  9 +++++++++
>   .../python-referencing/python-referencing.hash  |  5 +++++
>   .../python-referencing/python-referencing.mk    | 17 +++++++++++++++++
>   4 files changed, 32 insertions(+)
>   create mode 100644 package/python-referencing/Config.in
>   create mode 100644 package/python-referencing/python-referencing.hash
>   create mode 100644 package/python-referencing/python-referencing.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a0d5339b0a..6a2f1cad1a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1276,6 +1276,7 @@ menu "External python modules"
>   	source "package/python-redis/Config.in"
>   	source "package/python-reedsolo/Config.in"
>   	source "package/python-reentry/Config.in"
> +	source "package/python-referencing/Config.in"
>   	source "package/python-regex/Config.in"
>   	source "package/python-remi/Config.in"
>   	source "package/python-request-id/Config.in"
> diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
> new file mode 100644
> index 0000000000..273c42543e
> --- /dev/null
> +++ b/package/python-referencing/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_REFERENCING
> +	bool "python-referencing"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
> +	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> +	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
> +	help
> +	  JSON Referencing + Python.
> +
> +	  https://github.com/python-jsonschema/referencing
> diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
> new file mode 100644
> index 0000000000..d4f3dce5a4
> --- /dev/null
> +++ b/package/python-referencing/python-referencing.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/referencing/json
> +md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
> +sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
> diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
> new file mode 100644
> index 0000000000..4d11c99deb
> --- /dev/null
> +++ b/package/python-referencing/python-referencing.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-referencing
> +#
> +################################################################################
> +
> +PYTHON_REFERENCING_VERSION = 0.30.2
> +PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
> +PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
> +PYTHON_REFERENCING_SETUP_TYPE = pep517
> +PYTHON_REFERENCING_LICENSE = MIT
> +PYTHON_REFERENCING_LICENSE_FILES = COPYING
> +PYTHON_REFERENCING_DEPENDENCIES = \
> +	host-python-hatchling \
> +	host-python-hatch-vcs
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
