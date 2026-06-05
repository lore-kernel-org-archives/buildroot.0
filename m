Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2088ACD8C85
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E125882B34;
	Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEf3yRl57wsg; Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA8282AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663836;
	bh=0qmgj3yeM45rog7Lv04urq4t0np4uiaSkN1Nbn6FMe0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LthQn3dnvE2EcC+ohcyVNK0ehQBOw9Vz7rl2TyHifpkf5IwyVMMA5cdlwtYVG4B6V
	 ak+0j9JFO9+nfq6qymC1vdQaQ8JkGmq2W/B5FXI+jA8CGAQ2uUOMTpB9kmUWrLf6Wq
	 tHV0is64nmq101RehyhseTRK+oSzhkSBobtz+eEc6jhfvlgveVr/Ucf33Oh6acGI1P
	 8Et6So2rhjF+LHAFjmsDKmZ1dJPat6m66FPmXp3gLJHhF8j2K4AncMVO/ZHoyUKFZ5
	 iGUZ0ZKCrsFDVbt4IeS8CpIJA8P9WUHlsqEZjVJRbquPPzDuQEcLJhdIvrWctfOUo6
	 7GGnXbErrR//A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA8282AA2;
	Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66B16F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C80841F70
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTuS2UxUwk3H for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBE6A41F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE6A41F53
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBE6A41F53
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso21750535e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663825; x=1781268625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DgGF2mlhxRqV1BDgseao35iqCAewhWTba3RENuGTIj8=;
 b=Jix1Y2NvJmCSxp6JOIP+3faMp5t3z7RkhKO8laj7x6FqRKAO3l+ifOmXa2L+cGVkXM
 k5zcmJ6WsVtQk0reCsgqjryMmCAeMvRIaNSHSOjqaW3vFvsN8itQ0HeVipGTWHai2yrN
 J3Jaw1wczrv0EE13hi68wtyDxBIWV2i+DVwYakRw6RUetKqwbFSUGbvSbQBxMn1yTH4R
 vfTQdCYbbY/zdIBb+/fDStFf+4a/7LjgerkYfQkpRUzbW8H0NzxMQgzIaWya19HkhSrr
 ooEBKWHTni2b2uXaNQbRivB5tWuQIxGAWs1+ztD2dg1tR9ugy+2NMXWWqkGoyUWvlBKg
 hhkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1j6PIcaJmhPhtvTcZFLlIHiyTVObksOwsEQdpl4jpaf35P3ewRF3OE3CO59TPgkm/Xsgznk49TJ8=@buildroot.org
X-Gm-Message-State: AOJu0YxDyihzZartp93gICHsHCXyQVNltPyoQrSaMtPfzcbziG1nLs7/
 P/iBxrdfGe6cgfltVsHWS2IXVctjYM7+0nHIhmMs2XfjBwp9P+oj9dKk7f+/J+PJrmo=
X-Gm-Gg: Acq92OFWvukeZJCMFUqRRPUGcYkwBWsO6ZY/2E4V4L/Q74VsSknCdk9Gou28Ry7Dkjg
 g8woP/4+KRaymeTtDR3oyOfZQhIpeFnVjilWHMDcbHkBuwyNJFyVjXahu62ZLPmqM5HbEZUK3Qg
 vgscfJiwdzo5Vp8vNg6dvjBn3YeRh3NlzG1Av6KW73GePeEP7mh05R9pX5Wza+3n3F3RZuT50V6
 XmHMpp58FB8YUc6ndW2W0p4jUuqIiAsfQxgJ1fqWvQtBlBNAkGA63RneRA2vnF2hj4xFFvwWiYc
 lACgfyIF1xdjyatgNIntLZaab8TuF92M57npDWF+Kluw+2din6o2hzmEJ6Ygdbnj/3hQNkIDn5+
 X7kLIrQLLL4MKYV9eZXLGqnzfzm0f1HaJzizfvzA66nBvEc2Tn9Gzeaf32yjV4SmvM3mfEXHDI2
 pL7nsICxUNtYCAN5XUm6lusuPuVQ==
X-Received: by 2002:a05:600c:3f14:b0:48f:e230:2a1d with SMTP id
 5b1f17b1804b1-490c26460b8mr55145235e9.32.1780663824999; 
 Fri, 05 Jun 2026 05:50:24 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcae2sm26939917f8f.6.2026.06.05.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:24 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:24 +0200
