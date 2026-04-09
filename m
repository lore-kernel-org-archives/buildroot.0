Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AADE9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0393840FBC;
	Thu,  9 Apr 2026 08:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFjcnBGkA-8X; Thu,  9 Apr 2026 08:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA1F40FD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724196;
	bh=YMlxl6NAzS7JHNOZraKlxYqbI1ju5uPyYB3PtkiDjNQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nRHbjN18CWij5ZDAOhIo/F+dhh6G8cniBDl2Xy7pxY86Zn/a+PHNLVfq4VLOfVDJr
	 gsQaNNkXOS9doVCav9uoT/dqJ2UYQIBsJ3wzWCs+jAtJL+io1zc8y9MoSlx1Ze6pH9
	 xaZWc8yES3I0kVJuESjVqhPoFJabW3H8kAk7/XPtaxn3JUhyHjkXJCoI33XnXwSG5U
	 IcbVQnNFNAvAk/jezvRIJBAKGk90pywBZRNmuQNEpc6AX3LWXnZlZq4PxvA87A9o21
	 sLeYDsXpXl3Hc2J5incPCG8dL86lQ7KxvvQNyOg/TT0aZqfwlKZ3UK1Fzf/5Zt2UeA
	 tCTrfSHs6cIgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA1F40FD1;
	Thu,  9 Apr 2026 08:43:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4170C237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EEE74039B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay79JahlqJL3 for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DA094039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA094039D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DA094039D
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48374014a77so7879485e9.3
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775724191; x=1776328991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gVY7xot0SlWePQMbNUFrSkcfVE2UR/yCndnWje17vyw=;
 b=d7Ki5Aw3Ykm65m+nm4Tr+gfJynLayx6LlUx0tdlq9H4JVm8tOii8k4yO4Iq7oKGL8j
 DyngF9DHI9lRdAiTDCsik+6GSl7QQHZP8XNCcpg37mL0uxGqsvpsj/mOw8fsheuWIjRY
 d8TYoJVn0iDIWfdEBzfIVIGpNZsl3r1Ilu6VVMwVR6JQBZr717lipp1fObx4SNX42aSN
 PqDhE8M2m4hgaUJYdnKqu96x01qn064KgAnCoOmHql13sysdHOeqDh5f2SWEKH7qDSAa
 y1okXGUTXcI/e5zsb1dclbgXKTUHv6B/aEdi8+GLGoHm6kLedpb9yyny/zEhg5lIi6uE
 gbjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/n46AqJOYT3OabhzjsAIaTUD1pWm7rccj5/wZccna9uESnTXZOvHP5v8vgaWmgwFa6iJyosmJIxM=@buildroot.org
X-Gm-Message-State: AOJu0YyhwRrRfeIka9G7z4Upuf/InZ0xP8kTfVSSeJUKSoehT+Qs9X9d
 quUFgLYyQwWft+B7EMO4Oi6xG90FfODq347yCDki0VKw4FZORA0RDBm7a+TRass0UrI=
X-Gm-Gg: AeBDiesIWf9Ey8g3xPRGVaZe2JWgdkfZi+/SI6ARzGAC94LFKQzLwnYlv1cBhNaFqdr
 /e8xLs9i/sYj3oSY5P58dunq2WG0koN7fAfOfN+q0JezERu5x0AfcvFx88NcmbwCO31LMzSFI6f
 tne/k9f/QJHYshGeZ3it7dNXg6/0Y97Jaq4A0wMKSS8z2AJhKTMNlnaN/Gl4rKMKTb7C853N+wU
 ZZkgxdyClmxdSzDbaX/Hqj0VDc2QBJfPMYphvlexMCpX4WdX8lOinvA8QEZPSgAu384Hnm/Ycbq
 r+eUcNCoi6o8ModDh/BNa3T/USu6Kc4DMGZb+exW7x2SRJOe94JlWuZl6F+F0KEmFkM4Zyzk/4M
 m62PeBbbVLBnKPT3sL5BNbSkUVrlgCCLgz+joXDmkove8KdjsFOlKlz+z93ChbQGJBSQHe6gbV6
 lgGS2/S5HiraizlnGP
X-Received: by 2002:a05:600c:6305:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-4889978da75mr330990145e9.17.1775724190900; 
 Thu, 09 Apr 2026 01:43:10 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd19a69esm20272185e9.32.2026.04.09.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 01:43:10 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 10:43:10 +0200
