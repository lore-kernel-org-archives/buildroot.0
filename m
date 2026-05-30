Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425C7CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD7D60EF8;
	Sat, 30 May 2026 13:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhrwJo9rXhEE; Sat, 30 May 2026 13:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B62060EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780148285;
	bh=jgGwJwJCeKo+L3BLHfD5CDDmwBLc5HNzmjmqxb1j5Tc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XpDmsm9WTkOzk9OsaiZdSIqnjDxjBkvoLAR8IT1v555/aJ3ZkXn5krq+TlW1UBSR4
	 vmeTRoiUslgw/7Z3qco/fEuesedv7rSqjpK4amNhuIrUPe78MD/19vRakZB3oBkj3s
	 QpijuAb/w3yWdu5yeKlZNqZgz+2vBEXbUB2BMnPdWhaMswDPmEk2eESV8ZaMeBrKAk
	 w+LXvc/oER07dOfRQ3DVG4VznpvMhlmo+cT0MRNKAf/SnPgnRMasEuW2kuqOMvr9iQ
	 BrDed4fc/AM7oIPNzU//b7+CZyf81Lw/ix0tqE6KLgrARM+QSSWeNfeHK5egDn2YOw
	 F+lCHKTn5BeZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B62060EFB;
	Sat, 30 May 2026 13:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AABED3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D7F742E4B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBWCdBPoOZVg for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D58E242E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58E242E44
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D58E242E44
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:38:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DF8AB97C699; Sat, 30 May 2026 15:37:59 +0200 (CEST)
Message-ID: <c46e2788-ebcd-4bd7-a989-c12383c7189a@rnout.be>
Date: Sat, 30 May 2026 15:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
Cc: Martin Willi <martin@strongswan.org>
References: <20260409081401.2060709-1-martin@strongswan.org>
 <20260409081401.2060709-4-martin@strongswan.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260409081401.2060709-4-martin@strongswan.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780148279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tuSMLtcfdV9PXjn6oDP5a+6S9CWFGsbOPJY16Hf/Tts=;
 b=M2vohTq7MKw2382aCWEM9po2zTCqm6wyDjLczpgf/kYzxfrJK32Rprz35uwvYs/lY8IyYJ
 YVQVfP2+91OC/YI2sLdy3/MAiDWCGYis9w2kqhHrMzvZbgpscg/efqyxQyaaMkGwYyTKBC
 OVOKsH4QnKsAfCh/WuZOsGtsZEDHWQWCgiqOI8RQW3Rr5Brk8CwBAZhWMgFZsBhEpomIdm
 m2pJM/aXCwuFHtmnZCQjS0PfNcpmmgITLSSMrnW7ForRT8KKD/6y8hbs0XeyTckkYIp/SB
 0LLUEmsz3z4kyCvb5UG01Ou6uzBfIrfCpk3lvLpQkBQMb1O8/roCxKoWfiMFsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=M2vohTq7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Thomas,

On 09/04/2026 10:13, Martin Willi wrote:
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
>   .../tests/utils/test_generate_cyclonedx.py    | 26 ++++++++++
>   utils/generate-cyclonedx                      | 47 +++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index bf1b8e099bf9..a071ff867923 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -140,3 +140,29 @@ class TestGenerateCycloneDX(unittest.TestCase):
>   
>           foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
>           self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
> +
> +    def test_external_references(self):
> +        info = self._make_show_info()
> +        info["package-foo"]["downloads"] = [
> +            {
> +                "source": "foo-1.2.tar.gz",
> +                "uris": [
> +                    "https+https://sources.buildroot.net/foo",
> +                    "http|https+https://mirror.example.org/foo",

  By looking at this patch, I noticed that the newly introduced show-info-all 
does not have the part before the + for any additional downloads. The same 
problem happens if you do `make foo-show-info` for a package that is not in 
.config. So that's maybe something to look at as well at some point.


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
>   import json
>   import os
>   from pathlib import Path
> +from typing import Iterator
> +import urllib.parse
>   import urllib.request
>   import subprocess
>   import sys
> @@ -261,6 +263,50 @@ def cyclonedx_patches(patch_list: list[str]):
>       }
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

  This is not ideal, because you may have set a different BACKUP_SITE 
configured. It also doesn't cover the PRIMARY_SITE case.

  I don't see an easy solution, other than documenting that you should generate 
the input with

make show-info BR2_PRIMARY_SITE= BR2_BACKUP_SITE= | utils/generate_cyclonedx


  Also, we loose the information here whether it comes from a tarball download 
or from git. I don't know if there's an official way to represent git URLs?

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

  I suppose the idea here is to exclude local stuff like file and scp, but 
shouldn't we allow git (and possibly hg) as well?

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
>   def cyclonedx_component(name, comp):
>       """Translate a component from the show-info output, to a component entry in CycloneDX format.
>   
> @@ -284,6 +330,7 @@ def cyclonedx_component(name, comp):
>           **({
>               "cpe": comp["cpe-id"],
>           } if "cpe-id" in comp else {}),
> +        **cyclonedx_external_refs(comp),
>           **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
>           "properties": [{
>               "name": "BR_TYPE",

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
