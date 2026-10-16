Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82474CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC4840A23;
	Fri, 16 Oct 2026 15:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yADKtRBvOHzd; Fri, 16 Oct 2026 15:03:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 541B340A2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162985;
	b=kVCDVrv4li3etZt59RfdRWkx/dVZvZfIk5NhEDbnPkPGlRqga0Y7DJ9cs2XaZnHq6nFz
	 cWI2zzbk/i6m1emQDpYHifTyeGhudncsb8a13Y1gzD7F0zpcJeDXJwFkEC0sOHSq25yAB
	 xQFm2zVjBcGJ0m1c0GoZ0aEFda8+MYZSm4Oa87TzCoDV49lQyMUOpDh1mAf7zM9lL2l14
	 64LeswW+ovsyOJAMtcVebEdwZkhIYVkzHoUZd/3MxFk9qcaBSAnM2cvzMYWOVtR7ehBvz
	 B5zQ5O8sVw5TC9MIoAdhjQTnz7e+RffNCOJQ/ZayTIc0XnO4x0WAhbUbeo3eTE/E8Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B6vlt8YzgcELyYKhYXoFcaoRFbemWSRQ6OHbRTgC7D4=;
	b=HVGjKNd0j5/8XuubYvKJdyM1VDX7Nhe4g9tSAD41tziWQgqNEP/XhRZhPYlg+jI9ZGLG
	 kMna+Pbur3nOlrc15E4O+0ENd8X76YnLBy66uqF84MTVC6VU7YWbkDJQmsi9wQu4E/T4p
	 CoYjKZw+yG9/8ydSAmxGQizWvF6ERcGo9P8NK01okdiQ1q/NT9MkRhcmxqkHIlY0KsLPF
	 SyJeFn5bTE+YhsdG6Dg86FFVJsoViorajl0ZTGVcO2Bls4k6n0t5iHqNvEI0Y+7uLgDNn
	 KgIKLE5L9gUPLjs173sCxiVeO2JWTPp5aDoTbGdgBAZtJtjqek4m+m//RSGUX0VrLyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162985;
	bh=B6vlt8YzgcELyYKhYXoFcaoRFbemWSRQ6OHbRTgC7D4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=maZVUy1IKv6K1i/IG+Ox00uux9TKHi2dtLStim39+JjUpOBhv9WAWNoh1G1jbcWDH
	 FTy9O3wR7ilhV685CBwU/O73wml5vkZpT0qPRY7AxmDjJD6SN0TBTXRyD2TqF8fPsm
	 9+1H/dvqMYJW7gwz8jWqrCF+Fw3BUECieDO45K/twII7CB6yH/Kqqj1zmj9Ffb/Lc/
	 Hhbv5JilKofJeiuv8qC+o2ZW0F/dXX9a/OABgwzOX9mYCg6jmVEt9GF4k774A0+8sy
	 qhLFTReDuQIcFAGC8QCG504/7DVErdwZt7noACCSKgG39NlhyBaF+1E5KbTVORjJHi
	 e2gvCwJMk0bIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541B340A2C;
	Fri, 16 Oct 2026 15:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 679FA7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2134016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3ILQ8n3uIMT for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 46A1E40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162982;
 b=snpAgZk4RKKs7Qjd0NGjPB5PfVNIEzF1QVWUrvtxfYORt0wXxPg6zL2rNlRQMxK5wbJC
 OWubRCy/T8iQwzhHH7+kKzABxZDR5k9ZNu5eqzbpBOTDgx9jj8TfzaNJSaZKwvoAASD2j
 MmqsSyXyqKWE0oL8ekIYdT9D1OQzB5OCEh6Aro735QFLLhWwl+QAxi+aTtucu9Al0EKrR
 tGZ9O0HxTt78hftC3NUzZqvKkdfUmEUnSa5+zcn6YdqLBJ/Mkm7tkmiV0t2aTg5pCGmL/
 NsRk0i42jcpqkcVItbqfXiw6skqs716K4XDeelsVZ2C+4Yzzdr7JQRDrUN6FDbEw0iQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162982;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QIb0+dAHYynFzcxrXqgAuhLi11mEWfuGAiL7/2bQIPE=;
 b=Ez8GfzeRkJkKgXfI4El19waB+DG4XS0Lk1EsLR9AokSwvEJOytMwEn4u2Fw1rdjF37bn
 3MVdLJlp7rZtMoDPMnVLUSyU5rt49dTpEfEKCRvgBcYLwOAJyOGy1cqYhHzmDwGuu6Qxp
 fWXoYA3oRujQVNGqESaYYZEhH13ZXy5gvwXQCuB8T1DCvt1T6o7f43Fka6KZgBXmIan/3
 vN8Y4FLd+26Ree4JtN8vNfeWGqRyd90DUku1pS0S3qwYAdAjLyIhmFutgKAdI14uAY59Z
 uUTdAlNgSwVrg+V9S0naIqdBULP7kP8/EzohFM8ZSfiXD1MIn1BDQincIBwd6cdg95g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="JJlMf/l8"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46A1E40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so60548f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162980; x=1792767780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QIb0+dAHYynFzcxrXqgAuhLi11mEWfuGAiL7/2bQIPE=;
 b=NFHFkY1uM+T+b6WziWIKTnjVR+EOte3ReHpw1iPkJEcvklvupB3+0OInsate5uKN5L
 AJumItdpqcntX4EvXJtJNlhpl+uZRQkZFSUNoTgCyTsirr/PSBKw0gmla7pv4QIwRTqp
 CxJvmuOfIAMsBvPq1OnRwWd73MuH4B/evuW2bUFk/EiUgf76fVDAZ5RmV51BM+IAaDgh
 OXzRNzHolev6hSHWyYMlTxC7KBiA3K+r9MnLfy86E3NoBsHMP6EqXlztVpuqQVzBl1k9
 kurk8JwCagHQiPz4qcqeDLKDbTbqrlmWTkADGp+8uPkyY1suTcH1vAbW8obidA/Hao6b
 X8bw==
