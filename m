Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC4C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 20:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4544360B83;
	Sun,  2 Apr 2023 20:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4544360B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G9J9b5grYw7; Sun,  2 Apr 2023 20:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7603A60B73;
	Sun,  2 Apr 2023 20:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7603A60B73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1671BF36C
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 652D581E3E
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652D581E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zZEar8CmIPY for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 20:45:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F55981E17
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F55981E17
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 20:45:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so13129729wms.5
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 13:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680468331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVI+F19ZgmbziuNpm8o5yl4FHt6RX5ytLRvYOEnpIb0=;
 b=0TOC0U2skoPXYJSyO7ovLsbK7s3S1VYvh9r7giAyJ0ydpbWiU+m/GQyCdi8SG1Ro5h
 9C8AnV4ZDGWlBKGUWzf/DCqSIwFfO9Tt0S2kZEqHvcM33CK4kbUDcDPXsiliy9Zik7gI
 c86LBsAYcSGH3PWOwYCKo07TXVuJSaFDyiwQV69TutTYEfatPfObECJG/BmP4WzurSl2
 czxId4n3d2tXnuhhaZj2aASGsgPfR/9ZczTBRLV3vLJHgc8JvCmt3mYgm3FTBrnggPM9
 7zCtctbY/ru3tFlI6ad2nk66kYIjgpeEXnSGsqp3cE7EcEPYIH7Wy3QuuhkU0CjhyXjS
 0OOw==
X-Gm-Message-State: AAQBX9fv5vqyjz8I7O0PhOMM3Xi4/oY11u7JwQL/kXgCKgngcS1+mkf7
 WdHaKz8Ff7+27Sq/J8gP4XXYHg==
X-Google-Smtp-Source: AKy350bYpe1cgdibqxH2EIekLfbAtn1z2nFO1Y9BkSRiQuhsTZN4a+8Fi/eifc/02quRK90/ZnGe8Q==
X-Received: by 2002:a7b:c44e:0:b0:3f0:4e04:bd47 with SMTP id
 l14-20020a7bc44e000000b003f04e04bd47mr2182044wmi.37.1680468331236; 
 Sun, 02 Apr 2023 13:45:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adff849000000b002c56af32e8csm8027487wrq.35.2023.04.02.13.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 13:45:30 -0700 (PDT)
Message-ID: <dd2bcf74-02d9-029a-367e-2d74ff46d79b@mind.be>
Date: Sun, 2 Apr 2023 22:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230206120400.3188421-1-james.hilliard1@gmail.com>
 <20230206120400.3188421-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230206120400.3188421-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680468331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RVI+F19ZgmbziuNpm8o5yl4FHt6RX5ytLRvYOEnpIb0=;
 b=LpjAuFXnUO8VcaT1w+mrE0mB7pnBZrbC6AABmea0C0qHBN+yZRUQ9Ib4pz/CDoXA35
 dUELMZeC/ZxmDn32ZP6sgM7RkvRDkmlEtCL/hzrAfDKVIaEThult56Pkn/U0rkq2ejAN
 V/fq4aTwpl6Yp22l8Q9xPpkVv3yAstNH/ansS+MexsyAzGZxP/xZFB4mzBactTOAVPS4
 LLyXHAH2O6TfH+G04uOjejd2x0FCqad8nR0H0dpwQjwLa/HHfeBbTlHIyTmQQp8Z/RvA
 X5S1tTOuVPcCr2kweK5Rbt9tCcEjIvJDuxOVGJlyJnZnkk8nj1OThR1XpHgryAOR3wAx
 fDRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LpjAuFXn
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pypa-build: bump to
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2023 13:04, James Hilliard wrote:
> Migrate to flit-bootstrap build backend.
> 
> Remove no longer needed host-python-pep517 dependency.
> 
> Add new host-python-pyproject-hooks dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pypa-build/python-pypa-build.hash | 4 ++--
>   package/python-pypa-build/python-pypa-build.mk   | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
> index 4c02ee1dce..9da56f9f68 100644
> --- a/package/python-pypa-build/python-pypa-build.hash
> +++ b/package/python-pypa-build/python-pypa-build.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/build/json
> -md5  f2dc1823b0eff7037e19be18e354b2f1  build-0.9.0.tar.gz
> -sha256  1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c  build-0.9.0.tar.gz
> +md5  742e7cd0a67455c1df90061b42088bd2  build-0.10.0.tar.gz
> +sha256  d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269  build-0.10.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
> diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
> index adc124b074..d7c03323b7 100644
> --- a/package/python-pypa-build/python-pypa-build.mk
> +++ b/package/python-pypa-build/python-pypa-build.mk
> @@ -4,14 +4,14 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYPA_BUILD_VERSION = 0.9.0
> +PYTHON_PYPA_BUILD_VERSION = 0.10.0
>   PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
> -PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46
> +PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/de/1c/fb62f81952f0e74c3fbf411261d1adbdd2d615c89a24b42d0fe44eb4bcf3
>   PYTHON_PYPA_BUILD_LICENSE = MIT
>   PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
> -PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
> +PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
>   HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
>   	host-python-packaging \
> -	host-python-pep517

  With this, the host-only python-pep517 is no longer used by anything, and I 
don't think it's likely that it's going to be used any time soon, right? 
Therefore, the package should be removed. If you agree, can you take care of that?

  Applied to master, thanks.

  Regards,
  Arnout


> +	host-python-pyproject-hooks
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
