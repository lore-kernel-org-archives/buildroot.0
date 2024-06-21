Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB86DC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBDA84323;
	Fri, 21 Jun 2024 20:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtAsUxiW8Xid; Fri, 21 Jun 2024 20:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9463C84326
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9463C84326;
	Fri, 21 Jun 2024 20:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4103D1BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BDE84326
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G4Ije-CZxCi for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07E0C84323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E0C84323
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E0C84323
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:57:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-364a3d5d901so1757586f8f.0
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 13:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719003453; x=1719608253;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXBPRVl0Lr/+T+Gd29fKi1BFMdfDeZ6karj7Fy4Xdgo=;
 b=LiHr4Evnt6ZjiB1FG74+m/65g2Hw4OrfGbbVBrK1PPwBgVT2+eROVYP5kYYMleyoT1
 VZo8tym/ET+VLqVpW5nemKPRCSanzrIvOS8Mvj+yty6hcU7k/cRoZC+J9VIkjTYyX+Mh
 eM0HJXP4FJRt6d8kBobt4vXpyBbwP2+py/l9ev6ruKa821yXrFrgNQ9Q9Tok/i/Z4U8F
 DBkLYO6pTAwntWkfY8rcefQzkaNC88hI5ZfuJASBr8X+nA/9/w9Y2ipCeFmzl/C303bX
 Xxaq0xEnviHbivWnqAUIERKFz+BrGGJBvBgNlOZl2viUlQXFG8LxcAeUzoIJ418811WH
 P6bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoUjua0PwifjZxK6dbZEEvy8EYkwQpHGNmKLIOCENpGBMuD0JELxqNy1CCYV4OcnWKufOHkeHC1i7MAZMrc/m3Vwwe52PoEQ==
X-Gm-Message-State: AOJu0YyOjoXV98WyJIJri4P31sFT6tb+4z9yNE/VGiqMg0GY4Z5GwmTW
 /+Bm0mCztxDKQ9MIJCgIDFHTX4TmMr5MdUqjCNAfj5UuzA27A6WF8Ro08Qm25nG+s8dYcr+rX4h
 +
X-Google-Smtp-Source: AGHT+IHyF+rNkfWiTiRAYAxScmYQ3l8ymlbLmurLgN8oVCII31Dtn1iRcvvb0iZQ0xWdErdO7bvr/Q==
X-Received: by 2002:a05:600c:6552:b0:424:6d96:48ae with SMTP id
 5b1f17b1804b1-4247517f18fmr75544675e9.23.1719003452476; 
 Fri, 21 Jun 2024 13:57:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247101a955sm108831445e9.0.2024.06.21.13.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 13:57:32 -0700 (PDT)
Message-ID: <015d8fad-7a8e-49fc-bd4a-2217f037ec2d@mind.be>
Date: Fri, 21 Jun 2024 22:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240522111032.3095-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240522111032.3095-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719003452; x=1719608252; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXBPRVl0Lr/+T+Gd29fKi1BFMdfDeZ6karj7Fy4Xdgo=;
 b=aEcr82RRTyXULNRNlbFfdD8R0A6V6iAKX2d2JeUB3QXQsF+ZjuVLsTXCnynyf236Jc
 UvFVw+ut/8kx6aQxb9XWLS99ooTplUQhc48lC5ppaGc1CWN36gbAdTvqyxVturjG/jTD
 pAAh+h9xF2GoMxc/zun6TPnA1tFpJKrVnZclKhbw/7tLyZL3OJW4S4AGkO/A8A94NBTB
 O3fWBrrDjMRmc4XpuYHSB7RyM7yloGMKZyBd4yLF/RRi9ot6rjguLSIsgEse2PVOEdeP
 XqXoKbkZovUvyhSLcfIqbm6TaVOOFFkSQHtrTb8Gj7KvCJ3lsoIlkhYPVNNNSJxxQHml
 AkeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aEcr82RR
Subject: Re: [Buildroot] [PATCH v1 1/1] package/embiggen-disk: bump version
 to v20240521
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2024 13:10, Christian Stewart via buildroot wrote:
> Switch to the skiffos fork as the upstream is not maintained.
> 
> Update the tarball hash.

  Well, that's kind of obvious, since the tarball changes...


> Drop the GOMOD line since this is now the same as go.mod.

  There was no GOMOD line to begin with, and there has never bbeen a GOMOD line, 
so I'm not sure what this is about...

  I've removed those two lines from the commit message and applied to master, 
thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>   package/embiggen-disk/embiggen-disk.hash | 2 +-
>   package/embiggen-disk/embiggen-disk.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
> index 86e9346e9b..02c99add6a 100644
> --- a/package/embiggen-disk/embiggen-disk.hash
> +++ b/package/embiggen-disk/embiggen-disk.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  aa6019311ea869b1f7cbca640462eae6cfa0fef5a65ec5266ca394b261217960  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go2.tar.gz
> +sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
>   sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
> diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
> index 66f2087dbd..47b86c072b 100644
> --- a/package/embiggen-disk/embiggen-disk.mk
> +++ b/package/embiggen-disk/embiggen-disk.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -EMBIGGEN_DISK_VERSION = 9e7b2fc7b99c4dece41a805489a6ca377ce55a62
> -EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
> +EMBIGGEN_DISK_VERSION = v20240521
> +EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
>   EMBIGGEN_DISK_LICENSE = Apache-2.0
>   EMBIGGEN_DISK_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
