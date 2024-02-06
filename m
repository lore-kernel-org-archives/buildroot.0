Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3873C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977C381B26;
	Tue,  6 Feb 2024 12:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhhyKgegC49F; Tue,  6 Feb 2024 12:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960B881B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 960B881B52;
	Tue,  6 Feb 2024 12:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 185191BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31D241F2A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F31D241F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0V6tk29Mi4f for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:33:27 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2AAC41F12
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AAC41F12
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so3017745e9.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707222805; x=1707827605;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKsXP6B2lyAw7abxfD4WibXsgpYsi9HBoQSm66jGgEo=;
 b=HzlrOy15tlUW+1/hg6eZzGuKcLzULHokOPxbvul+WFyFnqC7uzLkXnp1Jg05403u7a
 COttZRQg3zAczm/lWpgTfqxzzq136k7Au0Bk67ohpdfuyWCPNfoZHa663pW82Yw/8q7p
 V+rOw7Eu7mn//HqFhrROKB6IWqLooPWYFKRV95utyeFdrqbrfxu8hf/DwfInIE6XXsmM
 az7bM7q1L4pGl/+bTcAmCjIYXK5B23UrwoA51nrI6MBKkXtjeY5uy7NuKqvTGunLvRDf
 HL00SVa+iWG1nza1DdEtCEJfDtJK5OrkiFk+ouNp0/IAQNcyTALjrqieiXknCewuiuA3
 jyxg==
X-Gm-Message-State: AOJu0YwuARfTP7SB2z0OCsVUQUbKdQyhtyICJbQfMLWfsF+2KdHtR/m8
 nIBIgK2mrj6+/Th3icLy7XI1bnSycjhVWkESA6+FlwrgtvkQvgupzbZN9XvWHGE=
X-Google-Smtp-Source: AGHT+IF2NXoxlN/k9X1EoFJwCfyXlvBX3ZI+1s2cidENnS7Zs7hraM57nafqz99hnC4LkCbU5nSWWw==
X-Received: by 2002:a5d:5f8e:0:b0:33b:49db:9e6c with SMTP id
 dr14-20020a5d5f8e000000b0033b49db9e6cmr862351wrb.30.1707222804831; 
 Tue, 06 Feb 2024 04:33:24 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWN1skdcQ67fAjukvaj5r/p7SIeFfkfqJuz9Drkct5iqL4nm2JDN84aXXLh1aF9tJy8l+cawgYlrAAOho5rUMoJj6JB/KHAIg==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4b0e000000b0033b3c2e73e2sm1981606wrq.113.2024.02.06.04.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:33:24 -0800 (PST)
Message-ID: <ed31ca8a-0bf5-4271-a2c7-c90cd379adf7@mind.be>
Date: Tue, 6 Feb 2024 13:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240205164615.510688-1-james.hilliard1@gmail.com>
In-Reply-To: <20240205164615.510688-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707222805; x=1707827605; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKsXP6B2lyAw7abxfD4WibXsgpYsi9HBoQSm66jGgEo=;
 b=JMhLbn0Vt53aKtvxL+ccvgN9gS1bCfYkuF6rWDyo0GnZlV4G9a+d5Jl/7DCPj/61DS
 eWNrfAgVA2/pleBCKiAXdgt04IYF7lTHnJEgCMNiy9hFs9C2BSG9HBN4eDLicTpMrAV6
 Y/A85l297tPOw6hbGuOkqgF/r02fIQT8Lo8keLESHW6IGo+Ek2h0A63SlG6MLSyvAkTH
 NA/nmMLnG8bnTnrGMRAzHa/l0sqXn23YkK/eZRZwzahl4qBAdP/GR9NqPXHC2GzjB1GC
 Q8E1wEpuRlgFcIDqYDg9QRPGE2cYvavv08deR6893y0Ry0JjPj7HBbep5d1/Sy8sIG4y
 Wn6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JMhLbn0V
Subject: Re: [Buildroot] [PATCH 1/2] package/python-starlette: bump to
 version 0.36.3
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



On 05/02/2024 17:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-starlette/python-starlette.hash | 4 ++--
>   package/python-starlette/python-starlette.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index 820026b70b..03d77cf5be 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  2ef2fc635691fd4a1823564218292dce  starlette-0.34.0.tar.gz
> -sha256  ed050aaf3896945bfaae93bdf337e53ef3f29115a9d9c153e402985115cd9c8e  starlette-0.34.0.tar.gz
> +md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
> +sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index 07f9d6be5e..9d137f5f5a 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_STARLETTE_VERSION = 0.34.0
> +PYTHON_STARLETTE_VERSION = 0.36.3
>   PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/4f/36/168ba6d56a28382f3b081b23b0cc431de35786e120b94c1f372708ed3059
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
>   PYTHON_STARLETTE_SETUP_TYPE = pep517
>   PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>   PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
