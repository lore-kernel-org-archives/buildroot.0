Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7714ACC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4573181586;
	Fri, 16 Oct 2026 15:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_ImlsWB9x_Q; Fri, 16 Oct 2026 15:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1818D815CC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162983;
	b=H53VDu4ZH73HmmTPx7iLbK1JlmwbzmX2s27RiXDavGY6HwAMAUyTK0gzNoZcBLMwR93j
	 SKuCliI5CUzl/cxvn4i+QEYqdtK9HwkujbrG2KbUdDmgY+W4tWJCsF0aC2RFY8D/5qIOc
	 AmMzPM6iLqmYCYI5y31+PMWNCmGpaeAD3LAs9GMcjHGmMQx4SGRCAj+qcKErcxzEsPUtx
	 CEVOXDIr7cU9Snw6wRblFdyWYO89fJYOl1u2xnunLmsxEfGeDX0mIUxnY/PlcuRUgClrG
	 gbyqcDivZyP3z9C3YOzIJDz0kk7kUmSw32R5e4/Vhh9HciKG2bsTl/SYVKMbkJQ5yeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PLyzMeAbVwdDURkjNZ9T6yxz1hblG4cm/xlGg1Y7rQY=;
	b=PAsUxVvpIU1hGl3VUOsqhAK4k9Xw8Oy25EJyyP7RTSxDIaqhhQVhMHYwvVfVDa+VX5T+
	 cduiLn0GWwMpo3KhNdRTw3/NJGG2+I4YB4XOcdpX3/3oujFZTEYb0bPF4B98tyErIqWQp
	 eFyOFjykpfp8HPesnm0H7d7wAqneC6Ib/Twsmawxln2jvYqj/d9KPEBhnv71XxERAXZQ+
	 /blzeEZc7zFwBhhYrlRKrWS32AxkJ7l7bHNZ3b5u8Ge1xSu/1FN9jwAIOYOQ2pk73xE0N
	 XOHjQ4QqsAxDHWFk72f4z7xydtmjVVo6L1T1PiH9YlSypoEJVfEzfGvnF+RiiVA70zg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162983;
	bh=PLyzMeAbVwdDURkjNZ9T6yxz1hblG4cm/xlGg1Y7rQY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fyUm44uI/JhrUzQiRRcBz15gMhlYsDEzdUp/1B4ZjryTOWW10Pq3gsAVm6qj6ZmG/
	 9cFh5Yide4XPEI84u1qhGx3B2E3jI0GhgBoqy+RMEldGfXgrbr8PIzCFjAEIt2LDg8
	 eOtZdyYILG/bFIB/1vgAUxpSw4OSLZAxWrohJYRclzfORmWdqbsrnSM+y5FEgphNRG
	 L/Ve4oGr/ZBtiiLEv6VHYMkPSy1UzG/19B/9lDgk6CzXeQAF86OguXbUrernd3Zo9O
	 xXa1gmtLByDKeD86dfZNT4cOSPa08fYZ4RJxpc7LggqylourBNJDTVS5kC1qgFRDcD
	 8+Z6x0RjoJ1og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1818D815CC;
	Fri, 16 Oct 2026 15:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E29255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16076815C1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5r4U4K6aNIN for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC30081584
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162979;
 b=TYh6+BLzp0Ylmdv83/noXdYeyU5IJFeuv+eP7avEsIuUCkiedFwpFLqOMZtT7tMCR3LM
 TkBjqV3I4PjMD4PRcm5glk/03nQSZ2lRqEC9/28gRYEH/uq1ybut68F7K6VkLhjt/c5Oo
 th+jnrTCp43WWcSgnUZb6rHOyr8lzB7OazvgnoUjrxUHVuwKejQxXR+J0q9AJGadwCbKW
 gQlIl2FgYGUjFziAijjn5b//gYvfSlSdnop3GapzQD/qV0ISL11k7By/t+/T2d4cg6SPi
 gTYpIhP/CjCh3tlENxicsP8PHXn/dwonzTBa9fIsBMbZVQ9QxwzN3i/q/cgC/PiFtlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162979;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=h4m0lA8mcS/GLvbNJj8NO6WDWxyuMcdDXkfcDO1nrq4=;
 b=F3BUF+Z++DH4Int2zEDK+pq4aPmY+kfCR44v/40/SqfaXv9pUJ0QXZyEgyRc/VNFQMpw
 PkXbiYl8EMiZwssWbnkg4G5FCmuVlHiYTV70quTjFW2/ItldiVRwepF4cr4Oy2ii9I8Ny
 /n/syJ3zPgob6p7geUK32WEziY4SUytP9Y5bzG3TmRBSkHCgKgZieC0zsTu90YkWTGors
 t1I7sGF+VNwF45/+4hhrtaDH7RNua+2qy6yRgVQyk+3dserTBnVNrFkl23ug4oidaLGw6
 Bu0a+mb6P5O85SyBEs6vrgWWtk85Lrmz1sIVNvBs8bWfwwc7a0WxizE0YFuQF1vo2qA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J3PO77UF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC30081584
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso557705e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162977; x=1792767777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h4m0lA8mcS/GLvbNJj8NO6WDWxyuMcdDXkfcDO1nrq4=;
 b=bylAeaSfhIulATMKZTitDhFe3x3gGirerdDUzp5WBVZ815TUyoNyfgd70tvyjlQc5w
 zFJ4/lwUfymPeXupAne67Za3Hcjj/eJ76idH0UPnYmDLWfrri6zMUOSeHB/45WTw9NaX
 ip9+wnJL58okjB/uXJRf4vB7htHNm7PqmKrODnMbLLa4itsMPiL68K/tjNpCeUcDB5d0
 /poeHMgq/qnKTfhh1rGABdvnHhOhRCOmO1LZTBBfnrR/A9EwAKnB0qteShe33YpN+NqD
 1/oFHmI/HySWfeAie7w69pGpBVGS722YKmMgfTPl988gd+zsUtEYZK7j5zKi+eDoycMo
 ewRQ==
