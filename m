Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3713C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF8661166
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBF8661166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682B8406DA;
	Tue, 21 Sep 2021 19:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOt6vBIndJcG; Tue, 21 Sep 2021 19:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9FFE406D2;
	Tue, 21 Sep 2021 19:21:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 616881BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E4482EA5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNa_2JZPZUKP for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:20:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CCEA82EA2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:20:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id dj4so493339edb.5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=czIHu7wJW+giKK/glQfs7v8xQRp7NhCaO++ZeFqzhpA=;
 b=S6b+Cmua3m5jH3q85Xcw9WqbOnMHOdmII00+ygKy6O8dCC0NTNnLhyJzzqUCD59o5W
 soDxXlbITyquke5NuJpfv9XXxdIcGgcYWNx17pP/rnuKaQp6fv//ZrmI98mMttnJDNJf
 ekeNjrlFfcYNC6n+KEho6GdMMxI/3Kthe+EfasLsdCFEiCJZRfRVvDCgnr0s9+QcFEGH
 pX2FP5qxce/D/ge+7mkvXw4KsMiOia60GRWMFJ7EjRGvyVwN1K6OdKVYppuOQrN4VSw/
 UXNlcI/y9tX8UQG+wCfgNDsykwa36s1ZUufua+SWep3k/elXC9KEVpcuQ6jSENkXOH9J
 E6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=czIHu7wJW+giKK/glQfs7v8xQRp7NhCaO++ZeFqzhpA=;
 b=r5Qff9h7q3OKATPfJTgvWiidr7SXT1x/p+SOFSkigfUlTmP71lFg5WfgKHNGCmEzDo
 SsnnIxxlgoJJoBn7fdUtha4W52xztHVZ+YmbCQA14RYkerjzgRRPQxH8f3bLQ0gx17/F
 OfiTCwN5h3cPguIi3TlEGhAGQQ6e7KB+ZamP8oAI/FS5Pg6fXLE88ECcMztA1IovBd5B
 Gnf/ncUKmHnuI0CD18BYmeC51yTz1IPtvlirAOLtU/2ZHDVRwG03tM9opfZXCbnOqm4B
 dxmkJ8zGa4/bYiSkVmdFSmkcPP9eYTwvt8c9YooGpxCyV0Vx5mXVJspzZ8o07AIxaTTJ
 VrsQ==
X-Gm-Message-State: AOAM530UdWcK0O/gIOUoYl9y34Kzxmc2bZIiyZpHyKK4AfzdEhmHHQJI
 PunM/m+WyXGuUJQk0htrzJcomBmJaKEM+Q==
X-Google-Smtp-Source: ABdhPJwCWIdAMoTb3RRxIA1/86qg1X8gEkmgIW9Rw88qCWNKdn8w4MTdupZBmjdQzwPIUFtjx8r0+A==
X-Received: by 2002:a17:906:608e:: with SMTP id
 t14mr37304470ejj.441.1632252026536; 
 Tue, 21 Sep 2021 12:20:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm9295683edf.85.2021.09.21.12.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:20:26 -0700 (PDT)
Message-ID: <8030701f-e232-a560-d332-4c126d362298@mind.be>
Date: Tue, 21 Sep 2021 21:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20210910185130.2685344-1-m.niestroj@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910185130.2685344-1-m.niestroj@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] package/python-bleak: bump to version 0.12.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 20:51, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-bleak/python-bleak.hash | 4 ++--
>   package/python-bleak/python-bleak.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
> index 9931bce202..5acac877c9 100644
> --- a/package/python-bleak/python-bleak.hash
> +++ b/package/python-bleak/python-bleak.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/bleak/json
> -md5  f15b43e4a6380eadb96b4235385c2ba1  bleak-0.11.0.tar.gz
> -sha256  7796a6188547cf77f668406e6513d5d23316c508ca929882ed429d90c7a745ff  bleak-0.11.0.tar.gz
> +md5  0c26b270358a782767012220fc595aa5  bleak-0.12.1.tar.gz
> +sha256  4a80a24cc944e52e856054639f298229c39a2fc720e5f7adbeebb117d10849ed  bleak-0.12.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index 870bfce10f..3ae6d90311 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BLEAK_VERSION = 0.11.0
> +PYTHON_BLEAK_VERSION = 0.12.1
>   PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
> -PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/7c/f3/817132098d57f5717f7f7dc46357e4ca2647c9addaf8e571382d12a28546
> +PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/67/4b/ba00c69a24a8d08c86f02caa45727a2ad2844c7bee9630ccb063be226f71
>   PYTHON_BLEAK_SETUP_TYPE = setuptools
>   PYTHON_BLEAK_LICENSE = MIT
>   PYTHON_BLEAK_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
