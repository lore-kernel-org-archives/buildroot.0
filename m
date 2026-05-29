Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DBDCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461F442311;
	Fri, 29 May 2026 08:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImRdtjLbhwaO; Fri, 29 May 2026 08:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD9F42312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043416;
	bh=cVb5/cV7fjX3/ys/YnSQAJz2UWywHHsyTWrLfAFsLDI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jzxWulZfMuk1yxPyEjHL6v9skxH3nUvxjDfzNCTPo0ysgp9Ms9ps92r7E+wtxZ0JX
	 21rSBmmOY2sz5vmtWIkz9kjLdgkc+PKd43BNyJkDwa6uVOR2AdXLdCSAtT3CqTrasA
	 Tcj1ZbvM+aqlEOL2hPv6o9ARTon+ApL2jIzaC52msoVxCKH1HUsoC5izwQ0Iz+CkSO
	 EgQcXOqNy/g6EY3fV9uk1Qa3YovDMMxgA7VykoGhKKVuUJlwWGs4SmZABTP1lJOfn2
	 7vZFtYOVb1wGDk9ytYVL66HefhhU2UfCn/BFL6W/xjeSXm8kSiQniIr58myKFB/o71
	 mO11IpjhJxA+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD9F42312;
	Fri, 29 May 2026 08:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF36928E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF666842C7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDHmFh4yXPvp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4A91842C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A91842C8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4A91842C8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so90488565e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043409; x=1780648209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7+J+HVvBtcvDleaf5pS26FYzXZP3k76dmqKVQyP4kUA=;
 b=ne4KbiOUKAzAjCUG0oxOtVGpLXKAZZk8rQuVSeiZi6smrEy5l/LiAFJqof6/5u1ycu
 qUUKIHC6G9qWnbX6RsQ8kuziFEDaqM+v8sw6rH6GPx22AIMPB9QmCYkWRofeqtUVjh/O
 2SrSCwTgrYmOGS/LBiKcrQAVVe6TVJbhs5pzn0Q9wGNXQ9Ymw+L1dvgPElL3seW1j/G7
 a7o2/aE9ejRujwHiAl4ef1LiAnmg832pQzwooDm7raeu2YiroMIRp6frJZm/AlOE+YGl
 fV4SmgbEKXi/HaWhy+kldMs4nJamVrhq9KI3aOf0o7Xa2HGGY+8y00ZUtXQmKj//wjkt
 bVPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PR2sMGRSf1PzYXgMN/9OF/Zu/ZxH1Wf1mpBPd5MkzqLpMkfuCym38zpcLXn3N4kRvnze93tN3MM0=@buildroot.org
X-Gm-Message-State: AOJu0Yzw+FciaXE9aBq7qywVhI9mCY5mNcTcVDvSGlsHBwJeV/BmRMa1
 fWfc/yULUbPuPcjEPDIx95Ohczl7vBUvgnGcH3ykik3ovw8CBVOhBNs65u1VrZqVg1Q=
X-Gm-Gg: Acq92OF8pYGz0ObdQqL64HQ7sbTrmWBGZk17uyfhJaWd7KyQM+AtW1pEfrxiWsDiMsm
 1zcEZ76VulP2XGAaxyIfw6Uv4YvzxVnv8lI5Mgz0dmN90sYTzV+mG3oQFW4nViMYR+OKoirWR0A
 Yq1/z+MqlPme7kaVEfC4eQt86Eqw5grQ4f89NSBvvzHQ33c6pvFNth/KeJeUDZ5f5A73B4kn1ia
 0zbrL9B2bTpxtalzvPtCdwWqzkNvE4OJn/J73Hv+8bSPQAgmhLUpHwkUTDCYWJGQYLTCXgKFXbn
 +pAY41Bwh2wZwUrhy+/ypmQxzvF57xD7KcZLH0PA/G3lItMYwNetoZAaHdih+uVJxyxVy/P5c62
 55wXkaGuq78WHa5jk3BLurNguUBGjepee14/X/m/jck2o/bbC6Y5oU16+F/S+iuoVVB6QVb4CIp
 8mlyZnoamlIcs8uMWezh5p9pk0nlG17xc+n0hBJlRjq17O0iTmjPtSR2Kn5tMdJC12aa7S
X-Received: by 2002:a05:600c:8b37:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-4909c631587mr24340855e9.14.1780043407835; 
 Fri, 29 May 2026 01:30:07 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6a0e42sm23578725e9.8.2026.05.29.01.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:07 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:07 +0200
Message-ID: <20260529083007.58818-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503190251.852569-1-chakrabortyshubham66@gmail.com>
References: <20260503190251.852569-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043409; x=1780648209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+J+HVvBtcvDleaf5pS26FYzXZP3k76dmqKVQyP4kUA=;
 b=PEnpT5PzPe9RX3B5TcjyoEneTn6R7ytk5NEWu/laU/mGTjeuqsN5FPNaU7DbxDXzpi
 /oWwUCOE0JB4wkv13DHI2hCk9jQs2TxQdIoc9umbZeXNcEzhbfT8reTTG73nOPRZqX7g
 HvrbKbEiwGIftzDi59e0AWqBaVDuriOQ8qiWmWQXJO3a5nM2osHTa78TKLbvdyuRBqjr
 3jYEp2TxWqcjGBxWVnWyQwO2vxjFwmIADZHWvgfdzbp2dFGegz8xnXp+QNefq9bG+d7c
 pKB6ghoYd6xdl3w5Tw69pABBPlIWCBNxEcUsfiGleSvM7PZIPGkT3OokRahajr7FvFT+
 v9Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PEnpT5Pz
Subject: Re: [Buildroot] [PATCH] package/dos2unix: update upstream URLs
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
> The old upstream page is being deprecated. Update the homepage,
> download site and hash file URL to the new upstream location.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dos2unix/Config.in     | 2 +-
>  package/dos2unix/dos2unix.hash | 2 +-
>  package/dos2unix/dos2unix.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
> index cfb5ba4b79..928605ae37 100644
> --- a/package/dos2unix/Config.in
> +++ b/package/dos2unix/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
>  	help
>  	  dos2unix converts text file line endings between CRLF and LF
>  
> -	  http://waterlan.home.xs4all.nl/dos2unix.html
> +	  https://waterlander.net/dos2unix/
> diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
> index 720a457ce0..d70bc6c21b 100644
> --- a/package/dos2unix/dos2unix.hash
> +++ b/package/dos2unix/dos2unix.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.5.tar.gz.asc
> +# https://waterlander.net/dos2unix/files/dos2unix-7.5.5.tar.gz.asc
>  sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
>  sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> index 99454aa2a3..9ac53ce838 100644
> --- a/package/dos2unix/dos2unix.mk
> +++ b/package/dos2unix/dos2unix.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  DOS2UNIX_VERSION = 7.5.5
> -DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
> +DOS2UNIX_SITE = https://waterlander.net/dos2unix/files
>  DOS2UNIX_LICENSE = BSD-2-Clause
>  DOS2UNIX_LICENSE_FILES = COPYING.txt
>  DOS2UNIX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
