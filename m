Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63707EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B9461653;
	Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRUJjE_Ib2rg; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D6B061654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011507;
	bh=TffjHWrwjR/PemaoEVI/99ea4Ra/4C4CjFriOjpTwFA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lysvb7E2Bdw1UTYd7PNLoAFBSmHpRO67OF3+X48CS/wESyJATrHlk/7k4WPBKJaRS
	 V/GWojgOAXGYrjUb/kn7O8aXhQj3leFcgAhTYR9U5SVDhTL7f0+LN3hSmpobPmo7Dy
	 bra8sd4JycN+uw3eIjO/IVV1QzC8Ck4Sw2mmaD0x8cSsL94oqjgnjkl6WI5MG7POa8
	 TQAu8/pLJC2NCUBhbxgUckN01eynsSIFiI6ScSb7BgMTYdzSmK36yHBUOShC0Upgjh
	 i3fZBIF9Vr6TlslMMwgxR+RSmjJ7IVmUAJaAbvk9xtPVDNHtpIuuZgVRPc8mozlsOb
	 MqxrjYcgo2HCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6B061654;
	Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D7669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2322541F85
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cthtyeGlblAD for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8310441F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8310441F7B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8310441F7B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48378136adcso4201655e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011452; x=1771616252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NcNK60+nArpdTCUS1cQdPkQCG6qt9wI/LmMpvdoRSqg=;
 b=kPhEcy9mSrFtsG1/zemDlLPQx0C1hYmdEFbUMFIgeD5RWta4mHqc3tUIH1LL8FLwxJ
 8PQCO3PoVlNSFUCRYx92m6/nSATdF9uhmTksMz3htJDDfLUBICcwt6+IOHSmn/N7nkyB
 B5EmOt/Ztq9k9RAkysGssOagHUjU2P2q0eC2sgTrxeCcVyQl1XOSla5a9GiNuf1qdjtn
 6CUAkfjjWsCbgPeNoKugQw9cXzRkbfiSecC9amfKH+zbAgg2c0wcpVgQ1zYDgKJlsEVF
 SYB7fFERLjJMLL02hTf+i6jr+RVFP3eVbfdGE21UKFB8mUy2i41a5j9D1VT9LBLkPB/A
 NhlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEzBhkZQtgRJbFiUvuWb4bwbIJHitL5n5qhRrCQKjMoblWfQPUt886w94J6/D7fNIWn/o7tpHU7bs=@buildroot.org
X-Gm-Message-State: AOJu0Yzm5IsMs7Je3bQ+a65yAgtSozAeg4jfch6Ryeyj5+hPQYuftl95
 GLq9z07jR8a0MV0iiN48XpXw/vI4ltsZAUY8CHm61paxJRxe1KqUQMDJujmlxRrgom4=
X-Gm-Gg: AZuq6aJhf3pBDZFYDyfqxRwM8T3KZn66RBdf0csYsv8eHt50lYTt/U2Z7/KgHGiVFgY
 zbqsiGlAGARZJMfX94xvTyi6WBwQ2wQNANk2usgLLd7sFydhvbMzUgKkpgK2ZPeY8sDtFe5wjm6
 3P6M2oLlAn1+zJ1MVvfH3yguJCKGJgg/VLr5HECLjO8UYfN3kAdsPO+N3IGIyP9stP5j7A3rTgn
 UZa7iejccsW1cPJw/Wmy8589PXMrv2L9t9KZwg9mcqAy/Id6e4NFm/6No1SZsHvYqAZtT9uM9bf
 xFpcHhi0H1E5GklzfX3Rr1If0CT4FydiUIxMOm2Qx8SAp06KsPF1jPSh+dgxCxqCuFj43ns0aSx
 v7yPCm6oQ28C2sfKW8fE2WJ8ciNJ5owGNWibmB6hNEY17VFRUd0Qz9WSUES360zf71RXgp0ach/
 v9H85iZTLSA6GzK+8=
X-Received: by 2002:a05:600c:4e93:b0:47a:814c:ee95 with SMTP id
 5b1f17b1804b1-48379bbcbd0mr6536955e9.12.1771011452453; 
 Fri, 13 Feb 2026 11:37:32 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d77b3sm309694665e9.2.2026.02.13.11.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:32 -0800 (PST)
To: Joachim Wiberg <troglobit@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:31 +0100
Message-ID: <20260213193731.39825-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216093534.2558659-2-troglobit@gmail.com>
References: <20251216093534.2558659-2-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011452; x=1771616252; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcNK60+nArpdTCUS1cQdPkQCG6qt9wI/LmMpvdoRSqg=;
 b=EIrnn8aGcTlCJ2r/KZwSo6VwPF7L5b1lJdvyMEkXrlSbkuVJKutp+bCUdzsa7Ka8Nw
 3lfgkgjm6SSc+TfaC3FECISnVAVWy0+/hIgYNW7PvbZgA8Hh7mZ9DNF+aaFC2QfIKUqW
 c1ypsZcfuNne5cgu/ysUypagGSWXNzbYFYElf91GehooBUwrHS2teD2daK29t8Oy3r1f
 ugbxhVIDuc0/esmeEZ5D5sAXcPTVhgUki3/nsHRgHtPXAh+oBBsZsQD+N/vUwcwFU4sc
 aBtvnP5daQJ9H0SyEyJYWbdn9nSwfdtRxzk3WeAzJwbIktf4oDaXtZtGijS8+QhblWUj
 f23w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EIrnn8aG
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libite: bump to v2.6.2
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
> Changes:
> - Fix memory leak in which() on realloc() failure
> - Fix pidfile() to handle missing trailing slash in prefix path
> 
> https://github.com/troglobit/libite/releases/tag/v2.6.2
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libite/libite.hash | 4 ++--
>  package/libite/libite.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libite/libite.hash b/package/libite/libite.hash
> index 3abad09b0a..c593f7a66d 100644
> --- a/package/libite/libite.hash
> +++ b/package/libite/libite.hash
> @@ -1,7 +1,7 @@
>  # Upstream .sha256 from GitHub
> -sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
> +sha256  0550ac5670836db85569786e00860d1d6999df8f74005307c290371c990e1dbd  libite-2.6.2.tar.xz
>  
>  # Locally calculated
>  sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
>  sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
> -sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
> +sha256  b6cc7074a27b26ee4e1ccda8d634d485d0f6f819e564c663c28ed61f4cc2b451  src/pidfile.c
> diff --git a/package/libite/libite.mk b/package/libite/libite.mk
> index e4bd845487..beb8c27ba7 100644
> --- a/package/libite/libite.mk
> +++ b/package/libite/libite.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBITE_VERSION = 2.6.1
> +LIBITE_VERSION = 2.6.2
>  LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
>  LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
>  LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
