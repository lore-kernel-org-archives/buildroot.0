Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE2C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED26580F86;
	Tue,  2 Jul 2024 07:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFx8VKb7Ttnn; Tue,  2 Jul 2024 07:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03ECE8105B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03ECE8105B;
	Tue,  2 Jul 2024 07:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BFED1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 772376081B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2eWSUPrMXXE for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:04:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A50C607D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A50C607D2
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A50C607D2
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:04:31 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so51569551fa.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903869; x=1720508669;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8VFgDGRVsb/dDwHXE8Gj2y6IH3mnC4Sbo4FOYNR0RuI=;
 b=iE00h4QUH8Ie9SXxE2oMdYFmjW6Qlo61Wz2naVVRSFIO3WA0nGI+sfjQHe6nnimHii
 p38EqcW7fd9IQOCvF3t96bMrfSZAnJh0GCeP6J+OSj8ZnUpM1eFEVM+HlDCAVoQvLD44
 ndREyemBztDJUbWaCyU7KzaC1n2BFtDa6YsNLobwEiBfphOb8jQLP0v9eSK8EFCEHQ+m
 N1Jc6eEV3vrliEm82WjLnEtSGDqfRajuYHiGAc1zhUqeHPsfQxC2jfk30LKO875ws1tb
 cK2K8LLmbtcsHhw3EgfYRK7eZGEFsVDCT7j+3Ooqkf51bCO3avu9VMABuUArbVO0ygW5
 EWpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfe7gatjKtQjysChjEQwh9cMdpnc/+sE4L0nmxjpuyR6Ky4lCf0cwERpbOl2dev138m7asDsjGRbDgNFl/KonuDCtVqgc98Q==
X-Gm-Message-State: AOJu0YxkA+UNwZq9InGwcdVworcKlAfL6QrVuVuXarO2nx5nCVhiBejK
 lAgKrHuP5DmWnPKwGNwIqfWqqICFl5O0rrMEDWRUi0KBLshAkdOOT8z6B8mFjAdpMCSO8M/zfXU
 k
X-Google-Smtp-Source: AGHT+IGnt3DYbM52M5x0RInqo8R4n7W+nWD37oNEoicQIoGW9UGOW9/ax/5VNvsAQZdVf+Rtkps++w==
X-Received: by 2002:a05:6512:2813:b0:52d:215b:9028 with SMTP id
 2adb3069b0e04-52e82747e92mr5937340e87.60.1719903868937; 
 Tue, 02 Jul 2024 00:04:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1046f2sm12198183f8f.112.2024.07.02.00.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:04:28 -0700 (PDT)
Message-ID: <c2ab1475-288d-4c91-b7e5-074ab7fc80aa@mind.be>
Date: Tue, 2 Jul 2024 09:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701175821.1731317-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701175821.1731317-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903869; x=1720508669; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8VFgDGRVsb/dDwHXE8Gj2y6IH3mnC4Sbo4FOYNR0RuI=;
 b=PR32dv8+8PTTqC4qeEJRFC521YF/3yj7RUmq6hge167nu1ckktw/QrMefRyoC5rbEy
 xgITHEbN1DyQL1qrYTBNxLScb0YYvuVYbSRK7MQ6PD6cFAaa8/mGk4yCa2Obc1aE52hj
 k8QPvz01un5dqhvSJgF3cSuICRe+y6PqFmP5MYLIFmrpDutbqVDdsE1uv5RCTlECEA6p
 gANGzaIF3WuF4/FUTmoElhu5G+LNIgj9RtaoQmRHcwNVudIZqTikxuwvexOhqDrfPSf+
 ys8xz4C2z1svs0lfV+tbg1Ye1rRg2cHvWfbAyk7YYNXdMxpo5QFF1Ozo1cEFzM+DiW+m
 g9Sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PR32dv8+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to
 version 1.0.5
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



On 01/07/2024 19:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-httpcore/python-httpcore.hash | 4 ++--
>   package/python-httpcore/python-httpcore.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
> index 1623573b65..e773374c05 100644
> --- a/package/python-httpcore/python-httpcore.hash
> +++ b/package/python-httpcore/python-httpcore.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/httpcore/json
> -md5  155fbd7794ce7351b607d408cb8182bf  httpcore-1.0.2.tar.gz
> -sha256  9fc092e4799b26174648e54b74ed5f683132a464e95643b226e00c2ed2fa6535  httpcore-1.0.2.tar.gz
> +md5  17916ce84db1c0705af60a61bbec9061  httpcore-1.0.5.tar.gz
> +sha256  34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61  httpcore-1.0.5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
> diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
> index f1b3b810d7..ae29d8dc8a 100644
> --- a/package/python-httpcore/python-httpcore.mk
> +++ b/package/python-httpcore/python-httpcore.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HTTPCORE_VERSION = 1.0.2
> +PYTHON_HTTPCORE_VERSION = 1.0.5
>   PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
> -PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/18/56/78a38490b834fa0942cbe6d39bd8a7fd76316e8940319305a98d2b320366
> +PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926
>   PYTHON_HTTPCORE_SETUP_TYPE = pep517
>   PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
>   PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
