Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC480CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F056842FF;
	Fri, 29 May 2026 08:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh-ST0koDbtq; Fri, 29 May 2026 08:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5ED84300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043425;
	bh=FAceuC87P9sx+nRUDvTxOt+5vtgxeOf74GYUextvWT4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YJOSbS1y7NdXsAyzlEO1y3GRIO4PBo3Ht8sFoZdrBvbrJ3zp7C5XQXDDYF2ToNICX
	 GHY3WsCvSv89HfhDNu1S2ahAZf/7nEDLh4N1bFhMKzagnOkMnnrrMWw9syB6vGZtou
	 dCcvEuT/8CH/S81TdddIvk5sRZkoCtgxKCAKq6vVtfG+KZ8YRNiEmMnlWeNGY55Y0s
	 MGrhwxtDShMjOW5cmsf5VyNdr6EE/E+0vptSO2ngBwgrx96XZCzHOHFn0pZYnzYtUP
	 5vNybMdiw0VG/3kVptChB2ih0gpW3doBL0HuXCOc/SuqOHQUI5DO3+oErbus9BISf7
	 oBbGip24OlGIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5ED84300;
	Fri, 29 May 2026 08:30:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D8C0288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F60F613D0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuSjVLz4XgHN for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23B1461594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B1461594
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B1461594
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso87904785e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043412; x=1780648212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zHKMPLaajM7ZIBwJpOMsW1PexVAs0ny3MhMAKKM2u5o=;
 b=nFsbx9gwPye2STxWaLtElYWsdgcupsjbFQ7TR8sL6b4jnDpxgqSzGOTRrfABFRiEDz
 rV1D9wZOoZrW5nNrZfyRcecGjTqAPOwiRtObQaDn7kOUKUaxjg/r+d0KekOEu0LINDle
 ax/Nwas5JUbwag5sPhM7O8WmWoRPXLr3vixiEKiyBm/bCAjgl7331t/cBSY1ew1ofNvF
 7WZltsu8HcwNYoRLT7j3YoUHgStXaAxNmTG0Q8MYqnsySQfMxXOuKbeohFLdJCtJXNy7
 cKddranloYeF/TvPVOWsOzlONGKKs6AWVTso1is/jkGJSalX4byL5liUob5x7AxC+lgi
 50Bw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8C+g2Ivos8UuUCCCrjlilHO++zRSEtxnOa9mbUkh2yIMFXbb5WG2Bxve7PRHugY6Dp3B5uxVGm3ZQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywk/+QsGGqJKm2gCQsnBdoMyqFZDAIiIMp4iKDI6KI+R5TBoWYn
 Vr0syUWrgeRZl9Yb8QW9D337kcdBaMFeBFOYi2jFcCwO0G48R+SzTPSY6Itoui3Fdzg=
X-Gm-Gg: Acq92OHxfKn9OyOakoJyUieFDoJJA/iFmFCU60Rzr1syGs38YafEfTeROigZDBLD7+7
 DeRY5M83AwowhTwXLEjQiol+3agV8fndtY0Tpq5mjov/d/Mjq9UaeS1Rth0/7aCVVz3xuqFfHEX
 psMFSlKZ+4ewrslrmQG2m02Gk7/FPQovorlb5Zx5X8a5ovL5YdRTi6y7+oNDi+Y7ADTKHw9+8EX
 MTqeway5/Kos+yyDcV0E5ZrMwn+xon8VhCfZSRmwlUTi/WdBED56JykGvaljfUvrBtft/yvOyoF
 CdHaqBvVhh9CzWpaTW2Hng4RV9xTa9c8QZTYUZMlcTkIO3hHWGagsqMF1ZiFlymCeU4pligU56+
 llEpRxa0XGR79CAc17fUa6gJeR3ZkSHsEejDmag5d5OJ+xGLD7omtSqBEvq7+Y00JJJWq/ixtEY
 2a7GBpQ1BlkQz7WYxH9ypQwXHNWnSC8b+fIoVV3AhR4mOeDVHKzujHhrOjIf8nsISGmFPv
X-Received: by 2002:a05:600c:e489:20b0:490:688b:f9f8 with SMTP id
 5b1f17b1804b1-4909c0ba255mr25382785e9.27.1780043412187; 
 Fri, 29 May 2026 01:30:12 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6db64sm29609845e9.6.2026.05.29.01.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:11 +0200
Message-ID: <20260529083011.59050-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511053836.208037-1-bernd@kuhls.net>
References: <20260511053836.208037-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043412; x=1780648212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHKMPLaajM7ZIBwJpOMsW1PexVAs0ny3MhMAKKM2u5o=;
 b=I8nSy0BySLdyWlt0hH7+9uuJ0O/QewUV0nis5BYEMSvK4vI7NAAf5lWQ1MXNM4kq5X
 4oGKLjc79b7Gzwuyfgf7GQ8NzB4zqJB0TXpyq3Kuz/cA1B252YQknXJW1xnsJIn8lFXW
 VGsarpOBikap6x7lhFurRvMJme7elXNi8SBejb0W+imHSZxxTn4T6qvZYy+AztTRPyQx
 0w8zVQN2BvP42jNp5P7UEYzzv8ftcP4TdS6YkMHIWxCT2K1Pt3ReLNcglVOmrZrwgqQU
 oLCinVa1uxje8ZzqhSlZBP3WXuV15zvP2jP7S7FdR79BdB+aXjF9C1C7tt9GnGmCfyIu
 hrNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I8nSy0By
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: bump version to
 2026.91
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
> https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html
> 
> This bump includes
> "- scp: Fix regression in 2026.90 building on older glibc or other libc.
>   reallocarray() was required, it is no longer needed."
> 
> and fixes a build error introduced by buildroot commit
> 5b136c89ffed35c30dff1802924a4dcf9bdab798.
> 
> Fixes:
> https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 81296375a1..31ac153b89 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
> +sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index beb635e15e..a7de8432af 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2026.90
> +DROPBEAR_VERSION = 2026.91
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
