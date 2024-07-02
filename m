Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B4C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83798136F;
	Tue,  2 Jul 2024 07:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pugjkzqBf9e0; Tue,  2 Jul 2024 07:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE628179D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEE628179D;
	Tue,  2 Jul 2024 07:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E071BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A41496078C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxrUg60jDsn5 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CE0260670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CE0260670
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CE0260670
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:44:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a724598cfe3so474084966b.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906276; x=1720511076;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EoGu0ExxRGAH+9+XErtn2HpRU1gzvn5WTXiao4fOiXA=;
 b=gyihnClgJu5STHib4PkLLG/ie9PpC+IDze8F7JXiDggxQ7awlMSWB7KTurjzTkeoJq
 CoIxXkFf/jtaEn0ZhuBMYsmf8RZ8oxFSiR2LEHWBcbWMRPjAvsqCZtNw/4ug8MzXExl4
 rzhrUT5BylIl21Q+xkn3HwKuU39V/dOO62kM5353+g2fmrdR6roQg8LQWrDVaVUI0Ori
 noGM2+yXFbziLtzhg8EGavum46OLp9RTuSeqiAL9ROTpnKIUA785FbyvNQ/mhS1q4tB8
 AFGMpENQdSWGkfng4opl6TEPUvLcYCEmz0ZHd2qiiH28WNLjGs/uRltQHjoE/bhI94DT
 D8MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQQ9JPlf/u3hD8qq62ZON6RzL2sLr+tUaLL9lh6kmLz9FDQ35t7c0PgCic7gPkoo3bHGYa8EHSRJYBUayCscxkBVsUSS2Cgw==
X-Gm-Message-State: AOJu0Yz8IJVW32HFlIQH4vlUkGstYm+JN2lKcNzf1vhRrifisAzsfwdU
 l0zL86I6FFZYDrLQW7Q3RQSZWznLJDXVYKdCp73trbAxBminMYZq5iWfeLtSt+Ixk5hz4mRfodb
 m
X-Google-Smtp-Source: AGHT+IEni+LmiLGa3OV8iD9CH/f7/2ZluyxgdjK4Rtc9HfECaFVO+Ak7CETrSczs+GwXK0zP2xCH+A==
X-Received: by 2002:a17:907:928a:b0:a75:3295:ff43 with SMTP id
 a640c23a62f3a-a75329600a5mr364289466b.64.1719906276550; 
 Tue, 02 Jul 2024 00:44:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf638f3sm396879666b.89.2024.07.02.00.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:44:36 -0700 (PDT)
Message-ID: <c6955fb0-cdf7-40c9-b5fd-2f4314e61a12@mind.be>
Date: Tue, 2 Jul 2024 09:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701185922.1759235-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701185922.1759235-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906276; x=1720511076; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EoGu0ExxRGAH+9+XErtn2HpRU1gzvn5WTXiao4fOiXA=;
 b=QD7DOYffLViBSMvxZ4rGqrwkJNcox0OJCICIzVwQJ0eZs7HCBMdwz/1JuynPTRme9w
 36cDiFBJvfDKcUlq+lUm/uabvMlgyhkGNu1NMLEVTHN62mxsGdJim7I35UMwXVGIncIy
 4OkjK/JvXPxa0lYAZ5WSwelZmE7xCAORYg4LrJrzCFJUqFP92MhNSCDJbsB4NCBphOWM
 IqVO3Ko57hMJ0RePNpjsfjgbHaRTYiRhlgo0cv2KeKqVX+/hM8Vv1EcDGjBrP+Nz90cK
 LR1qZBHRn0Ox7eCCTzvMC9jTnSbgRSeGQXsQPuvXK9xK0hMULoWMdNPoM5N0sxmCrFSP
 Zv0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QD7DOYff
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multidict: bump to
 version 6.0.5
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



On 01/07/2024 20:59, James Hilliard wrote:
> License hash changed due to changing team to contributors:
> https://github.com/aio-libs/multidict/commit/fecf3d43983a121ca44bfb11415c0110d7da4408
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-multidict/python-multidict.hash | 6 +++---
>   package/python-multidict/python-multidict.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
> index 568c320c53..d23a3de3eb 100644
> --- a/package/python-multidict/python-multidict.hash
> +++ b/package/python-multidict/python-multidict.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/multidict/json
> -md5  ec06a613d871dadfb66f2be3a1f2f3fa  multidict-6.0.4.tar.gz
> -sha256  3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49  multidict-6.0.4.tar.gz
> +md5  abcf9bf19365d06aa784de07da02115d  multidict-6.0.5.tar.gz
> +sha256  f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da  multidict-6.0.5.tar.gz
>   # Locally computed sha256 checksums
> -sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
> +sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
> diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
> index cd35dcb4cb..3c9a21f1dc 100644
> --- a/package/python-multidict/python-multidict.mk
> +++ b/package/python-multidict/python-multidict.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MULTIDICT_VERSION = 6.0.4
> +PYTHON_MULTIDICT_VERSION = 6.0.5
>   PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
> -PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/4a/15/bd620f7a6eb9aa5112c4ef93e7031bcd071e0611763d8e17706ef8ba65e0
> +PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836
>   PYTHON_MULTIDICT_SETUP_TYPE = setuptools
>   PYTHON_MULTIDICT_LICENSE = Apache-2.0
>   PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
