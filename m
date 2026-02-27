Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A3FD530D
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 09:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CC1608A8;
	Fri, 27 Feb 2026 09:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0EWQWeQ84FD; Fri, 27 Feb 2026 09:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C81EE608A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772183748;
	bh=gFr5FrmRNS49O5/WY4m2bmprqkC2iJJ/Wz9Ts3skfFw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pL6dYt+xJlUvDHRsk5tYUzizz3AylyN6MZzZo1OeWY5wlpJMXTJDs/1wXUxa3CRPS
	 2gLWi2ta1aFAlbgGoqdOTu0M6DV2mgdfB96z3CpLtffA1KXZLABt006ZbemP52GEJH
	 8QmjMU5J9S/bUyjfJoMbltg93nuA9kRlBl9fXpT7EBat46HjOUaWV/AAk9zg1JhX2G
	 ZRm6eHPqTBA/6xMgfTUTnlPKfyQeiji7bA3GpEoRHbvkfAQH0H9Pmf3oim3Ukj61pl
	 0LS/3ZkSjPZX9cNidpXhbQpGLEH0wH8QXQqCfCCncxkkAWz8Ir0Q4D2U12mv2X08Xe
	 dkNyfZ/v6LEnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81EE608A1;
	Fri, 27 Feb 2026 09:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 606F7131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 09:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45DA240467
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 09:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IMamcjU7IMB for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 09:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2897A40459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2897A40459
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2897A40459
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 09:15:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso11931115e9.0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 01:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772183743; x=1772788543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kssliaglys8iocHUeOShPxpX03SiMZr5sYNlmC3XRhI=;
 b=uDk8YO+1iObSnqZlis4FEoNEHqODBSJcxx1/qJWPb1e2RZ7Fxf0YwOh4WdfkTuKx8p
 7WwSXdP0nZIgccwz4w6eDO37hvnGpdhDqxpGGCWDctYZ40si85QzFSEZH6mkB+PeaFJy
 amP0wA7efaYx+EPKyXerKrR13JEv1VspU24qKXAgMHIw/NmW3R3lMCuTElNpe1eh2DCi
 BUAL5/Jxvyb3UWFnRdrG2f2kX31KPtKVs6g5vtfxmM09sVZJ77mdRIOWJNwzgc+VEAuW
 OwD4Q4GFYn71X4dpWx9gDJ+HNaG12tmu1ETdsXnrNXWRwByn6tnwFXvLUUEhhend2IrH
 /mmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBvvln/i9Trz+4RUQDUdqEbSzvcuGmQId6y0Hfqd/1W5b/JxWKfwCLqs+je87/oOL6X0nRLCzp5ms=@buildroot.org
X-Gm-Message-State: AOJu0YyAGgMEkR/XbHAy7UewPJdpESJcxrQdpkJUyjKW8cTAP4uQxAvg
 Q2LqtkAwQTasirFzyeliV2DDBSlh/ODNRAG9rWpgliSd1IasYSjpmUF5b1x3O1xxhryxlY/gFhj
 N2hp+
X-Gm-Gg: ATEYQzwo8/iIgOlelVmImFyy4xLDF1kguN/x91xXz3BCI3x44Rcs2oOmNPlOeIB7W3A
 u6X5yCHV4cdqE5rSSsh83jc3E9QSJ1cBaRY/YES1iboasDs4ibQtDhIJYhT/Jl2K2oFsrKSdd0r
 8iO7J4wEzlxv5NxObSaXqEOFJUi+7du+Z4kP6dRxMtOK0CVR56XveF6aNiryGJCqNTAuI5jIzis
 aMMSKlVJ+9l4p9j9j2eRK8rNh+4tZiGUt9JzPgj2yMpsm8VJP8nl8aq6VJYMAe+e+Oo7sP/BAi0
 gx/IlvoFU0p5xXmEHNJo7eotUyMx/aRDHJK2XbiltXxrr0YDTui7afiZzaUwIbICY5mC7IHJck3
 p3f3IHco+auWERLudhXCrOg9LfGE3UEgeR0D1AVL22CxheSBnr9dtJswX8kiCD4BqpA20sXaOY5
 h8UnyiEpzhUldXgJc=
X-Received: by 2002:a05:600c:2249:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-483c33f33d2mr66488785e9.18.1772183742133; 
 Fri, 27 Feb 2026 01:15:42 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7030b9sm163531085e9.4.2026.02.27.01.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 01:15:41 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Feb 2026 10:15:41 +0100
