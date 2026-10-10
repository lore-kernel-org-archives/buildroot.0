Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2442ACA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC7D60638;
	Sat, 10 Oct 2026 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ouczYREhqmu; Sat, 10 Oct 2026 20:43:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B436B60648
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791665025;
	b=EgURsVbVZC6Ignh46fjLXM+s8i3qEoB7NupLQcpBzPS2Qeqh2I1HYKHSxYZHLaO8fnKd
	 P+h2tAIGKZz4ZvwrqSkwRkfwLkxpMN2MWVfGYM8G0Sb2DXaeLmhbaz4Q34gjhIL4AzVsD
	 /ls2onXocEmc980XhtlnL72Mva6KxiS90oUcHs+HD0Ktm5szuVN9ZMm4c8D4VK80XLZcJ
	 nxwkYMJ9BS0JuBbtkFFk61zFRYnKZurQiqUObxjxPmlvbJe/rMe32QctxO+bZNcgXompZ
	 K5E+6rkkHzImYurKVbC4WSDxXE4Qmcn6D4TGpm6XGyquCGBBpbfEAsiixV23EH5I8Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791665025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=pPIwkECJuFOR+cS0XavyvMifYV6d+9xWWA2xfe3wl6E=;
	b=d0N0it17DC8fqJAfrOA165jU15AjOkCR3y/7CaRKTcU0ADPD6uyrxjoPrnMfNL4KX7id
	 JlhL7mOn6RxLsHPbyzaXasiUuHqKW0JuCBU7VfMc+/bVYwmHu6faMaFDdVu2p6u+Z1XFo
	 NFwXufiCwWb6/0D68VebLJUjME6tQXSvQnYu+4qD0DyLUe9wCCDF/JeOIjd/JWqEdw6of
	 qpzrTV4eohSwvVQG4qbnnzk9rUuvYUlTqdqk9VxmwSacBHrGYvIEZo4jmmw/SD0uSqHvq
	 ibD0LfjfNUZqLeMNjjJPQFTjshKEqEVvqmhdulwd2XwSBhbkqQ3aGFhOrLdSiHUcqDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791665025;
	bh=pPIwkECJuFOR+cS0XavyvMifYV6d+9xWWA2xfe3wl6E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OSXjBPMCbxRumJTgWLEuNUT5ZIxTb6PrH52SI5tPdb2FumbOKBJCk6C0Z0fikN538
	 T5EfL8YvrwEDKAv4rEJl6RjWKVKWlzXb/7heVVzOjji2yz2W90rb6U+/aXQVQ1ydzE
	 oOIXIVhl8QEbHJb+DxA9lMqiklKMwxEIIjTOB9qrJeluOuT2lv/jlCeg8+wg6ziDpG
	 07dKjUAk2WjkE/YULrdA3lyi8bpdUCkQVaigiuJqZQIoq6+6aQ68rgIu57mqVm6w5d
	 pIeSyGxp2abV3OxG/dytUXUMDDl+N2wGDCSnCStu1vdARTfjYvuUOtjU0cjuKqDog6
	 b5mbFARILxpUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B436B60648;
	Sat, 10 Oct 2026 20:43:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7926A156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF2840068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYkzF5OR5wgO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:43:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E8F540004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791665023;
 b=KJSmLMrXbu7ZQW/aT0Xp1ZApaxc8aOtbV+5m4JHGnlJ8vB0SwM6YTD/qY+CjxH/6Wvyc
 VsiESIOiOtHrMCp/vMdZyxBYtBxViuRCJi9xTmDTBqLWl68ZHtdqUmwO2upXhIctHd64m
 Lu4ft7Esz20YVrlb0npkosL/8UujETsFD3sLNHBPSJCTB0G37EEov3Nv6tSwIRVFkMcra
 j1GNe4yG7Jo1addTzsaciB5/d9k9XQjZA9aV3C+vkdZsSLeXQUyd4XR68MTR6vW8k4rKb
 5z5C4ll0utDAYplTdfWtacKDo/FqP5gfdW+zyGCkVo/R0+B1/suGLM03g/FMAJ1iY7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791665023;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=H7i6RUG7a8484tGA+FtlzmJvPvNiy1YIuZ3lyd5eWVk=;
 b=kYCn9eFQNNQ1EZPTVsm5m8HuBbsofo4cuYsyD47tjuaqEn9Udqa5Rks+0A3ImSH44zVk
 6RHRedg8UDYohdpjF2KqdVXs6B0XM1i/iqBc1ei2diggstLprLaswBSiqBYHuwRNpyTSD
 I7aMtOuYL/VymYO+TV6Y8mtnjHRA9ywl2tIIg+KF1TbgXU6hav9j/33AXftlnrJKA0hIV
 Vq3t2fExqCB41gl+yZD/khWHwbPdLvn9Zjj0piOz6G7oWw7qBc263hS8C7DcfB0RB/hn7
 12jPtTP59XNbRbH1ISQyAOrNzhSM5AjSXkbp68Z07hdGM/UrHX7KHY5jLnZu187SpWQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CDO6f0SB; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E8F540004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE0A2B978F6F; Sat, 10 Oct 2026 22:43:39 +0200 (CEST)
