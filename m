Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F60AEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD86421B9;
	Fri, 13 Feb 2026 19:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsYTYRQvo7Tc; Fri, 13 Feb 2026 19:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A77742184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011558;
	bh=ZcNF9Slltk5FIOpAx8hGkkWKk4tNGrLpBbASBBiYLKo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T6fTcpJMI1LKNYgvuua6ShzbYYv2nBPmOmF7ffaiRiNM8W8F2SvJ4J/ycE1iCCrIR
	 SoEnDAxCN6q5rdNBK9iV3CkjU4hD7QS9HKJ1DcWLp3nzft8qh/iJf7iCCqQGENLn32
	 4oDKPji8cgrLFkISkF6tMyp1jXQkViqIFNkXx3Hm0ttsVxUXaWaRlNC5HjMYbze0EN
	 dQM4GoAjHtFuPy3WWgqnT2Z0xbbAT0HVBxgGsFRMwKG54pVG3KbCphIUwEOfjZR9Yc
	 GUvS4AcQbyGo9unFxcr9yexx79aZkW+QgWlOXEMVEWCleGN5ZsKEkvW1OBDatZ7Ua+
	 73wMtwmw0eOKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A77742184;
	Fri, 13 Feb 2026 19:39:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A88EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E86861612
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OerA7tpqJ5wa for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B096600CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B096600CB
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B096600CB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so10397785e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011479; x=1771616279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AqOvBo/8JCbImROxd7JTroCJ+n6AcPDia+A2Gppp3es=;
 b=kfWOIvIT2yjs9LrX39JVqIs48e1Bql6eUK7YEMh4r6lfGTWem4mxa7TJP1g57+CRGC
 6SUEX44EEOo6nLgUspEw4eczttH08rcku7Ay1Q5y8d4sDCMrNiSWp4ezQZ/w8TtldWSF
 X8AVU1iHmj4oC4k/pSEGsXBBovPM5wu17bf2prIXU4kNwsWZooG/nOAemQI/DaGeX3r/
 0mCzxM6asCxtk1RLhXcOen7DVv37GZ4QPX2vqU8mYmzBNdj+gqKxqI3y6FEThMrJ5XmQ
 Sl0tNMjvjz27zgiaPmvz5IApK3DhRqZM8BzIIPcgciQjxYQMxGbHMjgIqAep28a+6CkG
 ZT4Q==
X-Gm-Message-State: AOJu0YwkfnzGATPIIbBB6INfjYmuQP7gjsrG7SaBrQCiBAZUWe+h4NnG
 12Rksp7FRdOeYf53gL6hHYuMYJDu2EgqLVk29iq0K6olvYuq0NX86dRupMToOmScC4r10JB6TWh
 LRNXM
X-Gm-Gg: AZuq6aIMXBaTwg/+idpUWS7qPIScJW4AhV6CnZSP0EFlnahPeuOXFVe3jQgXYP5uZwr
 WwDToV6nTobvV/AFuhtwUJ/3+cGGgbdPpu1J4r8uHIlwFyAmE3tXVacerfQiCUDkJXJMXUmc/i0
 nNIGeeA9uhNSa0BuafqpMv+lj7rtEcdkpXoBAuQTL6Se6jYHccOxBCIR7VpVJg1sqbU958vQn32
 /Hi8bKBksS84RlJCi7Y/6oDeryKFwYGz4ywQFSegU6C5NNxDOHtgVM2x24ITgIWmG6qPTkOlDWC
 nokkV7llBiwKncJ1aHe0EkvPRc8eCx8UILgqyctZKmsWqPkV9NPv1fNYDFLCN5gB1BvRQzxcIRq
 M9H97q7xYCoVFsIZAznaAZF701MQ9P4MCCt1z77iUXpkAAr4i8Pkz7JOVvYkG44s9tXQ7bLl2wv
 WDCdE8bA0gjmoxgqM=
X-Received: by 2002:a05:600c:608f:b0:477:9dc1:b706 with SMTP id
 5b1f17b1804b1-4837108573amr50848965e9.19.1771011479378; 
 Fri, 13 Feb 2026 11:37:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm317066045e9.0.2026.02.13.11.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:59 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:58 +0100
