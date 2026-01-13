Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3348AD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03620842FF;
	Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYrleiNxUEwo; Tue, 13 Jan 2026 19:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D59831A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333623;
	bh=5dOLEECgqgrfGPS9SSOnU7kFIJ26Qnkkl3MP4fi6D+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I/z8L/6xiZ4V8NVwL9mj+ExW1pJNNPwB1dITt/I3UlT0c1rDJTUtshJ3E7lBP6ln5
	 YCo5hWEsGYxcpzOmW3gPnSvGUbI3uPVgNTSAFQhPTuJY2Qa+0Xev8GHgnZPSABo/ee
	 4OdSEod4FSMQVxmzdIHmpjgdMRY/UEzjiXEeEnjZQi2KDPT5kMXmZaQBAGoAaJUkG6
	 PlLzhjEccEm5If23QtkB1n8hxndvJ0eULtQ0PiIEH1wgFIPQsImR6/bU6NKAzhEW8m
	 mqeK1vK7/0yfbDYMoyQqH4gEbSfH/dqbeLx+vuw6BFqxN9HUyY4zj6rCgBRW8zKN7i
	 3mIPn5PhLJyXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D59831A5;
	Tue, 13 Jan 2026 19:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 921031C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78132406E8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz-hlj2cYMaC for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 692E040376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 692E040376
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 692E040376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D08DB97A863; Tue, 13 Jan 2026 20:46:58 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:57 +0100
Message-ID: <20260113194657.99242-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-12-thomas.perale@mind.be>
References: <20251230081917.18676-12-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333618; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2oBmDmB0KSedGUEv2XIoAkVov8XvaypyAwpQhQ9s+Yc=;
 b=HCVpbCCrrnZmaAZ2cPPwZqgYV6P+C9Cy32Ut3I2xiB3JAvLs49v93xueDURnbSI5m7wYQC
 Nybv91EsT7umXuxqZxzBpGjivpm4flU7YQnKNWJ8y8UWBB2Yf8oU8yzm0A436rdqKexN7I
 hPOBD04Qcg9CQPW26LCn8orwTzPq7n3wYkC7yYdjUh6H3s92b8faohJ8uXiTlftdh+rCos
 CqaY8SCBMWHbF2pMwbB6vfPQ6snFa4iUjxd5veBuv7ivDJGbWOjR4uVOacIm+y0grZRrdl
 VgLFtdLMGx6NuGyPaPuJoLouNHMNQGmylbrUJPP/TpQwwWtJQQWj1Xq11sZInA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HCVpbCCr
Subject: Re: [Buildroot] [PATCH v2 11/15] package/glibc: remove stale
 IGNORE_CVES
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> These IGNORE_CVES entries introduced in [2] are then no longer matched to
> the glibc package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> [2] adaae82c58 package/glibc: ignore CVEs not considered as security issues by upstream
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/glibc/glibc.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index a7727cbad8..924274a7d6 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -34,19 +34,10 @@ GLIBC_IGNORE_CVES += CVE-2025-5702
>  # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
>  GLIBC_IGNORE_CVES += CVE-2025-8058
>  
> -# All these CVEs are considered as not being security issues by
> +# This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> -#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
> -#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
> -#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
> -#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
> -GLIBC_IGNORE_CVES += \
> -	CVE-2010-4756 \
> -	CVE-2019-1010022 \
> -	CVE-2019-1010023 \
> -	CVE-2019-1010024 \
> -	CVE-2019-1010025
> +GLIBC_IGNORE_CVES += CVE-2010-4756
>  
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