X-Gm-Message-State: AFq9FYKs3n95YUvCwAnf1HbCy1dV8f8bfcD7/6b9F6+k9IktzG0ayPR9
 gDNm6kTX54sbsIYdcEzDZ+Ss27pDJeH5L6Erde5tX+IjrPltiibSESr0knPtODyzacAA83x8BcP
 277A4dz4=
X-Gm-Gg: AYBFou211rK/e+ejPwWjHVeORkiP2rOxk3+QMi1T6wnralEKVB/wsg86DZnlD/hEKlQ
 XEcdIdcBCVD5NKxBITQajQfbMMaZy98dyMrtBCDbQ/oenKUajrvKFHuli3woJN5dWELNP992wnw
 ONjQjDlXAZFXfxonxjg8aZFAE2hIOPVoCoKJTTvCrptTKBWvg8sbG2Dsrgy/i3RvqCcWg1JUknz
 87t8g0z2FXClgxR8D2OyT+vV+EQnVXaJ+PfwDC5c6VY+lASvf0Cq3Cj0wuF/olh8aCPNGIkwUKF
 y23K4lcVOwY4d2mxt97fhpL1I8VMwZWQGIK11JwXlm7RV0rp7Pca5Q/pLsNTtrSC+/hKu6u0XQj
 hWwP8KDixghCBDG9xv/0T4MnXe7jbiE50f0UDXU8T63R4XwNPSmwehUysnuhQ5Yllf30OhOIb6H
 plr4wWaOD4U6cB0e+Ss3cEd/TiVhkWveoETxpQbvdf8hOBYWtqEOIuWnLsxjq32bt4wrTQuEBp2
 Z/zdOk7r5x/ojzo5XydZekGOh5qBiDIXamsGI7U8A==
X-Received: by 2002:adf:f0cc:0:b0:48c:58b9:f17c with SMTP id
 ffacd0b85a97d-48dfae645admr5743001f8f.12.1792162980106; 
 Fri, 16 Oct 2026 08:03:00 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm5736204f8f.35.2026.10.16.08.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:59 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:56 +0200