Message-ID: <20260213193758.41211-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-4-thomas.perale@mind.be>
References: <20260126130414.59175-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011479; x=1771616279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqOvBo/8JCbImROxd7JTroCJ+n6AcPDia+A2Gppp3es=;
 b=RMiNf0IAT6ZoEzDQHz9F+rfnqdegxmPFiREW8JcNOXx9AJgw796JBUWw3jUD7x5S7q
 ryDGnwuG/5MTAxcdptwTcyVGeLzAjqbo0JSR2iT57/18moDtzSb9CgUQsome56yX5cVf
 Lvm3MbZ8XO2VdRmfgrZSisynjeV/kgxHEm3a6dmHrMJr5yZNg0gFd7GUH8v9fm9RLNY7
 vitgsjntnC4IipBgxsKiMhtrC+7zZk53on2bxLn6xHkaRgBtB2PVFab3G8H/Av0ryOhA
 0ZwV6C3jIragG6rbyDEN8wHanbgEy17PR7aNG/CKlKJx/RmGF61d0oCpPr/xk/KVyFp5
 dCHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RMiNf0IA
Subject: Re: [Buildroot] [PATCH v2 4/4] utils/generate-cyclonedx: fix
 dependencies w/o virtual
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
> Since its introduction in [1], by default the `generate-cyclonedx`
> script doesn't include buildroot's virtual packages in its 'components'
> list, unless using the `--virtual` argument.
> 
> References to virtual packages present in the 'show-info' output are
> filtered out in the resulting dependencies.
> 
> This patch fix the default CycloneDX dependencies generation
> without virtual packages to reference the packages that provide the
> virtual package instead of just dropping the virtual package itself.
> 
> If we use the package `lbase64` that depends on the virtual package
> `luainterpreter` as an example. The 'dependency' entry looks like the
> following:
> 
> ```
> {
>   "ref": "lbase64",
>   "dependsOn": [
>     "host-skeleton",
>     "skeleton-init-common",
>     "skeleton-init-sysv",
>     "toolchain-external-bootlin"
>   ]
> }
> ```
> 
> The `luainterpreter` dependency is missing.
> 
> After applying this patch, package that provides the `luainterpreter` is
> present:
> 
> ```
> {
>   "ref": "lbase64",
>   "dependsOn": [
>     "host-skeleton",
>     "lua",
>     "skeleton-custom",
>     "skeleton-init-sysv"
>   ]
> }
> ```
> 
> In the case of a virtual package provided by multiple packages all those
> packages will be listed. This happens when generating an SBOM on the
> entire Buildroot packages.
> 
> [1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> v1 -> v2: use set to avoid duplication of dependencies
> 
>  utils/generate-cyclonedx | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 04ce8fc3a1..2b6c6d63d3 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -337,7 +337,25 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>  
>  
> -def br2_parse_deps(ref, show_info_dict, virtual=False):
> +def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
> +    """Retrieve the list of packages that provide a virtual package.
> +
> +    Args:
> +        ref (str): The identifier of the virtual package.
> +        show_info_dict (dict): The JSON output of the show-info
> +            command, parsed into a Python dictionary.
> +
> +    Returns:
> +        list: package list that provides the virtual package.
> +    """
> +    return [
> +        name
> +        for name, comp in show_info_dict.items()
> +        if "provides" in comp and ref in comp["provides"]
> +    ]
> +
> +
> +def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
>      """This function will collect all dependencies from the show-info output.
>  
>      The dependency on virtual package will collect the final dependency without
> @@ -352,13 +370,15 @@ def br2_parse_deps(ref, show_info_dict, virtual=False):
>      Returns:
>          list: A list of dependencies of the 'ref' package.
>      """
> -    deps = []
> +    deps = set()
>  
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
> -        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
> -            deps.append(dep)
> +        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
> +            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
> +        else:
> +            deps.add(dep)
>  
> -    return deps
> +    return list(deps)
>  
>  
>  def main():
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
