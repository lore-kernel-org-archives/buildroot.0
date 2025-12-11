Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B797CD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3CB80D84;
	Thu, 11 Dec 2025 19:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHibQ_IpMYNS; Thu, 11 Dec 2025 19:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6BB81D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481506;
	bh=HraAwOLX/9GSDn6YqdDC/MrSr3CV5odAdzInGz33P+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hM//WxrpFAh2CHQQsh70P0RG2Cr47hAIsf7xxOB+sBo4hmsP8ku2MaqeBQVIjfftN
	 XUVxIZkQMATcElCDe3V5hEgJM8dc84vlG8sKfiaK9xqknUqOeZsPQJnKZGk+M+GvP6
	 ZVJwnc1DcehdlGG43HLds5jkO9t0Jw4NayQJinHM3b/BQNwanlw2cQ8CQOFZ4Au2an
	 3d5RXnIWlLG6z33LvOSuBksPogtMyQLCaFNatpNlWM5irX9vlAD+EM+TRvqawj4M98
	 Iwql/fJrFLHkMnaqafMz6mnI1ydBsuaMRGpgu96UpB1/WlroLEV1IKKmSRgHM2+Won
	 yMXO5mAvm/2jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6BB81D0B;
	Thu, 11 Dec 2025 19:31:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E680AE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD81983455
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igrnfLT9EKLj for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 923E980D84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923E980D84
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 923E980D84
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B917AB979EEF; Thu, 11 Dec 2025 20:31:41 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:39 +0100
Message-ID: <20251211193139.1100211-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207092820.109515-1-thomas.perale@mind.be>
References: <20251207092820.109515-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481501; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=KINQCpdz6MwsBqbmzR6Ck7XRrBgw04RLYHblL2iprFc=;
 b=R/IkwPfqceyfGldyZjCWeh83RYmiG3avet64aBuY54yk8nzcWpp05LPCr3+oiBlk3iZhS1
 /sKvHL6Bn4uVP6osBXrBFT0lxezm3SmD/cgk6apMsmA3PRLYibg56flRI9vmfIFU0OCusv
 VPjg24j20pRIf3XHXjlxicOJwne7RbUmNg+a0+nfNg9Snhf2CoPi+iDaQaUcsv4kXIJhNT
 bdrhqJ/kDAAJoWDqeC/6ouiWzfejFweaZZzyS7FUvlSdABTwnCEX1aGQq1uaVei/DUkyx3
 z8aYh7LGLB1N+pG8uhkP7YmmaGd8FAs8z18zdyjxbakrM2bHySRyPXJQZqvu2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=R/IkwPfq
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/cve-check: fix typos
 and grammar
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
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  support/scripts/cve-check | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index 6442b2e72c..a72547ab38 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -4,7 +4,7 @@
>  # Enriches the input CycloneDX SBOM with vulnerability information from the NVD
>  # database.
>  #
> -# The nvd database is cloned using a mirror of it and the content is compared
> +# The NVD database is cloned using a mirror of it and the content is compared
>  # locally.
>  #
>  # Example usage:
> @@ -121,7 +121,7 @@ def nvd_cve_references_to_cdx(references):
>  def nvd_cve_to_cdx_vulnerability(nvd_cve):
>      """
>      Turns the CVE object fetched from the NVD API into a CycloneDX
> -    vulnerability that fit the spec (see [1]).
> +    vulnerability that fits the spec (see [1]).
>  
>      [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
>      """
> @@ -153,19 +153,19 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
>      return vulnerability
>  
>  
> -def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
> +def vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability):
>      """
>      Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
> -    if an entry with the same 'id' don't exist yet.
> -    If an entry already exist the input reference is added to the 'affects'
> -    list of the existing vulnerability.
> +    if an entry with the same 'id' doesn't exist yet.
> +    If the vulnerability already exists, the input reference is added to the
> +    'affects' list of the existing entry.
>  
>      Args:
>          vulnerabilities (list): The vulnerabilities array reference retrieved
>              from the input CycloneDX SBOM
>          vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
>      """
> -    # Search if a vulnerability with the same identifier already exist in the
> +    # Search if a vulnerability with the same identifier already exists in the
>      # SBOM vulnerability list.
>      matching_vuln = next(
>          (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
> @@ -173,6 +173,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
>      )
>  
>      # bom-ref to the component is passed to the affects of the vulnerability
> +    # passed as argument
>      bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
>  
>      if matching_vuln is not None:
> @@ -181,7 +182,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
>              del vulnerability["affects"]
>  
>          if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
> -            # We don't update vulnerability that already have an
> +            # We don't update vulnerabilities that already have an
>              # 'analysis'.
>              # Buildroot ignored vulnerabilities will already have
>              # an analysis and need to remain as such.
> @@ -228,13 +229,13 @@ def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Op
>                  "ref": comp["bom-ref"]
>              }]
>  
> -            vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
> +            vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
>  
>  
>  def check_package_cves(nvd_path: Path, sbom, opt: Options):
>      """
> -    Iterate over every entries of the NDV API mirror. Each vulnerability is
> -    compared to the set of component passed as argument in the 'sbom'.
> +    Iterate over every entry of the NVD API mirror. Each vulnerability is
> +    compared to the set of components passed as argument in the 'sbom'.
>      The vulnerabilities set of that 'sbom' argument is enriched with analysis
>      of vulnerabilities that match that set of components.
>  
> @@ -257,7 +258,7 @@ def check_package_cves(nvd_path: Path, sbom, opt: Options):
>  def enrich_vulnerabilities(nvd_path: Path, sbom):
>      """
>      Iterate over the vulnerabilities present in the 'sbom' passed as arguments
> -    and enrich the vulnerability with content from the NDV API mirror.
> +    and enrich the vulnerability with content from the NVD API mirror.
>  
>      Args:
>          nvd_path (Path): Path of the mirror of the NVD API.
> @@ -274,7 +275,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
>  
>          vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
>  
> -        vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
> +        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
>  
>  
>  def main():
> @@ -288,8 +289,8 @@ def main():
>                          help='Path to the local NVD database',
>                          type=lambda p: Path(p).expanduser().resolve())
>      parser.add_argument("--enrich-only", default=False, action='store_true',
> -                        help="Only update metadata to the vulnerability currently present " +
> -                        "on the input CycloneDX SBOM. Don't do an analysis.")
> +                        help="Only update metadata for the vulnerabilities currently present " +
> +                        "in the input CycloneDX SBOM. Don't do an analysis.")
>      parser.add_argument("--include-resolved", default=False, action='store_true',
>                          help="Add vulnerabilities already 'resolved' that don't affect a " +
>                          "component to the output CycloneDX vulnerabilities analysis.")
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
