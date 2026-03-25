Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D27109C02F
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 14:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7991361376;
	Wed, 25 Mar 2026 14:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zZmZ1vz1tLh; Wed, 25 Mar 2026 14:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2406C60ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774450704;
	bh=aQPUpktPJuylCzi24Z76kHKQFFyOCkRCpZJ1PyNrKb4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fEXyRxBxw9z2nuLHDO8foxmpOoO4a6i0gZowXWqzTWhgskjxVwooVh5SDGHkoxs8T
	 W22fCM7xrmJ/3ndPbD8kHCExYbBGAdjKhrkjpzjf4XE9Mwgl1xKisu+XANRzhb7M/m
	 bJrRm72iNhLzQSZ8tk5/fnxo/8Rjj1fbtWqkwUA5YPfIhgz4emZ6V4zEwwfVZX74U9
	 YDmZoXyj5iQArRymDtI3qw6noENM1hlRLPps6buNu42yzXYv7SXKfslCSteypzYQsq
	 b/M59xPzNXkN7mcNiD+pLZpWqppLjsjIDsXZYlz71dcaTA0neq2+3YuZf6L4Wy4Mrk
	 B7hbwKSIRv0Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2406C60ECB;
	Wed, 25 Mar 2026 14:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B1CA1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4100041104
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQWFlJg6zqUw for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 14:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02341410F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02341410F5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02341410F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:58:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so4798301f8f.3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774450699; x=1775055499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3PXdGRiwnd1nZfkX8yChKrMU8DeRREyisPeiw7Cp/Zg=;
 b=HTq8WYLpg3igFg+zaOykmIhN4PjlMFSG9dPLqEy4A37tlngThvygftMlTdl0Xtp50h
 0fX6jcdIvURAAmPifDFaApzobUVei3NGOh9otNac4uJlsa42Ec26AsXoH2K6mvM0oB0z
 q7FYAW6NOI7YsYLmYllGlKdjZLPa2I9MMHc5G1GzpjbOEQ5+D3fa5zzazWPNCa5sWid/
 LKf7d5heLikXSWhzrTxSbYN6Q+jiItnJZSVX22vXmIbbavFyPKxhjvaDP9Oa79LZsACk
 9/JgMufyj+yLgqXF5rwNjQrmzkc0H+2r8IWuJAjjJ51U6L9CH0QZDgS7BTeo8djhphhr
 z+NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf/0/F7749Oww7JIqv4eI+tM4ywOMgptXtuf3lYaPkyhoChk6lK5yfLX6giK59EWZ7h4uYXo47deY=@buildroot.org
X-Gm-Message-State: AOJu0YylB/nqepiMufDM5paahIZhvO8sJ4ePemrR1gO83ke5SVxCkZc7
 +KIumc/x6MZwluLzklYOlk7h5cXISU7Et8auFhq1pHmFgFSpCvoM4GA6Karm522iNQsTJ97D3vQ
 Ndfo225U=
X-Gm-Gg: ATEYQzxtNoFB5IxJqheWnDbiirHv2DMBcUqMFpnN+NILBCU9oa+wfXCTHlzTVQBjQZt
 WZxEJYnrFTgJuk+1HsU4wJToNstWmiVm7b/zfNoJr9RR+ifb0XwedJO+iDHGBqhtPsOL0b+gUpV
 yjS2CTlqAUw5oYu4GYZ9CuViONx83LXSLpGj6XCGDhZRPszL8ecyn2ax+fWoxrnXheMYUvBcIEP
 QahuEJ+iEBNTwc/ZprBlwNe/oet2OkUA74XXvKaCrKKba0go9M+BsWyJWtYwE2nMnMZdVwefLXa
 z9YHOHdBPxQHq04uDkXGRqbW1JPhJY8yaSs7/7v6TseQdwTFaixC98M5tPELCU3qCWMA4N8j+Cm
 KtoT+qdtypd+Ty0P3/YF+mSSzrznTUhx3ECVjusg+UVQcmu2CwQM29rauWmUpzGSk6dCc0/zqRP
 9n2yAHs4HXKum8e/zm