Message-ID: <20260605125024.273364-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-7-martin@strongswan.org>
References: <20260409081401.2060709-7-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663825; x=1781268625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgGF2mlhxRqV1BDgseao35iqCAewhWTba3RENuGTIj8=;
 b=hbhSsSZHkXRZBL1wUzHq0tEML4SXqbO5Z96jpnEBWoEBX5xfMat2npIhXWvh/ocFn9
 6WxLfOlOmbxVFUCeEFU3KCWAUo1DYUL2rHevNt2BJtEbgeayzQxdTdY8Kw9fTbJgAQCm
 3siccK6FZXzL9T67YU8GzMqzFqoU5pC/OxYB5scx25Ygz6rcNUpmBN+yssg8DsxQtFYi
 wCkJ5j2dLnWVEJJlB0spmDLFY8uj5vKedxZRfuEPiyjctWJHWMo0BXRO6Vaqgv3bWWVH
 rUY6VZGu14G88nt+o/Z4vkq+agvsDoRnF2vhjh2VFFjBxlYVsrFU+98A2PSqGbkxfUCE
 X50Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hbhSsSZH
Subject: Re: [Buildroot] [PATCH v4 6/6] utils/generate-cyclonedx: generate
 vcs externalReferences for source repos
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
> Some packages do not have a http/https download URL for a source tarball,
> but are acquired over a version control system like git. If so, add
> externalReferences of type "vcs" for such URLs.
> 
> As most git repositories use a https:// transport that may not indicated the
> repository type, add a "comment" due to the lack of a better mechanism in
> CycloneDX.
> 
> While the hashes are calculated over a tarball created locally, it still may
> be useful, so add them for "vcs" externalReferences as well.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 30 ++++++++++++++++++-
>  utils/generate-cyclonedx                      |  8 +++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 84f94f050760..77690b1b98bc 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -147,6 +147,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
>              {
>                  "source": "foo-1.2.tar.gz",
>                  "uris": [
> +                    "git+git://git.example.org/foo",
> +                    "svn+https://svn.example.org/foo",
>                      "https+https://sources.buildroot.net/foo",
>                      "http|https+https://mirror.example.org/foo",
>                  ],
> @@ -160,10 +162,20 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          self.assertEqual(
>              foo["externalReferences"],
>              [
> +                {
> +                    "type": "vcs",
> +                    "url": "git://git.example.org/foo",
> +                    "comment": "git repository",
> +                },
> +                {
> +                    "type": "vcs",
> +                    "url": "https://svn.example.org/foo",
> +                    "comment": "svn repository",
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> -                },
> +                }
>              ],
>          )
>  
> @@ -183,6 +195,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  {
>                      "source": "foo-1.2.tar.gz",
>                      "uris": [
> +                        "git+git://git.example.org/foo",
>                          "http|https+https://mirror.example.org/foo",
>                      ],
>                  },
> @@ -194,6 +207,21 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          self.assertEqual(
>              foo["externalReferences"],
>              [
> +                {
> +                    "type": "vcs",
> +                    "url": "git://git.example.org/foo",
> +                    "comment": "git repository",
> +                    "hashes": [
> +                        {
> +                            "alg": "SHA-256",
> +                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
> +                        },
> +                        {
> +                            "alg": "SHA-1",
> +                            "content": "2222222222222222222222222222222222222222",
> +                        },
> +                    ]
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 382d91ce55af..4166abd9ff04 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -325,6 +325,7 @@ def cyclonedx_external_refs(comp):
>          dict: External reference information in CycloneDX format, or empty dict
>      """
>      SOURCE_DIST_SCHEMES = {"http", "https"}
> +    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
>  
>      refs = []
>      for download in comp.get("downloads", []):
> @@ -336,6 +337,13 @@ def cyclonedx_external_refs(comp):
>                      "url": f"{uri}/{source}",
>                      **cyclonedx_source_hashes(comp, source),
>                  })
> +            elif set(schemes) & VCS_SCHEMES:
> +                refs.append({
> +                    "type": "vcs",
> +                    "url": uri,
> +                    "comment": f"{schemes[0]} repository",
> +                    **cyclonedx_source_hashes(comp, source),
> +                })
>      if refs:
>          return {"externalReferences": refs}
>      return {}
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
