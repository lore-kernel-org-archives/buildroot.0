Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D505C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA1F81776;
	Wed,  7 Feb 2024 16:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEU_zwMXffZY; Wed,  7 Feb 2024 16:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CF98186E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CF98186E;
	Wed,  7 Feb 2024 16:44:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8BC81BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3569409EB
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOyn8Qdbv-UH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE747410E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE747410E6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE747410E6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:44:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so7529645e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707324280; x=1707929080;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kBpurhBM1MQUkRWRQoMKkNYRkW3RwNgW65r01KIzPNA=;
 b=BoDJXY7Uf5oo07DJmlM3BUwyDwPMyIZ00We6hZwjd1hAKXDEcAChX76iYiphEdCFRa
 nGPUUqDG8hPSjjWIughvQpRXMpcU9KyphNayvKoQNxsf2RRRCmXyEJSObw64ct4K5kDm
 FhHPjkUN7BtGGosWR4IswY6DDEpQkMXInrjaJ1Aor1KrpxjNZLfEO9HHMIQzyDYgJMJi
 XV/hVdKhSpn4PHBbi24tTWu6oKmiyDLb9h4wvq6HxQh1WG5r3YWUsyvE2odvp7HSuNrz
 LX3K1PACnazRCRc3Sg1ZuUFHu+vgfoZzPbCmwFW9n15IS+FeJaXkA51l0eV/e/PkJjaR
 cy+Q==
X-Gm-Message-State: AOJu0YwabUG9gqajaZTjdixQtvCCymPR5ylZS649U/L74P1bg+992BNl
 Jm5h+V7G/nGumWfW6emAZ5FlkKUuJXVd+4z+OJSfpNhUK8kXWMibHzuiCcIWUVE=
X-Google-Smtp-Source: AGHT+IGKyHw2ueK8cqKXM8lWynZvSTvwpAP6zLkwid0veavmeb79tyxhPY+cUIEWO1nhnYSHghHOrw==
X-Received: by 2002:a05:600c:4f90:b0:40f:df20:3bc3 with SMTP id
 n16-20020a05600c4f9000b0040fdf203bc3mr5050811wmq.3.1707324269540; 
 Wed, 07 Feb 2024 08:44:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWRIWr7qMSUKnsNRhHgZ7NSddSA91eEnFLX1l++7Rq2a1DwCL8eK5duAIj6j4+5u4Btuz39iCHOWvbqjPmtC5SXeg+9DhDfVQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040fe5994d0csm2648349wmq.0.2024.02.07.08.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:44:29 -0800 (PST)
Message-ID: <72875bd7-8a7d-4db1-917d-17dbc90ce35b@mind.be>
Date: Wed, 7 Feb 2024 17:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111071354.3071382-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111071354.3071382-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707324280; x=1707929080; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kBpurhBM1MQUkRWRQoMKkNYRkW3RwNgW65r01KIzPNA=;
 b=JMV6rEF78KI/4BdYAzMt1qeIAosp2aTfVnlgfxkKmSJNfLwReqJguFP3+5pu3Ue6vY
 xKYnXcGmYBfEmUMw2/H6qktTzCtTgwevw+32jQw1twLzAEoV3heH6WzQWp9fQuiSL9BD
 XCxl7zSHof9CF5jTAdxcZ2D8wTOMZwArm9ToR+FU5grDMjbqoXnVeKzvrR18cG29l5Ao
 XhhOoYDoJ61s0N1AbqwI+nHvEFi8v/I9r0dLaQSysPK8o/M6YNzJavznpCN8e8XV9wuH
 G2SUsV92wBXhp0RAE+NcIKAHwit/Mi9JJChKxoXPGN+pGWGV6kLsSXXulDmk0W7E0xKd
 KBtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JMV6rEF7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to
 version 2.5
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



On 11/01/2024 08:13, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/facelessuser/soupsieve/commit/1615584814d597ce87d4b4d675250cbe20e3fa30
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-soupsieve/python-soupsieve.hash | 6 +++---
>   package/python-soupsieve/python-soupsieve.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
> index cf348d441f..278c7d1b0c 100644
> --- a/package/python-soupsieve/python-soupsieve.hash
> +++ b/package/python-soupsieve/python-soupsieve.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/soupsieve/json
> -md5  4c824620563604cbf783de149c8b8889  soupsieve-2.3.2.post1.tar.gz
> -sha256  fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d  soupsieve-2.3.2.post1.tar.gz
> +md5  88ae72bd970b425692235d17224204e6  soupsieve-2.5.tar.gz
> +sha256  5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690  soupsieve-2.5.tar.gz
>   # Locally computed sha256 checksums
> -sha256  bc66234cadd3f6e7aaf7160faf165f3f869ffc8a11b6b0d6c44a2e2a83314dd0  LICENSE.md
> +sha256  ceb7b9053b88addffa3102a457302bd840d123925ee9ed9c2ac90cf6548b33bf  LICENSE.md
> diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
> index ebf2ada7ac..581df7e787 100644
> --- a/package/python-soupsieve/python-soupsieve.mk
> +++ b/package/python-soupsieve/python-soupsieve.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SOUPSIEVE_VERSION = 2.3.2.post1
> +PYTHON_SOUPSIEVE_VERSION = 2.5
>   PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
> -PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/f3/03/bac179d539362319b4779a00764e95f7542f4920084163db6b0fd4742d38
> +PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/ce/21/952a240de1c196c7e3fbcd4e559681f0419b1280c617db21157a0390717b
>   PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
>   PYTHON_SOUPSIEVE_LICENSE = MIT
>   PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
