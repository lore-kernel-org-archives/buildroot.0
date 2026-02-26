Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF09FD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29E460B49;
	Thu, 26 Feb 2026 15:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmZh5fLEExvR; Thu, 26 Feb 2026 15:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B15DD60B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121066;
	bh=y4a7rnqjcOSAEvmX/HNV8b2jWbwD1oS7bZFx4olPf5A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f4sl+MsBaX8yHiWSPVBQo0J+u801M+U0GQBpqSmAvFSBn6NAXxKpfVIZTJKARoB6w
	 cpiCcr9hNiY5kgqJhyPhOySIM0HQRIHkX0oq10j2d6nX6jr15/oElBBFRInDIp7cPG
	 4dffzrXdVIicGDMMxhoq8cYjKx2eMyfaJSQ1SECAi2bga6sFLUDyjqj30PGK7oZNcj
	 NW6xCeBnpVp8tGPrPyBPA3JFVK26gMuRVF96VyZNE4nZzWh7Fd6t0Kj0kTU69jAEWU
	 DAQWOTbeZ6AqAfhjI4YTJpZnvysGQwiVmLfzVTaGEh9JnUWyT2BIGuycz3Lwr0bEAp
	 vuHMqEJ7G0PPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15DD60B5E;
	Thu, 26 Feb 2026 15:51:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A529B24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB1083DF1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI80NLd5gyl0 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96C9983D0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C9983D0F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96C9983D0F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:51:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so683996f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772121059; x=1772725859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=53QJQJswhM4EWSy8vMjDqSXozvM1wNxWA33u6NcltMc=;
 b=Nn/mCkPo1CkVLxguB5s4SWSSEMCMhrbFww3tdu5tFxFHaDA/cxsi5qlPI2saOnWHSr
 7nVTc6DKW9rA6kvVapM7qkN/QtWmUz8yuKDcKM97R5xKSjpRDh9N1ntHNV6qu22WLikq
 vBKLaqIHAA7X2a6zChcpfdoWNN9sck9rJiCB8OLmYTaNIJRVkBdPwjKrIz05fbKUaNvm
 5fDvAxybWjsyMsdrK+h0ytgvzvFXg3/QIYtNAEFRjUgRaSJLIQ7brVolABGr+432XZFT
 gouE7rL/vAIcEBwW0kCL3X5PRRI280KbfOuzRQH4nNMc1IFheayGCRq2XxjEGY5FWjqY
 Ed1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7McjXHdNeoLbRva6pnjorPcGanwlb/ClYm3XsCHjZwxHIrzPxiXMzKsiJTjfnIktUQcTj58Pe2yI=@buildroot.org
X-Gm-Message-State: AOJu0YzOodSGhL1ePyKDJSEh5dXyW/tqUyHh74JfhXe1t9LNwFVkgS16
 qFGgfiVnHV1jWoSU1+NW91Pr5jNfifnn9TBsuulp/RSOpdhytmT0dSvgj+TYA8ooIcuWDK5bva3
 MC+zt
X-Gm-Gg: ATEYQzy/6uHA+D4xm4GGrHa3ssD4Da/S0E/1m7FAxw8DcQh9WADvvWkYVWvxCUY7uV2
 POpvB/oTpXm3194a5VgRFUpMi0rnyGwvemMZ3WFYRTWjgpFNEh3oxfq5iN0sgWnUPJnlq6zZsjF
 4EbT01hSDNy1Z+FU0ZfWklS8fgpD/Z9601xDwAL2pdR74hVk1ZV0dO151MrzcQAkPqPMtd9fsHR
 qiPxpOKOjmOJu2cqx1N3kQWXmPxtK/QdrKw9styBGsEX6ikCKBHj2B3jBhpaOYyCyKimGnyQQuA
 9mFCTjYunmddwwxU7CfcgjNfouu2hQB6QzVMB0Dd8sWcbUfgwPRGWmUNC5UxzsM5hFvioZpA1TC
 cZt1nysyIZdNqx9I7adekza+OSSwERxH1wj/mlxv2n4D1Rg2SR94zG46nzZUV6jwCXXaCVegFzc
 5hDi7Q+eyg5tALdwERCytMvhahng==
X-Received: by 2002:a05:600c:1381:b0:483:7783:5373 with SMTP id
 5b1f17b1804b1-483c21a5835mr79809015e9.23.1772121058931; 
 Thu, 26 Feb 2026 07:50:58 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb776b0sm40626555e9.1.2026.02.26.07.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 07:50:58 -0800 (PST)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 16:50:58 +0100
Message-ID: <20260226155058.198531-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226142023.1064241-2-martin@strongswan.org>
References: <20260226142023.1064241-2-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772121059; x=1772725859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53QJQJswhM4EWSy8vMjDqSXozvM1wNxWA33u6NcltMc=;
 b=fP2P1Dj9R2s1ZbObEOVSEj155dtkIP+1WNSfOWnGztM/iBG8JpIfpQbRGTkxpErBMj
 VmtXLVS+5Stj4+Eje/O5qWHAz3CHvmM8eeDFjI+9KwXECplkcZ4XcbKb8yl7G1Y0kF58
 L/lE+zClxHzJV3/ha5Ql5vh0yXD/CxNtpmifR0p0LBcVTOhPd4Qd4A5jjuiOwLkGxgUg
 5gd48Z3sOvJm6ZkrxWn52ZQt7ZiXNLRRiJC2PVFvX9UuzZt5PRhi/KKS0fJCJlSTJBr5
 /9X/HkQBgyVxao7riyhIKnZsvMotAwE2x8F88kGr7GaWuc+Lh8B4o/glRgTGJIzSWr0h
 HA/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fP2P1Dj9
