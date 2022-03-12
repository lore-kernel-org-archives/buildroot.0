Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B85082457;
	Sat, 12 Mar 2022 17:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c9qGfdvAUXQ; Sat, 12 Mar 2022 17:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C72D82451;
	Sat, 12 Mar 2022 17:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051EF1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F398B4023D
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFVjrueKbujo for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:08:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F4179401D5
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:08:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qt6so25361083ejb.11
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FwHHyTmmD5APiLKPkgiIp26hiwJBIv0VUNvTTizFMfQ=;
 b=ddX7aVxsU1vJNm36WMRJNoYKMa6b5ub8oydXq7CA+y52GdFwyIgqSJfE8MHzJvnKyR
 ihjjEm8re4OGMktVz9DgnxjFB14UuUkp01B4hh6xEqdKee8PxC4D/DuwGKtYc8pp46jv
 /fQbGEpJVgLwTcrv/4UQUtP21KCtuQNVj78LBDqNMJINqd0uaSj3RkqMxtt4x8yOV5eR
 axx6By8fsa55oqZcbhoboGDK/09Uu+dA8a7HWXcM4kPf0pZaj7qVJ29aM7KWUx5X3MMO
 hneC5iDV0/kfmyaYATF8gMPFemmBeIX68rUJjZyOEDk0497Ex2dTDkNwcYJmev9KXyOD
 Cxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FwHHyTmmD5APiLKPkgiIp26hiwJBIv0VUNvTTizFMfQ=;
 b=eqZHTNGgYgocJns2zDMEv6vjKcXjkC44FzZCvXbFNvfh+O5jVd8Wna+n19pzL8mVik
 WmmqRs72lSwEiyTk74wKkSxgEVMnEpzvqfpWYQSrdna/KyaxD3Vd1VtBf83q4a+MTEbm
 CCGb8/4OZp7NX/pPH47D6R9v8bLf8Rnm5+c71UsocTyyKGjLSGDDDFM87CBRDuKRkMwh
 32j47g8dK1n870CFZBTGY6GuvukVLby3O964WkthXgBEynA/okLS0ZQudYvfTApAGyx/
 4NvFe2jHsHNqfCmStKr9tQgNxUhKdEqY3wX2SxFXkOXg/v3Ejd98j/1daccSWxBU6dJt
 3VBA==
X-Gm-Message-State: AOAM5314QZtSoVDOqqwGWiqb3CoPQKn4LJk9vZFxJ44wpm5QMAWUn5zt
 WxcK9JikaV/UtKppCdMxNpuBUAajamopNg==
X-Google-Smtp-Source: ABdhPJw7YjfCjpkvBHZmBeYIfL7kP80ujvCkhnkkcTl8O1cTGRN4k6rDFGoFh8c66P2QcMn61iWR3g==
X-Received: by 2002:a17:907:8a04:b0:6cd:2902:8db3 with SMTP id
 sc4-20020a1709078a0400b006cd29028db3mr13012749ejc.530.1647104883123; 
 Sat, 12 Mar 2022 09:08:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a1709072cc800b006d6e469fbf0sm4480372ejc.134.2022.03.12.09.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:08:02 -0800 (PST)
Message-ID: <087a4660-c51e-098f-33a5-72544c8701d6@mind.be>
Date: Sat, 12 Mar 2022 18:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220222185206.230318-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222185206.230318-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-distro: bump to version
 1.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 19:52, Julien Olivain wrote:
> For change log since 1.6.0, see:
> - https://github.com/python-distro/distro/releases/tag/v1.7.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Tested with:
> support/testing/run-tests \
>    -d dl -o output_folder -k \
>    tests.package.test_python_distro.TestPythonPy3Distro
> ---
>   package/python-distro/python-distro.hash | 2 +-
>   package/python-distro/python-distro.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
> index e2b3c0a444..8f09197156 100644
> --- a/package/python-distro/python-distro.hash
> +++ b/package/python-distro/python-distro.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
> +sha256  151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39  distro-1.7.0.tar.gz
>   sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
> index 753e74d020..c69849b7ac 100644
> --- a/package/python-distro/python-distro.mk
> +++ b/package/python-distro/python-distro.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_DISTRO_VERSION = 1.6.0
> -PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
> +PYTHON_DISTRO_VERSION = 1.7.0
> +PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/b5/7e/ddfbd640ac9a82e60718558a3de7d5988a7d4648385cf00318f60a8b073a
>   PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
>   PYTHON_DISTRO_LICENSE = Apache-2.0
>   PYTHON_DISTRO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
