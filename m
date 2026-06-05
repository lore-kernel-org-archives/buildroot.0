Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D1CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91451610B7;
	Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU90hQDXEoBR; Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32D2610D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663830;
	bh=lw4sPWMEG69/PDChJyanPPLcbstnRUF4mLpa4GEcHd4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DUGDhZXlLf9XSqO8GIoXItUMDt2qPRPX3/J+HLaBtV3aQlnkqxhq7GFUI/GDUt8z1
	 zmarRbH+v0NpuhZyXOHFmcv3zV3sA4/M3oDoi6vfztzXAwpy4GP8KDopTwByF8/oA/
	 zXZyQNzf7TJBjA616r3BWdjzwQai7z979i2oC1vnvMJx7C3YKzDx67YQPBBnkRk9JB
	 cyVZf0fRHINRes0rpNiHQl+Kmypm4AsFNsXIxi/QBQ+NeqtGdRi3Kq13xN6ICZFFRX
	 oz4MbzHtMSaGJu/cpLDV1jG2qAWFnf2DJJpZv20FGG9USyRF4u2k4+KvBbmUEHgJQH
	 Bz6Vhepnyo9Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32D2610D7;
	Fri,  5 Jun 2026 12:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1729EF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B854037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_6XrBgcFECC for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECD974037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECD974037E
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECD974037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso1495153f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663822; x=1781268622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Inoi/TbkL+wlVxie76ZbmQ4kq6u1t5QX3AChu9KE0Ys=;
 b=hNBlASb256R191lBK/vuX0KUfnJS9ReL5AaoozIyJFXzLY9exOANB+VliF3G8VYbVh
 NkOs4UBCYGJaFff5zP5fy5cMb5v9G7BwGJs3o9nfV7LW5yagO+kBQc+HXtbg69omjndw
 i144Ju0n2RzfRwf91tmJO+lngkseCWHfvoZYq+EoDsREQdS3ALmJ7McYdXZEYYlX1/De
 F7q8bFTMTjVX1fmIN6uQAgKbtd7MJCyWnCBdgNlLbZ2trKKIqYq5+ma4nnvO9ZKvXoiJ
 RjxLZJ5eiA1neXWoIgtLZ51rTk9yT1oHLy6aVXv5vWIhEa6YIm/FdE8p8jmaV7idTPF8
 pP2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+aWCWjHpRns4EfbflqzUu/MHNfwQqBM6MJUQRZg9zX37UwpYhFa+ziBGHpalIqj9KkG6WWi3ISAV0=@buildroot.org
X-Gm-Message-State: AOJu0YwBN3ITUmTqsPoRoxFNFjQiUwCxqqGmz8LtjPm/JqbgJPWOCuBa
 D75v+X8qIQUXBvUD/RktfznW6n7IPLNMRyIRuHdKKV3l2clIbEUBNtldTBf+B6h55h+e9gFxbkx
 9y1xc
X-Gm-Gg: Acq92OES7DmJBuIWeRlBggNywQYSxZ1/nCTULMZgHPMMJvTOkw4aeiAR+5Qda7+HZda
 o1Gw+tRmdPa/Tf395rRcIyw7nGO2mKeN4IEWpG8FSDoQxjk6lc1X62eY2kpwhvObCdSkSU1FRvi
 P9y+EpNQj1L1BqIqb89UXnktzX4dSnWVvzRv05pdamxt2x7Qi6fCe/ZNk0Ule7ZiVsbk6ap56B1
 2OVxmds1Xc5D6zWsbMdeT528oBseJflj8Y9HYeMKPv8ekRUgYJqxKXUlBksPjilmoqNnE5/fwY9
 RixrqVucTAvhQDeWrUaQa5hJ5NKR46QSopPv13ajNEGiCCCltNUsXYrC2kswkfNM/I+m/p97a/x
 l6Z5601DcRMgOMF2G1kpNx14lZrOqctjHHO37oVo+ux5ACG9RpXAf3MGhEoXFMhYCof4rN/48//
 VhYUtSRptEMbJmKdTUmZime2PU9Q==
X-Received: by 2002:adf:e743:0:b0:45e:f1c5:709 with SMTP id
 ffacd0b85a97d-4603076cb46mr4116685f8f.37.1780663821898; 
 Fri, 05 Jun 2026 05:50:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f67c6sm25643587f8f.16.2026.06.05.05.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:21 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:21 +0200
Message-ID: <20260605125021.273172-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-2-martin@strongswan.org>
References: <20260409081401.2060709-2-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663822; x=1781268622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Inoi/TbkL+wlVxie76ZbmQ4kq6u1t5QX3AChu9KE0Ys=;
 b=JWnGQO1tbXFrUsPZhWL3TEx8HnnMzZnJ80m3CspbWO9cfilvEjQE5DZyg3AHPxwF3Z
 b08kh0brGujbW+jW8FT56Y5dkGu3a/hNRxXXJRlKHBocB4zOWJHfT+0FnwL8eYtpoeSW
 PEalZPcwyOwUgXQEyBNel7Fg82hEbyOb7GmiSuijNDW4SOacR/92xPlUzF6n0fcrSOSp
 pRM8x4XOKMMuIxeXKwbbupLIfxmFyrrL8uaSlby4cfP5PzsURBwSScLLSD6nYvoEg3gS
 qLor7W4HOs51GDX2BWHoKyEeUS347xKbajpPvJQ6D6QRjzR5cIPxTXxBxwGZd9rwXczv
 Nq0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JWnGQO1t
Subject: Re: [Buildroot] [PATCH v4 1/6] support/testing/utils: add basic
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

In reply of:
> Introduce unit-tests for the generate-cyclonedx script, covering basic
> script invocation, patch CVE extraction and virtual packages.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 139 ++++++++++++++++++
>  .../cve_upstream.patch                        |  11 ++
>  2 files changed, 150 insertions(+)
>  create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
>  create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> new file mode 100644
> index 000000000000..bfe5eaf054cf
> --- /dev/null
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -0,0 +1,139 @@
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
> +                "provides": ["package-virtual"],
> +                "dependencies": ["skeleton-baz", "package-bar"],
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
> +                "dependencies": ["package-virtual"],
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
> +                "dependencies": ["package-foo"],
> +                "package_dir": "package/package-virtual",
> +            },
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
> +
> +        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
> +        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
> +
> +        bar_deps = next(d for d in result["dependencies"] if d["ref"] == "package-bar")
> +        self.assertEqual(bar_deps["dependsOn"], ["package-foo"])
> +
> +    def test_virtual(self):
> +        result = self._run_script(["--virtual"])
> +
> +        names = {c["bom-ref"] for c in result["components"]}
> +        self.assertEqual(names, {"package-foo", "skeleton-baz", "host-tool", "package-virtual", "package-bar"})
> +
> +        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
> +        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
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
