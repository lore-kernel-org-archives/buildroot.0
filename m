Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8461CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A809810B7;
	Mon,  3 Nov 2025 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSZrJsvdBbYr; Mon,  3 Nov 2025 21:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8418110E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D8418110E;
	Mon,  3 Nov 2025 21:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB99278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306CD81100
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj_abpL5Zbov for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BC0C81101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BC0C81101
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BC0C81101
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso63317525e9.3
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204310; x=1762809110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxB6jv9OzW37AFrqoPWsJ8i8ac3JeIwz84xlwSWpjU8=;
 b=GcwT5Knzo/vBw7I/xXLtp/aAKEqaURi9TBfqt1MFs6S/HYrog4vjZhjGLwxuB7iyzP
 dJOXglC0Sh+TVbJ0hvih4tOURKeVuJfGMGd9pE1/JRvj+6h1fegE6zAHQm3jUVjPGYug
 lZnhmgMa4Bus+zgtAU8/mWFy5Rt9zn7D1rmsbrxybH/B2wiCUSwDR/zJ6BeehVGdB8ZC
 TGqZhNz23qYtg9UG5XOONgBjjtLgIy1uCwDpLQqfp+rIYFbU6wbtbXwJVbaF6b1F2QFi
 kR4YP+ZXqB0UPqfs9NGQDTLodPhkpvitxWMxoiI3WChq8Wnmt4nWlfdZqNkdD1a9ROGN
 /OlA==
X-Gm-Message-State: AOJu0YyLDb9TdJcv/DsQvQtWrz56HW5/oPhQA1sMxudc1JOEzk0pkeml
 JbslIrhsgbZjj9Mm5ttEcVPcFv2yVTIgoF3fRGOenteKErYYJ8BKYr6tN1FiVudkgg+qebAFpKl
 h6mWW
X-Gm-Gg: ASbGncvopW85fIlLS1nEHIbB8ZtwJlPj9UegiTI6KpwGTgxBN6GNxWNNQJhIK6k6AG9
 xuQtW6cYdI1TAqZyEjN4ZlRb+C0iivrAX2EyyfcgEO142hI/kAguje3LPkuvDoMPSZvKC/zDZ7N
 QL/X97OfZjpa6ptPcs05VbGVpwHi5TATSVxxBQyoeLfOT9UNUkm+/By5uINUa53iU8VntOCBI8Z
 fpQ+s29dsrXq/tuzBMdJM3lUyX/fXdWt+vQRl9VdXCaAQgHHmyCvHeZKYfTuiwe0IOFcz1nEIOZ
 mfipqBHx4HyrcZQolxLcxmY5CU3kSILmfJXFYPVHHrRpoueNU3uvs0vSnWYJoFsvSExZ2NOY9DZ
 qTYQJBObrkq49MJVyDR5KRvbV/RrGWBPyc+siLVUwS3Undm9c/RYos5lNsPKQGXfE7XFT5YgtOI
 LLBr32HY0UQ7aRUwtgOvc6LwLGpE6gKgev1cFDpPkO5NBCCfA=
X-Google-Smtp-Source: AGHT+IFf+QxTGeZBj/QFkyzvBUol8kE9EYzzdUFlOWWO9Gk4WsHm+eSveKS3kSVb2wHIV4y4my7TRA==
X-Received: by 2002:a05:600c:138f:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-4773632cf5amr98404425e9.27.1762204309378; 
 Mon, 03 Nov 2025 13:11:49 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:44 +0100
Message-ID: <20251103211146.57344-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204310; x=1762809110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxB6jv9OzW37AFrqoPWsJ8i8ac3JeIwz84xlwSWpjU8=;
 b=WYnkVHQsfkIOHVI4Z+khG9D/TosscpdKB3HC+jmMYGDLusV1M49XOg93GmMuwqzIq6
 HKucVoHo+7qWnKs89dxN2lmfBW0c+IewsDqm+Xr3ookRQGZlI5zB3Ier36G0VCUmQ3YP
 hGfNztrDgb6NQsjhk1bHpyWe9lJN483ZkH6rDPWMyXqppPnLAWfXmEKBg33FAKFJL1Wc
 6pmUFS9PQ/FvwH9for+3fE0sPjT5MaJlIAEwFO6duSL+NoEzV7XoCjhGGcxwlOeGGmVz
 ARhE12IZikcfSFVXegTPgGKi+zgP4el4BeZjKp7C81qpCIIkeKhOrFDKavv/rpIAsjvv
 +9cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WYnkVHQs
Subject: [Buildroot] [PATCH 4/6] support/scripts/cve-check: add cve-check
 script
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

Enriches the input CycloneDX SBOM with vulnerability information from the NVD
database.

