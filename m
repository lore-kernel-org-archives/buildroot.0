Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049FEC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC40E81F49;
	Tue,  2 Jul 2024 06:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwLDE6QTibBO; Tue,  2 Jul 2024 06:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEEA481F44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEEA481F44;
	Tue,  2 Jul 2024 06:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6AB1BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD8781F44
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI2w4ZGvHmSX for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A71681F42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A71681F42
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A71681F42
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:55:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-36789d19ffbso51652f8f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903350; x=1720508150;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cu8M/S/TX5HDAub0fxevAjd7s3t0r3pywgI+vANHtIw=;
 b=UEebtC6YS/Z5aLMnQX7BOPv2hDu9OBLio8XjDzgGv+xAi+Dyz7VAEicbtIQaY5vizw
 6MuAQjxqpvTyq1i8gSSCkXJvvczUDSfcuZ787GpEYSXC2JEbaiSUPjEsYVXQ67EzckBu
 rQzJ2wuYg7+Z9/qePp61IXP8axzYW57c3lv2HWdHS3tG9EykXr40cca5QfKlmueoQw29
 SsPorFp3+rvs123S6+379eOPtAb8ED25DTERc14Y99cxUJUb8M1uIQWo57vQMnPMcVCe
 9M0AD454SJ3qdiWBuyNxnhjhdWJ6j+xqkYkoJ6lcKRr2QCNIWIvOrdraFUKZlvEtjoQl
 WkNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUm5yOvZI/I0FfO6YrfcpR+5J6n4sJQLlBbs7fEHzZNgTJLtQcxmAfizQFn2uJSGwfgsTQWqrRzStK3f2SL3FOsGO58DkUFQ==
X-Gm-Message-State: AOJu0YzKBW/TPc03LMnsHRC1rYbkTpX2FTtL8G0yjhzo6iec59jh+xut
 CUkbAaGX+iwP5njygkL8fvOWP1bf5ojOtFO6jITTKwwWwPi2kD+PttTHw3rRMXR4yJFpQoogtyv
 a
X-Google-Smtp-Source: AGHT+IFzDQva0bVD2z9KML0morxhuXiGl58d+yQfs4GknK7F/Mqm8FC9m2KTp+v3vJjUQJ6BIyKyug==
X-Received: by 2002:adf:ed06:0:b0:360:7c13:761e with SMTP id
 ffacd0b85a97d-36775728d75mr4831290f8f.65.1719903350362; 
 Mon, 01 Jul 2024 23:55:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fbbd4sm12265556f8f.84.2024.07.01.23.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:55:49 -0700 (PDT)
Message-ID: <a0f89a57-d8e5-4b48-bfd9-1f1df5551ede@mind.be>
Date: Tue, 2 Jul 2024 08:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701165110.1631129-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701165110.1631129-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903350; x=1720508150; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cu8M/S/TX5HDAub0fxevAjd7s3t0r3pywgI+vANHtIw=;
 b=B/Py1z33eTqv+IpeAAZq0cvrBAP0PpBgQLIfYSSm1VwooyMV3TokQ39VJOQeVE+5UY
 SDXVFvtT8FkP5Nce2Rzegcq51EAAR/eSd7UoS99cQk+1uL6fZoKL7WzEtP3028dgzOj3
 fNmbgjJ1J1kxl3xRvSaTA86QzOoyv6pb4RhhJskU4aN1+4bounRh5rv2Kydj7D5WBBIk
 kxjzoKHFB7G8AvJ28d0wOQP+enlwGhEk2pbnD7sVFZC+zdwi1Ec5kxOzBugFgx6VBvrQ
 4H4mktFaNfjVlMNYWstHB1IRdw7Ov5qqMfHlvGucnYMDRUXUXQuxXq7UMBCQF3yB+SbV
 rj4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B/Py1z33
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.6.9
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
Cc: Falco Hyfing <hyfinglists@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 18:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pymodbus/python-pymodbus.hash | 4 ++--
>   package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
> index 4595246efc..37c44f6a06 100644
> --- a/package/python-pymodbus/python-pymodbus.hash
> +++ b/package/python-pymodbus/python-pymodbus.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pymodbus/json
> -md5  809260ecaaef548c7ac327755d7d2d25  pymodbus-3.6.8.tar.gz
> -sha256  abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407  pymodbus-3.6.8.tar.gz
> +md5  5201e93420b9ac9dc5e3e64a656101cc  pymodbus-3.6.9.tar.gz
> +sha256  f4223b72c20cd00a2cf25f6ddb31ecb2c0587309111a55283b2f4a1ac115e4cc  pymodbus-3.6.9.tar.gz
>   # Locally computed sha256 checksums
>   sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
> diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
> index a96edecc54..cba94896bb 100644
> --- a/package/python-pymodbus/python-pymodbus.mk
> +++ b/package/python-pymodbus/python-pymodbus.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYMODBUS_VERSION = 3.6.8
> +PYTHON_PYMODBUS_VERSION = 3.6.9
>   PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
> -PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/62/c1/f18b090dcc45d34b6a0e3563acde71b407ef96a36fa965c508a84f755355
> +PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/b4/a4/5322c8e3be3bb2db7ab3eb7c2160fd2ec325083d7e60a76cd9cc896dd7bd
>   PYTHON_PYMODBUS_SETUP_TYPE = setuptools
>   PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
>   PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
