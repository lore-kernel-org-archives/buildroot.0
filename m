Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE47C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEAE480FBA;
	Wed, 27 Mar 2024 22:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfASfP3p7QF2; Wed, 27 Mar 2024 22:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3AC0811AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3AC0811AA;
	Wed, 27 Mar 2024 22:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7FD1BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32864820CB
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrF2XZCTpYIE for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5850D820D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5850D820D0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5850D820D0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:00:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41488f9708fso2167685e9.3
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576843; x=1712181643;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Y/9PRAHexYXijRIhMSlRMO3e6Gx/LzToKSqUtgWPDA=;
 b=RTsryp3k/hap8loNhEiYDfMnONt02/AwcquNmwga4zWpuWVSgiuJxma14fqShbx4ee
 CdWUU+Enj2VWeE2C9OsbUAyzYF6H+VTDSEWPDCZZCFlAr8JDVOqpvdCFD1pQvbqsZve0
 0BMHFur9dahonJGgm8I7+uAqxCyD39Kf8BFtgxvZlTinG9jnJKejVXVKuvBGkG90TCWb
 ISKAR81XdZdm/g1xrLE6LlXZVkdxyRXFb/TNfdiMfwm3Mw4pBvpxk7PCnYhVNkD6kRaw
 8oROsgn6EvdUTlgm5RvaTqfK4BWUX2fQIwF6DAj372DAoH2SPiD6W752lg/Jn/Kz37eD
 EdDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLUaBUfZRvsQK5A3zezQ4oLxLsLPZ+kfFOKtAWXXPu29u0MyidOEm9+kGvWuCIpVc4Fm993mx4YwzNXHEqtnvki+EI6C5s5g==
X-Gm-Message-State: AOJu0YzLpi0CtR4T/u51GNEmnGPdYrRjOXgdDpmLuuwXAFpAD3vEI/Db
 F10Cz7oUpjxh2hT/Hj4sg/OV9liENJRzlt/Cftpy0gSntZ+CXtix/bbQui4T8WM=
X-Google-Smtp-Source: AGHT+IEkvXTStZemhVTCfUs+jcntByW0dGC8dUkswQHXDLLnaz6sLmZfIKqGultFE5vY8/Pvw2jPdA==
X-Received: by 2002:a05:600c:3585:b0:414:759a:71d5 with SMTP id
 p5-20020a05600c358500b00414759a71d5mr861741wmq.34.1711576843313; 
 Wed, 27 Mar 2024 15:00:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b004140c161e8dsm3360267wmq.43.2024.03.27.15.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:00:42 -0700 (PDT)
Message-ID: <7df67d9f-9078-4edb-9017-f99e26b0c39c@mind.be>
Date: Wed, 27 Mar 2024 23:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-7-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-7-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576843; x=1712181643; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Y/9PRAHexYXijRIhMSlRMO3e6Gx/LzToKSqUtgWPDA=;
 b=gal5baqcjsrBuOEPXdcGd6LcQVmOzqgaf2fgjnmGrMoreRZt6f4vsQNZ5uCQGqKFiI
 ZTS+ATBbv8R+66ZON42QmwSG3yFzeTHxelcGLMBnOXgUxo2PaKaXfCecNbd0x53HMn/u
 aLRBsGvjPs1NZI1o8N/7Zk3vr/uM5Hfv5gusfkIMsjeF7ohJxKETbNgJeh2yX1nwom/U
 JVv8rn6ZjHfzYtPJQj+LYKtHQjLnBl3Yz7QmHyvaVR7Vy4LG6YCDmzjH2DQaLocYQZ+2
 dGsxZ7ky4HyxmxSRlpWro0cXiyVv7h4QrUvjFBeU3iAZ4O/klgE9BdoNYhGoKAJwOuMB
 FNWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gal5baqc
Subject: Re: [Buildroot] [PATCH v8 07/26] package/python-aiologstash:
 migrate to flit build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 22:14, James Hilliard wrote:
> We need to add a patch which selects the correct flit build
> backend.
> 
> As flit is configured as the pep517 build backend for aiologstash
> we need to migrate from setuptools to flit prior to migrating
> setuptools to pep517 as the frontend will not fall back to using
> setuptools once migrated.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...Fix-flit_core-build-requires-backend.patch | 31 +++++++++++++++++++
>   .../python-aiologstash/python-aiologstash.mk  |  2 +-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
> 
> diff --git a/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
> new file mode 100644
> index 0000000000..99a150a344
> --- /dev/null
> +++ b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
> @@ -0,0 +1,31 @@
> +From 3c4d1203eb9ee3dbe79b096d587c9baaf8b802ed Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Fri, 11 Mar 2022 13:26:31 -0700
> +Subject: [PATCH] Fix flit_core build requires/backend.
> +
> +Only flit_core should be required by pyproject.toml, the regular flit
> +package is the pep517 frontend which is not what should be set for the
> +build system.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/aio-libs/aiologstash/pull/258
> +---
> + pyproject.toml | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index 7bdaebb..252a660 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,6 +1,6 @@
> + [build-system]
> +-requires = ["flit"]
> +-build-backend = "flit.buildapi"
> ++requires = ["flit_core"]
> ++build-backend = "flit_core.buildapi"
> +
> + [tool.flit.metadata]
> + module = "aiologstash"
> +--
> +2.34.1
> +
> diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
> index de0ed820a0..bcf60a72e9 100644
> --- a/package/python-aiologstash/python-aiologstash.mk
> +++ b/package/python-aiologstash/python-aiologstash.mk
> @@ -7,7 +7,7 @@
>   PYTHON_AIOLOGSTASH_VERSION = 2.0.0
>   PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
>   PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
> -PYTHON_AIOLOGSTASH_SETUP_TYPE = setuptools
> +PYTHON_AIOLOGSTASH_SETUP_TYPE = flit
>   PYTHON_AIOLOGSTASH_LICENSE = MIT
>   PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