Message-ID: <888d878b-2a06-45c9-b162-e8e786aa8025@rnout.be>
Date: Sat, 10 Oct 2026 22:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-8-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260624101340.80670-8-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 8/9] utils/generate-cyclonedx: split
 vulnerabilities per state
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2026 12:13, Thomas Perale via buildroot wrote:
> If a vulnerability is present in multiple components and only one of
> them has a patch that addresses that vulnerability, all components will
> currently have that vulnerability marked as `resolved_with_pedigree`.
> 
> Right now, this issue does not affect any packages, but in the future it
> might affect packages that provide multiple version options (e.g.
> gnupg and gnupg2).
> 
> There is a small chance this happens in a real-world use case, but it
> may occur in the context of maintenance when running
> `make show-info-all`.
> 
> This commit changes how vulnerabilities fixed by a patch are stored.
> Instead of placing all vulnerabilities into a single set, it now keeps an
> index of the component for which the patch has been applied.
> 
> When generating the vulnerability list, the component reference is
> checked instead of only the vulnerability ID. If a vulnerability ID has
> multiple states for different references, multiple vulnerability
> entries are created with distinct analyses.
> 
> Consider the hypothetical case where gnupg ignores a vulnerability
> because it was introduced in a later version, while gnupg2 has patched
> that vulnerability. This would result in the following JSON:
> 
> ```json
> [
>      {
>          "id": "CVE-1234-1234",
>          "analysis": {
>              "state": "in_triage",
>              "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>          },
>          "affects": [
>              {"ref": "gnupg"}
>          ]
>      },
>      {
>          "id": "CVE-1234-1234",
>          "analysis": {
>              "state": "resolved_with_pedigree",
>              "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>          },
>          "affects": [
>              {"ref": "gnupg2"}
>          ]
>      }
> ]
> ```
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 672e7ed815..e12a9a4629 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -14,6 +14,7 @@ import json
>   import os
>   from pathlib import Path
>   from typing import Iterator
> +from collections import defaultdict

  Alphabetic ordering again.

>   import urllib.parse
>   import urllib.request
>   import urllib.error
> @@ -39,7 +40,7 @@ BR2_VERSION_FULL = (
>   # Set of vulnerabilities that were addressed by a patch present in buildroot
>   # tree. This set is used to set the analysis of the ignored CVEs to
>   # 'resolved_with_pedigree'.

  The comment didn't correspond to the code anymore (it's not a set).

> -VULN_WITH_PEDIGREE = set()
> +VULN_WITH_PEDIGREE = defaultdict(set)
>   
>   SPDX_LICENSES = []
>   
> @@ -218,11 +219,12 @@ def read_patch_file(patch_path: Path) -> str:
>           return f.read()
>   
>   
> -def cyclonedx_patches(patch_list: list[str]):
> +def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
>       """Translate a list of patches from the show-info JSON to a list of
>       patches in CycloneDX format.
>   
>       Args:
> +        comp_ref (str): Reference of the component the patches are part of.
>           patch_list (list): Array of patch relative paths for a given component.
>   
>       Returns:
> @@ -245,7 +247,7 @@ def cyclonedx_patches(patch_list: list[str]):
>               issue = {}
>               cves = extract_cves_from_header(header)
>               if cves:
> -                VULN_WITH_PEDIGREE.update(cves)
> +                VULN_WITH_PEDIGREE[comp_ref].update(cves)
>                   issue = {
>                       "resolves": [
>                           {
> @@ -402,7 +404,7 @@ def cyclonedx_component(name, comp):
>               "cpe": comp["cpe-id"],
>           } if "cpe-id" in comp else {}),
>           **cyclonedx_external_refs(comp),
> -        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
> +        **(cyclonedx_patches(name, comp["patches"]) if comp.get("patches") else {}),
>           "properties": [{
>               "name": "BR_TYPE",
>               "value": comp["type"],
> @@ -437,11 +439,14 @@ def cyclonedx_vulnerabilities(show_info_dict):
>       Returns:
>           list: Solved vulnerabilities list in CycloneDX format.
>       """
> -    cves = {}
> +    cves = defaultdict(list)
>   
>       for name, comp in show_info_dict.items():
>           for cve in comp.get('ignore_cves', []):
> -            cves.setdefault(cve, []).append(name)
> +            state = "in_triage"
> +            if cve in VULN_WITH_PEDIGREE.get(name, {}):

  Since VULN_WITH_PEDIGREE is a defaultdict of sets, it makes more sense to use 
an empty set instead of an empty dict as default of the get(). Doesn't make any 
actual difference of course but if we'd ever do type checks this would trigger.


  Regards,
  Arnout

> +                state = "resolved_with_pedigree"
> +            cves[(cve, state)].append(name)
>   
>       return [{
>           "id": cve,
> @@ -450,13 +455,13 @@ def cyclonedx_vulnerabilities(show_info_dict):
>               "url": "https://nvd.nist.gov/vuln/detail/" + cve
>           },
>           "analysis": {
> -            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
> +            "state": state,
>               "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
>           },
>           "affects": [
>               {"ref": bomref} for bomref in components
>           ]
> -    } for cve, components in cves.items()]
> +    } for (cve, state), components in cves.items()]
>   
>   
>   def br2_virtual_is_provided_by(ref, show_info_dict) -> list:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
