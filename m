Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF7D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828A540597;
	Tue, 13 Jan 2026 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGhfWS3KUP94; Tue, 13 Jan 2026 19:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86EB40674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333506;
	bh=PcK7rG6bh5QwzD0Y+qOcCBH603LQVW75/LZYXQttrMg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rQ+HDuCxhLmt2bUS8W5PXs66r/wXntXmy5f+ylEbXh4PMIMn9bp4mUYeHE8AE4jVX
	 7PZezqsiVOxflIbMdrgY2Bw+YhVSgvJI2zshF5V+oQyz1gmDt7AfwUYB76XrnSXDoE
	 fFtKW0m1pmd+jQD3m/KlJPyogjVVeP9kdqupEXgHIxUxPHuIl13JSofT+dP2W1KyC1
	 gTi00ZEsj3NElXA+NXhx4xUtq5jLtcqefAXfLbT0qmSThVnIIN3NR7il5qb8hr06CL
	 tbfASrOukOMnvkexW32Jx/hwnli3rgXHGUyAwCUKO1S+E+gul8vZkpFFSDx754+teH
	 OusmeYgJaLtOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86EB40674;
	Tue, 13 Jan 2026 19:45:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2701C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF4A6813DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6q5I-xTVKERB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 566F88146D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566F88146D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 566F88146D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5D77B97A863; Tue, 13 Jan 2026 20:45:01 +0100 (CET)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:44:59 +0100
Message-ID: <20260113194459.97366-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250506145236.895150-1-titouan.christophe@mind.be>
References: <20250506145236.895150-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333501; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=H7BmN6jb0xorMoVDKP1rNwI2szxu4w0yXZ/A5ptc3vg=;
 b=IC+4jTO9WtmGANNYNY6AAEBME1nVz3abkiQj9em3hkTewMxomUR2+XTQgGWt52m1Eq+0MA
 wwsZ4/K7p3hZ6qevXHn2iqtII2FbvHppZgS5y4ofBNF8bdm/FVbO6vt1Dr4NTHXSfBXNMD
 +w62ppLyALrF27UBvRMG1qi05qLghl5PIbj4jx5LuASTJQzdVEd1y/CZDY6UwHrBHlzISj
 T9l2fpkrLDKAI9tqOSkcBsMUFLpstAfcMXI82Zw026ritwI5WsFLe2pQibninaLabJ/C7U
 YSMX6AZ3wbmxJFtg7FO6sKZ9Rbu8COj4LDIsSQcHmXIGsQgzQ78jlUrGGx3eow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IC+4jTO9
Subject: Re: [Buildroot] [PATCH] package/mender: ignore mender CVE because
 it doesn't affect the client package
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
> CVE-2024-46948 only affects the device management and update server part
> of Mender, and not the client running on the devices
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/mender/mender.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index 146e6b2b73..1050277db1 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -8,6 +8,8 @@ MENDER_VERSION = 3.5.3
>  MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>  MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
>  MENDER_CPE_ID_VENDOR = northern.tech
> +# CVE-2024-46948 only affects mender-server
> +MENDER_IGNORE_CVES = CVE-2024-46948
>  
>  # Vendor license paths generated with:
>  #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