Message-ID: <20261016150258.60807-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-9-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 9/9]
 testing/tests/utils/test_generate_cyclonedx.py: test vuln with different
 analysis
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
> Add test for CycloneDX vulnerability generation.
> 
> If multiple packages ignore the same vulnerability but provide different
> analyses, the generator must produce multiple vulnerability entries with
> the same vulnerability ID but different analysis information.
> 
> This situation can occur when generating a CycloneDX SBOM from the
> output of 'make show-info-all'. The resulting SBOM includes packages
> that exist in multiple versions within Buildroot (gnupg for instance).
> 
> In such a case, one package version may ignore a vulnerability because
> it is not affected, while another package version may address it through
> a patch.
> 
> Therefore, multiple vulnerability entries must be generated, each with
> its own analysis and reference information.
> 
> This add test case for such scenario.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 69 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index b91add2349..2f1109b178 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -6,6 +6,7 @@ import subprocess
>  import tempfile
>  import unittest
>  from pathlib import Path
> +from collections import defaultdict
>  
>  import infra
>  
> @@ -100,15 +101,23 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  return component
>          self.fail(f"component {name} missing")
>  
> +    def _map_vulnerabilities(self, result: dict) -> dict:
> +        vuln_map = defaultdict(list)
> +        for vuln in result["vulnerabilities"]:
> +            vuln_map[vuln["id"]].append(vuln)
> +        return vuln_map
> +
>      def test_default(self):
>          result = self._run_script()
>  
>          self.assertEqual(len(result["components"]), 4)
>          self.assertIn("vulnerabilities", result)
> -        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
> +        vulnerabilities = self._map_vulnerabilities(result)
>          self.assertEqual(len(vulnerabilities), 2)
> -        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
> -        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 1)
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0002"]), 1)
> +        self.assertEqual(vulnerabilities["CVE-2025-0001"][0]["analysis"]["state"], "resolved_with_pedigree")
> +        self.assertEqual(vulnerabilities["CVE-2025-0002"][0]["analysis"]["state"], "in_triage")
>  
>          foo = self._find_component(result, "package-foo")
>          patch = foo["pedigree"]["patches"][0]
> @@ -244,3 +253,57 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  }
>              ],
>          )
> +
> +    def test_vulnerabilities_with_different_analysis(self):
> +        """
> +        If multiple packages ignore the same vulnerability but provide
> +        different analyses, the generator must produce multiple
> +        vulnerability entries with the same vulnerability ID but different
> +        analysis information.
> +
> +        This situation can occur when generating a CycloneDX SBOM from the
> +        output of 'make show-info-all'. The resulting SBOM includes packages
> +        that exist in multiple versions within Buildroot (gnupg for instance).
> +
> +        In such a case, one package version may ignore a vulnerability because
> +        it is not affected, while another package version may address it
> +        through a patch.
> +
> +        Therefore, multiple vulnerability entries must be generated, each with
> +        its own analysis and reference information.
> +        """
> +
> +        info = {
> +            "gnupg": {
> +                "name": "gnupg",
> +                "version": "1.4.23",
> +                "type": "target",
> +                "ignore_cves": ["CVE-2025-0001"],
> +                "virtual": False,
> +            },
> +            "gnupg2": {
> +                "name": "gnupg2",
> +                "version": "2.5.20",
> +                "type": "target",
> +                "virtual": False,
> +                "patches": [PATCH],
> +                "ignore_cves": ["CVE-2025-0001"],
> +            },
> +        }
> +
> +        result = self._run_script(show_info=info)
> +        self.assertEqual(len(result["vulnerabilities"]), 2)
> +
> +        vulnerabilities = self._map_vulnerabilities(result)
> +
> +        self.assertEqual(len(vulnerabilities["CVE-2025-0001"]), 2)
> +
> +        ignored = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "in_triage")
> +        self.assertTrue(ignored is not None)
> +        self.assertEqual(len(ignored["affects"]), 1)
> +        self.assertEqual(ignored["affects"][0]["ref"], "gnupg")
> +
> +        resolved = next(v for v in vulnerabilities["CVE-2025-0001"] if v["analysis"]["state"] == "resolved_with_pedigree")
> +        self.assertTrue(resolved is not None)
> +        self.assertEqual(len(resolved["affects"]), 1)
> +        self.assertEqual(resolved["affects"][0]["ref"], "gnupg2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
