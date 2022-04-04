Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2817CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D607040393;
	Mon,  4 Apr 2022 19:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nio0XjO3LMj5; Mon,  4 Apr 2022 19:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE6040201;
	Mon,  4 Apr 2022 19:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C58A1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1945D40984
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2x_ZpP0cjK4F for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:47:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F025040993
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:47:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bh17so22195343ejb.8
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3be2gbiH7dXeiowaM1RqhV6q4MLbDHxD4qVqg9QDgUM=;
 b=Q15BPwMK+aS69OMylCt7ZZ3UzGnXDQZOoNTdE3jIaGz2sO6CIzTha0RKTh1azb5X/i
 8jbbUnkLSnY4zHFVQnaRW5/8H644Et9M4x5zrMAQyM/yK3VCQ0CmESPIJ1zvUt8mUF1H
 24PQnH26B+X83r4zySE6epjPKHTxuGYd3k6psA2InMUJk/d0N9xsl1509NLXJsfhh/77
 YfINfHbW0HWbPVqpnou97NxYrxXzFgdxFRhJTlBtEWd8wT0/BX17zCxhaMMrYXgEktiL
 abkGqRpaIfYtvxZ9TBlrVs0aap6asiktlFoyh29ptQOq9YNfeJl1MhlRnVm4MHLcqJnV
 t5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3be2gbiH7dXeiowaM1RqhV6q4MLbDHxD4qVqg9QDgUM=;
 b=wK5v0KRNTh4MYuyDXYFPLS1eUm/QumQjeAz3Rve6VkJp82zCmq7xxy7c1dT1NfTQbA
 AD7TKDvyd0tNK6ak9oq6Xgyln32GdaOlC/MZIWmUy3pyqe4bifox35pqxIDRYSFZ46Ie
 3I4m1RZ+cNFwSqYHin1MU9H6+YOQiQRRUjCJ5meWVotveiVf+yQMQEKpntCeyoeXDqYd
 YqmJBHaX/9D2A+acydVnZeMNjWwn53q+Ocmy+rY8xraynBTPbduFgbVOhA2+ARoKI+yT
 t/dnPrnZr8eaNAps7/3BiYj253MedfKi4goIM1EBOuGa2SNC62w5rwq+bDc/nw/dkHJL
 urdg==
X-Gm-Message-State: AOAM531e8f2lnqY1BJQeyoWPEvDin7Pq32/6m1GSXgHW/l3GaN87EbxQ
 RX4oyQK5sdLBeJUaDk2BuSa37Js10PWyug==
X-Google-Smtp-Source: ABdhPJxCdfk4e1+fpCUTrCLBDN/+vbv+BeYX5ae36pVyqt6M+1x3ym9c2LlrKTrFuV326be41/YxwA==
X-Received: by 2002:a17:907:6da9:b0:6e7:fcd8:739b with SMTP id
 sb41-20020a1709076da900b006e7fcd8739bmr1781002ejc.308.1649101648144; 
 Mon, 04 Apr 2022 12:47:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b004193fe50151sm5903110edr.9.2022.04.04.12.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:47:27 -0700 (PDT)
Message-ID: <f9a32f08-dbfe-bfb6-3489-31e0604e48b6@mind.be>
Date: Mon, 4 Apr 2022 21:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Emile Cormier <emile.cormier.jr@gmail.com>, buildroot@buildroot.org
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/6] package/python-snappy: bump version to
 0.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 00:19, Emile Cormier wrote:
> From: ecorm <ecorm@users.noreply.github.com>

  Meh, annoying that github does this.

> 
> Required by python-crossbar and python-autobahn[compress].
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>

  Please make sure there's an empty line before your Signed-off-by.

> ---
>   package/python-snappy/python-snappy.hash | 4 ++--
>   package/python-snappy/python-snappy.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
> index 1e0f96054f..32df2bea48 100644
> --- a/package/python-snappy/python-snappy.hash
> +++ b/package/python-snappy/python-snappy.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/python-snappy/json
> -md5	82e09ffd44204096fc70d6de14d0ea2f  python-snappy-0.5.4.tar.gz
> -sha256	d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2  python-snappy-0.5.4.tar.gz
> +md5	fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
> +sha256	b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz

  When updating a hash file, please also update the spacing to two spaces (as 
reported by check-package).

  Applied to master with all of the above fixed, thanks.

  Regards,
  Arnout

>   # Locally computed sha256 checksums
>   sha256	d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
> diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
> index d087c83b10..e80aa861df 100644
> --- a/package/python-snappy/python-snappy.mk
> +++ b/package/python-snappy/python-snappy.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_SNAPPY_VERSION = 0.5.4
> -PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be
> +PYTHON_SNAPPY_VERSION = 0.6.1
> +PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>   PYTHON_SNAPPY_SETUP_TYPE = setuptools
>   PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>   PYTHON_SNAPPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
