Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A39EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF37B60DE5;
	Sun, 18 Jun 2023 13:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF37B60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nEt14li-h1w; Sun, 18 Jun 2023 13:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC74760BCD;
	Sun, 18 Jun 2023 13:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC74760BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3D51BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 442E381E63
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442E381E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94HxpC8DkbZa for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:27:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2393781E61
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2393781E61
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:27:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98802908fedso144159866b.1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094821; x=1689686821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oGdqM2gwxMakLG7WmX5EH7xAQeQZIxpKs8Pvxz4VpDo=;
 b=hyPkLH31cx7+6hmoa+sIjdESpPaQtyalCHDI2D1m5qWw3GPyj8G1ZgF9J0JswJe1mk
 WC8M8+dMUXHh0vOgS7+fHEZtycHNDfjEJlMIDaX6fdsoo5GmWf1Wy85GrBryQFdvqcj8
 oJmTH0IIMrQG5KWwsRzfmt9/jJcNciZLWuFAgpgezvAYYU+5tnFEohIG+u7IaxiPcudj
 dd5dx4Z2YbTZd0sU3QIDgpKbXwJxeyXC3cIOAe0tCgZ1LcJBQb/2+XqqmqM4qPZXZXQV
 1yF0syYuiJ+kp3M9MOWI1YhDyLamf1eO8aSmnc/8w2siN0Fd6sQWsFSvzQZRwOyXG6Id
 iiiQ==
X-Gm-Message-State: AC+VfDz7xPGLMXjO8QddejZhjZj7Jjo9XUAa0sipGBnitLUPCAl/RZHR
 2OlfxewcmEjhtaIsa32PBvuvI5K2qCGDcdb7LpU=
X-Google-Smtp-Source: ACHHUZ5lyehHcEVo8OnzRy/uHwJotUQVjCQ0vuXZ/1pNAxuzK8IIUz1hQEzq7+5JKr1vhhyHZzIB/w==
X-Received: by 2002:a17:907:7dab:b0:974:5487:6054 with SMTP id
 oz43-20020a1709077dab00b0097454876054mr6983666ejc.71.1687094821238; 
 Sun, 18 Jun 2023 06:27:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a170906158200b009870a805b3esm2409678ejd.224.2023.06.18.06.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:27:00 -0700 (PDT)
Message-ID: <f661a5cb-fd29-20c0-b88a-005f5b0dbb36@mind.be>
Date: Sun, 18 Jun 2023 15:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605082130.2142774-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605082130.2142774-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094821; x=1689686821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oGdqM2gwxMakLG7WmX5EH7xAQeQZIxpKs8Pvxz4VpDo=;
 b=Qgc/U1k/sRQ0vsQ3Hqr3DFcX3wa2GY1MYWGC5z9x0SbzYwjRZfCtET1+yWqKYdHgyj
 uAJuu6BVEluGdAWd2anDMyBt6k1f5FFwPo+0dzqEDtQAwjErRsHm7frRfl7TeKDjzM9F
 d/fGGcqR8ZfKcB3Imq98SG6KQnELQOinSonBjcjZ3k6xnFqtLUnW/nPWiVApjL8n6+uT
 X/cPNZnOpfstZMKIjRdOFMpQwtbpS+HGCP7Ku49uVd6KcX4aDQc5q6UvVBXAH3ySOmjs
 iwVVQ0i5ryk9/E0OmhDCHFu6NJ6LGpA72lpex7QwnPXNVquFOqJlZskbA2ZYKM2ZimHU
 CzCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qgc/U1k/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.35
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 10:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cython/python-cython.hash | 4 ++--
>   package/python-cython/python-cython.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> index e7e86264d2..dc75d098d3 100644
> --- a/package/python-cython/python-cython.hash
> +++ b/package/python-cython/python-cython.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/cython/json
> -md5  bd42c555cb2298b8a94fa8de7ee679ba  Cython-0.29.33.tar.gz
> -sha256  5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a  Cython-0.29.33.tar.gz
> +md5  138dba31e20e178b431a2e403154f906  Cython-0.29.35.tar.gz
> +sha256  6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527  Cython-0.29.35.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
>   sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index b11d75b33d..145e804bd7 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CYTHON_VERSION = 0.29.33
> +PYTHON_CYTHON_VERSION = 0.29.35
>   PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
> -PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/dc/f6/e8e302f9942cbebede88b1a0c33d0be3a738c3ac37abae87254d58ffc51c
> +PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd
>   PYTHON_CYTHON_SETUP_TYPE = setuptools
>   PYTHON_CYTHON_LICENSE = Apache-2.0
>   PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
