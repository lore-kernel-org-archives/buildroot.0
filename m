Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C4DC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54047610A9;
	Fri, 26 Jun 2026 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UlYGdP1z9UR; Fri, 26 Jun 2026 14:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61AFB6108E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485740;
	bh=lp8mpYFQ72nVta3y+2qsK6R7rgBqZ3NEfhLrQbK+Bzw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9gGfut6+HMc3nOmpsqTqBukbK83tNwrvggZ1mcO35W7i6bfdO+KoPf6ruUGDEtrO
	 whTshzLuFaYYopwKexWBltIxOKh6sen/3Cs6RUJDjNxSKOxUckEyeuVpALTi1t/HkZ
	 slTPttIqbsCR7gRPoyHHdBnAAuED4RRJ4/Bv08vBxApX7SWClTwauPQr37dYsNI9mr
	 V2SWPnCjvS5nXQrqLFbeMV0b0DsVE4QzGL9Wr/Rwfw5fJ6xfBvquWFBgQZK955SoQu
	 vS8DXhqwdGsusAt7sH4Y6TOvQr0bqBiS4FgXQnwMrD6jjuSDouGu1AjzsfA+IZoRyx
	 FNJzTvsmU+CtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61AFB6108E;
	Fri, 26 Jun 2026 14:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48BAE3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F0AB40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2Yi_nHa5w86 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E6424070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6424070B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E6424070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4926f8e02e8so2866605e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485731; x=1783090531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SzFVgdifylduiXV+C1Gzl6BTO6yIWvblt1crCYy1sQ4=;
 b=bxkytp1XkwNf2Igp2cveIeBNoD32WscOS2t0bDKo7PgnK0e8ZBuoNHx4bre7R9K5C4
 uqAJg8qbsHhnTj8oQWI1pIK6DQHBUD+f7Yi33M9h5tFHj9ZtsC34j+CdEry1goW6o3EF
 /aMtQOKUNZR4SDrGe/G6SFngw5+HwgpEKrP82/KYueoRjF4wIu7rcmLGVo3RaEf1N4cY
 y1Xq8kZe2o9wp7mnrXbxDORPB8JUDFG3eeFcZOgdcNkRTEJMt/2nGrslX//GbPYj+TTj
 thy1jn1HQooJapRXmVBPBEgrz1TtiJr1I0YXot8t19vuQVO36tqpcDOsljAOodaYv/SY
 6YIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yYDlSFeMSUB3fHdnyO2ReI9MF7R7vYo6wCEWcDcc0WTxoY5Kf4nKThlTelU0GlcSoqD8ohrDS07A=@buildroot.org
X-Gm-Message-State: AOJu0Ywp+1nAzYE7yeWy8Y/rm6Olj6dYhHy/MqBYF/dzIDjwZ+Q7BgQE
 N6aTwgEexFc8IjN3Z3U3ZXPGHFwfLqJQ6voPShpaX11jndQLcwdSj4Qoj+9Wz2zJ0o0=
X-Gm-Gg: AfdE7cmK2rQk+1jvU+YWdyslRZ2ZIiE4kJ/gXmoNQGEhMKOSs25VBC9ahGqnysMKCYW
 WFNTPZ8TClO2n8TGoaSDMmJfOQtNYZe8TChP2/cEEHewahXLJzZCCcjLj/c9esXXagsFjkT/EbM
 +V+sxsYSE55GM1f9ha6ZJvRqj+EAz/COg1VaFNoeapocsTJiyFjYnZvkWHNby05wYZK4nWYxk8G
 A2rgPhYXlhE79JcDn40HRHbE96tO5hIj7Z4dSQf0u4/Ydvk3ofJifWBA3BB5ohAZNhx+UN09uN8
 VT5O+bdjD1t89dT2xHSxrLtOcPnQZTKMvONpi24coQ6bV9DfuoAFDUQS23IdxpMY1GVePDvu3Lg
 VPrrfY3aWTNUEX+HEjggsej9z2WmnqSiuJG8A7LNbT+1wZU7cdQw1xHFhgzmnRVtegqJMFe34po
 FrSPJa
X-Received: by 2002:a05:600c:8119:b0:492:6f8d:eb68 with SMTP id
 5b1f17b1804b1-4926f8dec2fmr18185405e9.4.1782485730904; 
 Fri, 26 Jun 2026 07:55:30 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269071c9esm80826205e9.9.2026.06.26.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:30 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:30 +0200
Message-ID: <20260626145530.343165-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621165109.2425496-1-romain.naour@smile.fr>
References: <20260621165109.2425496-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485731; x=1783090531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzFVgdifylduiXV+C1Gzl6BTO6yIWvblt1crCYy1sQ4=;
 b=M8/NiHHim9+qvQHdiVEPCVaRI8JsjjSTlde+htqd3ZmVaqnVTeKQVQ3DuX8bn7djzG
 BrXJ4oOFStlEfk9HkNxW3qaU/U6OR10BIcwGNY9hy8lscnBgU7l7tTG2hTSbMek2dhc1
 rA+NU9LNBai3L0n5otZ4+49jONzOk3vIqYeNrEiQVZikeu6TF75CSoXQR/uuPKzZMFQK
 jedD46mabIovBfEVJexy237+0TwzUhYyqWsEs2H1cI1e3/PxmIP77yen1LCY/Vj5baJp
 1roz9qzMwCAN9KpM+plto5B4VIARflTt4RTsW4xTwfcbs0/2LfzSXN8g/0IiqE4rBw0b
 AReA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M8/NiHHi
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.9
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
> Upstream passt only documents runtime dependencies; and they advertise
> being able to run on kernel 3.8 or later. However, they do not document
> the build dependencies.
> 
> Since 2025_06_11.0293c6f, upstream requires kernel headers >= 5.9, as
> they make use of linux/close_range.h, only introduced in 5.9.
> 
> Add a dependency to kernel headers, and propagate it to podman's passt
> backend.
> 
> Fixes: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6
> 
> Cc: Yann E. MORIN <yann.morin@orange.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
> Commit log from ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36
> ---
>  package/passt/Config.in  | 6 +++---
>  package/podman/Config.in | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/passt/Config.in b/package/passt/Config.in
> index a93a088670..fca1dff7c5 100644
> --- a/package/passt/Config.in
> +++ b/package/passt/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PASST
>  	bool "passt"
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	help
>  	  passt: Plug A Simple Socket Transport
>  	  pasta: Pack A Subtle Tap Abstraction
> @@ -19,5 +19,5 @@ config BR2_PACKAGE_PASST
>  
>  	  https://passt.top/passt/about/
>  
> -comment "passt needs a toolchain w/ headers >= 5.0"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +comment "passt needs a toolchain w/ headers >= 5.9"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index a6554a3ddc..7884171380 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -72,11 +72,11 @@ choice
>  
>  config BR2_PACKAGE_PODMAN_NET_PASST
>  	bool "passt/pasta"
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
>  	select BR2_PACKAGE_PASST  # runtime
>  
> -comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  
>  config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
>  	bool "slirp4netns"
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