X-Gm-Message-State: AFq9FYLVoVGbwmI7hREl+7Yx9DbiottNn+9RGIvmIPCGgKBXULDN+x6T
 xZzUqaDXWHbtvhEC1GRVeUKPQSCJhzOSU2j9m0kavTLeMJJ8ZRMAdwR9Iqeq7GWlY0rzVjXQ4+d
 zXJtudu4=
X-Gm-Gg: AYBFou33YLKifJ6NwJTpuPTfrOOwrjX7/7qm6HZDINYnXwsXgE46Qunct/hIvYKnpsT
 PYHTDfHksRXKa+fKwDT/QN9nuifG6u56GM9/7wGdrlmWUqiuD+OWo10WboHoIOvMiE/+bLEZ1LV
 +bNeU/BAKxevXCmptWYK32zaSKdkAE8hM0QwsR4x+QE/fHkNSic3u/slO0sAGpjBtM7OTSpyOTk
 tnNVCHbCImxXanjojCGCvQLoWy80NUr92grgux8YS+IUd2pUUkXQcauSYSdyix/uoK+K1mCZ2F4
 KJLM/ycWEsl+HRabl7U/2+UbypMvsER7JWvUzKlSGQ+UhsT4XmxQgHXmpLBPNJa8oJH9gejsAqd
 XnaHzEx1CjK8umCB9Ebww21jY3glHp+eKONjFZeGd51JZ89lP0ta+xS3ppvcC3LDFtfhMbXsyeb
 BskbCZENjnrhaJunM8jCD+ytsdv+MyDDlyGB3WkH0vQZXcT08yA/LeaO66YZDNVNWR9qWY8mVvD
 TtDhLl8oz4eoWzGgu0yVBHfcHqLgqS6gipsJgad6w==
