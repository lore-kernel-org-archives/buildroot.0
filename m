Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826E4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:57:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD5060F11
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADD5060F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C59080F1B;
	Sun, 26 Sep 2021 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ix4tda2w_P2R; Sun, 26 Sep 2021 20:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92ABE81751;
	Sun, 26 Sep 2021 20:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B31981BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2DC281751
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kv4JK8h5vHMh for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:57:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F07680F1B
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:57:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id dj4so60609296edb.5
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4HaMkI8QUJTGWPbn/xD5hrBDAfRKs0t47fabMaXeazk=;
 b=Rd3d/ZFyq3PjCoFYAkiTbaWnfsWWQKTmYWBeisO7rSpXTJntSzMv3ZmiNLAWtDd3P6
 w5CjBNNv37yUmf7tAVAIMs2xftOEgT3Q/Q4owAQB1GtvNWCdlukM02/teW+12tyN0mIF
 kye5Ye4D+5cd9UsLJylEA4GpQNXbSy39eKbu5cZRAEY5GpEXQsjyV7IcjS4kv1E1JU9S
 WmO/dE/sAAAe7/bDMJOViopTs0dgdST3RQJiq2VHkWbdPEttKBcHGTCIA+gfexoitS/q
 akHLRRHRisCUN9O6aAuxQ2rffDP6pfFshxIK97pnZbGctG983RQMkuwWdlXrY8NLpgme
 p73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4HaMkI8QUJTGWPbn/xD5hrBDAfRKs0t47fabMaXeazk=;
 b=WAvOvu00H0ghbDKvqwjqzWMUZ8/awqLPOR0pOeTAQauHXiFDfwnEGvtK+vpd10XEGQ
 IpNSkMwbZVnT7fJgrNKAJ/Kc0FMygG1MPVfiIQFJPYsNzrhVz446F6A9FqtjUslmXRxI
 kfjAmDqeWyWgTFCHy6FGu3ee2NJvF4eFZJlB0DgLQXJ4gnndoF7NcMZNjdY6FpsX7uvd
 2jirgvs7zrcoWqn4MRENmyu6Lp9G9q7c4lBTPwVIeBXyD0IP6DAaG7FvB43b2VradtJP
 qYH6BKZ+12lV4imvMDSqFu/ZT1xBdaKZanH0MhhtoCjtzm/2aoxnJhCjqjQQ2ZdK5K1G
 1zJQ==
X-Gm-Message-State: AOAM532rZScAokLwK8aHSzzAXcx3WjD8zzkt3NNIOOwG6zCFBkrw3mIS
 TViIti7gZ8cC789kLXO3ASO9ow==
X-Google-Smtp-Source: ABdhPJywksyQDvc75q0dveLuyUfhPd7c1Tj7JZ6d/Q+RHul1Y0urEoYMtKxx06M/IdNEebJEuCikZQ==
X-Received: by 2002:aa7:c5d9:: with SMTP id h25mr18874467eds.159.1632689864392; 
 Sun, 26 Sep 2021 13:57:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r19sm8979868edt.54.2021.09.26.13.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 13:57:44 -0700 (PDT)
Message-ID: <ea27257c-18c6-c09e-3bb8-63ad483677c5@mind.be>
Date: Sun, 26 Sep 2021 22:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210922041943.3269673-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922041943.3269673-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to
 version 0.3.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/09/2021 06:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  All your python package bumps from September 22 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aioconsole/python-aioconsole.hash | 4 ++--
>   package/python-aioconsole/python-aioconsole.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
> index dea2216fcf..a9823aa7a5 100644
> --- a/package/python-aioconsole/python-aioconsole.hash
> +++ b/package/python-aioconsole/python-aioconsole.hash
> @@ -1,3 +1,3 @@
>   # md5, sha256 from https://pypi.org/pypi/aioconsole/json
> -md5  66d4b05e3bc75267daf0f773d839f62b  aioconsole-0.3.1.tar.gz
> -sha256  7c038bb40b7690bf5be6b17154830b7bff25e7be1c02d8420a346c3efbd5d8e5  aioconsole-0.3.1.tar.gz
> +md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
> +sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
> diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
> index b32d2bea0f..393fdf6e45 100644
> --- a/package/python-aioconsole/python-aioconsole.mk
> +++ b/package/python-aioconsole/python-aioconsole.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOCONSOLE_VERSION = 0.3.1
> +PYTHON_AIOCONSOLE_VERSION = 0.3.2
>   PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
> -PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5a/12/fce04ddc0a8ebd6482e5ec293d8bda47c9e05c82826b061f7b73523b8601
> +PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
>   PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
>   PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
