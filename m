Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA3CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFD04614FB;
	Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbYKSjsirIfI; Wed, 22 Oct 2025 16:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE78E614ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE78E614ED;
	Wed, 22 Oct 2025 16:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DE143F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAC4540ABF
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1rkNNjOY0tp for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDA0B40785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA0B40785
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDA0B40785
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8A53B979194; Wed, 22 Oct 2025 18:43:22 +0200 (CEST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:22 +0200
Message-ID: <20251022164322.286485-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009203425.126975-1-thomas.perale@mind.be>
References: <20251009203425.126975-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151403; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=1TKJrw8/Kx1occdgvaBSq4MjoCDwiYlRfl4KyZvBNF8=;
 b=gKaq88Fg1TJrUZ7Q0TXwwgl8I2/2TU68hsazh0PkKg/UC+htkNMpFVFP5+brxUrF2+M5PR
 LGDAX0mwd4CU4I8lNNvCwjc+vUp64kkr8iWfGwz/HVyzXJfoaN7L1Usvm6ukN+VSmLis4o
 Zs9kr6uVdN4oyJy8Tj78kPPjM5qp29El0HuOp8kb8+vFuAnE8EzY6sTQKjCldyfOYAcVXe
 Tegzs+05seV8NLdGzTEucMr5pmRDjfRIbuR5Da3i/NvjIgCs4gmfyI29ixDs/7V3SP0YsZ
 dPEoqW8bToGrxGnqWgpVV/TohauA945kEjCLuIaxeT+9t9w3uuzDwmN9ZfcEDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gKaq88Fg
Subject: Re: [Buildroot] [PATCH] package/suricata: security bump to v6.0.20
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
> The v6.0.20 is the last patch level version bump of suricata version 6.
> This version is now EOL since July 2024 and other new vulnerabilities
> apply to this package.
> 
> For more details on the version bump, see:
>   - https://suricata.io/2024/06/27/suricata-7-0-6-and-6-0-20-released/
>   - https://github.com/OISF/suricata/releases/tag/suricata-6.0.20
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2024-37151
> 
>     Mishandling of multiple fragmented packets using the same IP ID
>     value can lead to packet reassembly failure, which can lead to
>     policy bypass. When using af-packet, enable `defrag` to reduce the
>     scope of the problem.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2024-37151
> 
> - CVE-2024-38535
> 
>     Suricata can run out of memory when parsing crafted HTTP/2 traffic.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2024-38535
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
> Newest version is 8.0.1. The following CVEs still apply to the version
> 6.0.20:
> 
> - CVE-2024-38534
> - CVE-2024-38536
> - CVE-2024-45795
> - CVE-2024-45796
> - CVE-2024-47187
> - CVE-2024-47188
> - CVE-2024-47522
> - CVE-2024-55605
> - CVE-2024-55626
> - CVE-2024-55627
> - CVE-2024-55628
> - CVE-2024-55629
> - CVE-2025-29915
> - CVE-2025-29916
> - CVE-2025-29917
> - CVE-2025-29918
> - CVE-2025-53538
> - CVE-2025-59147
> 
> If someone that uses Suricata wants to bump it to be able to test it
> properly.
> ---
>  package/suricata/suricata.hash | 2 +-
>  package/suricata/suricata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
> index 58ab0d93b0..ea5ba01dc0 100644
> --- a/package/suricata/suricata.hash
> +++ b/package/suricata/suricata.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  98c812faef466d337f107f13ae37843f1c719942b93832d70f1a2fd7ee1b5c2c  suricata-6.0.19.tar.gz
> +sha256  c1515754924b618914fcb3cb98873af49996b920f2389a1998f89604f227a807  suricata-6.0.20.tar.gz
>  
>  # Hash for license files:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index e60ed2fce8..8840853054 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SURICATA_VERSION = 6.0.19
> +SURICATA_VERSION = 6.0.20
>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
