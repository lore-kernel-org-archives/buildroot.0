Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C10D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1546826A8;
	Wed,  7 Jan 2026 17:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d_miKiy1VHt; Wed,  7 Jan 2026 17:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BF8826AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808329;
	bh=1UqmFv5lcwoxEmPN6LiHtxQ32vGKe2xfGgMU6isNQKA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d5UDHndTixRDruEWSIQiXaTysRybfM/qVtIaMTfl0bSUPlKbm3kU5s2vmLjYJUwie
	 XiY1x4nwOOxL8nEGpXqu7XcyRmnv2RfIVv0EGpvPoqYbI/BulLGkYVn8Csd+eM9sz5
	 x91ySn2HQQnsEXoNuWx6xZMxZMpTzvG2XAEmgkkvU55njoE5QW62uJX8RDxRU6tiCB
	 hc11X2X+BZxj3sCe03CE7Em6cr1q+wgtpHHNy8ozvlr6XcIvo/VbBFKBeASPUYDRbA
	 MhrMAhRwJyzrnJ1NTq5c+elPLLORkCnXOeCUfbC40C+xvUZkFntoXneUEOHVDg1F8V
	 dU/D1yPw58JPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BF8826AA;
	Wed,  7 Jan 2026 17:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1890425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16463826A4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKgQASXWzCZF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD1588267C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1588267C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD1588267C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19E0AB97A704; Wed,  7 Jan 2026 18:52:05 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:52:03 +0100
Message-ID: <20260107175203.228667-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808325; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2GzI9kNKDiuS8z/3PQcIDfdtC0e/t3Mi1uGSN/5GMBI=;
 b=oiY/tkeqqRvWCqQeQv6PfM1cCatkvqLp3uIiOsmR5YgAYsP1ax1AZMpS8ZMfeNhnSSU89U
 vSNXB8O2Afvx52OdvKy06zvu+HojHwQ2nEunFQuct2Nvf7YhbVFeFsAcitx+r4e1GUuGDp
 +21cXNkLX5m0x3JT2KXOWnX/6i0PnZLwx0dYsO9KYoFiXBl5eu5iEDhxghg4KF/ZQCsVMw
 eQocgwLGh9Na5DWyVNOHl6hcQkDMs8i42mfw/XxWGrlmtdoCxTuUzt6foVlHRzHEspe9GD
 xzNArzNNVRCSOW1tICV4XRv+fnuvhypWm0mOezjdYytFWhaaeQPSYE9MbjuzaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=oiY/tkeq
Subject: Re: [Buildroot] [PATCH 01/14] package/sox: add CVE trailer in
 patches
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patches header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...voc-word-width-should-never-be-0-to-avoid-division-b.patch | 2 ++
>  package/sox/0007-hcom-validate-dictsize.patch                 | 4 ++++
>  package/sox/0008-phere-avoid-integer-underflow.patch          | 1 +
>  ...formats-aiff-reject-implausibly-large-number-of-chan.patch | 2 ++
>  package/sox/0010-formats-reject-implausible-rate.patch        | 1 +
>  ...CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch | 1 +
>  6 files changed, 11 insertions(+)
> 
> diff --git a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
> index 94298b7ae5..2b516fa4c3 100644
> --- a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
> +++ b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
> @@ -8,6 +8,8 @@ Bug-Debian: https://bugs.debian.org/1010374
>  
>  This patch fixes both CVE-2021-3643 and CVE-2021-23210.
>  
> +CVE: CVE-2021-3643
> +CVE: CVE-2021-23210
>  Upstream: https://sourceforge.net/p/sox/bugs/351/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
> diff --git a/package/sox/0007-hcom-validate-dictsize.patch b/package/sox/0007-hcom-validate-dictsize.patch
> index 722b64675b..c221f74c59 100644
> --- a/package/sox/0007-hcom-validate-dictsize.patch
> +++ b/package/sox/0007-hcom-validate-dictsize.patch
> @@ -10,6 +10,10 @@ Bug-Debian: https://bugs.debian.org/1021134
>  
>  This patch fixes both CVE-2021-23159 and CVE-2021-23172.
>  
> +CVE: CVE-2021-23159
> +CVE: CVE-2021-23172
> +CVE: CVE-2023-34318
> +CVE: CVE-2023-34432
>  Upstream: https://sourceforge.net/p/sox/bugs/350/
>  Upstream: https://sourceforge.net/p/sox/bugs/352/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> diff --git a/package/sox/0008-phere-avoid-integer-underflow.patch b/package/sox/0008-phere-avoid-integer-underflow.patch
> index 7c59896660..cc3cc533e7 100644
> --- a/package/sox/0008-phere-avoid-integer-underflow.patch
> +++ b/package/sox/0008-phere-avoid-integer-underflow.patch
> @@ -7,6 +7,7 @@ Link: https://talosintelligence.com/vulnerability_reports/TALOS-2021-1434
>  Bug: https://sourceforge.net/p/sox/bugs/362/
>  Bug-Debian: https://bugs.debian.org/1012138
>  
> +CVE: CVE-2021-40426
>  Upstream: https://sourceforge.net/p/sox/bugs/362/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
> diff --git a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
> index fd1d210da1..0489d82601 100644
> --- a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
> +++ b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH] formats+aiff: reject implausibly large number of channels
>  Bug: https://sourceforge.net/p/sox/bugs/360/
>  Bug-Debian: https://bugs.debian.org/1012516
>  
> +CVE: CVE-2022-31650
> +CVE: CVE-2023-26590
>  Upstream: https://sourceforge.net/p/sox/bugs/360/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
> diff --git a/package/sox/0010-formats-reject-implausible-rate.patch b/package/sox/0010-formats-reject-implausible-rate.patch
> index 5e60b62011..0805c2f958 100644
> --- a/package/sox/0010-formats-reject-implausible-rate.patch
> +++ b/package/sox/0010-formats-reject-implausible-rate.patch
> @@ -6,6 +6,7 @@ Subject: [PATCH] formats: reject implausible rate
>  Bug: https://sourceforge.net/p/sox/bugs/360/
>  Bug-Debian: https://bugs.debian.org/1012516
>  
> +CVE: CVE-2022-31651
>  Upstream: https://sourceforge.net/p/sox/bugs/360/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
> diff --git a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
> index b67d23c12d..7abdf54feb 100644
> --- a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
> +++ b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
> @@ -10,6 +10,7 @@ bug-redhat: https://bugzilla.redhat.com/show_bug.cgi?id=2212282
>  bug-debian: https://bugs.debian.org/1041112
>  bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2023-32627
>  
> +CVE: CVE-2023-32627
>  Upstream: https://sourceforge.net/p/sox/bugs/369/
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
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
