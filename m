Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01E3CD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C05F182AA7;
	Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEP_J_UIYJAL; Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB02182A7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663832;
	bh=DuGhMIWy7TgxqcFuiu/4mjyUDdzaUhrMcQbXniy3/lM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Etbv83kGlQhHEWhFq5oWWV+Mxcoyy0KkZ4nb+yRPNCAHnC6IV+PA8jpHrKH3vmFKk
	 CAaIyD3f9NY6CMUCkLlBOjbBTvQ+E8PP9nKcGPiqLyYlfWiMQgQxBs/7DvWWcLIYoS
	 tGVXqTh7PAGnD/Zloqc2n2rW5KIIBZk7I21FXgsUCHWrZEnuJeGhJoLYVXwFg6WDq3
	 sFn759IjC5doTrIj+1i5dm+5sL5qBq3e9f2qpefn8CgWaMoBMmQt44KxNvil/xA+dA
	 zGriVsV1r2x+tAuI9OAtg/KS1ANSI7wcebo0s3O/FbotPemGo7mp5ghpxWoyKjdBk1
	 5CTdr9LLYSsag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB02182A7F;
	Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70356F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D1B74037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-mi-SZc4kvH for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A01540381
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A01540381
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A01540381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15198645e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663823; x=1781268623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I/X51nJFm+uQr3R3V7OBINYV8iEXymxv1baL1RbrXFQ=;
 b=Tzfg5E+jGzW734H/w6bk72g5WraVkyZ9fzB/Cqg40gBZBwkWJptLKZKsNGaIoxj5t3
 3bhqhhUjkFyFkORiqIUaXsI8c1Lf+7mR3teqBfIH4VOVviffXpw2tOrSimCMI/RUMxec
 nadvBTWxabITCmtrv0Z4E0D5t5G2G6Wke1tYBP/OFfsf2/eQSsg2Hm/wco9NHh/hM7cn
 KB++MjVNY2iAxAzQqeLb3egGUKMY2mB9OsGNLVjM27XNeOeaJP8D00dOWfB4YTT/HdMo
 cCezyRSQImOSvi1BCG6/MTfkWsqPBXNjBYqI8EzAIA1hergtLwCa5eMR2XZpfLWA2OzL
 Gt8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RWjW4kLcpJrTeZ35fNlanxCCQBioaZ05uqMy5/lDUlSnoKplK3ETstuwfXSeS39nZcNTtW5TdM8E=@buildroot.org
X-Gm-Message-State: AOJu0Yx+FoIZz/33ho5nxS/oop0MdWM1S9qmv4iF+rpxe6SfPuS7GkGA
 V/8oWdrWlpT10iSG/9oeyy+cLVCJE4FUMWpOkO9yIk+AHpCLtEwbw6TZH/YHtCAmp4U=
X-Gm-Gg: Acq92OELFpaj/2JtWxahyWOK3ZDgNCarWUxIfYQZxebTSAIi3q6l/IznKhsA+S5Igtj
 fWeHKnQFD6LnESzt5kq0knoEaOIlE81+fvL21n8bsVlM8RTqN/ULLMcrDOth7odMel2NKfC4xN9
 X06f4zXXLhHO6s0XJsCP6A8l+wQXcf+0EDw7c+jdkW2F8B1vZUTjhqpzXparAlA1yDr3pICjH+s
 TtMT2iP3ZFyMXKPW7sd9JLaDIIp9vxwg+sDP9VwWU6VuF2DPSIXOA9V0771C9uXGc/13X+Cl/mr
 B1iG+ThJa9SZuDPXt0zRhu4bYGrup9f3EN3CKlrJZmUuxV5hGK5h5q5nMG+YcP3lu2sjp7ld7GD
 DJDJtNR973eXBJos58fOEe5ulUtfEzEAXQ0v7aK32S39PhxByHRH/6aaPdviCruYlkFQwZ5rALT
 GYA2ij0jIxh5mmJBV6+W+5TbLSTQ==
X-Received: by 2002:a05:600c:4fc6:b0:488:aa33:dcbd with SMTP id
 5b1f17b1804b1-490c2615bdemr54353555e9.26.1780663822959; 
 Fri, 05 Jun 2026 05:50:22 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e4b5asm158728255e9.13.2026.06.05.05.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:22 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:22 +0200