Message-ID: <20260409084310.27382-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409081401.2060709-4-martin@strongswan.org>
References: <20260409081401.2060709-4-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775724191; x=1776328991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVY7xot0SlWePQMbNUFrSkcfVE2UR/yCndnWje17vyw=;
 b=Sn8/ekr+hrvBcTBX1MBXrreIblhkmWerfbe0+YYbZbfkOg2WNHgbpy9gLC7EGqMd8L
 iklb0qkqeCBBBT/uPi4ZJlID2bp670uIMYlXhpm4zQEcifYPNJ8QjIXGsLrYuHxF5rrs
 p5eo2nESUPkwKii8m6HSOemhyZMKz+Zi9D0dNzK5E3LdK4L975xYDHS+wFuUtkJnz7Hy
 b2nxtLJB7oL6Y9yVl7TSN7THaTdugbwJR3U4lbRo8M5NQa6BlWYxTy9iE9YqaN4I2gy9
 2XQbA49fWGjwlU0rb2Z2+h38cWn170+Tw2DmkGhiCQX5UxAw9p9lhuE9+QJnAFB84QdP
 277g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Sn8/ekr+
Subject: Re: [Buildroot] [PATCH v4 3/6] utils/generate-cyclonedx: generate
 externalReferences with source-distribution
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

Thanks !

Acked-by: Thomas Perale <thomas.perale@mind.be>

In reply of:
> BSI TR-03183-2 5.4.2 [1] lists source code URIs under "Additional data fields
> for each component", and as such "MUST additionally be provided, if it exists".
> 
> If a http or https source download URI is available from show-info, extract
> it and include it as an externalReference of type "source-distribution" in the
> CycloneDX output.
> 
> [1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 26 ++++++++++
>  utils/generate-cyclonedx                      | 47 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index bf1b8e099bf9..a071ff867923 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -140,3 +140,29 @@ class TestGenerateCycloneDX(unittest.TestCase):
>  
>          foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
>          self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
> +
> +    def test_external_references(self):
> +        info = self._make_show_info()
> +        info["package-foo"]["downloads"] = [
> +            {
> +                "source": "foo-1.2.tar.gz",
> +                "uris": [
> +                    "https+https://sources.buildroot.net/foo",
> +                    "http|https+https://mirror.example.org/foo",
> +                ],
> +            },
> +        ]
> +
> +        result = self._run_script(show_info=info)
> +        foo = self._find_component(result, "package-foo")
> +
> +        self.assertIn("externalReferences", foo)
> +        self.assertEqual(
> +            foo["externalReferences"],
> +            [
> +                {
> +                    "type": "source-distribution",
> +                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> +                },
> +            ],
> +        )
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index f4d5afd847e5..a3b7293f9a5e 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -14,6 +14,8 @@ import gzip
>  import json
>  import os
>  from pathlib import Path
> +from typing import Iterator
> +import urllib.parse
>  import urllib.request
>  import subprocess
>  import sys
> @@ -261,6 +263,50 @@ def cyclonedx_patches(patch_list: list[str]):
>      }
>  
>  
> +def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
> +    """Parse download URIs into (schemes, url) tuples.
> +
> +    Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
> +    Buildroot schemes with the stripped URL, excluding
> +    sources.buildroot.net mirrors.
> +
> +    Args:
> +        uris (list): Array of URI strings from the show-info output.
> +    Yields:
> +        tuple[list[str], str]: (schemes, url) for each usable URI.
> +    """
> +    for uri in uris:
> +        scheme, _, stripped_uri = uri.partition("+")
> +        if stripped_uri:
> +            parsed = urllib.parse.urlparse(stripped_uri)
> +            if parsed.hostname != "sources.buildroot.net":
> +                yield scheme.split("|"), stripped_uri
> +
> +
> +def cyclonedx_external_refs(comp):
> +    """Create CycloneDX external references for a component.
> +
> +    Args:
> +        comp (dict): The component information from the show-info output.
> +    Returns:
> +        dict: External reference information in CycloneDX format, or empty dict
> +    """
> +    SOURCE_DIST_SCHEMES = {"http", "https"}
> +
> +    refs = []
> +    for download in comp.get("downloads", []):
> +        source = download.get("source")
> +        for schemes, uri in parse_uris(download.get("uris", [])):
> +            if set(schemes) & SOURCE_DIST_SCHEMES and source:
> +                refs.append({
> +                    "type": "source-distribution",
> +                    "url": f"{uri}/{source}",
> +                })
> +    if refs:
> +        return {"externalReferences": refs}
> +    return {}
> +
> +
>  def cyclonedx_component(name, comp):
>      """Translate a component from the show-info output, to a component entry in CycloneDX format.
>  
> @@ -284,6 +330,7 @@ def cyclonedx_component(name, comp):
>          **({
>              "cpe": comp["cpe-id"],
>          } if "cpe-id" in comp else {}),
> +        **cyclonedx_external_refs(comp),
>          **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
>          "properties": [{
>              "name": "BR_TYPE",
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
