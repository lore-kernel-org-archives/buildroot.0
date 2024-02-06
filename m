Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50142C4829C
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 047C582668;
	Tue,  6 Feb 2024 17:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZe9qA6d58Xo; Tue,  6 Feb 2024 17:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 003388300C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 003388300C;
	Tue,  6 Feb 2024 17:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 666451BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A1F941F99
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1F941F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRKVHuCb9Evl for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:48:22 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB47041F9F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB47041F9F
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so3867450f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241700; x=1707846500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r9e9QGF8Msfrr7KqQvICNBbysSNq2Bxr6ZCB7T9Uta0=;
 b=xRxUSbqFHtJnGpaWVMPhN7G6CDsJSznuMWVEVD2/ZuDcSIB2vLzBnCtfBu4MCE9Fp8
 e2hkL1jGseQ+ve0Dr4VnJ5dZAsOlFgq5R088OFoszyAKZEeL9gkNcLLq/9+zlUnL5WPN
 bo8Sug6Oxdro/ZSq24BM9W/bK+iL4ttJW0DNGsJlGja5E3jSyOvTZoToKTxBPsH2bvGP
 qQR4IZfv3dkdqvc4IGWEXVkq+yBRifCN1VKfFzroziHXsSmWviif0BXPj+QSZEj8zoMi
 T1D02tz7U0f74zskIRPdocpB2Q/6b+NsT/KYt17os7OlX23iJWy/XGg1hxBvM04Y0tx0
 AAMg==
X-Gm-Message-State: AOJu0YymFOWDjCki2djS5OO/h6e2RZGQP9PZGh2MPomBSpuzDF0XMP3t
 IxaITov3wRIjbQEdiPJfdfa0IYVjYNgljcvUOHaxnMm9hUBwWoja6+y5MKPDnEc=
X-Google-Smtp-Source: AGHT+IGigQ6fFeltkARhV+Np5UMtb/XojYqeuqKTnLBuFqddllKqDYySFmeG5169WsZB1nMUjuf0WQ==
X-Received: by 2002:a5d:4e85:0:b0:33b:21f9:cd9a with SMTP id
 e5-20020a5d4e85000000b0033b21f9cd9amr2220713wru.19.1707241699953; 
 Tue, 06 Feb 2024 09:48:19 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU9oORKmjETEPNT5U+pHnjZl9DqYlsj3Rv8ud9zXiIZOD8caPi0hW4yDIiVd4dQfnMSMuKBhe4wHJelAoF9KdK1yM0bPrJ/taUfrkA0cnb6Js4+YvNBvxdRmp0CZOSJuKB7726TqWNyvf/6chhDzvGXDVU/JC4vNQY=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m14-20020adffa0e000000b0033b43d7394bsm2574259wrr.55.2024.02.06.09.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:48:19 -0800 (PST)
Message-ID: <e8e8c35f-d160-4902-a579-5c235cd461de@mind.be>
Date: Tue, 6 Feb 2024 18:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231124225945.163643-1-james.hilliard1@gmail.com>
In-Reply-To: <20231124225945.163643-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707241700; x=1707846500; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r9e9QGF8Msfrr7KqQvICNBbysSNq2Bxr6ZCB7T9Uta0=;
 b=SbnY1QRXWqvTqgNVX5l94AAL6ukYT12d4SreS0j/bdKHe2Y7oEJtLMGrr3gz7yPCdu
 RGxjEVhmsVUr9VJTQjXkdxXAuNUFSaMRfC4T+8OXmGXV/CTYxYUFI3wPHaKbBMJXOg9D
 xM6fn6grD5/Xxncaya9UxgllWv1yD/tQVgE2lFLzo8KxlRI8/QMfTrUMTcMr1qSysRx0
 EQOylahaRvqkXL1kHGC5Mh+0FWquRFM+v43NcXnh/kSTLZhn+6jLCbWXgRWtK759w/7t
 cv9NMYSK/6De0TeBBXa2R2cRaHQRwTliEG75kTOBX5eneTButw5QQxnUiLtQk5KvEikx
 ZCWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SbnY1QRX
Subject: Re: [Buildroot] [PATCH 1/2] package/python-aiosqlite: new package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2023 23:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                              |  1 +
>   package/python-aiosqlite/Config.in             |  7 +++++++
>   package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
>   package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
>   4 files changed, 27 insertions(+)
>   create mode 100644 package/python-aiosqlite/Config.in
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5a3410d758..1f7d262265 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -971,6 +971,7 @@ menu "External python modules"
>   	source "package/python-aioredis/Config.in"
>   	source "package/python-aiorwlock/Config.in"
>   	source "package/python-aiosignal/Config.in"
> +	source "package/python-aiosqlite/Config.in"
>   	source "package/python-aiozipkin/Config.in"
>   	source "package/python-alembic/Config.in"
>   	source "package/python-alsaaudio/Config.in"
> diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
> new file mode 100644
> index 0000000000..6f2af23cef
> --- /dev/null
> +++ b/package/python-aiosqlite/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_AIOSQLITE
> +	bool "python-aiosqlite"
> +	help
> +	  aiosqlite provides a friendly, async interface to sqlite
> +	  databases.
> +
> +	  https://aiosqlite.omnilib.dev
> diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
> new file mode 100644
> index 0000000000..e06061346c
> --- /dev/null
> +++ b/package/python-aiosqlite/python-aiosqlite.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
> +md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
> +sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
> diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
> new file mode 100644
> index 0000000000..e513d53c02
> --- /dev/null
> +++ b/package/python-aiosqlite/python-aiosqlite.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiosqlite
> +#
> +################################################################################
> +
> +PYTHON_AIOSQLITE_VERSION = 0.19.0
> +PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
> +PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
> +PYTHON_AIOSQLITE_SETUP_TYPE = flit
> +PYTHON_AIOSQLITE_LICENSE = MIT
> +PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
