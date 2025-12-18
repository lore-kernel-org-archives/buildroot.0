Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279A2D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2585611B3;
	Thu, 18 Dec 2025 16:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v18eeB6LUDc0; Thu, 18 Dec 2025 16:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D79D6076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075822;
	bh=K6D50EetTcynJmM2NG64HFU2qfPFj7nrkgZdpGkVs/Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JZQee4gdi+bhlUjSUBfjsTe+jEG/y/zSqKvoihN8ubHMadY4B7sWUVyY3VofXQ/PC
	 oftssM3Hujhzq+97f0iGWpVKFdie1Ivs9GYLEPYn6ekekLxRilStsjTNc0PeNr2zdv
	 MgUDVxbSjv/VKRIcMZx7La+uzAxYCPMKUDbhU9ET/MhP1S1rsFsc5LyzcVoxiYP6dI
	 D4NPfF2A1BsdrktIuFWzKWDWQljx8yRTiKpqEsE9cljGQlt1hieMJ9tmR3dVArtctw
	 tkc4J+AdGrEspHJWadlzM68zxHuM0oGX3qU7swnMW5KfodErJOt69AlzNM2qbOIssF
	 SUjKXcTTAC8Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D79D6076F;
	Thu, 18 Dec 2025 16:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 214FC1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0785D6076F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8NH7PF09RPi for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8C716074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C716074D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8C716074D
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C890B97A323; Thu, 18 Dec 2025 17:36:57 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:36:55 +0100
Message-ID: <20251218163655.379051-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251030190936.262624-3-thomas.perale@mind.be>
References: <20251030190936.262624-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075817; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WbDMQ3WwZdTWXfDTnNFwc6nQ6IhVLPFIJgB05F67b0E=;
 b=FC9V9nKcuodAOVKAmaOTD8cTaHjyxQ3nzepgTdz4jSieZquMc6eEKeUewUi1/4x5bbxNls
 z8wLc9jdnGE+QVCMvawRdPKHb3XNSmnbTHnIAhVDqwcYUiLFYTNhYpcdZWLaH+VMMfFDVR
 QqaYPM+nty4ReIWtnOiVyiGr/nHwhF5GZkU2kFMNAodTxuowICnnu45RXeT654gvGZTpxB
 cuEPOeubtOImB6k/rpGb9L5preKSZG6rhQnb8r4WrahX4k3ozkiDhv0cNs+OWWvpPW5E+4
 Bb4hbiEJpnaOp+HYfAzK+llPEKRXeiQCn2VaAtxqvRdtgLs8+SxCeST5CN4Cxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FC9V9nKc
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: mention CVE trailer
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
> Adds documentation about adding a patch that address a vulnerability.
> 
> The patch-policy file now explain mention that patches that address a
> vulnerability needs to include a `CVE:` trailer with the reference of
> that vulnerability.
> 
> Until now only adding the reference to the `_IGNORE_CVES` variable was
> necessary, so the documentation of this entry is modified as well to
> point to the patch policy.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  docs/manual/adding-packages-generic.adoc |  6 +++---
>  docs/manual/patch-policy.adoc            | 13 ++++++++++++-
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
> index 6827b9975e..e7547460fd 100644
> --- a/docs/manual/adding-packages-generic.adoc
> +++ b/docs/manual/adding-packages-generic.adoc
> @@ -509,9 +509,9 @@ not and can not work as people would expect it should:
>  * +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
>    Buildroot CVE tracking tools which CVEs should be ignored for this
>    package. This is typically used when the CVE is fixed by a patch in
> -  the package, or when the CVE for some reason does not affect the
> -  Buildroot package. A Makefile comment must always precede the
> -  addition of a CVE to this variable. Example:
> +  the package (see xref:additional-patch-documentation[]), or when the CVE for
> +  some reason does not affect the Buildroot package. A Makefile comment must
> +  always precede the addition of a CVE to this variable. Example:
>  +
>  ----
>  # 0001-fix-cve-2020-12345.patch
> diff --git a/docs/manual/patch-policy.adoc b/docs/manual/patch-policy.adoc
> index a4bc5f391a..7a707a33d0 100644
> --- a/docs/manual/patch-policy.adoc
> +++ b/docs/manual/patch-policy.adoc
> @@ -144,6 +144,7 @@ AC_PROG_MAKE_SET
>  +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
>  ----
>  
> +[[additional-patch-documentation]]
>  === Additional patch documentation
>  
>  Ideally, all patches should document an upstream patch or patch submission, when
> @@ -177,4 +178,14 @@ Upstream: N/A <additional information about why patch is Buildroot specific>
>  ----
>  
>  Adding this documentation helps streamline the patch review process during
> -package version updates.
> \ No newline at end of file
> +package version updates.
> +
> +If the patch addresses one or multiple vulnerabilities, list each identifier on
> +a separate line with a +CVE+ trailer.
> +
> +----
> +CVE: <vulnerability identifier>
> +----
> +
> +If multiple patches address the same vulnerability, reference the vulnerability
> +on every patches.
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
