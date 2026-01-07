Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1978D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F47840CD7;
	Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGDnec0dQgPF; Wed,  7 Jan 2026 17:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1970F40CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808150;
	bh=UEHszpjEzrtz8ZEaIMDmTJRbkt2lwj8sKXu74TSV7ZU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XgUjEcYA8k4/3H/1AhwIYic1NLqgzRGhQu5JpH3ncvUicLbXEvZY78FLYVF39tAb1
	 09XeJ3eM5+FThXvava7BsK9UOgBucgQ2cuC1ybbeaZ6mnU5be5Jlez7l0SE73qrYw+
	 qk1mdSSZosaTwYhfv589o43N58LD6n+EIG+aFBx8zrpaMvF92LI5/iPoaW3NqNp7Sz
	 WTabiQBxQ5LLouP16mFlSHgyODdDTF9NCjDH8hCljm5yz7AYCR/oRFdZinnzU29YG7
	 2tkGdFsOjb/SjT4FJpKr5LgcbMkWoRWk16K61TLo/1Qfz5Ny0xZFkloiZZPaae0wwr
	 tNEJ06lDzRK2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1970F40CF8;
	Wed,  7 Jan 2026 17:49:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DCCC25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC45607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Nf-8mHcfCKN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5927D607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5927D607FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5927D607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7EA47B97A711; Wed,  7 Jan 2026 18:49:04 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:02 +0100
Message-ID: <20260107174902.224854-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216182845.2575378-1-buildroot@bubu1.eu>
References: <20251216182845.2575378-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808144; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0USTcrNlA4Irw6cPnZaK1b0oAl1D6kAe6bzB5+PuQro=;
 b=f1yhdo4dywZZArHe5kiktva/dHiB2n0mcFIeoTri1PWxXVNIO1LokyAt9DFG/DwxchjkTn
 40MsOzs/GY2d6scq2c57m8bUfZgOSaqK3E9tYZDIoPZVz0/rlB87wekGyLPwiuWnoEpbyn
 TVdzEuzkcyxObBtJs/lx0WycqA18rK6oRhZ5EVfQWcwpK/NYDpK/wwr5c7UU3qRQGH7mPf
 8p4NgbIQ16z7OTzoUCqk2TQdGqlmByOPt3nzbsqeNZLDeinzfKV6ITIZX13rdzzlfRRiSz
 VdzQ20STfdLbn6w5mPkJNj/oa67JqExnUrgIJmxe6U/Y4krCV0FrYzA8INg3rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=f1yhdo4d
Subject: Re: [Buildroot] [PATCH 1/2] package/tzdata: bump to 2025c
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
> Release Notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/tzdata/tzdata.hash | 4 ++--
>  package/tzdata/tzdata.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index a1629066ce..fcf7bffd24 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> -sha512  7d83741f3cae81fac8131994b43c55b6da7328df18b706e5ee40e9b3212bc506e6f8fc90988b18da424ed59eff69bce593f2783b7b5f18eb483a17aeb94258d6  tzdata2025b.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> +sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 32607268d8..a7b6dd8f65 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TZDATA_VERSION = 2025b
> +TZDATA_VERSION = 2025c
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
>  TZDATA_SELINUX_MODULES = tzdata
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
