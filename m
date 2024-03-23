Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ADCC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146E4606EB;
	Sat, 23 Mar 2024 20:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g82nXXQv7iFg; Sat, 23 Mar 2024 20:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B086073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B086073E;
	Sat, 23 Mar 2024 20:37:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269FA1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1450040109
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_Eq2fI3Azfv for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 132CF400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 132CF400B8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 132CF400B8
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:37:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so2107919f8f.1
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711226264; x=1711831064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26cLDpzp/3g0MnuDBqS+tMDL25ypHj3O25MUgGB3Qls=;
 b=O/qBGuXb2jXNWOtWduMhY0n79jWw5FQNudOBoJKTdZ+9WKY6hllY87/3cJ5eXOC8AY
 T94Y7rjXML4bqPaD7HFLr34gxt+hmey1aclDkGWSaMAOgG8VKdbVec/uvO5pvJ0nBjHX
 FVw2nmFDMDijUTDADLWR5wFZ1IDD5fu/jkVW+MxSf93OVB1UNsqgPre/pJ5rxnCOspHs
 9CYZvKkYAqIa8Uo4xyeDYP74B5Ra+di70jxOunMZQ7suPVdLVXzLmX0qIyYZgrJnXyRM
 n/5MzSqZRK7eR4nclqVxknyM6QPmmPgRcI2r/xVizLtwGA246IhKaq0fHsvdAwOBxgTU
 +YeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4kMNCyhQfU1BTkXhr7VzjQS8MHuEPuN1cJBcBd1LfnQVmbhFMiJh1TXVVSsi/9dzduWcjfBaHvB73NBYg1NEVV75jdmXb/A==
X-Gm-Message-State: AOJu0YzVGYq9nsafo7yYnrwqq7eWGBoFdHwo8oHmAP+CQ9sTHgNhWiry
 MIBVNZ6aCDl/irqbZ8ky+Sf0FSxLjy7lFs0K4s1KL7QCO0os1KiWitIeZeBg+Kw=
X-Google-Smtp-Source: AGHT+IG3uubgEmQSl6LNLVNdnJdG8Cu2iK7ieIYWImsc1REmWobeq8KAkXdE2Ozz1fz20Y0wRfmLGQ==
X-Received: by 2002:adf:eec5:0:b0:33d:d96b:2615 with SMTP id
 a5-20020adfeec5000000b0033dd96b2615mr2208887wrp.47.1711226263659; 
 Sat, 23 Mar 2024 13:37:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cr1-20020a05600004e100b0033b48190e5esm5164949wrb.67.2024.03.23.13.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:37:43 -0700 (PDT)
Message-ID: <4b6089c2-c67c-41e8-8e12-434c6e7125e0@mind.be>
Date: Sat, 23 Mar 2024 21:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20240318140258.1083375-1-neal.frager@amd.com>
In-Reply-To: <20240318140258.1083375-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711226264; x=1711831064; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26cLDpzp/3g0MnuDBqS+tMDL25ypHj3O25MUgGB3Qls=;
 b=L8Y8wa5hyClDAh/IsxF+HfWLwD3HfS3HTaNyii3qRKqe/Mz8T2qMiz4vglmH48IkcD
 j0pmR/h+UlXtVlvmzFGh1Dnsm9nAKqU5k6RunxgOUGXG76/j/EjQYef6y+GHdwDGtQWb
 T0F4WsiQTm0ImvOfAKsL4T24BfcmN7ISAoqw/vPp0ojwp8L/865WT4xdR8ur+9r4SDUJ
 8pLoBn2alf/XrzdSl62nBtik2u3Jm33vDaQBQb6UglrbzUdh6CWJWmYqOA4NLtwSDq08
 LbHKfHlmtwzjJ5ywaMQoKxqDRO9x2EHJvVb1wQMrW2IP0/EFNkT7iJNqz0EZ1bZaM6An
 9f7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L8Y8wa5h
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc702_defconfig: bump
 to 6.1.70
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/03/2024 15:02, Neal Frager wrote:
> This patch bumps the zynq_zc702_defconfig to Linux kernel 6.1.70.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  All 4 applied to master. Thanks for the review, Luca.

  Regards,
  Arnout

> ---
>   configs/zynq_zc702_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> index e85285a832..7f762abc58 100644
> --- a/configs/zynq_zc702_defconfig
> +++ b/configs/zynq_zc702_defconfig
> @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_merge_6.1.70)/xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
