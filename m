Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F03FD8FCA
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B1A481B17;
	Thu, 26 Feb 2026 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JSMdV8SmRBj; Thu, 26 Feb 2026 15:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE48481B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772119479;
	bh=4I2GOOvAITZTbJJQ7N2aae9fTb03j3UKbJh41+GHJIY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XmypzOmsSn6v16S1L5CsaZHCtYZLx94cHd3l1uG2i/GjN6bWXiqgY97pw3U0a4N42
	 Ub6hs808ueS4Id1Y2bl4epq9RL0Fx7La5W1dM6lYGDBLWu9DxSKxwQ+BGPL/j4Tafe
	 rZjTwtUYo0KMRpkhP9v6yp7tK5hwxoIP3HK/2EQ3zJ3LOpfY2EgS1HshiiWcBAwTcn
	 Pfjr+PQHGPfnsQGc6BrKyVj0aNkJi/wH562sxH0HateZmXwMQd1jIuJrXP/ua1YmYE
	 /CSceuLsLTnnh9hvifxzX/6HYAzhsUeIgiIwzArYAcFGE1Q4Ea1w1Pa1OciZZdZ9kL
	 5gabmlwYyAL7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE48481B23;
	Thu, 26 Feb 2026 15:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E5D24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72BDC406DF
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtAbkfms-ytF for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD5241600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD5241600
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD5241600
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:24:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso9089595e9.3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772119475; x=1772724275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J0JVqj7qEanxpkO2jDhjuYp4nh5ntvpB/Zze2q8KC1o=;
 b=FdG5t7qlY8xBipsleoUMe12qdVTMSON2nDvTJtRE2xHmuS5+XHSq90Q60A+2DrY8mk
 MtTrx02VDef2Cyu2ilTUyCKgwEEfHrN/iitSPiPLpOYjgI3YOiuqrLOJmmf2C4u/ODhT
 /yiOMQQGr9LLFaKR4ztgHIWUvxKZAOcCELjzmxAYq6+s8c6wOvv5cxJAXyR8zuUj47fi
 +SySsSY+3AffYBSlcvIziMvsUSVKgFtZbUrE3B2GrK/WtIIOw7rcpyA6VfdoTWGNJM5Q
 Tchh/e1Z+Zxtsf4q8OoKIgUjDDN1DRE5NJF2DYhQB3o7onBQfxGpd6pEopR2ewrAavmv
 p/Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvFv1iFn56FBLxhUfilC4OuP3elKYx2I7jQzkfNxWk/qg3w1ZAqYztTpxcfJiFyE8vMpD6a3ANMgc=@buildroot.org
X-Gm-Message-State: AOJu0Yyc2B1JAHrDee5tALRaLoFy/AWROPg/HsKf+52Vn4xuVCWYN/be
 90Tsk5Uoi8HzJiEMxFbdOErda6cAAB6SGijie75a0WX2D1He1LoTxr1HBGMEQeBcghbOQlL9UiN
 hWJkS
X-Gm-Gg: ATEYQzyhnQa6NsWrenbSQNbDENmOQ1d6IDnI6mr5PVNOggvFQ3aT9lEL0RUohTYpD2X
 boy+ucVCDo44w+nhpxKjY3HFGvlQtzSbUYkPic2RZ0mTjzWwZo+VQ74BwWRQb5TCruLgUDReUIy
 m+DdG4+9zryx4oO5oWrFSHE0MuK1vXVWouWT6DrcHKjTtZhM+uujcNd1O48UsLKcRyr0rpFYGXV
 HuJEr3qapRcsdRcxVVoK5tU4u2vh0JIadP4zVVdFZsJFnHgDLW78x/ZtEeuattOQDCiRHtzC3Nf
 5Drq6EyBSo4FnMqJCqpUAep3jm8ZchaVhnYRNMecfaZKX7ztr/0LsbmtsgMoYZMZKRaeze3ACRs
 a6N7NQ5KKPTrayHOBsX4Frbm3m6zmDeUS5XvrSowknIL2DdnAIyiZigBZlomVjM8kErh+a6SJuq
 Ka+zmrpZKD9GqthtI=
