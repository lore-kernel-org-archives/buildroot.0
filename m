Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB989C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D538418E1;
	Sun,  5 Nov 2023 21:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D538418E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4NGA4oem21c; Sun,  5 Nov 2023 21:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E79541B42;
	Sun,  5 Nov 2023 21:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E79541B42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6EFB1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F28982112
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F28982112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5taIPYdEQpNF for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:09:14 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2461882102
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2461882102
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so6446014a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218552; x=1699823352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXRk+upHnCyn1edT+HaI6QOKITaQkLtFK++ZCn86ipQ=;
 b=OlBbBPY7HVsf/VJfYb1qH8sYbX7j+aOkHWPEXcrqAFMFbAhTAQyCesWtmgSvk1BvXF
 VcE17nsOVnOVh14koZa1j9INK4s+ZcLgdFuD21WxtT3ELK6ZIvy3yy3xzCW+vSNmHRTQ
 1xElJYBnWBtXVmcRgdeA8Q09paGSzmpRsmxaS/ljh3Uv0N5JFnR9Nlxb4TVLFmHZE3iI
 2Z1uJZ5x6Ik48RdrOv42ZodIJKy49j3Wu/KY3rqMOjrviPHTlO4/QnFh+3Mhaj/0cPRG
 3XY/WotA8NCayq4UtoMV+BcsjlkD8cmsWOGYAeCDpppslhkQkdK2Y55b1CvI+CzFZSz1
 7wjg==
X-Gm-Message-State: AOJu0Yz0liXEUn3KNbdwFg+xDQ26fVxzAh9T2643pNTn371IWju46wMO
 GmSuUQkpL8V7DemMhq3StCv52haQfN1X1kHqfLE=
X-Google-Smtp-Source: AGHT+IFik45qFmX74Jy2Nw0tUnZfse0Rv7W+cRJ8ZtFqh5zrTBZrk60QXj0ntCGi1wiwdOwPPMsJqQ==
X-Received: by 2002:a50:cd84:0:b0:543:dd0:a0d8 with SMTP id
 p4-20020a50cd84000000b005430dd0a0d8mr18148416edi.31.1699218552298; 
 Sun, 05 Nov 2023 13:09:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a50d79b000000b005432f45bee9sm3659319edi.19.2023.11.05.13.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:09:11 -0800 (PST)
Message-ID: <f5bb99db-fe2c-436d-bf7d-a067f6615b19@mind.be>
Date: Sun, 5 Nov 2023 22:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104234900.2686730-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104234900.2686730-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218552; x=1699823352; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PXRk+upHnCyn1edT+HaI6QOKITaQkLtFK++ZCn86ipQ=;
 b=TJBf0gNg9zCGF701ub5/5iCjR3qhbFv5vDqxAzi3OtqR7tsuZ2lzDFejeP8K0/ZM2M
 UIon89Q0hj1c/yrIiDNAoJRFSxDYY1dVIUNxgaN4vWe6uWfJyavda9ICzjivL7SqsY4U
 wMJGOA8H7XiyKydoMukS3m/v/6K5IKUjud+I2CqIlRFruPg74DlpeggXUxJ9Erd5SX1G
 nNLME4KZxTLUUre0KQUfO2ell798/hfIRvfbyLvPy0UT21NeUaYjNKXjfQJb4Kf6EYll
 7SJ3R41e7hr5/+C02Ao7ebDdMkVDLURAkLwSfn7nMXgXdyUAIlwtrv/tihvB0vgPk2Er
 0DQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TJBf0gNg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.12.1
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



On 05/11/2023 00:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-alembic/python-alembic.hash | 4 ++--
>   package/python-alembic/python-alembic.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
> index c84c46c84c..df1f4fba02 100644
> --- a/package/python-alembic/python-alembic.hash
> +++ b/package/python-alembic/python-alembic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/alembic/json
> -md5  de9d9f92a49a5e3ae5a978018927f474  alembic-1.10.2.tar.gz
> -sha256  457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d  alembic-1.10.2.tar.gz
> +md5  642d563af853b317f018026f3edd5dba  alembic-1.12.1.tar.gz
> +sha256  bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f  alembic-1.12.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
> diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
> index 4f605b8f60..fd41e0df66 100644
> --- a/package/python-alembic/python-alembic.mk
> +++ b/package/python-alembic/python-alembic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ALEMBIC_VERSION = 1.10.2
> +PYTHON_ALEMBIC_VERSION = 1.12.1
>   PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
> -PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/d6/02/66ed327f944f3f85423096c438d7d290da5af21a7aecf9e5b9f09d9e34b2
> +PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/44/b4/253fe31261d9f5d603d89bd9e6fba1625494a6d761d319902dfe4db59016
>   PYTHON_ALEMBIC_SETUP_TYPE = setuptools
>   PYTHON_ALEMBIC_LICENSE = MIT
>   PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
