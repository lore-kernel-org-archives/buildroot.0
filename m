Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24936C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A55412A3;
	Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ee17VQF99Mb9; Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D547B41294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089147;
	bh=S/eq7FTB/c++l61e6LWej0bArRBfqtQB1OlE7mbcTmM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SRVRPAvWRCUMUIbHP086SkQlDAKzo5PmHMqvcc+xptN8T0UCGlJDNfGoW99CPTVSI
	 NN0XnTZ2p+068j766FQruwJbsakpNbFesvLoMZMZ++OeIUHh5QXMYxvPfKrKjDJT/o
	 B+VBrAVGbDMnx2ARG3Gi0QFFAX0JPTWRiTPzpZ1vNcCeqqmzC9Qa2O5f0nLpfkcZEP
	 49Dz268zpx9o0uV3spGQim/QxGm+tJp9qdi+lz3HFrkU74GP8voy2nvS5RBEzorrZN
	 IDmjelchd8dpaQoUpuuFkhNUrkxbYr0AtFxWN+F6zi/4lCF1QK/uCvMpycwziOUv4u
	 AHv8Jkvtaq0rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D547B41294;
	Fri,  3 Jul 2026 14:32:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 442E214F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A91640556
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liNLohUohjwe for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19D214008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D214008F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19D214008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-472326ca506so436271f8f.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089143; x=1783693943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lf71nBMek2ASYNL769msdYLkneei1o+SkZIVvVvCJT0=;
 b=OPMygKB8yZ169ls+cG29DKiJ4Pd6TX0hBmoUug3PVe2+6jpGhVupnKjp5vddGVFQe6
 zs8hRP4g3PRsRCrWNQIAD3MEMnlEjcnRo7hOEH5pj7humdNdi8F20sCoZ2r8eJtO7/y0
 5CuueijRHMMjqHgMAmcbLYp2tWYPB2vpnMcoCU0/PQGIts0WPgWEGJdVW9IV2f5ppKZT
 2ThThgrs2XLVpZDPzV0kNctqUOAHZ1S5rgFBX907kTOhu4lcfPVJbL+Ra9pQbVT+glq0
 rF/0m1Xf9OFxPHEll/PIlAu0t7bqKMCCbu2orYBgggvVNPhl/0ZQxhcwzaGlfHR94R6h
 Hq4w==
X-Gm-Message-State: AOJu0YwZmqXn06Tdwiu/U2LI3hQTJKuZeQTBEadCy+6XNeSnPxOKKFBC
 slvnCEHXK/rXqtks2o5ihEy5NOUhoXggyozTp5AbMEBx8SfkfAyZgHuvqbVwu2GJsy4iUPzg8pN
 dzbmY
X-Gm-Gg: AfdE7ckXpK5/igwOrJlxWp+yMFdIvROKaiyNKPiaUe3URKd+4U0qEDWqRTQa5DqOq7I
 +kBraelwYtGftIzcQFCxtMBA5htAn64B+JKcGnSZeUkEGTdSG9bYr5msV7mnU7IRlWqLDZJdeEa
 ADvAeP66C71+yZy00Rtki5UbZIGn/vvVRtTcU/S9+eSY5jgG3+pSeNm9yUmaMf2cZGPfpGch1SE
 +5vDUiobdiPuFW/NttQvn9Gs28iac8EN4EngNu5oMvkmOOSF0Ww9y8oM4ln7hkS42W5qCLW1D35
 dLdv/rD9uNA3+xdneRLDeRIJabshpvI0Qw+3m/rpuCY16sRVwL87Dj8ooCnF4wLDv1VEWyJCpDp
 i7VqOGPmHq5fk4M3bhFt/DamkoSpavlEoX4ZdiQ5CNe1vDckqR2PzGUN3xzFk7QjyDSRl2dRJfQ
 7F6GPG
X-Received: by 2002:a05:6000:2887:b0:478:5710:4650 with SMTP id
 ffacd0b85a97d-47857104741mr11545793f8f.58.1783089142793; 
 Fri, 03 Jul 2026 07:32:22 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dd0b1sm18632027f8f.35.2026.07.03.07.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:22 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:21 +0200