Message-ID: <20260227091541.41760-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224145622.1789367-1-fabien.lehoussel@smile.fr>
References: <20260224145622.1789367-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772183743; x=1772788543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kssliaglys8iocHUeOShPxpX03SiMZr5sYNlmC3XRhI=;
 b=cDp+EMMcElYOA3pRpGP7WumXzBe0Mnzj3dMAlCxrkZ/VHxLGtXFyfe5AeeL/R7fBJv
 65I8MZVKC9pxOUbh3TJ9Pt/hLdIQ/RTOWa1XZWONK85PsHyIQPa/D+mRrFT7B6QV1XXK
 AaJd83ZAB9uGutSW2xrCEsH8ZA9kT+ECfyjSAoiHd1w6b4zYAeGVE1TZUTnoL6S8HMiT
 mUprlwC5DsnEc8apLtKKxwzh/QudbShhWN572MIP2ozelICQtRDEoLCVhmJw7kPb1+C5
 AGb16YSPiuBdUIpOrSnEcSY+qDzddkvDNhC4QF41kUVFUpQnvuD0vVQjeMZaHiygfQwU
 uZMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cDp+EMMc
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/cve-check: Fix
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

Hi Fabien,

Good catch, thanks for taking the time looking at this.

I have some comments:

In reply of:
> Normalize vulnerability timestamps to RFC 3339 format with explicit UTC
> timezone suffix for CycloneDX 1.6 compliance.
> This fixes validation errors in sbom-utility and makes the generated
> SBOM with vulnerabilities compatible with DependencyTrack VEX parsers.

I took a look at the spec and if I'm not mistaking I didn't found reference
RFC3339 in the CDX Spec. It looks like this come from the JSON Schema
`date-time` data type that the CDX Spec use
https://json-schema.org/understanding-json-schema/reference/type#dates-and-times
https://datatracker.ietf.org/doc/html/rfc3339#section-5.6

I would include this information in the commit message and the docstring.

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
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

> ---
>  support/scripts/cve-check | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index ff14e4b238..932c67bd12 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -15,6 +15,7 @@ from typing import TypedDict
>  import argparse
>  import sys
>  import json
> +import datetime

This import ended up not being used in your implementation.

>  
>  import cve as cvecheck
>  
> @@ -118,6 +119,25 @@ def nvd_cve_references_to_cdx(references):
>      return advisories
>  
>  
> +def nvd_datetime_to_rfc3339(dt_string):
> +    """
> +    Normalize datetime string to RFC 3339 format with Z suffix.
> +    NVD dates are already in ISO format, just need to add the Z suffix.
> +    
> +    Input:  "1999-01-01T05:00:00.000"
> +    Output: "1999-01-01T05:00:00.000Z"
> +    """

I would include the reference to the JSON Schema spec.

https://json-schema.org/understanding-json-schema/reference/type#dates-and-times
https://datatracker.ietf.org/doc/html/rfc3339#section-5.6

> +    if not dt_string:
> +        return None
> +    
> +    # If already has Z or timezone offset, return as is
> +    if dt_string.endswith('Z') or '+' in dt_string or dt_string.endswith('-00:00'):
> +        return dt_string
> +    
> +    # Otherwise just append Z
> +    return dt_string + 'Z'
> +
> +

I propose a more generic implementation with python datetime utils so we can
cover any edge case that we might not know of yet and normalize the output data.
As your other series uses the CVEList db which has another format for date this
might be useful.

https://docs.python.org/3/library/datetime.html#datetime.date.fromisoformat

```python
from datetime import datetime, timezone

def datetime_to_rfc3339(dt_string):
    dt = datetime.fromisoformat(dt_string.replace('Z', '+00:00'))
    
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    else:
        dt = dt.astimezone(timezone.utc)
        
    return dt.isoformat().replace('+00:00', 'Z')

if __name__ == "__main__":
    print(datetime_to_rfc3339("2010-10-20T00:00:00.000Z"))
    print(datetime_to_rfc3339("2025-08-02T12:15:28.050"))
    print(datetime_to_rfc3339("2025-08-02T12:15:28+02:00"))
    print(datetime_to_rfc3339("1999-01-01T05:00:00.000"))
```

But maybe this is overkill ?

>  def nvd_cve_to_cdx_vulnerability(nvd_cve):
>      """
>      Turns the CVE object fetched from the NVD API into a CycloneDX
> @@ -134,10 +154,10 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
>              "url": "https://nvd.nist.gov/"
>          },
>          **({
> -            "published": nvd_cve["published"],
> +            "published": nvd_datetime_to_rfc3339(nvd_cve["published"]),
>          } if "published" in nvd_cve else {}),
>          **({
> -            "updated": nvd_cve["lastModified"],
> +            "updated": nvd_datetime_to_rfc3339(nvd_cve["lastModified"]),
>          } if "lastModified" in nvd_cve else {}),
>          **({
>              "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
