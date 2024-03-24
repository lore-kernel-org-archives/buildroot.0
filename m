Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF08C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 008B9401B4;
	Sun, 24 Mar 2024 15:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUsZNMDOew1K; Sun, 24 Mar 2024 15:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8436404A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8436404A9;
	Sun, 24 Mar 2024 15:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 892DA1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 763A8606D4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOsbrDURfiae for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54D23605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D23605BB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54D23605BB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33e672e10cfso1943930f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292947; x=1711897747;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pbHklOaCHHC44EtK9DJX+WGPCY7hlvJPn2n66HbpMHM=;
 b=R71ic+ROa5xCfP9QRjJaXK7rDA9U0+3aU7PPHYmqZTaauNCxDhoXfv2n7UJWb06f5N
 2WQtttIR7AQbGxWEvfsq0s9UV6BrIN92o4+ryHB5iH9X5S/2NSrqTmXX5542l5EQ8VLt
 I3nlE4BVoARB9SHAOXmWisCh60wxy4fz6DAhTvRX2h62L2wl3JO2MOfUyxHj9a1mcwpE
 9ohVmUNXHOptjweAPljw23wQUQH3oG9bmNGuLaxYszRmdUTC5nDhFoLOyqotlnFFiTq/
 IitCj+9S2VWSbFIyIOyYbqLMUuDbemChpR1+3wMzlpE6GVZolkKveOYYVP/nX+Dtegmm
 Nx2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3aIET+At0w05wVqJ4ifTnH/d/p8YLlZeAi35WQkj2DmXGaMpEZ1q6fIm1Ey67yHmCc9nNegHZq16VqMJ4PGBRZScO8Tvp3w==
X-Gm-Message-State: AOJu0Yxs6ObuYNnfpYno0+Sd/iWxi2jOA+lYjcK4eNr05uTvVIP4s7h1
 Y4Zq88XC2ywG1EQ4IvBRGqJmkkw+BBClCk2zgJL++aQdWnQdCKVW+vwqhD6BU8Smo7S3HsOe7p5
 v
X-Google-Smtp-Source: AGHT+IEAmGduJzFE7AAB2hsBXrwNZ9LIHjdumjFMsVi3R0r5pybkaQEeXxd++sE76VJziwPO++lkFQ==
X-Received: by 2002:adf:e788:0:b0:33e:3a4:6c1a with SMTP id
 n8-20020adfe788000000b0033e03a46c1amr3371299wrm.30.1711292947209; 
 Sun, 24 Mar 2024 08:09:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:06 -0700 (PDT)
Message-ID: <a906697f-5f55-46c2-9869-d21aaace578f@mind.be>
Date: Sun, 24 Mar 2024 16:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324090817.251630-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324090817.251630-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292947; x=1711897747; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pbHklOaCHHC44EtK9DJX+WGPCY7hlvJPn2n66HbpMHM=;
 b=ZVqdHBve/FoXQLPSfegyrJzdpzhXvGkltZbkhAmA3Y4SnM7VSD96TLILVJQ4aVROuC
 ddOS0GdYh72s754xgAzKliwsXfZFelNvhYDvaKPTTAnef7FtK4LXpIqHh8mlbn/xzhYB
 VxxJE5BLThPRvThEr5H7ZmdPkRdri7jS5i6GzAf6vhHZuxklt9CtP7yTTdTJkHo+sw9S
 5vyS0Z2V+RPnNFafuqK6th+ethe6CIMpmt7TlHgEcZ4nLCZ71QbQBJ3oLPTlwrVsaznr
 1n5wKYeGyaDIXAXhhLVAhQTrTDSWo9ROzOvPVfGAJmCIvkkg9kP5k3tUIHV6X8Kkd5MR
 WLHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZVqdHBve
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.50.2
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



On 24/03/2024 10:08, Fabrice Fontaine wrote:
> Update hash of license file (date updated with
> https://github.com/PurpleI2P/i2pd/commit/d5ee1f602fdc7a47ccc9a4e239ea720dd63f123a)
> 
> https://github.com/PurpleI2P/i2pd/blob/2.50.2/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/i2pd/i2pd.hash | 6 +++---
>   package/i2pd/i2pd.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
> index 98c0db243d..cc099a94ff 100644
> --- a/package/i2pd/i2pd.hash
> +++ b/package/i2pd/i2pd.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/PurpleI2P/i2pd/releases/download/2.43.0/SHA512SUMS
> -sha512  7247850cd47cccc540346b4a1becc6dba5f40bcb333cd722e9fc59fd8b0beddee700376829d29add05cea6b84bb34303ed37e01914a1a41cf8cd94fe5c826e4a  i2pd-2.43.0.tar.gz
> +# From https://github.com/PurpleI2P/i2pd/releases/download/2.50.2/SHA512SUMS
> +sha512  7df7a578711a959feee4326060829cf87c0d1669e473934549cb59d868a7aef7300ecd2d7a6b92a2295aa7e97964cc16d0e44a334db917e22b0b59573a9052de  i2pd-2.50.2.tar.gz
>   # Locally computed:
> -sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
> +sha256  e32cc0171ce3301afa67d83f61598f29af7efdf8218dfb66cc1a72224474ec2c  LICENSE
> diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
> index ad268a235c..402931c655 100644
> --- a/package/i2pd/i2pd.mk
> +++ b/package/i2pd/i2pd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -I2PD_VERSION = 2.43.0
> +I2PD_VERSION = 2.50.2
>   I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
>   I2PD_LICENSE = BSD-3-Clause
>   I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