X-Received: by 2002:a05:600c:6296:b0:4a1:7ecc:b23c with SMTP id
 5b1f17b1804b1-4a1d75e6feemr1637395e9.6.1792162976258; 
 Fri, 16 Oct 2026 08:02:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8abfae7sm27558985e9.0.2026.10.16.08.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:55 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:52 +0200
Message-ID: <20261016150253.60776-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-8-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
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
>     {
>         "id": "CVE-1234-1234",
>         "analysis": {
>             "state": "in_triage",
>             "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>         },
>         "affects": [
>             {"ref": "gnupg"}
>         ]
>     },
>     {
>         "id": "CVE-1234-1234",
>         "analysis": {
>             "state": "resolved_with_pedigree",
>             "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
>         },
>         "affects": [
>             {"ref": "gnupg2"}
>         ]
>     }
> ]
> ```
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 672e7ed815..e12a9a4629 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -14,6 +14,7 @@ import json
>  import os
>  from pathlib import Path
>  from typing import Iterator
> +from collections import defaultdict
>  import urllib.parse
>  import urllib.request
>  import urllib.error
> @@ -39,7 +40,7 @@ BR2_VERSION_FULL = (
>  # Set of vulnerabilities that were addressed by a patch present in buildroot
>  # tree. This set is used to set the analysis of the ignored CVEs to
>  # 'resolved_with_pedigree'.
> -VULN_WITH_PEDIGREE = set()
> +VULN_WITH_PEDIGREE = defaultdict(set)
>  
>  SPDX_LICENSES = []
>  
> @@ -218,11 +219,12 @@ def read_patch_file(patch_path: Path) -> str:
>          return f.read()
>  
>  
> -def cyclonedx_patches(patch_list: list[str]):
> +def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
>      """Translate a list of patches from the show-info JSON to a list of
>      patches in CycloneDX format.
>  
>      Args:
> +        comp_ref (str): Reference of the component the patches are part of.
>          patch_list (list): Array of patch relative paths for a given component.
>  
>      Returns:
> @@ -245,7 +247,7 @@ def cyclonedx_patches(patch_list: list[str]):
>              issue = {}
>              cves = extract_cves_from_header(header)
>              if cves:
> -                VULN_WITH_PEDIGREE.update(cves)
> +                VULN_WITH_PEDIGREE[comp_ref].update(cves)
>                  issue = {
>                      "resolves": [
>                          {
> @@ -402,7 +404,7 @@ def cyclonedx_component(name, comp):
>              "cpe": comp["cpe-id"],
>          } if "cpe-id" in comp else {}),
>          **cyclonedx_external_refs(comp),
> -        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
> +        **(cyclonedx_patches(name, comp["patches"]) if comp.get("patches") else {}),
>          "properties": [{
>              "name": "BR_TYPE",
>              "value": comp["type"],
> @@ -437,11 +439,14 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      Returns:
>          list: Solved vulnerabilities list in CycloneDX format.
>      """
> -    cves = {}
> +    cves = defaultdict(list)
>  
>      for name, comp in show_info_dict.items():
>          for cve in comp.get('ignore_cves', []):
> -            cves.setdefault(cve, []).append(name)
> +            state = "in_triage"
> +            if cve in VULN_WITH_PEDIGREE.get(name, {}):
> +                state = "resolved_with_pedigree"
> +            cves[(cve, state)].append(name)
>  
>      return [{
>          "id": cve,
> @@ -450,13 +455,13 @@ def cyclonedx_vulnerabilities(show_info_dict):
>              "url": "https://nvd.nist.gov/vuln/detail/" + cve
>          },
>          "analysis": {
> -            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
> +            "state": state,
>              "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
>          },
>          "affects": [
>              {"ref": bomref} for bomref in components
>          ]
> -    } for cve, components in cves.items()]
> +    } for (cve, state), components in cves.items()]
>  
>  
>  def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
