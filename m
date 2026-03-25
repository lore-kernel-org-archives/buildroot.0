Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39217109C02F
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37B381F11;
	Wed, 25 Mar 2026 15:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wlgsaRWBMWu; Wed, 25 Mar 2026 15:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DECDF81F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774450953;
	bh=E5TGeXlilMpn9+ZXRgzpvZz+2OBFHNQ6uwiPnRnV5Jw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gkul5WC95ho7u/+eAG7o338zJErdTM30nJb7Sjshl/Tf+3+zPxHC78zzhSS87zj0F
	 dpBolO0DMcOhNyWa4Z2UKuBc30+aE1eK/K3WfPRV5H8c121xn4+vHTDXv9q6PBTjUR
	 V2S+l/aT884EVGco5SCYz6gcfmYXwQfihmsLQMhyJjNzB8/TGinDtheIQ63n2rK12Z
	 4jeSUPfkjvLkzq48PAyDL/haH2oEA1NL+sIBehAG/pqHOJcdg9YTa6d1w/kdu2kxze
	 oxsInaDT+K5KiXWWoH2x3ouJPcSyWeWLQo3rw/iz8ZRHlygKDtSVkLBrBdhYyYADaG
	 bF4AaKCDBLwsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECDF81F44;
	Wed, 25 Mar 2026 15:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D95C81D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF67F40767
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sdCeLPfyOys for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 15:02:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 214C1405FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 214C1405FF
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 214C1405FF
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:02:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso25321215e9.2
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 08:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774450948; x=1775055748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m5Nb4pPC9w1OTdN+I0GrsjadiI6lZv2atH3a70dxArs=;
 b=qLQ+1El4lxNv1z395gsPJ3e5r2XwTrsUE1UhTwTsp+VTvSs3X71wF+2KuUJhTHYDsP
 5cmkjNINsmD3lQu814uWwsZNirnvqGKEhiEgGrOEKvkz7SbFVtq4VXDMofyM3u37+H9x
 /GSrYN9JlXNjXlJr3EKl/hnsDXxxPgpCKbuBRlb42+w7Om0hNw3nGLSJaEBgAQB1Is4H
 OU2anmfRG+TdgMbu9mMg62Zz4lXYHqTwZ+fAgOyLmcga/wQLH2pTDg+svSx3NmeCIltj
 adRB/+2cvABh9r7T69sUCN3m2Wgh3qR7XPrBqDP+LlehzNxOw6ooLLFGGMPZiurDPmPo
 xbgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrqghPYYklVAdqdi7bl29I6yXu8sf6ZhN/y5fx60LKlJePRJEz9Rr1h6GOmU6DBR5OihLIjm01wp0=@buildroot.org
X-Gm-Message-State: AOJu0YybBAj08+DGM4Gr/0L9PJN0+oicNkjOvqNZHM++yT3op5AMmq94
 331DxIefpiwk8K20q5JgXdhqRPzP4oi5y6BmAaXwymVgrag2xH3yaM4TupOXGYbt0rk=
X-Gm-Gg: ATEYQzxbBnnRI08PUT/+AcsAuq4zGGVXFARF023d+zVS7CbsWaOMynEtsV07PXANCbd
 Nw7IEhXQovTMdWPBLBA9WF4/40vaGEej/gf7Sn6ruE1Yzvqziq8198v+r2jxHD3SUfaFQdq6XrU
 E+7h2kcJbj4jywICvDJvhD1/AYUv/FmVu1na97PmRUcc9xVFMCnEvMetShXWaXSL404kD6V55BT
 pmeGtgyV2lem3fDwwYNV5KnkIvMqRYboUc3GoKjG01DIBGfNAEHMtImO+/kzDZY5tG5Oti2ZvWC
 KGPSmPVOAUQdgqXYo9H3jipwnSyQZquJRBKsuVoz7UZYzuV5pSm2UfE0PEYgiQP1ucL/kXl4axX
 MuaiDv9WHb+SB9LX9nY5zF+I/KHttHo8q7PQ6/7bI/8k9hQkntaUBs/Ei23XkvCJqGmTI962AzS
 pbSlP1F7OW8MOdTaxG
X-Received: by 2002:a05:600c:3491:b0:47e:e076:c7a5 with SMTP id
 5b1f17b1804b1-48715ff3363mr55678945e9.11.1774450947799; 
 Wed, 25 Mar 2026 08:02:27 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487172f909asm32602745e9.6.2026.03.25.08.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 08:02:27 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 16:02:26 +0100
Message-ID: <20260325150226.389096-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325133343.1008245-6-martin@strongswan.org>
References: <20260325133343.1008245-6-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774450948; x=1775055748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5Nb4pPC9w1OTdN+I0GrsjadiI6lZv2atH3a70dxArs=;
 b=QnRy31AxlRNPmDGpQz2fJfTs1qZytRDn6WAAfoWAu67VWr/SovRmSDqiTKW8ZaSn1f
 j8DgOS/JPFZ6F1PMJPHinUaWKFxJCWBm5z70rnrYdKtnQXjUqfmxA8rArA0DswSRzC/3
 8EwSYHjANC3R/+NeOo3ZJNCK4CdcEwMO27t1hyfeKmve0aChB7leFM7ORob0j4vbNU6R
 pDJTAdG5MQAgEay0FqQkYO6mmKQuJwiM4qQ5AUGmgcJUJDjY6mvo9TckIE4cyNuhJn9u
 x0mWUkY9Dt4WlvtqGsG7JvyusAac+fkOpSjypsjRtrAHTluFI5lCGU98ekkKa50FeFLe
 qBDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QnRy31Ax
Subject: Re: [Buildroot] [PATCH v3 5/5] utils/generate-cyclonedx: add hashes
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

Acked-By: Thomas Perale <thomas.perale@mind.be>

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

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 42 +++++++++++++++++++
>  utils/generate-cyclonedx                      | 34 +++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 9c2bd2bc9180..29f492803e10 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -164,3 +164,45 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  }
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
> +                    "uris": ["http|https+https://mirror.example.org/foo"],
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
> index 3946380ae3ef..4ef0548bae51 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -278,6 +278,39 @@ def usable_download_uris(uris: list[str]) -> Iterator[str]:
>                  yield parts[1]
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
> +    mapping = {
> +        "sha1": "SHA-1",
> +        "sha256": "SHA-256",
> +        "sha512": "SHA-512",
> +        "md5": "MD5",
> +    }

NIT: Use `MAPPING` to show it's a constant ?

> +
> +    hashes = []
> +    for hash_file in comp.get("hashes", []):
> +        with Path(hash_file).open() as f:
> +            for line in f:
> +                line = line.strip()
> +                if not line.startswith("#") and line.endswith(f" {source}"):
> +                    parts = line.split()
> +                    if len(parts) >= 3 and parts[0] in mapping:
> +                        hashes.append({
> +                            "alg": mapping[parts[0]],
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
> @@ -294,6 +327,7 @@ def cyclonedx_external_refs(comp):
>                          {
>                              "type": "source-distribution",
>                              "url": f"{uri}/{source}",
> +                            **cyclonedx_source_hashes(comp, source),
>                          }
>                      ]
>                  }
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
