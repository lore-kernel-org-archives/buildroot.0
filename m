Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94189CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2CC6131C;
	Fri,  5 Jun 2026 12:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOPkPJ7vedBg; Fri,  5 Jun 2026 12:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 507B461325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663876;
	bh=AQYPWVuHqrBbTXwWsrZiV9gGoBp47qlgPqFmvtflDpU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jJaJomt8bSSXU3dC5g0VbAeheUAdGSm9fn95rCR873MqtQpAQe2yKlTTW8QdxV/PH
	 YpHfM+bc58CFZDqzAquJyDCHoeNLkKzkqnCCtc5cB8jgKkgoXyuR/pj09cKMwW5aZY
	 ceLfxAe2EIaOgQANehi109VkrSRGGrI7i8zQK7L27Ck7dQVWVWbE5Egf+g0VirayBr
	 3bezBQM/UWP88HiIK3b1OYiv9obyyAq8tr/nYGOxrfwQRvOfZyQVYW1RvcpySWDZ8W
	 tj2eH5HBcFX0bXmKCLs582nYBAHecR6N652N9jdW5OhvwaWnXT9yQ7hHjefZyFRgHe
	 G6exTgWSaTeRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 507B461325;
	Fri,  5 Jun 2026 12:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE07F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 023CA60E68
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwUSx6hlBbiM for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBE9A61318
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE9A61318
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBE9A61318
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso1387699f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663870; x=1781268670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dMI8ZhK3pkKWTwEgiJ8AGTJHmQR/DRek0fefuARXvK0=;
 b=XeDYRxFhcSo7OMuiZ8mrjYQzuXK5oPU8U3iUvsnzDZ9DxgAGvqv8vhTbTQbUpLlp5Y
 fblBGWvt3GOUoyHLwrgSZ2PADY9ELyOAZexpJxd7t4YmjvOcd0cHUNcOzBhPvPU2CQBA
 GbqyBNx+fqQ5cIDPAVuQbirwYuaLIR9AA3DcjUulsPVDP06YaaS70MUX2zTYc4WfoQ+z
 CrXU8FyG09q/8xQ70iXhuM2DzknRhuRDc2q8Lczw0zJvqhddHdqye90g5oE/TYmyUtig
 SLzbTUdHbAeHTdEC2DU0Wl9O22k4LIAqJt9/hNekn7txQZ9Wc88lbwzVYASVI0VVpo+n
 tBSw==
X-Gm-Message-State: AOJu0Yz5BNEnNi/YI5qqHi/3mJsyFkMHl9dF2644JjKuyDbBNU3tWdKY
 xB+j8WLhiL8GTkb29nvGGo/4HlpAoZYLZOwjgHxtk6JFAliccmEB9r8n0NKDE4+3YgMdDuGL9Hm
 F51jF
X-Gm-Gg: Acq92OGg6wloaBGn5HIFxGgkzCvQr/Rn4q6H7fCyVK9GVOSMomZKGV8mePowmnE0G/c
 x7XSFGM1T0ByFs4QzoZDYAy0rl7/aMUp4Z20arE0VrDHBEeyYBk4Ds6uquzF3cDN36JxZVzmQoA
 ugJxgzHQBlryd9McaBat22CHEXylJaXVAMPijlwtuf382fJv9Ax9TIa3fCwY4GPiIB2CR7vz5NY
 KIXsfmgi/h29bj9sNhyAxLrAeU/UkvBwpypCKjVw7w5QVeNqXnv7Px9yLBG7v29gefw1a2NUzxE
 wznAJwq6WljQhkOAzod/NtMobWbRZCNyZ0cgZK6TYlzMcdR8wgUPzvVmMUzvxTY/sb0/O4A8gnJ
 HYKo2X0cBs5UjYwghVFNVPLnru0v8CUrids3UOYaW6tRY2BZwzVmbjrlUfbHhkZZJafZW1w3kcq
 aeNG2XQ0yAijebhsi2y6C7RTO2oA==
X-Received: by 2002:a5d:4ec7:0:b0:45e:ed7e:f900 with SMTP id
 ffacd0b85a97d-460304ee4bemr4465116f8f.6.1780663869719; 
 Fri, 05 Jun 2026 05:51:09 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm25726398f8f.0.2026.06.05.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:09 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:08 +0200
Message-ID: <20260605125108.275416-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-4-thomas.perale@mind.be>
References: <20260529150631.447940-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663870; x=1781268670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMI8ZhK3pkKWTwEgiJ8AGTJHmQR/DRek0fefuARXvK0=;
 b=RHGY3RdqQkY1W9M9a4aDpEUjGMduClKP0y5kIXx2bU7WrewsUOx/RFRzNrwQYZdyKP
 TgUdWlXGilZKXOtxMdu+usIXx/lSv6iWuXvxO2PXlZNjpEHrgjv00e33hA12Zy4W12JO
 lXvJaZPa3myOoi87N7DRHRGtv04AnlB/H352sNmrSVW7aF0vMxYLPk6KxEx6eAmtVVy8
 ivR1w2vDHl6SzgnxRFnO2GwfKjk9RGDFu7+cAFNO+L4nNRSuhp4uP6t19MFSdnTabQR8
 VNPXiiFEy6w7OUCdBEuCEntm+ORalgIhGdPpAT5IrEf81XZ/+5oyPGd+SQgs3DiONHRN
 Ka2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RHGY3Rdq
