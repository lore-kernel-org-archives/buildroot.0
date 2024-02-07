Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF4C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0970A82726;
	Wed,  7 Feb 2024 16:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxeNLXvs36l1; Wed,  7 Feb 2024 16:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183DF83C12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 183DF83C12;
	Wed,  7 Feb 2024 16:38:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 057831BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A8883C12
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP-sLLtTkmdE for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:38:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC8E882726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8E882726
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8E882726
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:38:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4101da33362so4324375e9.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323882; x=1707928682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d48vErxFmtKbFfoEo8pA6dD9gcyqTDKswdpiIk91Dok=;
 b=CMXeLhtd3CW54+bZ7hqfRS0i8zlcIXz+tvnOfGjeFf/5jc86d9I56RmtWq8hZnsIud
 fK6zBxr4BMf1o0th1QyW+k5Vxikl1hm5BuUvwtxzxGTgU6U4NQIAEAzEAxH0QKVwQR3R
 xNviHvBzkCmb5ahyjyw7OBmBLe/J5k7fiHplS8xvBc5O1CuMVgLdpDR+IYcl3P+ktsTs
 YjgoT9G5L4XoP+ugNzOuuNiauyo2cWsNa1Y5uqczBHo/oqH1nSkDAKLFzrlQTrszsr+T
 S1ygSC26XEAwne/3TDlzSU0h4v/NyTewLyU+xCvxNq3KOKr1df+ef6jhM3WNPXHfYy3o
 IKpw==
X-Gm-Message-State: AOJu0Ywg05Up69Z73RQoX7p4VGQgsAKtzXk8gePsJWL7fN5J/KwrfF7G
 wFUoSkNji2NDD9+Ze0zwO0srq1LBB0+B2yKoIxGIZ9qsZswKlJAJcRAYDlYSi+g=
X-Google-Smtp-Source: AGHT+IGQY9YtQcLsA1UZzfPTl3zrrhiGzKb2O5jtcAO7tC1J7XIYDLoDhgpp8VhHTasHIbU2upVWbw==
X-Received: by 2002:a5d:4ac8:0:b0:33b:2b45:9618 with SMTP id
 y8-20020a5d4ac8000000b0033b2b459618mr3672876wrs.58.1707323881967; 
 Wed, 07 Feb 2024 08:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCQf54fyd9lMQ5duE15bMUIG2uEc4jLq43g4ujTHzJMr1IfmNcEqiyd9HzhwqgQw9xvQSnhlS3wtY4M4Litswon2q2M5jung==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:38:01 -0800 (PST)
Message-ID: <143e5206-5b0a-4860-a575-44fbef70c582@mind.be>
Date: Wed, 7 Feb 2024 17:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111063622.3047258-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111063622.3047258-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707323882; x=1707928682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d48vErxFmtKbFfoEo8pA6dD9gcyqTDKswdpiIk91Dok=;
 b=OBosiknh0gqdVy3RJrKkIU1I3fsFrH1jGAZLTGJjsCM4Q88V4Ulzd0Swf4gs+DFMpV
 gi0h30r92gEP8gwI5F7ZBRAw0AUOHEiYx/J4aGwF7OMZsxvuYrIst9/N0dQu/pNfseCe
 icvIONLcly8zAQeqsiLYC26BjaGiiog54YOS0Kfl//hjoE43fuCbm+Q3Vm4FPA1o5WcB
 cjBnPP8jjWCOj88TD+0E6Cyqr25XqTjbgWs8QisGpG9YP+WaaNsrvjRqFQFQf/T6noj3
 hHhBUM4N6+MOZ69KXEEhaGdR/Gu+meB4MiPwK6jb6BW/Bw8QlBrd3Ie7VCekeEcb4HfE
 64wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OBosiknh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 8.0.4
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



On 11/01/2024 07:36, James Hilliard wrote:
> Migrate from setuptools to intree pep517 build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-scm/python-setuptools-scm.hash | 6 +++---
>   package/python-setuptools-scm/python-setuptools-scm.mk   | 9 +++++----
>   2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
> index 8cfe07d1d9..1a884dbbbf 100644
> --- a/package/python-setuptools-scm/python-setuptools-scm.hash
> +++ b/package/python-setuptools-scm/python-setuptools-scm.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
> -md5  158dc741637fb4fa4b955c62bd2c08be  setuptools_scm-7.1.0.tar.gz
> -sha256  6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27  setuptools_scm-7.1.0.tar.gz
> -# sha256 locally computed
> +md5  a05e98ab9ae447e173f0c747e0d49e81  setuptools-scm-8.0.4.tar.gz
> +sha256  b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7  setuptools-scm-8.0.4.tar.gz
> +# Locally computed sha256 checksums
>   sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
> diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
> index 5a35c35a1f..4cbf914690 100644
> --- a/package/python-setuptools-scm/python-setuptools-scm.mk
> +++ b/package/python-setuptools-scm/python-setuptools-scm.mk
> @@ -4,15 +4,16 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_SCM_VERSION = 7.1.0
> -PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/98/12/2c1e579bb968759fc512391473340d0661b1a8c96a59fb7c65b02eec1321
> +PYTHON_SETUPTOOLS_SCM_VERSION = 8.0.4
> +PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools-scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
> +PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f
>   PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
>   PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
> -PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
> +PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
>   
>   HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
>   	host-python-packaging \
> +	host-python-setuptools \
>   	host-python-typing-extensions
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
