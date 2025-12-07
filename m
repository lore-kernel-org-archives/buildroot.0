Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC00D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E2483104;
	Sun,  7 Dec 2025 09:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcthCxCCbDHM; Sun,  7 Dec 2025 09:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5DB283155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765099707;
	bh=JPGG2+s4PtfzlwvrtaKBzgI/yMls5IRm8+io1tH18KQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jc39g7gm04zzu3B6y+rKuMGZW/JLKilMDpkAZZ9SbgsO2X35SI1AcWWY8cutqEuuq
	 WrE/jL4sbQ7eDg/m+HMz1EWqkXv8TYrSBrgMc0Pk8bCDcVJ23GjN87FZ0QwhwbK7N7
	 OiswkpOqOFUIFcB8+HmEdFQkFpxlpxX9aPr9LEb3INcRd5aKQ6dzWLdcylKPOoubhs
	 98+cq/bJ1xC+TbYQOc4bo9BpAyB4SOdO1y+p7JfYUmR83pymoZHLs6UfwH4wkmVzGw
	 mbkvqdgrQbwzJuCTBBTJLUx+WfKymAVXr9nEppEc2BDn7LVARmnXB1ky4Isaspf5AM
	 ssjGq1LkJF0lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5DB283155;
	Sun,  7 Dec 2025 09:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EFDD151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 866374055D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNh5ccBh9Mn3 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6E684055B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E684055B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6E684055B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:28:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so6512604a12.0
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 01:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765099702; x=1765704502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xp86up8ccXLl0Tsi3I4B9zYQgWNQAXkox3dAZ5yBV/4=;
 b=mxi3aATi+1ckJYUQVyXGIdGzNW9YKa6Pd+l+c1YqsLXDqUhnZtKo4b+RNHz0aaXPw8
 0BceXA3ZlsdT1xAKAqI4Q9AcPKfY582VYpbO/K3fgnRFQvF6bZoBP6YvKy8eZ7ujHCSC
 zhZYdgAcxwXg2pktnXFObZg3LZaBRGtqkgGLhpgsl9MNhxBR738UkBrZ9Zc365gXH0AS
 gSGSJvE7O3aliYM2Dy2+OCPy+tKlNV/CtcNf74fiIv0ttrPIDhScf0I8yZPY+trN0qiN
 lf8bvs6+/VKSIyzqRwvvvM6qRBZ9DfU15XYUrZ9LcFU9CktPa6EuzbocEbGp0OxZ9fTi
 H6Lw==
X-Gm-Message-State: AOJu0YyKJYSdU2hCmf3f+JToFyoQiy1UAharDyHnqai2LVjl2VDOD9gS
 3caZ9RRer5iyeo1m1y7ieTH5p0xVr+uPlkWBPuuFkINtYjfblf3sNwpddTl70HkgqnsUCVs91VE
 ejG5LywI=
X-Gm-Gg: ASbGncvAGtot70IjydUNchAH1QifWzYM1UYCMWbXxeRSR1DJH+HCK4e3Z8P8Ab1BCkm
 zvSjhcrOYDo086xFpeSRWVwZKNigfxcf9p1mqVPahezhpTVEkMkuDzbv4QF3Jzs/3Fd+WR9OT80
 YOpD4SzmXmu092jg9ewRqSAw1yzKLdEd0dXc+0yWLpRHCiZ2uwBnVs9n8lwYWSQ1wPT2tvk4c/i
 V8jk5utsVZ4RpqEkrp1DdCzZRLkOtlFHLzJwKUKlrzjY9zSFPfOLE4i8amoYHrsO18QxEmW2UOb
 GraeXztwrFsUdmDxlNSbWbsigTGr6NAn5iemR0xQzScSzbmJKzaQv2GaspTVSELvQzAzt2bDrdp
 pZ358ieU8AkLyaqIwTOaBV3GFC2jv2atwimrKlHCeTJPZ9UiakwOqiyZmcuJXdJFZU5sQxsGwGS
 8gkl7M
X-Google-Smtp-Source: AGHT+IH+6aEJuXWLFLzybbjiVF/jYbDyGELFZ06Ym4HK555w9ilS2gxU1O6t3/FDcYiqIkQCjFGzag==
X-Received: by 2002:a17:907:720b:b0:b7a:1b3:5e5d with SMTP id
 a640c23a62f3a-b7a242be82bmr423289566b.8.1765099701846; 
 Sun, 07 Dec 2025 01:28:21 -0800 (PST)