Subject: Re: [Buildroot] [PATCH v2 4/5] support/scripts/cve-check: fix
 vulnerabilities with different analysis
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
> Before this commit, only one entry per vulnerability ID was added to the
> output. In CycloneDX, if you need to provide different analyses for
> different affected components with the same vulnerability ID, you must
> create multiple entries with the same ID.
> 
> When running `cve-check` with the `--include-resolved` argument, the
> analysis of some vulnerabilities would get overwritten, which led to
> undefined analysis results.
> 
> This is especially true when running the analysis on multiple components
> with the same name but different versions. For instance, if the input
> SBOM includes both the `gnupg` and `gnupg2` packages, CVE-2025-68973
> could be included. This CVE might be exploitable for the `gnupg` package
> but resolved for `gnupg2`. Therefore, a single analysis entry cannot
> cover both cases.
> 
> This commit fixes the logic for adding vulnerabilities to the output
> SBOM. A vulnerability is now added as a new entry if:
> 
> 1. A vulnerability with the same ID doesn't exist yet.
> 2. The affect of the new vulnerability is not the same as the one
>    already present.
> 
> For the CVE-2025-68973 example this would result in the following
> output:
> 
> ```json
> [
>     {
>         "id": "CVE-2025-68973",
>         "analysis": {
>             "state": "exploitable"
>         }
>         "affects": [
>             {"ref": "gnupg"}
>         ]
>     },
>     {
>         "id": "CVE-2025-68973",
>         "analysis": {
>             "state": "resolved"
>         }
>         "affects": [
>             {"ref": "gnupg2"}
>         ]
>     }
> ]
> ```
> 
> 45 vulnerabilities were concerned by this bug over the Buildroot tree.
> 
> Co-Authored-By: Tim Soubry <tim.soubry@mind.be>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/cve-check | 76 +++++++++++++++++++--------------------
>  1 file changed, 37 insertions(+), 39 deletions(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index 881d9c03c0..9aafa5fcdf 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -175,55 +175,54 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
>  
>  def vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability):
>      """
> -    Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
> -    if an entry with the same 'id' doesn't exist yet.
> -    If the vulnerability already exists, the input reference is added to the
> -    'affects' list of the existing entry.
> +    Updates a matching 'vulnerability' from the 'vulnerabilities' list or
> +    appends it as a new entry.
> +
> +    A vulnerability is considered 'matching' if it shares the same 'id' AND
> +    either:
> +
> +    1. An identical 'affects' entry.
> +    2. An identical 'analysis.state'.
>  
>      Args:
>          vulnerabilities (list): The vulnerabilities array reference retrieved
>              from the input CycloneDX SBOM
>          vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
>      """
> -    # Search if a vulnerability with the same identifier already exists in the
> -    # SBOM vulnerability list.
> -    matching_vuln = next(
> -        (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
> -        None
> -    )
> +    new_analysis = vulnerability.get("analysis", {}).get("state")
> +    new_ref = next((a.get("ref") for a in vulnerability.get("affects", [])), None)
>  
> -    # bom-ref to the component is passed to the affects of the vulnerability
> -    # passed as argument
> -    bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
> +    # All vulnerabilities with same ID
> +    matching_vulns = [v for v in vulnerabilities if v.get("id") == vulnerability.get("id")]
>  
> -    if matching_vuln is not None:
> -        # Remove the affect to not use it while updating matching vuln.
> -        if "affects" in vulnerability:
> -            del vulnerability["affects"]
> +    for curr_vuln in matching_vulns:
> +        curr_vuln_analysis = curr_vuln.get("analysis", {}).get("state")
> +        curr_vuln_refs = [a.get("ref") for a in curr_vuln.get("affects", [])]
>  
> -        if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
> -            # We don't update vulnerabilities that already have an
> -            # 'analysis'.
> -            # Buildroot ignored vulnerabilities will already have
> -            # an analysis and need to remain as such.
> -            del vulnerability["analysis"]
> +        is_same_ref = new_ref in curr_vuln_refs
> +        is_same_analysis = curr_vuln_analysis == new_analysis
>  
> -        affects = matching_vuln.setdefault("affects", [])
> +        if not (is_same_ref or is_same_analysis):
> +            continue
>  
> -        if bom_ref is not None:
> -            ref = next((a["ref"] for a in affects if a["ref"] == bom_ref), None)
> -            if ref is None:
> -                # Add a 'ref' (bom reference) to the component if not
> -                # already present in the 'affects' list.
> -                affects.append({
> -                    "ref": bom_ref
> -                })
> +        if is_same_ref:
> +            # If same vulnerability id and same affect ref, keep the previous
> +            # analysis. This is the case where a vulnerability was ignored from
> +            # the generated SBOM.
> +            del vulnerability["analysis"]
> +            del vulnerability["affects"]
> +        else:
> +            # The same analysis, add a new affect
> +            # reference.
> +            if new_ref is not None:
> +                curr_vuln.setdefault("affects", []).append({"ref": new_ref})
> +                del vulnerability["affects"]
>  
> -        # Update the metadata of the vulnerability with the one
> -        # downloaded from the database.
> -        matching_vuln.update(vulnerability)
> -    else:
> -        vulnerabilities.append(vulnerability)
> +        curr_vuln.update(vulnerability)
> +        return
> +
> +    # No same ID w/ same analysis or same ref.
> +    vulnerabilities.append(vulnerability)
>  
>  
>  def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Options):
> @@ -297,8 +296,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
>              print(f"Warning: '{vuln_id}' doesn't exist in NVD database.", file=sys.stderr)
>              continue
>  
> -        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
> -        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
> +        vuln.update(nvd_cve_to_cdx_vulnerability(cve.nvd_cve))
>  
>  
>  def main():
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
