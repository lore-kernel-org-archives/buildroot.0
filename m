Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E40D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65EE640E0B;
	Thu, 11 Dec 2025 19:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jf7sY099uYMt; Thu, 11 Dec 2025 19:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC8F40FD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481503;
	bh=uDs+VqeC88YhX5m4lcBAVpT1VhyGW/2Q429vXWvl3J8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NYsq6jp1fvRxp6shwkLKtpD9vtinLGA16kNKyICOeK0xOfx6+o7QHwQSNlVs4Krjs
	 RMbjkcPdCJm3ULqtZQwGpZQV+I64pPBuwU737VG1kpaBZEEydEsTbvTbg+3b383W0c
	 9dCUH5Ea/WXkK34a4moJfMBSRYtlj2tchP1jkOhXqABznmE9lxU/INpF+aefSYxunM
	 gf+z5hGzaFI46Pnc3VwADmRROUPMQla/xnL58LqCy+87lvRb5Xb6rx27u5AeM5Lx1U
	 1qQCH+9OCG+LGRYpjZ0iPXXYlOA8QWfSR98HWZeK3BasfpgxwSTWGaBUI6VxzpAlkg
	 7OswYOT0J5OqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BC8F40FD8;
	Thu, 11 Dec 2025 19:31:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4DA0E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C762D83C71
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cafENW6LfO6f for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF14283C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF14283C92
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF14283C92
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C491FB979EEF; Thu, 11 Dec 2025 20:31:38 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:36 +0100
Message-ID: <20251211193136.1100152-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207092820.109515-2-thomas.perale@mind.be>
References: <20251207092820.109515-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481499; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=XjFumT+2Z8+4/WdxxKCO7Mc00ZJCNKYvxNsaOhmQRxU=;
 b=Wsu/agjd0QLrz+lENqVpVaReEg7zreX8Vb/6/JRuL3rb/PcmAIzizlMn031kK4kfODeuCj
 4bAL1BOYUTBC6D2dQPTAxwPkUneGNBHv9fkdFZMJSrEpciCXe8vBMgd6hnzClTq3Wj+H8i
 6CufWXuHo5T3WABvrcEOrVROQe5dvvUoZgQJyrBFqSsDCMjIG38sMx0/eD5mTIL4Ft1MAJ
 pHWSWBWUAu/sjuTRix8yo2klQheYEOWNPTN3adne39w13E/qB2EnuzL6iR/ZrMF+2skGcg
 YyGa9KkSM1SZdACe+dlsscs4Rj0mArjN63PD7d9HkH8ntkuSqLrIp9SH+qkBBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Wsu/agjd
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/cve-check: don't fail
 with unknown CVE
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
> The NVD database has CVE entries that are not present but may be
> referenced in other security trackers.
> 
> For instance the CVE-2024-12455 is documented in the Debian security
> tracker [1]. However, the NVD page is empty [2] and this entry is not
> present in the NVD database mirror.
> 
> The following command would make the script fail:
> 
> ```
> echo '{
>   "vulnerabilities": [
>     {
>       "id": "CVE-2024-12455"
>     }
>   ]
> }' | support/scripts/cve-check --enrich-only
> ```
> 
> No CVEs present in Buildroot ignored CVEs are affected. But when
> enriching an SBOM with legitimate CVE not present on NVD, the script
> will fail.
> 
> This patch change the behavior to just log to stderr unknown CVEs
> instead of making the script fail.
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2024-12455
> [2] https://nvd.nist.gov/vuln/detail/CVE-2024-12455
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  support/scripts/cve-check | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/cve-check b/support/scripts/cve-check
> index a72547ab38..71f93afe64 100755
> --- a/support/scripts/cve-check
> +++ b/support/scripts/cve-check
> @@ -271,10 +271,13 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
>          if vuln_id is None or not vuln_id.upper().startswith("CVE-"):
>              continue
>  
> -        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln["id"])
> +        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln_id)
>  
> -        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
> +        if cve is None:
> +            print(f"The CVE: '{vuln_id}' doesn't exist on NVD database.", file=sys.stderr)
> +            continue
>  
> +        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
>          vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
>  
>  
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