Received: from arch ([79.132.236.244]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf54asm8319025a12.10.2025.12.07.01.28.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Dec 2025 01:28:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 10:28:19 +0100
Message-ID: <20251207092820.109515-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1765099702; x=1765704502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xp86up8ccXLl0Tsi3I4B9zYQgWNQAXkox3dAZ5yBV/4=;
 b=WHEdzJpBYXTHP/K1PYHYlaPHxx6h7XsWPVatitNyqgw0GwN3tp+rffmalQMMmYY44m
 Wla2dHERP7tLAKEWA2IFIByBzCOI55/3OaTi/fo5Ftseh2hVSyEDOd0evSXfKltPXRH7
 vhWiDgnkhAn9zNYcZ6zvmy8Lj2mUqrfq90FPZKgUjYX5oFtqI2+RAMUqvP+P3iWxnjMo
 Lik+6c0es+xVCa3Yp4FDChJLdJDphQBJHNKHKik4DAwE2bf4HzkYpP+D/aS9j06MEO68
 klq/loTI4zxnTiuhetaOFn/haMCIsUitmZ2LmexqP6AnO3XjBOHDIoH4rXcBaXQdaNe7
 HE8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WHEdzJpB
Subject: [Buildroot] [PATCH 1/2] support/scripts/cve-check: fix typos and
 grammar
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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 6442b2e72c..a72547ab38 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -4,7 +4,7 @@
 # Enriches the input CycloneDX SBOM with vulnerability information from the NVD
 # database.
 #
-# The nvd database is cloned using a mirror of it and the content is compared
+# The NVD database is cloned using a mirror of it and the content is compared
 # locally.
 #
 # Example usage:
@@ -121,7 +121,7 @@ def nvd_cve_references_to_cdx(references):
 def nvd_cve_to_cdx_vulnerability(nvd_cve):
     """
     Turns the CVE object fetched from the NVD API into a CycloneDX
-    vulnerability that fit the spec (see [1]).
+    vulnerability that fits the spec (see [1]).
 
     [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
     """
@@ -153,19 +153,19 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
     return vulnerability
 
 
-def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
+def vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability):
     """
     Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
-    if an entry with the same 'id' don't exist yet.
-    If an entry already exist the input reference is added to the 'affects'
-    list of the existing vulnerability.
+    if an entry with the same 'id' doesn't exist yet.
+    If the vulnerability already exists, the input reference is added to the
+    'affects' list of the existing entry.
 
     Args:
         vulnerabilities (list): The vulnerabilities array reference retrieved
             from the input CycloneDX SBOM
         vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
     """
-    # Search if a vulnerability with the same identifier already exist in the
+    # Search if a vulnerability with the same identifier already exists in the
     # SBOM vulnerability list.
     matching_vuln = next(
         (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
@@ -173,6 +173,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
     )
 
     # bom-ref to the component is passed to the affects of the vulnerability
+    # passed as argument
     bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
 
     if matching_vuln is not None:
@@ -181,7 +182,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
             del vulnerability["affects"]
 
         if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
-            # We don't update vulnerability that already have an
+            # We don't update vulnerabilities that already have an
             # 'analysis'.
             # Buildroot ignored vulnerabilities will already have
             # an analysis and need to remain as such.
@@ -228,13 +229,13 @@ def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Op
                 "ref": comp["bom-ref"]
             }]
 
-            vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+            vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
 def check_package_cves(nvd_path: Path, sbom, opt: Options):
     """
-    Iterate over every entries of the NDV API mirror. Each vulnerability is
-    compared to the set of component passed as argument in the 'sbom'.
+    Iterate over every entry of the NVD API mirror. Each vulnerability is
+    compared to the set of components passed as argument in the 'sbom'.
     The vulnerabilities set of that 'sbom' argument is enriched with analysis
     of vulnerabilities that match that set of components.
 
@@ -257,7 +258,7 @@ def check_package_cves(nvd_path: Path, sbom, opt: Options):
 def enrich_vulnerabilities(nvd_path: Path, sbom):
     """
     Iterate over the vulnerabilities present in the 'sbom' passed as arguments
-    and enrich the vulnerability with content from the NDV API mirror.
+    and enrich the vulnerability with content from the NVD API mirror.
 
     Args:
         nvd_path (Path): Path of the mirror of the NVD API.
@@ -274,7 +275,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
 
         vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
 
-        vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
 def main():
@@ -288,8 +289,8 @@ def main():
                         help='Path to the local NVD database',
                         type=lambda p: Path(p).expanduser().resolve())
     parser.add_argument("--enrich-only", default=False, action='store_true',
-                        help="Only update metadata to the vulnerability currently present " +
-                        "on the input CycloneDX SBOM. Don't do an analysis.")
+                        help="Only update metadata for the vulnerabilities currently present " +
+                        "in the input CycloneDX SBOM. Don't do an analysis.")
     parser.add_argument("--include-resolved", default=False, action='store_true',
                         help="Add vulnerabilities already 'resolved' that don't affect a " +
                         "component to the output CycloneDX vulnerabilities analysis.")
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
