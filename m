Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167DD109C025
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 14:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C877861366;
	Wed, 25 Mar 2026 14:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMTFMQyA9k42; Wed, 25 Mar 2026 14:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BBF36136F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774449295;
	bh=6HrQg1MW6Ts1qASJIetyUYlNOs0scYg5oB9nuOl/t3I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b7sumCpnon5Lj2N8GiO1d/wtPEd/QVYLA5edNQRYhlBB+GDNn2PkOT/fcX5DcyoTD
	 ZzAFRcnSvua2X0DMagoKWkOtnZ+vhxGTaqeMtLgNAZr9QqU9DiOVIgE0Cg7AoWZ/KS
	 Y891q1MMCpvwmDA72iVAZKouCixRZgOldUWfKyLexs48ucSI15KteQLm6VPWnf1sOz
	 0+YhUT8/0XerTrjbZzRlbtQfqCdkKqkoryP3Yolx6Kjxvzc/2sOwUo0HaNGH2SrMf/
	 1TLdbzFgsb2sJrblKxnptvXy2d/3eYvpIwd5KfNdPKKkHEiCbKvsMo1QaFAJsF3D4M
	 EWPcSBRZ/a9DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBF36136F;
	Wed, 25 Mar 2026 14:34:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB081D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D5D06136F
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe1FWGLogEyI for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 14:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D4BC61366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D4BC61366
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D4BC61366
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:34:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso656480f8f.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 07:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774449290; x=1775054090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AU+RTuCvezSeSc5cXNw6pdgGpWC2IQQsTb7rCq6Wu3s=;
 b=QIOC+xv0YAKQz5EdO2rbUueXkj8+c+dbOu7k/YlHStvd8gfO4dtN68LNdSk1g1xaYo
 RR29qfdh/4jEjM8WclcgVrmQAEQFvu61I2LvyA7cjtSaBJNgflRG6CFEDjgsL3eIdi9N
 6bPcPqNztGA6xydlm8Un3VuM0BQks5rd7bv35yWRE48RLnGk0ezDnuVO/ywMZq5jDVGo
 NUr9RHZVTEG6BqotSEXJWK0MK1OXiC9icH+FWEhNs1ufQCcspYa7cv8+Rq19F5JhBFzg
 t5a5mlcNuh1y/VYu8m6dELMdbNmUjchAbqC2ZjQ55Kj0AUUBBe30AFupz+UksrCZx1Dn
 gNJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC5uPsVnsgdEqvVuX+EmSV/Ta3nuDMxbqzEuVFkzCU8pLXRBxd2Mb0YWhwH9vxaeLVGWIqjtJ89y8=@buildroot.org
X-Gm-Message-State: AOJu0YwzwBjJD0nz3uOGt5BRkGR4HxtBVS6pEJ8dpda0/RGwjEg5K/ct
 IzHc1wt6qs3SVUrK6oxN9E0r7V9VuprEvZzS/FxhMPch2NwyIL4+nziruxxfpON8pcOa1VCfsAC
 B6bQI+1w=
X-Gm-Gg: ATEYQzw1r3d6sAS8TXmFWcafaLG19ch4A7FSlWRev/RvEr0lHjElnEzRNccaA97XFii
 HvhcF+/d8hTJ6TOQZW9NeLzFkX/dKYONiisayCXKHqxUAm5rUE3xkKoiDUuLfGZDKjzkjQVgTWm
 zBVvUxtflrZVkSJc3cqsmtDotev5CG6bZFa+Lk5JtE9S2BIu9Za8uflTSqEPLrUYPouQDJtQR/x
 QGoyyExQlFATZBNhAyt0C1QOH1rxNinZCEvhME6ofrXRdhy+7p0xwToGZlMnIp44sr5MPIyOTB3
 vn8GuZPxSRKRPVhtTZlv30mnVX156iYp8dnfjYMnbxulF3uFax26yd/0PXi72/VUoapmxLH8Yu2
 Aet9FNpK4pFS+um/t5sQe8TK09uDgI549sfm1DyVopecBybysSWZPAarKGlMHpTpNSU7wN7WHg/
 BX/7ivxnLMAiZ3A15A
