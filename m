Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD8CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D7C842EB;
	Fri, 29 May 2026 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSLJ-jB2SbwE; Fri, 29 May 2026 08:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583F7842D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043417;
	bh=QuH/J7GQ3ljVDrC18YRCeiQK5QLBJLsE/qBMYVyJM9g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XHePjSs+2nvWEptb+YWRvR7z7UOG6KYmJLjL+ieYtttWqar9b8elW1if5zN9ecd3N
	 D3jGZhWBjEKowOTNSxNrEwZmcw6njRB4PisjHpCyuEh2Mj1stnPi29H1Mijh3Esna3
	 Jt/YtB0qEx/tLS0Z2jNzZRSGl83cJHah69qfhqZQOafFhZMc8clTwBcSWZC5UjNKfo
	 5lqceyA5gxPfoArQyJrSa8cCpaJCP9VLboWqhIyW9cF2GhEEybvdEfulFyEizBvtZm
	 vAfcPP5qWYhB5rhPq458NEl1xm8xx7g2Am1m5ONPTfR0EftKGbEGlThRrXQQJ5hXir
	 pKiyAOiv2FvfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583F7842D8;
	Fri, 29 May 2026 08:30:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74257288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63270842C7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BIRVMj8MOuX for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2964C842C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2964C842C1
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2964C842C1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so144316665e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043409; x=1780648209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CJRv8HKgR1WgRDlJwzQvRSvbNp7+OIqvXEIFst2xxJg=;
 b=Lo4WPAzToQVyPUQWKtOn+YL/ZgsOCK/H5jebSL4YDPhr/G6DihDZRh9xS8uh1vk6rS
 hUjcd0pyY1lPlZBhTeiH3czocW5s66niti/A27TxzxNru+xY/6v34ODe2w9QedyyQoYG
 kvU2pCKSSjJSpF9py4ZwA44spAU/9yt7+iv2Q5XpBKmqaz1FLrpi7XDJZTVl5Fr8Y7Fk
 3QIcOaYQa6ilmoG9jtNsX+xVOCZ7WTZblVU8vWLXVK7PC9rqXOkXmUvo1pmIokcQLmuB
 +KLVeoeICYCvD6p08ArGM8e6fT2B6DI1UvkNc61y6M/zol6pIBQTrtTVQF6WlZY2ther
 bIrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KUVdUVT2n5wyw5Eqf8Y0SdnX/cB3uwtnD0nl7nz8jrffnFh5M2drxY5TQEYQcwPDuGC0MfoMO24o=@buildroot.org
X-Gm-Message-State: AOJu0YxqKOKqyHo2j4A3zEP7sBezrBLhsvs0cTjFrf+n3mT0BdgLZpRP
 QP0uzmhd0rJUN5eSAR6SFm2ENxuJ4mQ1TB3wtg1HWiG7yVC1CHiQsZyIKNJbMBVhjYg=
X-Gm-Gg: Acq92OENeJvFicDgnp59yjfmjB31N8GIttII1V+YTj6nuKdr4iBDBoXJ98z8UAgraWx
 eEiW+qC37ZlGFTqhMp3aqgL4Di6dhkeLaGa/DQgX3tjWmLxSooAz23WjKdcW8oVtPX1HzOvDBSx
 pTlBwFSH23V2wj94LxiValqBtTuCqcNQ+dLGxxrb8J9QqENgEgzSDP5CXQ4f6D1g0YLgyCj+fsa
 lUFegqH9kF6fso7iw0eGAD1/7O0WDZbHGjhsvE+ZZh4upt0pvS6neP8UM5ult5fj0RtrAkpwixs
 bBloxKGl5gyoBJxYgOWbIemRV1LatLM5r6ufbQoJBk7FmxC6xyknmWTMD2aN8LzHg2LMvU2vla8
 jy7X6HHC7oMZnp1zGMH8n7smkXZWe+CuDljZ9nM8XDw26sVCideWYqUXHiGIJhqs8IIlOsb7PVz
 RgHBtkL1GvQM6JcArBQQtoQHhmxylTVMkJNdEJlgcC6Lz1PQiGqXsTtXEi9Q==
X-Received: by 2002:a05:600c:3b10:b0:490:5872:e641 with SMTP id
 5b1f17b1804b1-4909c0cfe40mr33253465e9.18.1780043408750; 
 Fri, 29 May 2026 01:30:08 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm31943515e9.1.2026.05.29.01.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:08 +0200
Message-ID: <20260529083008.58885-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503054654.489631-1-bernd@kuhls.net>
References: <20260503054654.489631-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043409; x=1780648209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJRv8HKgR1WgRDlJwzQvRSvbNp7+OIqvXEIFst2xxJg=;
 b=c6XMA7qSn/N1jK5WvjU9fOJEtV1bM0VcLDXsg96CM7qO3t2YcXkJNr0lQZEBWMeTrW
 CnI+KCPGPPywQbMvG/z7Ku4bpDOLdduW9JO0nAfo4F0uB5t0Ou/ilnIB+YqJqYhhlbv4
 Kt0/plqPusIMlc6SpEAxPLYcUoavGkMgMWz56bZajYP0e0QO/4W4VLtKkjvyGMXvhIy8
 OHimSHMQz/q4uR9pt9hcEeMkzARiz071xL66cl+yYQQf/glqBDLfb0OetTJg3V/dsTLp
 XCh3hTJuRwgJ93MO0IbONMFjhJzYi94ICeYNbdJ8U3mSvEJIrwrkLhklSLfH7GQL33qg
 k75Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c6XMA7qS
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump to
 version 2026.90
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
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
> https://matt.ucc.asn.au/dropbear/CHANGES
> 
> Fixes CVE-2019-6111 & CVE-2026-35385.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index b3f532b1b7..81296375a1 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
> +sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e4e42cf994..beb635e15e 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2025.89
> +DROPBEAR_VERSION = 2026.90
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
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
