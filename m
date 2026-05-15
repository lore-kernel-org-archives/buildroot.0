Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72680CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C94261649;
	Fri, 15 May 2026 13:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx4UNVVsETrg; Fri, 15 May 2026 13:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2135A6163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852059;
	bh=JBjy2YlLsV8ApY+Rz8/4QugWB5y1JUppD/Gop4S1hI0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i7swfjijVSXP5d2BGk1/8XighnygVOr5KaSQiI9UBjfgUmsPn3VXIiepJ0nI7iJo/
	 rbL0GNid2pUnXHO67QXg2AlBZH2zVfZ/6oy/XqgLpHs6NWxYyp9hmgHFuxEr8SSAD2
	 6H6AmbawUM4uKh6WFsiatOBw94TjopFJwILfyYrAXKve1/SO0zVOgSELKOOXiWmDMI
	 n6NZSLoEBK+M+z/wJDIcPQTievHGGOkupJVz1CYL2TbbI7omOJMRHYXAlPZM6zOsAD
	 v4jU9iHUwOm1pbxMfTM99oOqOKoNs2Isia9V+of4gZixceLW8H20vGe3NMR4H5bSvK
	 NCP7ot7cFRFzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2135A6163E;
	Fri, 15 May 2026 13:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E0DF36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CFCF84356
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqOnITgJbAzI for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D06A484352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D06A484352
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D06A484352
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso5742655f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852053; x=1779456853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0fyavIPlJwVh70609YouAZaOgfRYfPO3g0i8aZOmWyM=;
 b=EnjOb+QOngU4CBLMG+mrH+Vf3vGupUeg1Qcpc+S/Thv87H0JWtwZyPLRiTxtDLJvcZ
 UqIiQemZJpDmdI9UFjsewxeS3LroAhhlIcaWfqGLv0E5hlGSsDTergkKtKiNSK7GELYF
 yp1sF9rZeQvsweg59YPeYHxOxdezG4YZD+EpBkoo0tal6iHmpedqkxXpeK1I2661EYCe
 Re7FjzEg4A8+cuKNpigbsMGARmn4avwNxzpzv2ThnigxIQ+kz48kgvfzrs6gR5zHfoeu
 zihRhR6g4iW/NkjPRy/sgLU+Uv0QbWnUm2imVsvZ/d/5Z02ebJmEkzQCFZxv+GyV1Sq/
 pwuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fJ67p1r2efGtlThL1BYlHDE+IJFIqSIB5G+M71LQKOqJvzJFneB6iPZv4vvqxRmWHTClVx9graUQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywvhl984g5+uRP2iu0m2L+gb/SIwmmr+xvj51QrWFKsTDEmX90d
 Vi1p26Na2t+pUcctD+XzBbhDfJgJX1q/awGegRVu4leg312ApxX1n1ArkK0atKzkDKE=
X-Gm-Gg: Acq92OFDmLBV8HgmTvrkrLn87FAsU5cX8ECk8Rh3nW5bTQSy8n2L3NkIjCUbh1q9kFg
 2imNE+cYTxIgdZr678FvZfQJB59xClzACOjyZHQeiEGPw6Rb93+rPHnun5LLlgb3HTdW70Aimxg
 afyQkS3pRAIsyl+IE6CyxkTz5TopcT1EIzyC6Hu/0GS6mkim/lySCdNe6REgttaSnbpbCT7tBVg
 TjcLWEk2oP+a2YKtBSay7dCBbGMDBYjWjJnpckxh1Vru5B/6JVhsIliZWsYve+IVhSzweNX0MRo
 1lNE5oReiFmnR1GTJPkHBc357x/YlTXlCpnBQtQwM3BxgM+6Q6eDIAKr79BJY1RPbuFuko6cE2k
 fLDejI3gWbkD/vLufENk67uCY+dShvPfV/2rhTr26FNUOo2WGAZ7Ipo73/hWwFlboRBZ0A7cWfB
 ckevmB0gFFSKi0WyCqNiSE4UUeLdN0nhT95J8QcXGbr92K
X-Received: by 2002:a05:6000:2902:b0:43f:dfc3:555f with SMTP id
 ffacd0b85a97d-45e5c5f8d7dmr5412683f8f.43.1778852052699; 
 Fri, 15 May 2026 06:34:12 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13262185f8f.36.2026.05.15.06.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:11 +0200
Message-ID: <20260515133411.316501-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430044144.7757-1-bernd@kuhls.net>
References: <20260430044144.7757-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852053; x=1779456853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fyavIPlJwVh70609YouAZaOgfRYfPO3g0i8aZOmWyM=;
 b=STZphetGHnJLxynmTWRy98DYAegvBld7b6QPx+DS++cXzLIdYHRADPkblDrcXvm3pT
 5qA9J60irBUAj2Pj7Ih8RlHL/8PlH1Sx7MVH7xLMZl27napyMmPNw3ycofMYvYwGdWxR
 teQoCbnGZeU2lTT7yLtAFqWc/NWZMLRUejaNvt3pOiSbcywceea+MNdS6TBEX+YwfOiG
 dm4GaZnNSDRS/KOzngZ0ac+T14/LUM4lDDIyHCTpTv21STYbND0CJbgmaxxoTtNx5Yxe
 YMgFDttMC8Y48MZlNagL5nV7VKLZRK63iSpcbbHHHRxHLvZEcwejzShR4t62kBI2Xm8V
 Amrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=STZphetG
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.2
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
> https://lists.exim.org/lurker/message/20260429.121733.f58d9686.en.html
> 
> Fixes CVEs:
> 
> CVE-2026-40684     Possible crash with malicious DNS data when using musl libc
> 
>    On systems using musl libc (not glibc) due to an oddity in octal printing
>    it is possible to crash the connection instance when malformed DNS data
>    is present in PTR records.
> 
> CVE-2026-40685     Possible OOB read/write on corrupt JSON in header
> 
>    configurations using json operators on invalid externally-provided input
>    could trigger heap corruption.
> 
> CVE-2026-40686     Possible OOB read with large UTF8 trailing characters
> 
>    configurations using utf8 operators on malformed utf8 in headers could
>    trigger OOB reads and might trigger some data leak if error
>    messages are required for subsequent emails in the current connection
>    and similar malformed headers are present.
> 
> CVE-2026-40687     Possible OOB read/write with SPA authenticator
> 
>    in configurations using the SPA authentication driver to a hostile/compromised
>    external SPA/NTLM connnection it is possible to trigger an OOB read/write
>    and crash the connection instance or possibly leak heap data to the instance.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index f9a62e0188..745b9f0977 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
> +sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
> +sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 47fe17b372..7129e2ebf6 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99.1
> +EXIM_VERSION = 4.99.2
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
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
