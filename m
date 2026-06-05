Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069D7CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D650780E57;
	Fri,  5 Jun 2026 12:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RN0moW8ULkzB; Fri,  5 Jun 2026 12:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F4481467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663877;
	bh=BQWjcGeZF5nW2clzOcRRU3Map1cQYLAPKdXTgOI86J0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iDDUJJNYGsH4AtN0i0Sx5pCVB3nosD25o8sSzpcH+jjeJC3FGMrML5wWowTnecsXi
	 kiZgXSrnzo2YlrBvF5mMK2AJbDapRUNwNmiS9P3OCTII/TfD/US3ez7XyHzpb9S99b
	 M9UJTAo/u+SM3ojHupLhw56Se5P7MdDk0pn1oHBE331/j/JI/e+4lvxVOZDye0j7ev
	 PQHhw53fHj9rQuIBlqJlKpKVA9+bwXsLHXGhdQSww9HFUn+iu8QX+/vjdi4UuvIpLG
	 DV4fQQ1flT1NBb43C8Qw4mw4gRLGmS9oKmcpF5kMaArdyHdrWR44TsuqHF7slHojgY
	 m/0jFR5lF7TPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F4481467;
	Fri,  5 Jun 2026 12:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0193F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91DCC4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0Na3vWWdXSD for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84C604037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C604037E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C604037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so15541295e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663872; x=1781268672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KZ9WO8sNGmRv2yan8e6TDEhbc0zCDwbHeN+K4WYOHg0=;
 b=WNozOU8TlDXKJepyvEA70PCQMzWJvgfbcAcHk4ZNL4Ap3DOQ3cAShDZjEqEJnSl12w
 F2fsEXHtcBTqVmP1Y7krkDlmTbhntHMntpvT1nn9pV/7yi4ys3hqf8RT3iTEansn136I
 oQt9mw0jmnmZG6YRS2KeMFB3UTXBa8QIdJj8+mth5aLmJTy+N6QG9uQc3XoNaGeP3bPr
 3GY548Sx0UdvL6vr7s81A5dUx1tr6TaVMTBkrxdexXBiV1jg1wmp09FXlNquBna51082
 HnGib307QPGsnMHVXLZJRtTCGpMouWUyTEHjyd1GAOF4rlQDzwNv7ECDD5tjMvjVcnD0
 w1cw==
X-Gm-Message-State: AOJu0YzmQIdW0O5kKryKGxPLhmZ8AbIq83Gdqfe71SSr7IlBAN0btuik
 /Gq4VGLyNRF/PvPhmD3LPoXHcYJuvYHCIj58TxxuaM+xEdC8JHR1zTHJ0q7ewmrA4bc+7YNJncK
 2ozfP
X-Gm-Gg: Acq92OHN5SNRxNljClLlxvtnfJYfiRUVb9QRzGY7OQyjfAPhFW2M8Uxo/VSXwi//i6Y
 Ajs3p1nnq9BYbobk2W2LS7qURv49JPKw3yPgur2bht3E/LEj+WSmvGdLzSY2gPnwKaHFe2LLNWR
 H7QqP55TDzUncWTawG0RyOtk6BKMMET0+IpFYS1l5U59H/TPy9BuNgCj+7ZMO2b+BwhB85/Riek
 7wUFDvwtDVSsy3bbbVhkBMJYq6z+dwl/+YlhBX4DSNobO9jXUeEFU/eZIHCeJ3j5YYmiGNSbv0k
 nUV2V+Ef5vTgIZ1T3/j12po9udE0KWMdaWZyo3/29QKJIx60Ma3SW/p044QLHr4PDXxhXVakSW3
 qrtC6HUQ7Qb4aIlKUquXdy/kcHDg+lw+kJW5FOdOfBOEW1DicBsg21Q2W+sr2LvHOg4lWjq+2u7
 LZRqnUojZf0+LjALCrR84/qwXL5A==
X-Received: by 2002:a05:600c:5248:b0:490:c024:2ec8 with SMTP id
 5b1f17b1804b1-490c2522657mr55526855e9.0.1780663871597; 
 Fri, 05 Jun 2026 05:51:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27298564f8f.20.2026.06.05.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:10 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:09 +0200
Message-ID: <20260605125109.275465-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663872; x=1781268672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZ9WO8sNGmRv2yan8e6TDEhbc0zCDwbHeN+K4WYOHg0=;
 b=fEFxsX7DJR1VnTYSekdwWk4oA0qyEDJKE4nzRYxdvxxbZ9FtJrKg3ViN4V0eIkJUkr
 wSiM/2Dpbd3MlrEoHp2qDKX9ZSHe1ttAbkafgeKBDGeIa1I88UwCD3Lc+p+A2psy11ln
 1TGbOC9f0wUu1fiP19eQPY/BG9zey9fb0RWnO277255f9F3dqTYlx319LBz6DS0KFn8g
 /EGjxMpRXG6qhA62cPglbHh9ZBs2Gzun2IWBfGmJUf+Big5F0xL/9LBrl7TioXUcBPd9
 thT/OEGnOSt+GuwiE/gDyn9WecgXKQXj1waQp4+xwpjmqkBeENzyQpFwutMLgWqVapgY
 1Wug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fEFxsX7D
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
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

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v1 --> v2: add this patch at the base with comments from https://lore.kernel.org/r/<20260227091541.41760-1-thomas.perale@mind.be>
> ---
>  support/scripts/cve-check | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index bcd970bad8..5047523ade 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -12,10 +12,10 @@
>  from collections import defaultdict
>  from pathlib import Path
>  from typing import TypedDict
> +from datetime import datetime, timezone
>  import argparse
>  import sys
>  import json
> -
>  import cve as cvecheck
>  
>  
> @@ -35,6 +35,24 @@ locally.
>  brpath = Path(__file__).parent.parent.parent
>  
>  
> +def datetime_to_rfc3339(dt_string):
> +    """Normalize datetime string to RFC 3339 format with Z suffix.
> +
> +    NVD dates are already in ISO format, just need to add the Z suffix.
> +
> +    Input:  "1999-01-01T05:00:00.000"
> +    Output: "1999-01-01T05:00:00.000Z"
> +    """
> +    dt = datetime.fromisoformat(dt_string.replace('Z', '+00:00'))
> +
> +    if dt.tzinfo is None:
> +        dt = dt.replace(tzinfo=timezone.utc)
> +    else:
> +        dt = dt.astimezone(timezone.utc)
> +
> +    return dt.isoformat().replace('+00:00', 'Z')
> +
> +
>  def cve_api_get_lang_from_list(values, lang="en") -> (str | None):
>      for x in values:
>          if x.get("lang") == lang:
> @@ -134,10 +152,10 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
>              "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
>          },
>          **({
> -            "published": nvd_cve["published"],
> +            "published": datetime_to_rfc3339(nvd_cve["published"]),
>          } if "published" in nvd_cve else {}),
>          **({
> -            "updated": nvd_cve["lastModified"],
> +            "updated": datetime_to_rfc3339(nvd_cve["lastModified"]),
>          } if "lastModified" in nvd_cve else {}),
>          **({
>              "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
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
