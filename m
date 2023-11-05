Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B929F4192B;
	Sun,  5 Nov 2023 21:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B929F4192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhkvJFNa3AXW; Sun,  5 Nov 2023 21:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD1141991;
	Sun,  5 Nov 2023 21:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD1141991
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2A611BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB4EB6104E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB4EB6104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgFkk0GS1LKg for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:09:39 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D81116104D
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D81116104D
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so6467975a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218577; x=1699823377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKYL41DGId/15RB7zrPubgD/tLuvvfKcOX7S3LiWDQ8=;
 b=c1P5jEjQHA8w6kHDinGboJgAG0edTXsSIH/ltHNWfbqz+oIrMWZLmTUFO+9y+xMmwQ
 156OVZxK3Yl4lWvSY+37xLqNxFJn3yA1Q3B18J8eqURKFGUM5VVzaB4cVuFX+Mqn9vx7
 wAtTVdUrzynMeJWFSVucOwscaEvb5A4OoksoC+6p++lcb49OqNUI+PfzoAkuM4cGhrnI
 OseVwhTEmVz88SHM2RdROsTHCYLrLOyKMMXJK592R7/26pXUwzsdI4z/6GLjLxiZGB0T
 9/xD72pC9Nx/gHfPW2DLi6rGXz5nfe7pRrDb1J5UkWXmnqJbJUoCzG2BTpTB6HjCY8Eg
 YUcg==
X-Gm-Message-State: AOJu0YyvBeLb3kny/viBPn3vMyn05RNb8+J6ZvJpGnUSFX7c5Ey7m1za
 l2DQJLnLqldW0WQQhePgjZR07A==
X-Google-Smtp-Source: AGHT+IHt7BT53r5ahXopDVFYBb1mb2liipMSPolNyBUeRHccxpjIc0vymfOSqjrUG1hKLfanZFpAWw==
X-Received: by 2002:a50:9552:0:b0:543:7201:7c70 with SMTP id
 v18-20020a509552000000b0054372017c70mr14099813eda.7.1699218577125; 
 Sun, 05 Nov 2023 13:09:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a50d79b000000b005432f45bee9sm3659319edi.19.2023.11.05.13.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:09:36 -0800 (PST)
Message-ID: <7be4568d-5c88-43ab-b29b-99863e7690d0@mind.be>
Date: Sun, 5 Nov 2023 22:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104235554.2696561-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104235554.2696561-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218577; x=1699823377; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKYL41DGId/15RB7zrPubgD/tLuvvfKcOX7S3LiWDQ8=;
 b=C35UOxzGiLjfhf6ghcr+K/5Z2CY2rFjgp7c4Cwq9xKY77AeyjODy7nrZw0bY/xQ5pC
 +0dh7XkTelo1sjRJmsfgsvUl5WrSUCwruxq5U9uf4XpX+GN1vWBTKnKuJ7s3lx/BAOLP
 ueDLH+Zty43A3o6c2dTjDxHOlIPLSb8QAZw90TrQjBUGxtLT/mnyhbG2+LzIasMkL03/
 0D1mfpDVqjDyMW03OThgIQJQVSpskJ0xBa/3QavYBVRU6iquyQUlDaDWUuo91xid7bg+
 fkrqdlCLsvu08dYA1JwNqS5PKFIlUCpqXv221HA20lTvCQxSk+3iuHgpNJz8FyHxBzqY
 +6dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C35UOxzG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump to
 version 0.10.0
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



On 05/11/2023 00:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
>   package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
> index af3d0faad2..ab8b868b97 100644
> --- a/package/python-alsaaudio/python-alsaaudio.hash
> +++ b/package/python-alsaaudio/python-alsaaudio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
> -md5  5408be7d7017ae9272706acb4a543c2f  pyalsaaudio-0.9.2.tar.gz
> -sha256  e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36  pyalsaaudio-0.9.2.tar.gz
> +md5  720b2e1a47a5fdb587ea1b4eabbd23e6  pyalsaaudio-0.10.0.tar.gz
> +sha256  e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab  pyalsaaudio-0.10.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
> diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
> index 205bfdb86c..0692f4a8e9 100644
> --- a/package/python-alsaaudio/python-alsaaudio.mk
> +++ b/package/python-alsaaudio/python-alsaaudio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ALSAAUDIO_VERSION = 0.9.2
> +PYTHON_ALSAAUDIO_VERSION = 0.10.0
>   PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
> -PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/a9/bd/24f576c07953671edfeba2545c3c92c46e97384f622957ecf95967c2b456
> +PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/e5/f0/411140b1c2d8eea8531233f39103e7ebda560030493e298be6439ce36936
>   PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
>   PYTHON_ALSAAUDIO_LICENSE = Python-2.0
>   PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
