Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC03C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 19:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA6064052D;
	Wed, 19 Jun 2024 19:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpVQKCzLVK-D; Wed, 19 Jun 2024 19:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7FA241576
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7FA241576;
	Wed, 19 Jun 2024 19:34:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8BF01BF25F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C5640A70
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C12VcDjQb-PA for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 19:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4263B4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4263B4052D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4263B4052D
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 19:34:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-36279cf6414so100288f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 12:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718825659; x=1719430459;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tv6wUAx3z7U4KrqcKrak6TjODrCyaKBwDjIiP51idOk=;
 b=A8WBA3t/v3CYWa15iLMz7o7FF5ectpX7lOvHY+WbEctPQVyAAmuE2BxLjDZhyIqeve
 lJFD5T+2uYR3vb+WNifSXA0/ZP6+C+F1TRqMLEyJmGB+CN1miQgilegF1ZDIk018s3bG
 G+doOuF0efipmyeAb2tP4rtI9D08VAKKXpmjEyHhP6WE8PmqJZuMuPeyhry2PWMaS5n+
 xvIxX8IXKQoeweNaZ+485mguTlD24gwkKxgTNjS9Ubh2rq8+Q+METPJyJjJ5nlZjMUi2
 X+Tx2bnDTVD76vYxdmPIOOWSTXuU2MsIaH2B3XgvSCBV4PK1CKDm3mcDNHrM+vUjJIIG
 5dgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5StkXhusvmlJMqgVnLdIefBGfIK6FXrujXLMAmEmRCasVZ9TbGKIJO+OosK9ZlddMEAcvfYh/ldZEA6mqTX1P0jHHfRSX9A==
X-Gm-Message-State: AOJu0YyygBzDxxVdiQC88yM5TZDcI7J9gfyf02pkLqE739EQYYNDpUs4
 793OBdDnkTrjmVtnekQIVlxgfiMbRM1JdAXnMaTfd14nLtfjuJotP8uDUWAImLuQeWl1/KtPmcT
 3
X-Google-Smtp-Source: AGHT+IHaW9Koy7EzIxQNzRlxjaDiYa4md+2YhKs+rwmeHlVe/LirseuCeNuHFRKnXXPvBYqrWAq3lQ==
X-Received: by 2002:adf:a44e:0:b0:362:3cb8:cba with SMTP id
 ffacd0b85a97d-36319a852fbmr2286242f8f.67.1718825658719; 
 Wed, 19 Jun 2024 12:34:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3637f5c3c5dsm2612076f8f.100.2024.06.19.12.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 12:34:18 -0700 (PDT)
Message-ID: <2afd58e5-6234-444b-b9eb-efbea53b65ba@mind.be>
Date: Wed, 19 Jun 2024 21:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michel Alex <Alex.Michel@wiedemann-group.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608001828FCC65E7AF713E5A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <AS1P250MB0608001828FCC65E7AF713E5A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718825659; x=1719430459; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tv6wUAx3z7U4KrqcKrak6TjODrCyaKBwDjIiP51idOk=;
 b=ablOfFv36V5H3T0xo5DvABwYHvpQ+2QIMNihHWq46Um9iJDRytKQctfN85gjy5YDmE
 g8X/A4lW+qe/n9OKh5jVTCz2tcHdrB3c7v1SPG5pr+r+bRJ2EHug7zoXbHmpXeeoPx8w
 I0HXRmi9mVi+0uh7XgOz4eUJwufhy8DcJmgELRUa3HJj85Cng/dWajuU2GOu0aNIMEh8
 buP2CKhsDLSsvLY++vYUZ3BsUJDUNmzYy45VYsaRsyiMaJf/ZzGsVhBYDJkamO35iZYy
 XZYj0J3Z1K2jdCRJ9cCNgePcRNJI4S39wMGGBjDfnzClyzlW3LPlAsahGnd47cdGa3k2
 Vh3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ablOfFv3
Subject: Re: [Buildroot] package/libzenoh-c: bump to version 0.11.0.3
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



On 16/05/2024 08:48, Michel Alex wrote:
> https://github.com/eclipse-zenoh/zenoh-c/releases/tag/0.11.0.3
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>   package/libzenoh-c/libzenoh-c.hash | 2 +-
>   package/libzenoh-c/libzenoh-c.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
> index 8331f5cca4..852e785ead 100644
> --- a/package/libzenoh-c/libzenoh-c.hash
> +++ b/package/libzenoh-c/libzenoh-c.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  c792f0be936ecbb3f759124be28950a01385f4680eaf4f1da55997640899648e  libzenoh-c-0.11.0.2-cargo2.tar.gz
> +sha256  03ff32bfd11e39a1634d5abe0e69599ec988c63115682a17a5e7d021f3c1e9e8  libzenoh-c-0.11.0.3.tar.gz

  You need to give the hash for the -cargo2 tarball now, not for the upstream 
tarball.


  Applied to master with that fixed, thanks.

  Regards,
  Arnout


>   sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
> diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
> index 3a50fe6bf1..07c153e328 100644
> --- a/package/libzenoh-c/libzenoh-c.mk
> +++ b/package/libzenoh-c/libzenoh-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBZENOH_C_VERSION = 0.11.0.2
> +LIBZENOH_C_VERSION = 0.11.0.3
>   LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
>   LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
>   LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