Subject: Re: [Buildroot] [PATCH 1/8] utils/generate-cyclonedx: add option to
 control patch diff inclusion in SBOM
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

Hi Martin,

For this use case personally I've used an external script that just strip out
the pedigree [1] that I just plug next to the SBOM output:

make show-info | ./utils/geenrate-cyclonedx | strip-pedigree

Personally I prefer that we have a 'strong' base and then strip out stuff or do
analysis externaly if needed to keep the script as simple as possible but maybe
that's just my opinion ;)

What do you think ?

PERALE Thomas

[1] https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/strip-pedigree

In reply of:
> Including raw patch data can be verbose, and it does not always make sense.
> Patch diff data is optional in CycloneDX, so add an option to control whether
> the diff is included. The patch inclusion mode is modeled as an enum, as future
> changes will add more modes.
> 
> If a patch has no diff and resolves no CVEs, omit it from the SBOM.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  utils/generate-cyclonedx | 71 ++++++++++++++++++++++------------------
>  1 file changed, 40 insertions(+), 31 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2b6c6d63d3cf..25248a0e2d95 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -13,7 +13,9 @@ import bz2
>  import gzip
>  import json
>  import os
> +from enum import Enum
>  from pathlib import Path
> +from typing import Any
>  import urllib.request
>  import subprocess
>  import sys
> @@ -43,6 +45,13 @@ VULN_WITH_PEDIGREE = set()
>  
>  SPDX_LICENSES = []
>  
> +class DiffMode(str, Enum):
> +    INLINE = "inline"
> +    NONE = "none"
> +
> +    def __str__(self) -> str:
> +        return self.value
> +
>  if not SPDX_SCHEMA_PATH.exists():
>      # Download the CycloneDX SPDX schema JSON, and cache it locally
>      cyclonedxpath.mkdir(parents=True, exist_ok=True)
> @@ -197,7 +206,7 @@ def read_patch_file(patch_path: Path) -> str:
>      return content
>  
>  
> -def cyclonedx_patches(patch_list: list[str]):
> +def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
>      """Translate a list of patches from the show-info JSON to a list of
>      patches in CycloneDX format.
>  
> @@ -207,61 +216,58 @@ def cyclonedx_patches(patch_list: list[str]):
>      Returns:
>          dict: Patch information in CycloneDX format.
>      """
> -    patch_contents = []
> -    for patch in patch_list:
> -        patch_path = brpath / patch
> +    patch_contents: list[dict[str, Any]] = []
> +    for path in patch_list:
> +        patch_path = brpath / path
> +        patch: dict[str, Any] = {}
>          if patch_path.exists():
>              try:
>                  content = read_patch_file(patch_path)
>              except Exception:
>                  # If the patch can't be read it won't be added to
>                  # the resulting SBOM.
> -                print(f"Failed to handle patch: {patch}", file=sys.stderr)
> +                print(f"Failed to handle patch: {path}", file=sys.stderr)
>                  continue
>  
>              header = patch_retrieve_header(content)
>  
> -            issue = {}
>              cves = extract_cves_from_header(header)
>              if cves:
>                  VULN_WITH_PEDIGREE.update(cves)
> -                issue = {
> -                    "resolves": [
> -                        {
> -                            "type": "security",
> -                            "name": cve
> -                        } for cve in cves
> -                    ]
> -                }
> +                patch["resolves"] = [
> +                    {
> +                        "type": "security",
> +                        "name": cve
> +                    } for cve in cves
> +                ]
>  
> -            patch_contents.append({
> -                "diff": {
> +            if mode is DiffMode.INLINE:
> +                patch["diff"] = {
>                      "text": {
>                          "content": content
>                      }
> -                },
> -                **issue
> -            })
> +                }
>          else:
>              # If the patch is not a file it's a tarball or diff url passed
>              # through the `<pkg-name>_PATCH` variable.
> -            patch_contents.append({
> -                "diff": {
> -                    "url": patch
> +            if mode is not DiffMode.NONE:
> +                patch["diff"] = {
> +                    "url": path
>                  }
> -            })
>  
> +        if patch:
> +            patch["type"] = "unofficial"
> +            patch_contents.append(patch)
> +
> +    if not patch_contents:
> +        return {}
>      return {
>          "pedigree": {
> -            "patches": [{
> -                "type": "unofficial",
> -                **content
> -            } for content in patch_contents]
> +            "patches": patch_contents
>          },
>      }
>  
> -
> -def cyclonedx_component(name, comp):
> +def cyclonedx_component(name, comp, diff_mode: DiffMode):
>      """Translate a component from the show-info output, to a component entry in CycloneDX format.
>  
>      Args:
> @@ -284,7 +290,7 @@ def cyclonedx_component(name, comp):
>          **({
>              "cpe": comp["cpe-id"],
>          } if "cpe-id" in comp else {}),
> -        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
> +        **cyclonedx_patches(comp.get("patches", []), diff_mode),
>          "properties": [{
>              "name": "BR_TYPE",
>              "value": comp["type"],
> @@ -393,6 +399,8 @@ def main():
>                          default=sys.stdout)
>      parser.add_argument("--virtual", default=False, action='store_true',
>                          help="This option includes virtual packages to the CycloneDX output")
> +    parser.add_argument("--with-diff", type=DiffMode, choices=list(DiffMode), default=DiffMode.INLINE,
> +                        help="Patch diff mode (default:'inline')")
>      parser.add_argument("--project-name", type=str, default="buildroot",
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> @@ -440,7 +448,8 @@ def main():
>              }
>          },
>          "components": [
> -            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
> +            cyclonedx_component(name, comp, args.with_diff)
> +            for name, comp in filtered_show_info_dict.items()
>          ],
>          "dependencies": [
>              cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
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
