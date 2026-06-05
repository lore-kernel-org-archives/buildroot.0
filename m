Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B014CD8C84
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B25410FE;
	Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4mENUB1a6lk; Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2E641F86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663834;
	bh=LTl2qNUelZO4n6uYAougm+W3oPbqMLV8ARcyb1jdQnE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y0iq/50SbCfxTtd/UocZkJ7x7gURSVmYQTlX7Kw4xKkSw9NC2lD1/Uz3g88NTdjz3
	 5U33bbonHD3QQpGA0urFubq1zimILzk9iGO0cdRxR8F4D4c5KV2bOlQIcl0oBufUMm
	 cfEXkzPgLWbvLHyCQqerDfxVyUAl6f4srzCUinJM5Av5sMMbAzEYAM5LEUYK8Kos7I
	 VrX0fGZtFU6zEGLBJBDkLlGsPWbTilKj5JWzjuszAVX6zJL+vLmlJKos7vB9MIAOCn
	 P+vk3dp2GI12K6iXo7D4q1jGnw7dz9Xe6euRzbomKE2ZpdVn7Z2CcqtrP0V8y5Ns1W
	 t5WHhlv4Mlbmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA2E641F86;
	Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FDE6388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24A1641F58
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mcMfwVGZimC for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0219F41F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0219F41F06
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0219F41F06
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso20505935e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663824; x=1781268624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eX8HCBc4b1SGmNltPLxsjpL8qvsUCoSMQ23lf6Ct+nw=;
 b=hyCahuOuulyEclq2zfuslo+waNfVpGL65N6nuq8Xc+lU/Ii5Tw1+nWLpnJ39iy92Qu
 86KpGV3/J4UwE6bPUmDxdUSb/l4ZfjDec1d+w3CCH3VLr26DBtvaIM6xMDlK3o2MbfpD
 vZme5w2t9IdNhhopRPmT6DCtdKQWfBQ5Wr/+qESFvqt4jiF1Vep880UexvbT2I8jTSfD
 3Lj3hbKN1iPBhxuWpT8dsbnp0rvrXYKvddia+2H0ItGb/8TGvRbzpQrZLKLyqIBiQP+R
 pmXwByODQwttovFkISeF9RgqolgEsnBJX6t1Q341kE5r3+nDBop86O2bWGnpWLSbc5bU
 UzRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/kPWBL22twac0Zwpq7bjWP6jNvn+kQk7pb3lS7NEtSagDMhCNz9tkzEWdcCKrYUSJtlUY6VzwCrTg=@buildroot.org
X-Gm-Message-State: AOJu0Ywx6UXmLKrY8citcODRxYNEq0KaHPcck+XRJFSYl4DQRWu+dwZS
 nTlpa7fYGQoQETqR+yxXqXoRRwMADGRhJWrmaMZCpN1s8w/NRKz5HFnoQvqICQ+AV9U=
X-Gm-Gg: Acq92OHcPp5i+UPJxmQG9mBd6fKNrtEpl3f9DlXAXOPasjNEmaDP86J7ZQjeLfvzsOC
 7/LbSa8tJPq0upnRrbXHQRp1vImfZ9uoKIm5ULrzQyH/NpHNF+a5v1mC/u1WswvWsQRZBclFlSh
 l5e1Z9ilr3gXGXKjj799ItZJSEDymEa0PQ9eQwjBG6cj0dcwgMWxuhNVJ/R0B4IlGQUzcolgWu9
 yLiQRrRbiD/Fo4WyF0ZH4DDtMfDySHBCuoumxzFAtjxtYV3P/AuVaT3O3RYpYNj6/WSdoqXQXV2
 zepOg1o1evG4cLOa6v0sYsr7K/vxHPmQ//Y4Ylm839czxyoyd1WjY+gYuJU32xvMIaUFEt3sVS4
 ogLarddwvfQs7s5e2Lonb0oaSWXBDJFaJVNd4PE8JOEkDDYTzHSMonKaSGZKVZ4PiychDpaSHfW
 WleMKxMn3LL5J44u7eLJIX2fWNQw==
X-Received: by 2002:a05:600c:a117:b0:490:c2a3:abaf with SMTP id
 5b1f17b1804b1-490c2a3abdemr36012555e9.35.1780663823997; 
 Fri, 05 Jun 2026 05:50:23 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4004sm25935580f8f.9.2026.06.05.05.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:23 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:23 +0200
Message-ID: <20260605125023.273286-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-4-martin@strongswan.org>
References: <20260409081401.2060709-4-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663824; x=1781268624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eX8HCBc4b1SGmNltPLxsjpL8qvsUCoSMQ23lf6Ct+nw=;
 b=DAnjcycPe8U7nx9FVrzs7369k4lAkpFL31xPgbH61eLDg/J+N7EztdX2RGRdh4vC3L
 ITzmPexbsT9a6fT4kG/VQf9z3carqbxzp8vO5I2f6uCYqhKUauRZBHD92Xw70hkmpyEv
 2GvxaWbt5lzo+Ke4XCYvCEVm8va0YS2W3SE5OhZokFKn+KuRob7Bj5rfCyX8y9DEwh+p
 zaOTc6bZk+e6wzIgJzZVkedzs2iQ3K31PObs1B2GPIttZ4vz7FRpQSE2JGG1TB+zDckF
 qfGljpdTr5vhoDXZmFeDFIQjosU5egOGlM5qgGj+VqlQMP3hgglj7YNPrGQtesdRNa42
 0zVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DAnjcycP
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

Applied to 2025.02.x & 2026.02.x. Thanks

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
