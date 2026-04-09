Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A4E9DE6A
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9220040E7C;
	Thu,  9 Apr 2026 08:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie1ZUKQAtJeW; Thu,  9 Apr 2026 08:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFF940F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775723678;
	bh=WnVBmHfWC9FQtkBTeGHhCRKC3MrXL14ycU2Z5FGzbeE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ePZPDUo9X4SH7dHddDMYtgOioV2IpLH0SQmA7XwCrWnixNHnGhpPQI4YXCbqMSyhN
	 bNGsNUHcMOLayWOawjgek5RYR3Bn1/hifi2aORclHjnfOcNc5ostV12iQJt57pfoqD
	 ck1rA1Fk8tk/sLJt5Mp3BBfnrYuAQFJasU9/0Kh1/yQR0tYVoi+lgnByggRVKB2XM2
	 zT6J/vDkRfq8CATPI1UUSkFnM5TM1Uvy1W8aJLEp+IiPAxWL1TABUXy+iCHMlkeuKz
	 1goarB5b8x1PYW50j0OUkGP0ZuPPcVF0mEs6IifN5XipUrmay1IXglyqgBdCZ070tT
	 tg1A6d+YZgKSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFF940F1A;
	Thu,  9 Apr 2026 08:34:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5B51F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DC00607E8
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFtyEdFWA5sn for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BA2560796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA2560796
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BA2560796
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:34:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so7189505e9.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775723673; x=1776328473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B6JYLJtuHU5rDfQJ0NRXWMpBl/BN8+ZA2IVgL2geCc0=;
 b=sRQXJ7CEk+h9/lD/m53AkFDfCex2wRQHdKcbOweJTL5X0HrO2iNqbaPJcnBuHgyBIX
 r/cDtSFAODsYU0KdvV+6QD1KoNEi6yYt34HaMFt0tonOde0N1zvt8tEb7JxDI785/41h
 uY3h/yMNS1ERjUhsxIymKvxdmHqZ0gCg1/U1QsC2XcM16lTR0MzIKvyCwUykKVErfhfT
 gfgo5InH/OnGCWYSUAP/XGJaq4CoW+OZ2yHe7YWkjRN5nD5Tdc+8AOdJUqCs5MGG+Z4m
 vVS7xYTYZZ3VKlVRjq4/cjtbhsYXOos7W29rx4WQG5m4cIfmf7KuLEXFAIGuHtdxeW8p
 +/fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1MwI2ci/iO3MNB7sRAz2BFJ3SSttSnvi5610UG7xKiKcj4IzoSCqAmuitNgFDvCzRjY7549KmsBE=@buildroot.org
X-Gm-Message-State: AOJu0YzGSjxyRWeVBEwJM8mWaKx8BBHhSSXruVQxE0SPCPkh5rYaE5Os
 4f8/3vzsIK0cfr7zSvQUsK+1Nhp9u4Yz3s/LExfLIbAvVWTAbaOS1rha0TnRLefh/7c=
X-Gm-Gg: AeBDiesdNE2E/dT5vLxY8yHEixu4lqUeQxdztW8hI0UxpwTe+JX9sp9CRiUuKcsRQGv
 lXOIGLJVG7nBgCpUAlddYci3d3QSRO8qC7MEvAao5+03OlvLgvubFngoM8WGOa28cGyTIUNIe2u
 0AOvXwhH9pHpMjN3F9+8qzV9l+xMzdM4qiab5h48fmwK4C1JeQjn/Uy2aCEVazcWKQzgpK0Swyi
 u8mfEaXihrPHroAxvc5++2w9rCu/HQ+Yl3fvqNTueF2j+aTqHfVk0zUHb0zyESf/0ayTbxnjhYz
 huNJF2zB4qjRYCYyxlpwz0pVHG6s/hFSS/BT9KtiI6QJmBpmVZlV8mWT5zWNsub0acJ2c8/0Rnv
 nniWF946qzlTIDGzgwxqTR5+0yDVQSaLlxOYJda8oRrDuoOWfceZ/fjNcdLK6MneNPV1FtSD0wW
 tL+Jvq8bu1MA1GKDwE
X-Received: by 2002:a05:600c:5292:b0:488:8c89:cfaa with SMTP id
 5b1f17b1804b1-488996b021fmr372601665e9.3.1775723672678; 
 Thu, 09 Apr 2026 01:34:32 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1999c6sm28552345e9.4.2026.04.09.01.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 01:34:32 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 10:34:31 +0200
Message-ID: <20260409083431.24030-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409081401.2060709-2-martin@strongswan.org>
References: <20260409081401.2060709-2-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775723673; x=1776328473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6JYLJtuHU5rDfQJ0NRXWMpBl/BN8+ZA2IVgL2geCc0=;
 b=a+bF9b3b9AGq2ot0Y/CmCW9Hn97JDCu6yp7STnxqwVjZ3P0sJhB66EZ81Nae8/+0G9
 CWpMrqjD5mkI8VVag1DrgCwv8odrQxO3l4Fb7GtdYbcAaUSZzVSNyKjH4Ntlrg4Ja4Dx
 Urn6W1M+vOhrQGbzTPPwAxy/7MTC2TRcQFCcjJw01U1b9Z59xGO2Vx4Ykaa7R6IRSCte
 HWqlDNe5VcWpMf4Df+KRnoNIfjanESwJSwsoF//zlPYhPdTaASpgtcSvFwf5/ysm/Nkn
 k+3/T0F30ZvqwC1L2ZOHil3uCNWFHaqX93Y4f0AjeJxBKm+K9hJQ3bE1MIy9p1Ek/0W0
 f+Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a+bF9b3b
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

Thanks Martin !

Acked-By: Thomas Perale <thomas.perale@mind.be>

In reply of:
> Introduce unit-tests for the generate-cyclonedx script, covering basic
> script invocation, patch CVE extraction and virtual packages.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

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
