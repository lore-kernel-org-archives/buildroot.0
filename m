Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC078C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A645E81F49;
	Tue,  2 Jul 2024 06:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibTvOzYYVEbd; Tue,  2 Jul 2024 06:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3F481F4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3F481F4F;
	Tue,  2 Jul 2024 06:56:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C594D1BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1245413E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQZLMeIL4AuY for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86ECF400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86ECF400C6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86ECF400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:56:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52db11b1d31so5361345e87.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903380; x=1720508180;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNVj8+47AOZ1DeLfN80vAjAswUBQlfude9aUxO9kOVc=;
 b=iLy0Z7QfyMTSybQh/LFj986uEiZgCnNvxy2E0tKQGjAz0hXdbrhH4t8UYkEJOMPvxT
 T1jvmpjFdS5IwQpwW6NoJ40j+bbVH8Pc9YWYCXv6YoCAI/qKJEn64QToiE/IrmZDrVPS
 YsdOw4RpPPL6n22bVRkP3SdxlfrK7o5IJhJ0iwb9Uc6cRUAUDbItd9UTY6xJNjp7J1Gh
 dnsJm+o8M4tx4zK9zU3G1r6we1n27vrXSAA2hUClBQ+BbllkRhfmZKPwfYfUs7fV9ofv
 yIpmn/PRBvK8vK7SjtI3BJeHMgaEBD1wG2MHBmAe/tWONnBhV67tuXIUZC0REcH4DRsz
 lnqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0e1QsNLsMgMWzJLNQWhrpvSb/AsCHrMEUNrxLf5C/pWbU3ymiOYriOpG0fVXfGnpPDo2+c70tAzYeeICey7QjqfFpf5g33Q==
X-Gm-Message-State: AOJu0YzFaKhiXt25JZPoo8AFSbxGDKpD/y/dkV1y9jsumeCgfIJnGxA4
 agvR+3cqHLvvvpohsokEVlPnHc5Ld3bxS/8f7kLuQ4bwcL62ofMAFx4KwMSCI64=
X-Google-Smtp-Source: AGHT+IHdnQ9Iid5UWAJMPpjpFEwgeE++fq1ZbQ909p7nitsPmu8XfDFYMrW423nlBQeXvqqAvNkJJA==
X-Received: by 2002:a05:6512:1104:b0:52c:8944:2427 with SMTP id
 2adb3069b0e04-52e82687da8mr5125731e87.31.1719903380226; 
 Mon, 01 Jul 2024 23:56:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc429sm12236075f8f.68.2024.07.01.23.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:56:19 -0700 (PDT)
Message-ID: <f7e433a9-d27b-42f7-abec-d22fa02760a3@mind.be>
Date: Tue, 2 Jul 2024 08:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701175319.1729258-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701175319.1729258-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903380; x=1720508180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KNVj8+47AOZ1DeLfN80vAjAswUBQlfude9aUxO9kOVc=;
 b=boHk/rmkjf2G55syCaS3DPZaeabvex5GAGOlx2r3Zl3dxbDYEkYMXWyeX/tIUoK1kC
 tt+etUBPBSh2W5roaoWsUs0RAFiMmHKJNvzRSDOXjmxII6QS6wO3vps4aq4VHABtVqnK
 l7/jWEgcJYtUcm59eWeU11LUgI374DXJR+DobeISPn/+Es7DFUXdNHDl04XTWPRolP6j
 MpOUcJ/llluPD5WFp5ajiXxW/mtNS8rCPI/NxRrTsqrQFjAQrsXoZl5YywDJxu9aa+TY
 Q+Nevh7JoNqkbrVUtKZPQrpLbUdEJzOINvxuP+oGAYQ5WWVXdfYRIE65TGWJAs0kim8N
 79dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=boHk/rmk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to
 version 1.25.0
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



On 01/07/2024 19:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-hatchling/python-hatchling.hash | 4 ++--
>   package/python-hatchling/python-hatchling.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
> index d49bee8bfc..b01d3df254 100644
> --- a/package/python-hatchling/python-hatchling.hash
> +++ b/package/python-hatchling/python-hatchling.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/hatchling/json
> -md5  63a3c6480c0805c55ce396e1ad246e78  hatchling-1.22.4.tar.gz
> -sha256  8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e  hatchling-1.22.4.tar.gz
> +md5  ac265366ccd17365db319dc95a9e5bc5  hatchling-1.25.0.tar.gz
> +sha256  7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262  hatchling-1.25.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
> diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
> index 91f6597dfc..2ca2caf67c 100644
> --- a/package/python-hatchling/python-hatchling.mk
> +++ b/package/python-hatchling/python-hatchling.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HATCHLING_VERSION = 1.22.4
> +PYTHON_HATCHLING_VERSION = 1.25.0
>   PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
> -PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/4f/2a/c34d71531d1e1c9a5029bb73eb3816285befd0fffd7c63ffa0544253dca8
> +PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/a3/51/8a4a67a8174ce59cf49e816e38e9502900aea9b4af672d0127df8e10d3b0
>   PYTHON_HATCHLING_LICENSE = MIT
>   PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
>   PYTHON_HATCHLING_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