X-Received: by 2002:a05:6000:220b:b0:43b:83a8:25ca with SMTP id
 ffacd0b85a97d-43b83a82639mr9594109f8f.1.1774449289692; 
 Wed, 25 Mar 2026 07:34:49 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cefd7sm154618f8f.17.2026.03.25.07.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 07:34:49 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 15:34:48 +0100
Message-ID: <20260325143448.381493-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325133343.1008245-2-martin@strongswan.org>
References: <20260325133343.1008245-2-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774449290; x=1775054090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AU+RTuCvezSeSc5cXNw6pdgGpWC2IQQsTb7rCq6Wu3s=;
 b=if75ucyozJwrNwdmW3Ke4+r+1MoVdWf9iw8aE0EwGhMoF14d3oPvXsfxSNqXQx+sgS
 Vhzq3DwoWHailJI8Oc6sRW0uMKIamfaJCII/FreIKyHlnRbFAzZR0h/ZGnvcVRIRWP7F
 Tjn48P4gm0DOlv74yEQfmm0T9/ayvnMOO6JBYGXc7UbbCkCRkSrZBREcQ1C2H3V8xBLz
 V0dpO79f/yTMBBdLE8NnKe3i/tPMrYcuPasuhUSv1jq1JG8dlRZkwMc8maB6tbHHU8qD
 bGxmnQcrt7mS5qdBZvPSd10jlwBjtPS8/jeEGYX+fuDkD3OsMtZarlP00FHiig5ShJmb
 8SUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=if75ucyo
Subject: Re: [Buildroot] [PATCH v3 1/5] support/testing/utils: add basic
 tests for utils/generate-cyclonedx
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

Some last remarks before I approve all those changes. Thanks again for
re-working your patch series.