Message-ID: <20260605125022.273226-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-6-martin@strongswan.org>
References: <20260409081401.2060709-6-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663823; x=1781268623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/X51nJFm+uQr3R3V7OBINYV8iEXymxv1baL1RbrXFQ=;
 b=D7WOpmevbeDKVIw3ixMZeWfYrUwmBBgxlawKkevSThVYPHfmhFEnPfSfSwVKdiY5Ub
 DtKsoscSVHbfSKVZMZUUNRjFVC8e5seBLh7S50FwFyDXh39iNsXiw0TF/lk51nJCx3TG
 GNpvxzgjWo46pM2ZpAqrdR5fziKQXlD+zk8waYse1lYQveEg3a6j+EHk/r1HV6s6ncu5
 XFEbTy5+XriBq6cqBz8pKsVFI/bvaDWAp/sgYyv6o0BJNSCYDZJmZ9rKLN+ConXxpn+l
 y9pvPxkQ+YzWBys0Pxv37HvbhXbfh6yTJDanymtgwW1MhlSLWqKpkGdq92j69vpKkN4/
 4aQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D7WOpmev
Subject: Re: [Buildroot] [PATCH v4 5/6] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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
> BSI TR-03183-2 5.2.5 [1] lists the "Hash value of the source code of the
> component" under "Optional data fields for each component", and as such
> CycloneDX "MAY additionally include the [...] information, if it exists".
> 
> As hash values are available in Buildroot, iterate over .hash file paths
> from show-info input and read hash values for the source distribution. Add
> all found hashes to externalReferences source-distribution entries.
> 
> [1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>
> Acked-By: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 44 +++++++++++++++++++
>  utils/generate-cyclonedx                      | 34 ++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index a071ff867923..84f94f050760 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -166,3 +166,47 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  },
>              ],
>          )
> +
> +    def test_external_references_hashes(self):
> +        with tempfile.TemporaryDirectory() as tmpdir:
> +            hash_file = Path(tmpdir) / "foo.hash"
> +            hash_file.write_text(
> +                "# source archive checksums\n"
> +                "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
> +                "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
> +                "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
> +            )
> +
> +            info = self._make_show_info()
> +            info["package-foo"]["hashes"] = [str(hash_file)]
> +            info["package-foo"]["downloads"] = [
> +                {
> +                    "source": "foo-1.2.tar.gz",
> +                    "uris": [
> +                        "http|https+https://mirror.example.org/foo",
> +                    ],
> +                },
> +            ]
> +
> +            result = self._run_script(show_info=info)
> +
> +        foo = self._find_component(result, "package-foo")
> +        self.assertEqual(
> +            foo["externalReferences"],
> +            [
> +                {
> +                    "type": "source-distribution",
> +                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> +                    "hashes": [
> +                        {
> +                            "alg": "SHA-256",
> +                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
> +                        },
> +                        {
> +                            "alg": "SHA-1",
> +                            "content": "2222222222222222222222222222222222222222",
> +                        },
> +                    ],
> +                }
> +            ],
> +        )
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index a3b7293f9a5e..382d91ce55af 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -283,6 +283,39 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
>                  yield scheme.split("|"), stripped_uri
>  
>  
> +def cyclonedx_source_hashes(comp, source):
> +    """Create CycloneDX hashes for a source distribution.
> +
> +    Args:
> +        comp (dict): The component information from the show-info output.
> +        source (str): The source distribution filename to look for in the hash file.
> +    Returns:
> +        dict: Hash information in CycloneDX format, or empty dict
> +    """
> +    MAPPING = {
> +        "sha1": "SHA-1",
> +        "sha256": "SHA-256",
> +        "sha512": "SHA-512",
> +        "md5": "MD5",
> +    }
> +
> +    hashes = []
> +    for hash_file in comp.get("hashes", []):
> +        with Path(hash_file).open() as f:
> +            for line in f:
> +                line = line.strip()
> +                if not line.startswith("#") and line.endswith(f" {source}"):
> +                    parts = line.split()
> +                    if len(parts) >= 3 and parts[0] in MAPPING:
> +                        hashes.append({
> +                            "alg": MAPPING[parts[0]],
> +                            "content": parts[1],
> +                        })
> +    if hashes:
> +        return {"hashes": hashes}
> +    return {}
> +
> +
>  def cyclonedx_external_refs(comp):
>      """Create CycloneDX external references for a component.
>  
> @@ -301,6 +334,7 @@ def cyclonedx_external_refs(comp):
>                  refs.append({
>                      "type": "source-distribution",
>                      "url": f"{uri}/{source}",
> +                    **cyclonedx_source_hashes(comp, source),
>                  })
>      if refs:
>          return {"externalReferences": refs}
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
