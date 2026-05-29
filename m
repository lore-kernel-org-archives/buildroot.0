Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7312CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DD18053C;
	Fri, 29 May 2026 08:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWqSH5Xfh7yu; Fri, 29 May 2026 08:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581358421B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043359;
	bh=FI7/AIlDfzg7e9fwpg/kcUvCTYmaw+uEcvOns0jsWGo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kPpRGj0CoPXD/yvV9zXFEJ9RRDelFgsOzPYOKGMKhs0ayFyJEduVv2ra8CL3MYAlK
	 PMcFHbyd9i3X7ELh6d1c9vWEJF+KagcwpCxdJq8tS4DCdHPKWL3kvaonfNE5MT6gNK
	 3ae9cGlNO114CxLesbbz05uxtc9ZeljeomcODJgrGVFsW2Uc2Lqx/rBuHJ1Xlz69X+
	 8mUvvOM+yFAPAyXQVytzEhvUHKLNYRHOHJmqQ9q2lMQlHdHEGJO0kkLGb0ZvLkvTXF
	 kUvGystwrVwaA+QQKxi0qIn+WePVaOLuWKvabfSizMVAW0R+JCxyrpe8ybpmIK5Jbk
	 do1hfosYhoFgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581358421B;
	Fri, 29 May 2026 08:29:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A30288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82D5E421FD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcaHSPsj1i-H for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8046B42207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8046B42207
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8046B42207
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so8000120f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043351; x=1780648151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F0iZIHHLgP9pWSwGcWkr6i2eimyfZB3B8CGNccg4xkQ=;
 b=VDHnOfoNlCTS2RKp730CDhCNMUVAaOQzP8e98GhmaJSCggjGb+9bYZdUhQjjzUFsg+
 E1qPQCoY8dND+7KWZti0KTabo6VcbvzTmJXgu+PC7HZQ/EZ7FvRRNdXo1U8NxjBMA1jX
 S7Cu9NnVq5d6aYIp3LIKJDkmQJYIMau8iBs5IgNoaXEmkFz1W49C4w/8j5PI0pCXaVDB
 HvjAKi/tJg/6vCh7M83f0REcB7l7cT3Iyzx7iTR584SVPpr6Oiea+69ybT6w0QMmeP5g
 Bvv+eFwIVIfB+NAGSyHRG2zhNqwJmRF8GmYqHQbf8r2Kkr2BEaizRwLSIWV3CBBxWrdM
 ERXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FQBLuQan7ZEqj8SH9fhvO1I/YK6nD7+FT7N4237IXWbZ1Ibl7ZVlOBdhmxoBBySbGJg5k57LH7DY=@buildroot.org
X-Gm-Message-State: AOJu0YygM9xidM2D8CU+ElSXFRESkVZahzfi6hiI11+zHnCKZsjP+0/q
 IdI+8woeDhF2tzz6uYiQUx6M2mck/ieVLEUIWw22OIUzL07P4ne/5Q6M0jR/OBOplUo=
X-Gm-Gg: Acq92OFlMavfpv+Q03w9STSwXBpc0VhwoXzMi4Q61rmjQGKyS1do7dtYLFZ+jLwz5Us
 Dq6MQ4X/Chu9f4UEVMRJZFkdql+z5yApECAXfMDwxxiNVPYKFpnn7zLiZ6xe147L6IUGdsqaYSZ
 Evvo02HTFUk5piliSOY2Cl1uNhHQzNCNE6pTXb3B6P6sAoDs7WblDd+3AO6yR0rCHHevmBzhnnY
 L4L/HCox3Qrb+Uh8RZ6W4cywNpob7DHQaiVEKNN6tAg+kCJGEO6NVZe2UjV96e+3w2GlLh/rx2b
 4DN1teqNcCQoica88KEtbyywcF6z8xYU/lJX49tn7Q4EAERk4BDDx7S4ww3NC7zmKifuwT1KXgI
 CakABBUYz6NNUwdFTYsheMmpCcA7RRhH7V+67pgDEaQZHJ8RU2KvcarwvP1+7eAb4FFLjioa2d3
 bQZ4cHwkZ0bEKY+Xyz5zVMrk3PYOcDP18ZYg4EHD5wMXoJPU6ev5sPLF+5kY+OMe2MPBdV
X-Received: by 2002:a5d:4583:0:b0:452:c9f:4b91 with SMTP id
 ffacd0b85a97d-45ef13eebfbmr2122857f8f.4.1780043351243; 
 Fri, 29 May 2026 01:29:11 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a0374sm1666544f8f.2.2026.05.29.01.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:10 +0200
Message-ID: <20260529082910.56838-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260121180842.48561-1-bernd@kuhls.net>
References: <20260121180842.48561-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043351; x=1780648151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0iZIHHLgP9pWSwGcWkr6i2eimyfZB3B8CGNccg4xkQ=;
 b=SEJTQsrpBHYqOCp/qncTqydbcjWuyz/WiTVAB2HXck17U5tdb7GXB2DnSGhzc5g5+X
 ar4UEPNujkEEnw9QWwOlHw4N2W/kdOASqs03iNWrMZ9HDjHlXVbYhKLKoyb0frMTfId2
 XaoGslMU7JefJwhuQBYQkOQ8JD99Xarj7QfhANgvIeRcdrYBaBPTEbB2DdgB5qvu3R6O
 65+wHHPzONr67LinpJzd6dlW5U8vMQuSgDrrM27wsjlm965HMRxSTQ0q1gZxWn9FAe1k
 PNA8Mp7FEZwCWVomCxZkz6XZLUpUzBEjl7DaLwY1fCDjXZvKFTz8EM45mJQk9AtuZHly
 7ZMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SEJTQsrp
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: bump version to 2.92
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Release notes:
> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q1/018380.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/dnsmasq/dnsmasq.hash | 4 ++--
>  package/dnsmasq/dnsmasq.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
> index 212774cd10..258f0b1e93 100644
> --- a/package/dnsmasq/dnsmasq.hash
> +++ b/package/dnsmasq/dnsmasq.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
> -sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
> +# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
> +sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index dec7c9a86d..74fc053089 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DNSMASQ_VERSION = 2.91
> +DNSMASQ_VERSION = 2.92
>  DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
>  DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
>  DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
