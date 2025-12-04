Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16D6D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7191C613EB;
	Thu,  4 Dec 2025 20:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Njb9vCCj7aEO; Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E57E61C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881033;
	bh=rpbVsxS3E8/aEop57feeU165k2UpTwBdpZHjIiDnHWI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V09tgdv507jxSh5pDtolOuw8uNvQuKLKndJvfAyeBJK8aF/9MPAtd+ykcFR+UMKfG
	 HX/sPInAAvfkViTX2cNZgw8zZlAppWuW+kT+0XGV40nlj+VOayW5G1XLEgCZjotlGE
	 tR+ODlReuik+XtVH44XPU4Y3JbIj/x+QBnnmx0061o9eZWHAvUcILYmWkZApsdzqBU
	 DPaKkJpqnZNRvP6GqYaSLKyeT8BxMAFxiXQE2xlIbe+oGfVh88GoNStDHyajWpSHjJ
	 Cjj3IpnH9wNr9t9BtmU3iWt4f78S2SDbRiDCtz0SKEqLBzCbl6LlYUX0Y/EbF63BFv
	 S7S9cZrxbPDTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E57E61C7E;
	Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E72DD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04AAF61B0E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO7FYSrlA1XV for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF4D1613EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF4D1613EB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF4D1613EB
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C85BCB979ECC; Thu,  4 Dec 2025 21:43:48 +0100 (CET)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:47 +0100
Message-ID: <20251204204347.13308-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251017210430.496962-1-raphael.pavlidis@gmail.com>
References: <20251017210430.496962-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881029; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WUKgqi0OfJm4VA0h+AX/1qGVj4ySKFqvpuGIgIrtA7M=;
 b=jWZhwYCFX+ovUeanFuSxEsc5tPMLRTAdNX3AHL4yd4HHSEwwBWOKX8WLbBUT2aUjUqYeld
 6GymGa7fJuGnC/JH9ko4QE891Y3rZxvNVjI8LX2MYUTYifrx4M7qvtaSksbmjBSax7LMT0
 ZQy/CurlzuVw1M2jNR9eveMNwh5gISEuhKRLoqpWjHdzTmtusun7qzMWMzHz9KhDOBwDbf
 LNc2Et+Vvy9luv6do2U79BV52Y1WjgEI0OcA7qO9aeMSjZ85VoQueX7JDalErnZd4/GX6+
 OObqo+DMwzUmEOpWzkYUQyuAk5XTXKsdflB+3UM3aTkMXznPtcq86YTfkcR25Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jWZhwYCF
Subject: Re: [Buildroot] [PATCH v1 1/1] package/podman: bump to version 5.6.2
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
> Changelog:
> https://github.com/containers/podman/releases/tag/v5.6.0
> https://github.com/containers/podman/releases/tag/v5.6.1
> https://github.com/containers/podman/releases/tag/v5.6.2
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  package/podman/podman.hash | 2 +-
>  package/podman/podman.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/podman/podman.hash b/package/podman/podman.hash
> index b5802dd305..e52a353aa7 100644
> --- a/package/podman/podman.hash
> +++ b/package/podman/podman.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
> +sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
>  sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index fc9a989bf0..71eb26b496 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PODMAN_VERSION = v5.5.2
> +PODMAN_VERSION = v5.6.2
>  PODMAN_SITE = https://github.com/containers/podman
>  PODMAN_SITE_METHOD = git
>  
> -- 
> 2.51.1.dirty
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
