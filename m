Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E66C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7E341952;
	Sun,  5 Nov 2023 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7E341952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQLvC6oifB_U; Sun,  5 Nov 2023 21:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9503F418E1;
	Sun,  5 Nov 2023 21:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9503F418E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 972AC1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D5F96104D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5F96104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2zkj06oJLb7 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:08:38 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B2CD60BA2
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B2CD60BA2
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso6353886a12.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218516; x=1699823316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ClsYIQpUd+ebntMGdhwrw0Nx5ttPCcZS3zRQiieQoAo=;
 b=xTd6CwZKEG83ZcHViOBkDMoqqXhAb5GHBqyXmTy25mEcgm5SZH9SMzFFhQlHpILQ39
 FTUvy1RPYfPGAuVSVkyaSozu3pg/y2vVqQS3zZIIUm8Va71Z36rKWf9WPIQCzlmog4Cq
 9Vt08DuvaO9YwD/W1n8X+t2eSq+tNc50NkPt4c7jlgzngOPykXRphmrAM3/BDYFxo5nL
 ACS6N8bPT2XUzv2gZrzOgCKB5a6qdK11fP4PSznf11gwf+nITdPo+MndgJ/orehelwee
 5SMIoKTOJ42F4DdcJxpwL8seBgQYdLmywW0ZL4zkeW2XGzl+2LubNN8OXf2o42BUrN4/
 IKLw==
X-Gm-Message-State: AOJu0YwH/XrHo2RUqsQkktW20s/JvMKj5UAiXWMAvZshRhsaA+C/S7KJ
 ovoT6t/2ewKPDEEIyo4EJ0U7LQ==
X-Google-Smtp-Source: AGHT+IGVe8M8pZmdTzxDpknrJKhcFLfnn8umnZzxZdNnoDOhlrNlEMutoreTMCxAOTGUuiCcOYG3Xw==
X-Received: by 2002:a05:6402:54f:b0:53f:a4f7:7bfb with SMTP id
 i15-20020a056402054f00b0053fa4f77bfbmr19827438edx.17.1699218516489; 
 Sun, 05 Nov 2023 13:08:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a50d79b000000b005432f45bee9sm3659319edi.19.2023.11.05.13.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:08:36 -0800 (PST)
Message-ID: <fa4a43c8-2e50-4c5b-80f2-7d144f8f3b00@mind.be>
Date: Sun, 5 Nov 2023 22:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104230029.2668016-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104230029.2668016-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218516; x=1699823316; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ClsYIQpUd+ebntMGdhwrw0Nx5ttPCcZS3zRQiieQoAo=;
 b=R/bdrDNlAK7n5/Y2xN7fN0vI89OjlI9JlXLoO93IZyf5ZmiEsXTc8HSAaeCTJH8/4n
 kBT2PbxHkzDhlEOOpB3//og1TpwdZU8NT24fTF8snLkYHN8t1Y9Bv0/FmReZ2UpQuJxP
 vGIJBsExxpcG7YJx38RBZ9SbUoYm0FfzCpAfyEl0cMAnq+UdKsNiA11HE4q+Ay90ViI1
 TNiYgseESITjU14Tld2MEdkQ7dsNkIMpKTfPzk6rJd1p+yi8yGYJp/PaAKE/GaUTvUTd
 b38Wz06T1BD47ixieBp1bQqJFv8IS5AKv/KGMGE/VocVkzEKIdxF6QY0vNOvNQ1gked9
 ZSKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R/bdrDNl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aenum: bump to version
 3.1.15
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



On 05/11/2023 00:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aenum/python-aenum.hash | 4 ++--
>   package/python-aenum/python-aenum.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
> index 40c0e55fc5..9c59804d6e 100644
> --- a/package/python-aenum/python-aenum.hash
> +++ b/package/python-aenum/python-aenum.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aenum/json
> -md5  c0b78a74cdfacc0bf0cbb42785afaed8  aenum-3.1.11.tar.gz
> -sha256  aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73  aenum-3.1.11.tar.gz
> +md5  f3fa11cda9ddaaed4d3f03b35f3a65ea  aenum-3.1.15.tar.gz
> +sha256  8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c575b9559  aenum-3.1.15.tar.gz
>   # Locally computed sha256 checksums
>   sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
> diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
> index 603fc66d0c..27f9e5cea6 100644
> --- a/package/python-aenum/python-aenum.mk
> +++ b/package/python-aenum/python-aenum.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AENUM_VERSION = 3.1.11
> +PYTHON_AENUM_VERSION = 3.1.15
>   PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
> -PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/63/6c/a71e18de7c651f384b328be6bccadbbd472aca62f547c1a307b9388d03ca
> +PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/d0/f8/33e75863394f42e429bb553e05fda7c59763f0fd6848de847a25b3fbccf6
>   PYTHON_AENUM_SETUP_TYPE = setuptools
>   PYTHON_AENUM_LICENSE = BSD-3-Clause
>   PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