X-Received: by 2002:a05:6000:2502:b0:43b:4dd4:684f with SMTP id
 ffacd0b85a97d-43b88a410f3mr5353741f8f.47.1774450698605; 
 Wed, 25 Mar 2026 07:58:18 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b91942e52sm347043f8f.9.2026.03.25.07.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 07:58:18 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 15:58:17 +0100
Message-ID: <20260325145817.387805-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325133343.1008245-4-martin@strongswan.org>
References: <20260325133343.1008245-4-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774450699; x=1775055499; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PXdGRiwnd1nZfkX8yChKrMU8DeRREyisPeiw7Cp/Zg=;
 b=MQzei+lf0NngfZUbUZ9DKTJl9swhlXYooabI49ayyeRGyluUa70v271QKl2errApxX
 qBzx8F2Pa9io/ER7RBD78AF1V+PbcZYwyd84v3AC4sAfI3CUqO/m2oJKBn5r3+Pgtxzv
 9fMF6z8kBIfk8wiZtSN9X7cuIzzUcYyCSUrwwPBakLc6L1YCJZJNlFY96p8akYCcnZ3Q
 7th0EqqeRgMqZZBoagHd35Z1R/XavmBwRG4Kqslms0nWVY/28AQan3Gf8/Ab/PO83vq3
 TRQ20Rf3wM+SsK1/Llq9Vcr1aXXJftLlU7k3EUNmcW3GnmxtHY807yQ9lNe14EKhKnPU
 gUtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MQzei+lf
Subject: Re: [Buildroot] [PATCH v3 3/5] utils/generate-cyclonedx: generate
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

Hi Martin,

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
>  .../tests/utils/test_generate_cyclonedx.py    | 27 +++++++++++++
>  utils/generate-cyclonedx                      | 40 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 9b041ffb61fb..9c2bd2bc9180 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -137,3 +137,30 @@ class TestGenerateCycloneDX(unittest.TestCase):
>  
>          foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
>          self.assertEqual(foo_deps["dependsOn"], ["package-bar", "package-virtual", "skeleton-baz"])
> +
> +    def test_external_references(self):
> +        info = self._make_show_info()
> +        info["package-foo"]["downloads"] = [
> +            {
> +                "source": "foo-1.2.tar.gz",
> +                "uris": [
> +                    "git+https://git.example.org/foo",
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
> +                }
> +            ],
> +        )
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 70abd7af7c89..3946380ae3ef 100755
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
> @@ -261,6 +263,43 @@ def cyclonedx_patches(patch_list: list[str]):
>      }
>  
>  
> +def usable_download_uris(uris: list[str]) -> Iterator[str]:
> +    """Filter the download URIs to find usable HTTP/HTTPS URLs.
> +
> +    Args:
> +        uris (list): Array of URI strings from the show-info output.
> +    Returns:
> +        Iterator[str]: An iterator over usable HTTP/HTTPS URLs.
> +    """
> +    for uri in uris:
> +        parts = uri.split("+", 1)

NIT: To make it more clear what your are splitting maybe ?

```
scheme, _, strippeduri = uri.partition("+")
```

> +        if len(parts) == 2 and {"http", "https"} & set(parts[0].split("|")):
> +            if urllib.parse.urlparse(parts[1]).hostname != "sources.buildroot.net":
> +                yield parts[1]

What about 'git' repos ? If I understand correctly URI such as:

```
git+https://github.com/containers/aardvark-dns
```

Won't be part of the 'source-distribution'. Which looks to make sense in regard
of the CDX spec. Could we use maybe the "distribution" property for those ?
Does it make sense ?

https://cyclonedx.org/use-cases/external-resource-links/

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
> +    for download in comp.get("downloads", []):
> +        for uri in usable_download_uris(download.get("uris", [])):
> +            if source := download.get("source"):
> +                return {
> +                    "externalReferences": [
> +                        {
> +                            "type": "source-distribution",
> +                            "url": f"{uri}/{source}",
> +                        }
> +                    ]
> +                }
> +    return {}
> +
> +
>  def cyclonedx_component(name, comp):
>      """Translate a component from the show-info output, to a component entry in CycloneDX format.
>  
> @@ -284,6 +323,7 @@ def cyclonedx_component(name, comp):
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