In reply of:
> Introduce unit-tests for the generate-cyclonedx script, covering basic
> script invocation, patch CVE extraction and virtual packages.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 136 ++++++++++++++++++
>  .../cve_upstream.patch                        |  11 ++
>  2 files changed, 147 insertions(+)
>  create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
>  create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> new file mode 100644
> index 000000000000..20f67b48a7a8
> --- /dev/null
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -0,0 +1,136 @@
> +"""Unit tests for utils/generate-cyclonedx."""
> +
> +import json
> +import os
> +import subprocess
> +import tempfile
> +import unittest
> +from pathlib import Path
> +
> +import infra
> +
> +PATCH = "support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch"
> +SCHEMA_LICENSES = ["MIT", "Apache-2.0", "GPL-3.0-only"]
> +
> +
> +class TestGenerateCycloneDX(unittest.TestCase):
> +    def setUp(self):
> +        # Provide a fake SPDX schema so the script never hits the network.
> +        self.schema_dir = tempfile.TemporaryDirectory()
> +        self.addCleanup(self.schema_dir.cleanup)
> +
> +        cyclonedx_dir = Path(self.schema_dir.name) / "cyclonedx"
> +        cyclonedx_dir.mkdir(parents=True)
> +        schema_path = cyclonedx_dir / "spdx-1.6.schema.json"
> +        schema_path.write_text(json.dumps({"enum": SCHEMA_LICENSES}))
> +
> +        self.env = os.environ.copy()
> +        self.env["BR2_DL_DIR"] = self.schema_dir.name
> +        self.script = infra.basepath("utils/generate-cyclonedx")
> +        self.cwd = infra.basepath()
> +
> +    def _make_show_info(self) -> dict:
> +        return {
> +            "package-foo": {
> +                "name": "foo",
> +                "version": "1.2",
> +                "type": "target",
> +                "virtual": False,
> +                "licenses": "MIT",
> +                "cpe-id": "cpe:2.3:a:example:foo:1.2:*:*:*:*:*:*:*",
> +                "patches": [PATCH],
> +                "dependencies": ["skeleton-baz", "package-virtual", "package-bar"],
> +                "ignore_cves": ["CVE-2025-0001"],
> +                "package_dir": "package/package-foo",
> +            },
> +            "skeleton-baz": {
> +                "name": "skeleton-baz",
> +                "version": "0.1",
> +                "type": "target",
> +                "virtual": False,
> +                "licenses": "Apache-2.0",
> +                "dependencies": [],
> +                "package_dir": "package/skeleton-baz",
> +            },
> +            "package-bar": {
> +                "name": "bar",
> +                "version": "0.2",
> +                "type": "target",
> +                "virtual": False,
> +                "licenses": "MIT",
> +                "ignore_cves": ["CVE-2025-0002"],
> +                "dependencies": [],
> +                "package_dir": "package/package-bar",
> +            },
> +            "host-tool": {
> +                "name": "host-tool",
> +                "version": "0.3",
> +                "type": "host",
> +                "virtual": False,
> +                "licenses": "GPL-3.0-only",
> +                "dependencies": [],
> +                "package_dir": "package/host-tool",
> +            },
> +            "package-virtual": {
> +                "name": "virtual-provider",
> +                "virtual": True,
> +                "type": "target",
> +                "provides": ["package-foo"],
> +                "dependencies": [],
> +                "package_dir": "package/package-virtual",
> +            },

Here I think there is a mistake in the 'virtual' package declaration. The
"provides" property should be present in 'package-foo' instead.
See how "go" the virtual package for "go-bin" is declared when running `make
show-info`:

```
"host-go": {
    "type": "host",
    "name": "go",
    "virtual": true,
    ...
    "dependencies": [
        "host-go-bin",
        "host-skeleton",
        "toolchain"
    ],
    "reverse_dependencies": []
},
"host-go-bin": {
    "type": "host",
    "name": "go-bin",
    "virtual": false,
    ...
    "provides": [
        "host-go"
    ],
    ...
    "dependencies": [
        "host-skeleton"
    ],
    ...
},
```

So in this make show-info example it should be the following if i'm not
mistaking.

```
"package-foo": {
    "name": "foo",
    ...
    "virtual": False,
    "provides": ["package-virtual"],
    ...
    "dependencies": ["skeleton-baz", "package-bar"],
    ...
},
"package-virtual": {
    "name": "virtual-provider",
    "virtual": True,
    ...
    "dependencies": ["package-foo"],
    ...
},
```

> +        }
> +
> +    def _run_script(self, extra_args=(), show_info=None):
> +        data = show_info if show_info is not None else self._make_show_info()
> +        completed = subprocess.run(
> +            [self.script, *extra_args],
> +            cwd=self.cwd,
> +            env=self.env,
> +            input=json.dumps(data),
> +            text=True,
> +            capture_output=True,
> +            check=True,
> +        )
> +        return json.loads(completed.stdout)
> +
> +    def _find_component(self, result: dict, name: str) -> dict:
> +        for component in result["components"]:
> +            if component["bom-ref"] == name:
> +                return component
> +        self.fail(f"component {name} missing")
> +
> +    def test_default(self):
> +        result = self._run_script()
> +
> +        self.assertEqual(len(result["components"]), 4)
> +        self.assertIn("vulnerabilities", result)
> +        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
> +        self.assertEqual(len(vulnerabilities), 2)
> +        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
> +        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
> +
> +        foo = self._find_component(result, "package-foo")
> +        patch = foo["pedigree"]["patches"][0]
> +        self.assertIn("text", patch["diff"])
> +        self.assertIn("content", patch["diff"]["text"])
> +
> +        host = self._find_component(result, "host-tool")
> +        self.assertEqual(host["properties"][0]["value"], "host")
> +
> +        names = {c["bom-ref"] for c in result["components"]}
> +        self.assertIn("skeleton-baz", names)
> +        self.assertIn("package-bar", names)
> +        self.assertNotIn("package-virtual", names)

I would add then a test case that depends on the "package-virtual" package to
make sure the dependency to "package-foo" is correctly resolved.

> +
> +        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
> +        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
> +
> +    def test_virtual(self):
> +        result = self._run_script(["--virtual"])
> +
> +        names = {c["bom-ref"] for c in result["components"]}
> +        self.assertEqual(names, {"package-foo", "skeleton-baz", "host-tool", "package-virtual", "package-bar"})
> +
> +        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
> +        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "package-virtual", "skeleton-baz"])
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch b/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
> new file mode 100644
> index 000000000000..f18e51ebb9ec
> --- /dev/null
> +++ b/support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
> @@ -0,0 +1,11 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +CVE: CVE-2025-0001
> +Upstream: https://patches.example/foo.patch
> +
> +diff --git a/foo.txt b/foo.txt
> +index 0000001..0000002 100644
> +--- a/foo.txt
> ++++ b/foo.txt
> +@@
> +-foo
> ++bar
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
