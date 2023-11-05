Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7DEC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50B841949;
	Sun,  5 Nov 2023 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50B841949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJDuxAkT-sbI; Sun,  5 Nov 2023 21:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F27614193E;
	Sun,  5 Nov 2023 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27614193E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB081BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA4C54193E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4C54193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKzvMl9SIvw4 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:10:39 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB2FA40338
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2FA40338
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so6265321a12.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218637; x=1699823437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdsx9OeAW2q4dmbv624MvxA1YtpfI5zZJpbtxQi1R6Q=;
 b=mk6WrYUFr7phVSG9vQbXkrYzfIMkqK9xtBl9jHZz3MAnZtcr0roBEM7QME+mKf822e
 lvkjUb6wP7AqvYq1ZCMf1as4rqebKRFhz2wa+q2NN3xFEiQudrJyUaojBAKy3qTuSj4b
 y5Op5wy89/IzNWp25ZWDhSNaUYDH+wfXIy3Jm3l2SBrnUxY7zVpN4t34YLnZ4PLloAzg
 HA29LazWp6hw2JDQt0lFRiqqVT9TcHl2pNRV0rEK0kFPIY8bso1bXMXKY3kBMW+aki4P
 PgBUCfanK3o8UGK3+M2Ou6cvZz/HryjGhniKN89UyQ92fYGdI+x6AzQhD+8MBidGRSpp
 VMXA==
X-Gm-Message-State: AOJu0YwpuREoLdU03GkZKNNu1xa9U+gdZ3SrzJztZzAQFe2cq4v1LyId
 9MyJKRuDz+iwFtbyx2GgggSghA==
X-Google-Smtp-Source: AGHT+IEubVZocw7+TWQJdWcLQmBP+7xFx6Ewl7BrzwRGj1MVREnJR1WdzQeRUYaK4YSb0QTnDyYbdQ==
X-Received: by 2002:a50:aa96:0:b0:543:7115:eb15 with SMTP id
 q22-20020a50aa96000000b005437115eb15mr13195770edc.20.1699218636906; 
 Sun, 05 Nov 2023 13:10:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a50d79b000000b005432f45bee9sm3659319edi.19.2023.11.05.13.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:10:36 -0800 (PST)
Message-ID: <6b92ec90-0f5f-4376-a8ac-f362a712cd9e@mind.be>
Date: Sun, 5 Nov 2023 22:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105001009.2704781-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105001009.2704781-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218637; x=1699823437; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdsx9OeAW2q4dmbv624MvxA1YtpfI5zZJpbtxQi1R6Q=;
 b=T6aK9QHWKV1S0n5Q943AbHZf4lHu3Ae+SQ/T50tYcaO/7lT1ed2cEwQIxKfB4F7jCt
 f1G37WuxZrMDLxUadmkjEAJp4LEVVeScQbyVgmIAJ3OkW/vE0po/V2rMdbAujBb3s9RZ
 zBqbmkmH0BDN2cWhx0UPEU9/EQHBOfUxfFQZyr6HOSjbCJio90PYMV0d2RSGmhd+dJEQ
 4xuTbzP4X65K3wrRrROw5JizoT/BdtB5LECcppe6mN+bBPQOtjAUplNCypSW37Hl0zP8
 8zv5tX/o/ERzN5G31mxHDJWnJwpGcMU8QGjiB5w9Fc4SDtN+6VcDdsuU2UQScRR/w2DW
 PPCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T6aK9QHW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to
 version 23.1.0
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



On 05/11/2023 01:10, James Hilliard wrote:
> Migrate to new hatchling pep517 build backend.
> 
> License hash changed due to adding contributors:
> https://github.com/hynek/argon2-cffi/commit/1133f3c2bafee1501535de5e5531054570438b1d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-argon2-cffi/python-argon2-cffi.hash |  6 +++---
>   package/python-argon2-cffi/python-argon2-cffi.mk   | 12 ++++++++----
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
> index 09da5855a3..e11195e1e2 100644
> --- a/package/python-argon2-cffi/python-argon2-cffi.hash
> +++ b/package/python-argon2-cffi/python-argon2-cffi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
> -md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
> -sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
> +md5  7371c126f21a895b33c4fe7e00ac6fc1  argon2_cffi-23.1.0.tar.gz
> +sha256  879c3e79a2729ce768ebb7d36d4609e3a78a4ca2ec3a9f12286ca057e3d0db08  argon2_cffi-23.1.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
> +sha256  b6944d386e87ccf49d9632da083685a4b7624733e686a7fe283dd2d428341d77  LICENSE
> diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
> index 0fb3e50ff3..238271f5f7 100644
> --- a/package/python-argon2-cffi/python-argon2-cffi.mk
> +++ b/package/python-argon2-cffi/python-argon2-cffi.mk
> @@ -4,11 +4,15 @@
>   #
>   ################################################################################
>   
> -PYTHON_ARGON2_CFFI_VERSION = 21.3.0
> -PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
> -PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
> -PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
> +PYTHON_ARGON2_CFFI_VERSION = 23.1.0
> +PYTHON_ARGON2_CFFI_SOURCE = argon2_cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
> +PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/31/fa/57ec2c6d16ecd2ba0cf15f3c7d1c3c2e7b5fcb83555ff56d7ab10888ec8f
> +PYTHON_ARGON2_CFFI_SETUP_TYPE = pep517
>   PYTHON_ARGON2_CFFI_LICENSE = MIT
>   PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
> +PYTHON_ARGON2_CFFI_DEPENDENCIES = \
> +	host-python-hatchling \
> +	host-python-hatch-fancy-pypi-readme \
> +	host-python-hatch-vcs
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
