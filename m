Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C8C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD2FC405D7;
	Sun, 24 Mar 2024 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLVhZgih2bK3; Sun, 24 Mar 2024 14:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F77B405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F77B405D9;
	Sun, 24 Mar 2024 14:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD6761BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3F9400E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoqNdHYr1Gi4 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38D7B400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D7B400BA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38D7B400BA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:55:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341730bfc46so2604976f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292110; x=1711896910;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cywi9TeX3L7brUTyMDgJzKrZTtfVF2mka6FsmgA1lNM=;
 b=jmOy+JUIhwzpcaNAFERJ/Z+P+VZVU6GCEo/gjC/TuAeHzI3DsBLmk5VaszEzX7XQaj
 /Zbanzs5LLSDOWfuXrDi/4nlw+P7yaAEaXngD//GWolwTK9x2GjbzXIsZEhNZBxlrvWS
 bkMYENSeFJrXqDYqZ7qd99PKpYkxYRZ7jEWRVJOqWpXr2LdyOfLFSY+tEoeRiHvlXK/C
 MShJqOEp+SaVNuNCJ1LNeHob97EaH001y03m50KKFI/bSr6CTxPZGZswdrGLe5QV/qfM
 fK2UpKyKDgkaT3vWezOsvZYnJw7INzCzRGVc/RnlUeEuJRh2lsQLC2ED0EkYUi/oh0D+
 IlMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVckXMf40fe5NHRFttLXoCngU9IimQw7Dz+wgzrZ767R0eFumASh3uREaK9Sg7PA61hqMpqF3QLt07UFbtsfpkq5cEQq3m4vQ==
X-Gm-Message-State: AOJu0YzLZaconAxZh5iKudChUi0qtGFkmj1LM8I4kHOZJTyjNd30OIai
 s3EZQ+c+TtE1lQZOKgPcXfUFB3CSmPRWX+KPUdBhTeZzlbrk3xj7syBLB8xjIiY=
X-Google-Smtp-Source: AGHT+IGQqgw6v39WsJNs7GviVO7pr5Iu+Gn0Qgcxrc4o+Q1Hh8VyT5G7LwHpO+I/qjGR83MD1+01sg==
X-Received: by 2002:a05:6000:1e90:b0:341:843d:dd5b with SMTP id
 dd16-20020a0560001e9000b00341843ddd5bmr3367422wrb.4.1711292110440; 
 Sun, 24 Mar 2024 07:55:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:55:09 -0700 (PDT)
Message-ID: <b0bac9d6-3abf-4a19-b5b5-8bbb08b04aa8@mind.be>
Date: Sun, 24 Mar 2024 15:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20240324094549.1943918-1-nemaakhilesh@gmail.com>
In-Reply-To: <20240324094549.1943918-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292110; x=1711896910; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cywi9TeX3L7brUTyMDgJzKrZTtfVF2mka6FsmgA1lNM=;
 b=XeBy63PCndIdl0Mtqb/iFjqetcHkRLVGEsHZ6/byiKmY1iqi/sLzCX/nwrufj19i/l
 qtAGzLrV60/9ioVFbzMcwhEimnRAbbHCmyVLvIdPeB3JNaxnNTVFk2lxLxmqcu39KBLf
 P4i0YjRfeIr5apafhGp3uNqbI2rwVP9wcQyFrF3G04qZIt+L2cN2bJsZYkyaJnuG7qnV
 w+g26YdMha6mMBPHR0tqIXF9M4qYCNlW/Js42evleYKURg9WwRGJXWTHfZ9mRFEO9EDj
 WOFBYjUA8YQ+LDauBcKaEeGDj62twJvU7QRO1KnrI1wNy0tOR9yLTLzakir5aatzEt7s
 DScw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XeBy63PC
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 10:45, Akhilesh Nema wrote:
> Changelog - https://github.com/coreutils/coreutils/blob/9530a14420fc1a267e90d45e8a0d710c3668382d/NEWS
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
> $ cat coreutils.config
> BR2_PACKAGE_COREUTILS=y
> BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES=y
> 
> $ ./utils/test-pkg -k -c coreutils.config -p coreutils
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: SKIPPED
>                               arm-aarch64 [6/6]: OK
> 6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> ./utils/check-package package/coreutils/*
> 211 lines processed
> 0 warnings generated
> 
> cp --version
> cp (GNU coreutils) 9.4
> Copyright (C) 2023 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> 
> Written by Torbjorn Granlund, David MacKenzie, and Jim Meyering.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>   package/coreutils/coreutils.hash | 2 +-
>   package/coreutils/coreutils.mk   | 6 +++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
> index 7df1048afa..6304813e44 100644
> --- a/package/coreutils/coreutils.hash
> +++ b/package/coreutils/coreutils.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256  adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa  coreutils-9.3.tar.xz
> +sha256  ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52  coreutils-9.4.tar.xz
>   # Locally computed
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index e9cb7b67cb..ea6442f8f1 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -COREUTILS_VERSION = 9.3
> +COREUTILS_VERSION = 9.4
>   COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
>   COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
>   COREUTILS_LICENSE = GPL-3.0+
> @@ -14,6 +14,10 @@ COREUTILS_CPE_ID_VENDOR = gnu
>   COREUTILS_CONF_OPTS = --disable-rpath \
>   	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
>   
> +ifneq ($(BR2_TIME_BITS_64),y)

  BR2_TIME_BITS_64 is not set on 64-bits platforms, but we probably don't want 
to disable year2038 on those platforms.

  I also notice now that on 32-bit platforms that always have 64-bit time (e.g. 
riscv32), it is only optionally set... Probably the BR2_TIME_BITS_64 option 
should be reworked a little. Perhaps there should be something like a 
BR2_TOOLCHAIN_HAS_TIME_BITS_64 that indicates when time_t is 64 bits?

  Regards,
  Arnout

> +COREUTILS_CONF_OPTS += --disable-year2038
> +endif
> +
>   ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
>   COREUTILS_CONF_OPTS += --disable-single-binary
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
