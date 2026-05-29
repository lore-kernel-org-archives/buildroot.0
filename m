Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73448CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EC260EDE;
	Fri, 29 May 2026 15:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H-BQcoglOtI; Fri, 29 May 2026 15:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A5D60EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780068843;
	bh=r1PdvgLaMGFMQ7iAOc0M+eM7oD0VNK0StygReK1eOgs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iNzOiGm/sl58gIBMNJiOBh77ox8W5cmMlcdOikfWiEt3GmvMYuH7aSv+pmawWG0iw
	 z2l809cAImP3lYiuEGongjlsbft22PkrjyUkg/T0QV91HvKDcQsi1wMGlvqcQpeiRc
	 nGEcRNvq3RCGOiA5/7Jx2TynCNwX2Z0/bNKJLMi/cr2xk9cLwiqOlgbooQRNSlQ25E
	 AG46p7W9bPfJh1ablM9INsyutoILVj/ATV61eATrw79DyvhMx7ABDKroKYKhOS6JtV
	 /IWLu3FWy/FPYxnQ8cHo7w2u/mFiUZ6j8ReNKZXCC7JF4eTEhpUJfzpvPMvW68mLKE
	 xWFjPn6BPOatg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A5D60EE3;
	Fri, 29 May 2026 15:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6099D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D482C41E1B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAKn5ltWAUwj for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 138AF41A20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138AF41A20
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 138AF41A20
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:34:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0D70DC6245E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:33:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48D91601FA;
 Fri, 29 May 2026 15:33:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2B6910888CBC; 
 Fri, 29 May 2026 17:33:56 +0200 (CEST)
Date: Fri, 29 May 2026 17:33:55 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <ahmx1V2FO31TSP6B@windsurf>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780068836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ttAfEEdzvZpzGXf0DbIO2E1XbN/NgomupwyoENgWzX0=;
 b=jFqSBwpE/tVTvbMP8nh0DcDni+Rs2hkDoG0sVHQTxazCVgpULoINmY3h8v5jI8Ld4ntCgC
 EKwGVod8BYEkd8w7d5nBEQX4U5rjutLp76OzyMEazHRSs3RVQVaC46j4fY6o7TOvnjwsI5
 gnE7OLzZ+dRZM/atEoIYbHK0Rf2zvURoqXRKyjGlvtBHJDgZIpYwekM0daTg7iu9N7r55N
 nZAhSwuYMA8A8dYM3mJ6PeiUkIKv3RCQQsGtXCPDdE96dwWwc8kXmZ6sguWZvlZj1EPX8I
 4UfivVkYyw0NVjxZOQFKBMD3S0hlVwsoX2cm3hW2Sq6yPyQQ00EPKwDe5BAfug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jFqSBwpE
Subject: Re: [Buildroot] [PATCH v2 1/5] support/scripts/cve-check: fix
 vulnerability timestamp to RFC 3339
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 29, 2026 at 05:06:27PM +0200, Thomas Perale via buildroot wrote:
> Normalize vulnerability timestamps to RFC 3339 format with explicit UTC
> timezone suffix for CycloneDX 1.6 compliance.
> This fixes validation errors in sbom-utility and makes the generated
> SBOM with vulnerabilities compatible with DependencyTrack VEX parsers.
> 
> The NVD JSON data feeds provide timestamps in ISO 8601 format without timezone
> information (e.g., "1999-01-01T05:00:00.000"), but CycloneDX 1.6 requires
> RFC 3339 format with explicit timezone designation (e.g.,
> "1999-01-01T05:00:00.000Z").
> 
> Add nvd_datetime_to_rfc3339() helper function to convert timestamps before
> serialization.
> 
> Validation results:
> 
> Before fix:
>   $ sbom-utility validate -i cve/cve_report_current.json
>   [INFO] BOM valid against JSON schema: 'false'
>   [INFO] (234) schema errors detected.
> 
>   Error example:
>   {
>     "type": "format",
>     "field": "vulnerabilities.0.updated",
>     "context": "(root).vulnerabilities.0.updated",
>     "description": "Does not match format 'date-time'",
>     "value": "2025-04-03T01:03:51.193"
>   }
> 
> After fix:
>   $ sbom-utility validate -i cve/cve_report_update.json
>   [INFO] BOM valid against JSON schema: 'true'
> 
> Tested-with: sbom-utility v0.18.1
> Co-authored-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