Message-ID: <20260703143221.274610-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626082852.96329-3-thomas.perale@mind.be>
References: <20260626082852.96329-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089143; x=1783693943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lf71nBMek2ASYNL769msdYLkneei1o+SkZIVvVvCJT0=;
 b=MbF/RLXYvWhZJl9MT0ychpKaMLpdislespHz1K+qBW2ZrIEZGlLy+pBR1MircTlv0W
 jddWycms3OavDGCYCIHNgEw+S9jUDsu9yHPTAmDWD9HHnW1KK9qeWk4Auir41BEVjmjj
 ssouC1Jjc89hpoKvHWosJQ6OSoHZ9HBKQOL3AaG30NzgazCUUkLjjpaZ5pTsJTvgLPlU
 FzxCawNQjDOShPz2V6IjRnqq3m+cKPXYOqKclygFR1wHCGPNZ8kQ2Qt7bPlhwJm29+ib
 dfKUnpMHcyCT3HV8KaYQfuloB6v5Jt4zoGiuNX/puu1oKPI5QFAh/ZJQEhlOiy5S3AMw
 5WrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MbF/RLXY
Subject: Re: [Buildroot] [PATCH 2025.02.x 3/4] package/squid: add upstream
 patch CVE-2026-47729
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
> - CVE-2026-47729
>     Due to a Improper Validation of Syntactic Correctness of Input bug,
>     Squid is vulnerable to a Out-of-bounds Read attack against the FTP
>     gateway.
> 
>     This problem allows a trusted client to perform an Out-of-Bounds
>     Read from random unrelated transactions when accessing a misbehaving
>     FTP server through Squid's gateway feature.
> 
> For more information, see:
>  - https://blog.calif.io/p/squidbleed-cve-2026-47729
>  - https://www.openwall.com/lists/oss-security/2026/06/12/1
>  - https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/squid/0005-CVE-2026-47729.patch | 49 +++++++++++++++++++++++++
>  package/squid/squid.mk                  |  3 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/squid/0005-CVE-2026-47729.patch
> 
> diff --git a/package/squid/0005-CVE-2026-47729.patch b/package/squid/0005-CVE-2026-47729.patch
> new file mode 100644
> index 0000000000..5a8b0e3e08
> --- /dev/null
> +++ b/package/squid/0005-CVE-2026-47729.patch
> @@ -0,0 +1,49 @@
> +From 865a131c7d557e68c965043d98c2eccae26deef8 Mon Sep 17 00:00:00 2001
> +From: squidadm <squidadm@users.noreply.github.com>
> +Date: Sun, 17 May 2026 18:04:47 +1200
> +Subject: [PATCH] Improve parsing of certain FTP directory listing formats
> + (#2408) (#2409)
> +
> +This surgical fix restricts parsing to the input buffer when the listing
> +entry date in "TypeA" or "TypeB" formats is not followed by a filename.
> +It does not improve rendering of listings with missing filenames or the
> +overall quality of FTP listing parsing code.
> +
> +C strchr() always returns a non-nil pointer when given a NUL character,
> +so its callers must be careful not to supply a NUL character if a
> +"natural" one-of-the-regular-c-string-characters membership test is
> +required.
> +
> +The bug was probably introduced in 1997 commit 3fdadc70 and then
> +duplicated in 2017 commit 3d872090.
> +
> +Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
> +Co-authored-by: Amos Jeffries <yadij@users.noreply.github.com>
> +Upstream: https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8
> +CVE: CVE-2026-47729
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/clients/FtpGateway.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/clients/FtpGateway.cc b/src/clients/FtpGateway.cc
> +index 164fd0e499c..e04bb603d96 100644
> +--- a/src/clients/FtpGateway.cc
> ++++ b/src/clients/FtpGateway.cc
> +@@ -622,7 +622,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
> +             // point after tokens[i+2] :
> +             copyFrom = buf + tokens[i + 2].pos + strlen(tokens[i + 2].token);
> +             if (flags.skip_whitespace) {
> +-                while (strchr(w_space, *copyFrom))
> ++                while (*copyFrom && strchr(w_space, *copyFrom))
> +                     ++copyFrom;
> +             } else {
> +                 /* Handle the following four formats:
> +@@ -633,7 +633,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
> +                  * Assuming a single space between date and filename
> +                  * suggested by:  Nathan.Bailey@cc.monash.edu.au and
> +                  * Mike Battersby <mike@starbug.bofh.asn.au> */
> +-                if (strchr(w_space, *copyFrom))
> ++                if (*copyFrom && strchr(w_space, *copyFrom))
> +                     ++copyFrom;
> +             }
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index e072ec6137..439d65e479 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -24,6 +24,9 @@ SQUID_IGNORE_CVES += CVE-2026-33515
>  # 0004-CVE-2026-33526.patch
>  SQUID_IGNORE_CVES += CVE-2026-33526
>  
> +# 0005-CVE-2026-47729.patch
> +SQUID_IGNORE_CVES += CVE-2026-47729
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
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
