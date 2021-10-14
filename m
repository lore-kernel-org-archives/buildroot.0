Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DC660F9E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25DC660F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E264860BAF;
	Thu, 14 Oct 2021 21:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWtNGl11qmdf; Thu, 14 Oct 2021 21:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A5A60BBB;
	Thu, 14 Oct 2021 21:00:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1281BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CBFF8274E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xH-uLT6190u for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E3EB825D3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:00:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y12so30506166eda.4
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=kCd/KDAq1dn/hNFCB/AGDYSwGUel8G28TdXKc+iZlSM=;
 b=ILEVUvP1zYXlhYwNOl8YiWmp9vRJi3b/bixQ142T2uCCSJZZWaxYIKoBoRs3/e0IDS
 FzxiN3cgWgQJ3NPdADcas/LwAiQz3KWkcW3D+ukC6eJOk5ijaZwG0lT0UYcE21xysYc8
 nQgAEe1gRdMsMwRW6+E1zn4igF/u8bQEwNYrr1Pwf76WJnYFfaE7Rc0HramCdP3jYBaA
 kyAGI+2VnPhlzMAtGUWz9Q/qyxjLSSK8QwGzunCFb5dhcFFdkN7pg46XNaGg8PoWoyZw
 EkKv4WiMelTWktfnR0HY99EjMZFbEdigLJ1ivP3hcCA0MJTWkNMF3cATflnvMAB6fj+4
 H+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kCd/KDAq1dn/hNFCB/AGDYSwGUel8G28TdXKc+iZlSM=;
 b=J7Hc47nULawN2qMvYueDhg7p8c6HtRJGZyeQ361w0tXnPv7uNQsbzTIV4QRQ9Wa6cC
 RGoq7oCfhZ7eOTkGj5Y2B9TOJOAYl0q/1sMV5IrdDIahThgRzslQNN43KgTLOGLlfOh/
 t7E0YfJhMqCpa646T6fJqaJDO6n4Cx3M7KHMkHBaSVleFe4GtsgJMUAMtLQOA72UWnC5
 deeNYUWHz5leePDwnxdVYoA588Aj8lPu+pmOaxiUQHnUG+53/rCi/sQadcwOLGg+Cg+L
 +GRsDrTGUo0DWN+XSIrMTyS3lyHUh3K6IrhZYTDIvjoOWElbDyV9b8n6+QzJzsIXCNLz
 0iXw==
X-Gm-Message-State: AOAM531MBfLvYryDrS7j0G9nK27yChAd1M8omNKnErYT9Un4EayWC5oI
 +MXfnn7AweEO7v3AY5h5mEn/q31jaSlKAA==
X-Google-Smtp-Source: ABdhPJz6Frs+uzZzQoZMFAytOthrnwXcRD0xvy2o6zbQoRSWziCsKuydRzQ0mA0VMHY4+mHTVe37YQ==
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr12014594edc.343.1634245244641; 
 Thu, 14 Oct 2021 14:00:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b26sm100916ejl.82.2021.10.14.14.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:00:44 -0700 (PDT)
Message-ID: <71e47d04-a44f-342c-b69c-a978e111b497@mind.be>
Date: Thu, 14 Oct 2021 23:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211009081852.380162-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009081852.380162-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/automake: bump to version 1.16.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2021 10:18, Fabrice Fontaine wrote:
> This bump will avoid to set --with-python_{prefix,exec_prefix} to fix
> the following build failures with python and libsoc or libgpiod raised
> since bump of automake to version 1.16.4 in commit
> fe90272b5128987ee7492fff950660e05324838d and
> https://git.savannah.gnu.org/cgit/automake.git/commit/?id=ed8daa069a6c8ed34f7856c42402ec46f305e670:
> 
>   /bin/mkdir -p '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
>   /bin/bash ../../libtool   --mode=install /usr/bin/install -c   gpiod.la '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
> libtool: install: /usr/bin/install -c .libs/gpiod.so /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages/gpiod.so
> 
> [...]
> 
> libgpiod: installs files in /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot//home/buildroot/autobuild/instance-0/output-1
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/045dc3f737f58d44014a4b717b5a565388e86f63
>   - http://autobuild.buildroot.org/results/6e7a129b05e7852a4dc8dd35148664ad09610f28
> 
> https://git.savannah.gnu.org/cgit/automake.git/tree/NEWS?h=v1.16.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/automake/automake.hash | 2 +-
>   package/automake/automake.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/automake/automake.hash b/package/automake/automake.hash
> index e8112e0c48..b2e70641db 100644
> --- a/package/automake/automake.hash
> +++ b/package/automake/automake.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  80facc09885a57e6d49d06972c0ae1089c5fa8f4d4c7cfe5baea58e5085f136d  automake-1.16.4.tar.xz
> +sha256  f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469  automake-1.16.5.tar.xz
>   # License files, locally calculated
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 470a0bd46e..5270e7864d 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -AUTOMAKE_VERSION = 1.16.4
> +AUTOMAKE_VERSION = 1.16.5
>   AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
>   AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>   AUTOMAKE_LICENSE = GPL-2.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