X-Received: by 2002:a05:600c:3587:b0:483:a27e:6706 with SMTP id
 5b1f17b1804b1-483a95fc063mr347212935e9.9.1772119475434; 
 Thu, 26 Feb 2026 07:24:35 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm164743925e9.9.2026.02.26.07.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 07:24:35 -0800 (PST)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 16:24:34 +0100
Message-ID: <20260226152434.190931-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226142023.1064241-7-martin@strongswan.org>
References: <20260226142023.1064241-7-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772119475; x=1772724275; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0JVqj7qEanxpkO2jDhjuYp4nh5ntvpB/Zze2q8KC1o=;
 b=bFWhX5z9kF9TSVfkE4x1FblDmcedfihb+DoplWB0G4TfyTCuS5+GroG1XsIGsejp/I
 sB7LoTe8l/qC+rglk/b5Ox/TWsva0dHaT1oR8FtTwLmFmRmUj5XKtGEphDaSrYGVaY26
 2L+GqjXQK+xZNjT+nvjshWnYl0ZiFPhElUo9te6JLW3sWUMog5bRvzyrI3PccSNCoLWK
 nMfj9VZrLln386v65pCyJKK5u2vXrkbq3LeI8bPeUymlRqGwWsSIFg3tr00/szHm9F3Z
 jOO2ayAX2UeioIX2lch6JDU4o3MdA4ddRruvqcU1fgXmdWY29ltoN0xh2A3yj9H6akFw
 unOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bFWhX5z9
Subject: Re: [Buildroot] [PATCH 6/8] utils/generate-cyclonedx: do not list
 filtered packages as dependencies
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

I think that this patch actually address my previous comment [1].

If we keep adding new filters to the SBOM generation do you think it's possible
to instead extend the `filtered_show_info_dict` to also directly filter the
dependencies of the show-info output so we don't have to implement the logic in
the dependency generation ?

[1] https://lore.kernel.org/r/<20260226151708.188915-1-thomas.perale@mind.be>

Thanks,
PERALE Thomas

In reply of:
> Packages filtered by --no-host or --no-skeleton are not meaningful dependencies,
> as their references are invalid. Filter dependencies by components that are
> actually part of the SBOM.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  utils/generate-cyclonedx | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 1d8fec7a2cdf..9920000e6714 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -381,7 +381,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>  
>  
> -def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
> +def br2_virtual_is_provided_by(ref, show_info_dict, include) -> list:
>      """Retrieve the list of packages that provide a virtual package.
>  
>      Args:
> @@ -395,11 +395,11 @@ def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
>      return [
>          name
>          for name, comp in show_info_dict.items()
> -        if "provides" in comp and ref in comp["provides"]
> +        if name in include and "provides" in comp and ref in comp["provides"]
>      ]
>  
>  
> -def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
> +def br2_parse_deps(ref, show_info_dict, include, virtual=False) -> list:
>      """This function will collect all dependencies from the show-info output.
>  
>      The dependency on virtual package will collect the final dependency without
> @@ -417,8 +417,10 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
>      deps = set()
>  
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
> +        if dep not in include:
> +            continue
>          if not virtual and show_info_dict.get(dep, {}).get("virtual"):
> -            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
> +            deps.update(br2_virtual_is_provided_by(dep, show_info_dict, include))
>          else:
>              deps.add(dep)
>  
> @@ -511,11 +513,13 @@ def main():
>          ],
>          "dependencies": [
>              cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
> -            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
> -              for ref in filtered_show_info_dict],
>          ],
>          "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
>      }
> +    for ref in filtered_show_info_dict:
> +        include = filtered_show_info_dict.keys()
> +        depends = br2_parse_deps(ref, show_info_dict, include, args.virtual)
> +        cyclonedx_dict["dependencies"].append(cyclonedx_dependency(ref, depends))
>  
>      args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
>      args.out_file.write('\n')
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
