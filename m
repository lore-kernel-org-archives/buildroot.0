Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF7DFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001DD40B88;
	Tue,  5 May 2026 19:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8h3fuibVcHbj; Tue,  5 May 2026 19:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A82C40B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778009135;
	bh=1OjW5auypDHtKf1En4Y0kIe1DTpSlGQ06JBgzoRUoes=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FNAgyFOKMkDvQtFDbgCsFlIklSYvry1gGhURy+GwVqmvQ/yldlcipCFZx9T7jahZC
	 YfZX1CoHY01VKCrrT9G6LNQF7hTAQUJMxNBdWya3BBwHhrjcKIQqreLxwKV3bMriW2
	 ptx7gHZWDB7fKdfF1S4Zx/hD5KL5g6R0Kxo1Z08JElIBDck1o7FGoPLwm0T3pkDpEr
	 Jl61Bbz0EHBJ0gPqgNYkw7fw3BZRrtYKaqLV8bD6xk9xJfWg8FvXoNZW6BdMcmjB6J
	 wxKJPt459cJZR8YQsOuxvsglFzQLU8/TCyPYjZedrUEbjdKVlQ0gYWVcc9UM0y62gs
	 gHRUOz8isR97Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A82C40B85;
	Tue,  5 May 2026 19:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 565C42A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C1740B85
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne3UASlvfOta for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5800740B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5800740B84
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5800740B84
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB85BB97C2B2; Tue,  5 May 2026 21:25:29 +0200 (CEST)
Message-ID: <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
Date: Tue, 5 May 2026 21:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778009130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1KZCoFy/9rm/Fl9JWGTSUrghlxnH3rvk2SvWSJnoDQ4=;
 b=AYqYIRw+8AH9Xz8bfQeTvxH10JcqEe7Pj+2tyildFfxC8Xy7JmEfb0BxSNvqfmHbesMGqO
 ej41/TMHwGARfyWwmBIjBqJq+ydBHpCEHA4dDvh1DyfgDFP3WFmupUsrHdPmPuDYHrIaI3
 Iy/cpBt6l0H/JUdwvNpmXQTB/XltNexkI45rUFKe/oK/BsiUqwTyFypfSqJYkiMZu9zEst
 ocg0XX8Ak8iOawBOlhNtGmoQ/1ugGZRIpPV3CWHX95EmKd7h3tFbkgGVwGq3hpr5ak8kfD
 R+pnz9NCzjEEW5pTxtSYN/6SQoqGL9fppXTeMpKZuK6zA19xsULSQ6GhxfBcog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=AYqYIRw+
Subject: Re: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fiona,

  I'm making an attempt to get this series merged :-)

  As a preliminary remark though: pkg-stats really should evolve to using 
show-info output instead of parsing files itself - that would solve the things 
like the incorrect patches and hash files. There's one big blocker for that 
though - pkg-stats supposed to be able to work without a .config, and show-info 
currently doesn't.

On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> this series is a collection of small bug fixes for
> support/scripts/pkg-stats, fixing bugs I bumped into checking a fairly
> simple build with it:
> 
> * Incorrect upstream URLs (most notably for the Linux kernel, and I
>    had a wrong one for a package in an external tree due to an Emacs
>    backup file), patch 1 + 3
> 
> * Entries for *missing* upstream URL would still be links with
>    href="None", patch 2
> 
> * The "infrastructure" column would list "host-* (target)" when a
>    package that supports a host build is actually built only for the
>    target, patch 4
> 
> Patches 5 and 6 are small fixes for the script itself (don't
> unnecessarily load whole package files, allow importing the script as
> a module).
> 
> I see a bunch more things that should be fixed (notably virtual
> packages reporting missing license/hash info when there simply is
> none, and the package parsing process itself), this is what I had time
> for.
> 
> One question for possible future improvements: Is the JSON output
> format documented/defined anywhere, or simply "what the script
> produces, subject to change"?

  Ideally pkg-stats would have documentation, including of its JSON output. And 
tests as well. We can only dream...

  Regards,
  Arnout

> 
> Best regards,
> Fiona
> 
> 
> Changes v1 -> v2:
> * Avoid glob in patch 1
> * Add patches 4-6
> 
> v1: https://patchwork.ozlabs.org/project/buildroot/list/?series=501442&state=*
> 
> Fiona Klute (6):
>    support/scripts/pkg-stats: search only Config.in{,.host} for URL
>    support/scripts/pkg-stats: format upstream URL info consistently in
>      HTML
>    linux/Config.in: add kernel.org URL as BR2_LINUX_KERNEL_LATEST_VERSION
>      help
>    support/scripts/pkg-stats: fix host/target infra filter
>    support/scripts/pkg-stats: don't buffer whole file searching for infra
>    support/scripts/pkg-stats: run main function only if called as script
> 
>   linux/Config.in           |  2 ++
>   support/scripts/pkg-stats | 54 ++++++++++++++++++++++-----------------
>   2 files changed, 32 insertions(+), 24 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
