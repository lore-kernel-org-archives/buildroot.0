Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582DC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B848127D;
	Tue,  2 Jul 2024 07:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPgSRNhjN0zo; Tue,  2 Jul 2024 07:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1494981F9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1494981F9C;
	Tue,  2 Jul 2024 07:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B84E1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D8960856
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yxq8K_-S8ORt for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A507B6081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A507B6081B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A507B6081B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:04:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso27738995e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903897; x=1720508697;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tVusjl6WGbzK/GRCEhzrxtNdVcTcnfrRfNJ84m23MRQ=;
 b=QdEIzIeLK3JZMLD/PQWakoitlW/qBDgmWRLqOl+L6+DMYHlAjDciirkqgtL3jWM7ro
 C9Ri9FxHzh1XwcuiYNC+5Hdb3AcHPHwGfWILS+v++QxSr3+vKVeMJlLo3oXJitmrfLWr
 JOvLbztTGkxhvtHPIVpQA6yDWnScO8c1+MUdcEavca/1jEgi8/fabC9aW+gmAiVTh/U6
 VCr+d0HNVBMPI5DY00x/WhK55m23mSzgavofouDWJK7urs6DcOI7lXrl8WNVUPftMpCN
 V9tHOxxuCM1PN2lmYUNFPVVJ7CAbJi7M0O7uiQUF2/l5lBK98XFL6nMzagi75dH5IX1F
 4KRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcaEPrfb2vRfAmIVR0OiLz741Bz8LoqNN9n0bKOUDIOOR+EjqkIo05NC8saua0fkeTOtZ7VxWvr7Q+i85kXk8GORktoxxmPA==
X-Gm-Message-State: AOJu0YxyyhKRi0vL0kGupj5KoHD4Bz3KiFpPFDgJy496PJTzVRsL/aZG
 Z6wPoNYBbsn/lqfQpftDSLa6mkfecJKgcbeLakoEp9EjvfQimYX8kfHQAqESeAQ=
X-Google-Smtp-Source: AGHT+IG/aKf2F/ktLIsk1BfizwM1suqrAibKexIWABdLkkIQ50FpuPURaYZp2gc9+3iUgufhJLpOLg==
X-Received: by 2002:a7b:ce83:0:b0:425:6327:f00c with SMTP id
 5b1f17b1804b1-4257a00ce8emr51938515e9.22.1719903896699; 
 Tue, 02 Jul 2024 00:04:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55aeasm181824815e9.17.2024.07.02.00.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:04:55 -0700 (PDT)
Message-ID: <8b9df79a-a662-4471-aa10-8bd3167e52ab@mind.be>
Date: Tue, 2 Jul 2024 09:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701181716.1738978-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701181716.1738978-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903897; x=1720508697; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tVusjl6WGbzK/GRCEhzrxtNdVcTcnfrRfNJ84m23MRQ=;
 b=UHE/1SNgNO8U2CjoI/M0sGWw/+bAnIfLYHhhjpxKHp8wkshiF9zmx27yltCnx/0Zkm
 v4l7+Ssuc3AhemzLSOnxKCgjm2z6XqEXLM/qS3HWM2G3r076wnJEXapWYgNE19YBCf8j
 xsLlu6e7QiM9cFspr0VAwOnFAjDY2E/3hdXJp/mzhhSaDQMUA3HZkeOS3tQlyBEULq75
 NTwAPGKoPeXvp/97Wd2/TCeSDkokCQQ5HAwYixUaP4ztRw94q1I6XdUU0f2i0gK/p223
 YWRmumzNM+LZB5PwN3WhNdM41kElAMWpYskZ8OA3sM092fbKh3NtOPXEgjQ8zWZuPTL+
 XTSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UHE/1SNg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.4.0
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



On 01/07/2024 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-anyio/python-anyio.hash | 4 ++--
>   package/python-anyio/python-anyio.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
> index e77d30249c..c1edeca10c 100644
> --- a/package/python-anyio/python-anyio.hash
> +++ b/package/python-anyio/python-anyio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/anyio/json
> -md5  22e660fff1a584e72281f0d6a083e4e0  anyio-4.2.0.tar.gz
> -sha256  e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6e64c9be77e3be50f  anyio-4.2.0.tar.gz
> +md5  04346dd3631f405d0786ca0f441dace1  anyio-4.4.0.tar.gz
> +sha256  5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94  anyio-4.4.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
> diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
> index 32c2286157..4f9cbb78f7 100644
> --- a/package/python-anyio/python-anyio.mk
> +++ b/package/python-anyio/python-anyio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ANYIO_VERSION = 4.2.0
> +PYTHON_ANYIO_VERSION = 4.4.0
>   PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
> -PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/2d/b8/7333d87d5f03247215d86a86362fd3e324111788c6cdd8d2e6196a6ba833
> +PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/e6/e3/c4c8d473d6780ef1853d630d581f70d655b4f8d7553c6997958c283039a2
>   PYTHON_ANYIO_SETUP_TYPE = setuptools
>   PYTHON_ANYIO_LICENSE = MIT
>   PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