The nvd database is cloned using a mirror of it and the content is compared
locally. By default the patch 'dl/buildroot-nvd' is used.

Example usage:

$ make show-info | utils/generate-cyclonedx | support/script/cve-check

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 134 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100755 support/scripts/cve-check

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
new file mode 100755
index 0000000000..b4abb9f7d6
--- /dev/null
+++ b/support/scripts/cve-check
@@ -0,0 +1,134 @@
+#!/usr/bin/env python3
+#
+# Enriches the input CycloneDX SBOM with vulnerability information from the NVD
+# database.
+#
+# The nvd database is cloned using a mirror of it and the content is compared
+# locally.
+#
+# Example usage:
+# $ make show-info | utils/generate-cyclonedx | support/script/cve-check --nvd-path dl/buildroot-nvd/
+from collections import defaultdict
+from pathlib import Path
+import argparse
+import sys
+import json
+
+import cve as cvecheck
+
+brpath = Path(__file__).parent.parent.parent
+
+
+def cve_api_get_lang_from_list(values, lang="en"):
+    for x in values:
+        if x.get("lang") == lang:
+            return x.get("value")
+    return None
+
+
+def check_package_cve_affects(cve, cpe_product_pkgs, sbom):
+    vulnerabilities = sbom.setdefault("vulnerabilities", [])
+
+    for product in cve.affected_products:
+        for comp in cpe_product_pkgs.get(product, []):
+            cve_status = cve.affects(comp["name"], comp["version"], comp["cpe"])
+
+            if cve_status != cve.CVE_AFFECTS:
+                continue
+
+            vulnerability = {
+                "bom-ref": cve.identifier,
+                "id": cve.identifier,
+                "description": cve_api_get_lang_from_list(cve.nvd_cve.get("descriptions", [])) or "",
+                "source": {
+                    "name": "NVD",
+                    "url": "https://nvd.nist.gov/"
+                },
+                **({
+                    "published": cve.nvd_cve["published"],
+                } if "published" in cve.nvd_cve else {}),
+                **({
+                    "updated": cve.nvd_cve["lastModified"],
+                } if "lastModified" in cve.nvd_cve else {}),
+            }
+
+            # Search if a vulnerability with the same identifier already exist in the
+            # SBOM vulnerability list.
+            matching_vuln = next(
+                (vuln for vuln in vulnerabilities if vuln.get("id") == cve.identifier),
+                None
+            )
+            if matching_vuln is not None:
+                if matching_vuln.get("analysis") is None:
+                    # We don't update vulnerability that already have an
+                    # 'analysis'.
+                    # Buildroot ignored vulnerabilities will already have
+                    # an analysis and need to remain as such.
+                    vulnerability["analysis"] = {
+                        "state": "exploitable",
+                    }
+
+                affects = matching_vuln.setdefault("affects", [])
+
+                # Update the metadata of the vulnerability with the one
+                # downloaded from the database.
+                matching_vuln.update(vulnerability)
+
+                ref = next((a["ref"] for a in affects if a["ref"] == comp["bom-ref"]), None)
+                if ref is None:
+                    # Add a 'ref' (bom reference) to the component if not
+                    # already present in the 'affects' list.
+                    affects.append({
+                        "ref": comp["bom-ref"]
+                    })
+            else:
+                vulnerability["analysis"] = {
+                    "state": "exploitable",
+                }
+                vulnerability["affects"] = [{
+                    "ref": comp["bom-ref"]
+                }]
+                vulnerabilities.append(vulnerability)
+
+
+def check_package_cves(nvd_path, sbom):
+    nvd_path.mkdir(parents=True, exist_ok=True)
+
+    cpe_product_pkgs = defaultdict(list)
+
+    for comp in sbom.get("components", []):
+        if comp.get("cpe") and comp.get("version"):
+            cpe_product = cvecheck.CPE(comp["cpe"]).product
+            cpe_product_pkgs[cpe_product].append(comp)
+
+    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
+        check_package_cve_affects(cve, cpe_product_pkgs, sbom)
+
+
+def main():
+    parser = argparse.ArgumentParser(description='''''')
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
+                        default=(None if sys.stdin.isatty() else sys.stdin))
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
+                        default=sys.stdout)
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        default=brpath / 'dl' / 'buildroot-nvd',
+                        help='Path to the local NVD database',
+                        type=lambda p: Path(p).expanduser().resolve())
+
+    args = parser.parse_args()
+
+    if args.in_file is None or args.nvd_path is None:
+        parser.print_help()
+        sys.exit(1)
+
+    sbom = json.load(args.in_file)
+
+    check_package_cves(args.nvd_path, sbom)
+
+    args.out_file.write(json.dumps(sbom, indent=2))
+    args.out_file.write('\n')
+
+
+if __name__ == "__main__":
+    main()
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
