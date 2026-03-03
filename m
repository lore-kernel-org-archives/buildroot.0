Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B99CEDA687
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A04406D5;
	Tue,  3 Mar 2026 15:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-X4_6uNIGyN; Tue,  3 Mar 2026 15:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5DF406C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551013;
	bh=Kby2jjD62vM1wLBJ+xpMK/9QygwaIJxbCpXPR+32wW8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=h0CgpJnVHwLhfEcGOGVaxufTSJLiRR6qe2fjVIDJtvmpBc1tqdrcoGZaE69G/C3et
	 m5WSuRgDo5nHFa7d/JyWu7AmuV4rZ+RF6EGzwf3AiCWHcM8WHUFWF+6gcLV2NTmwlm
	 y+Sd5yAVFEGav6iP0V7u2QEHNM2w61nZjsRW1LZaNv2VcVMtbhlejtcu5HtsWrEws3
	 w9k19jLMq9I6WP2fsmYgd6umzDAuwiQT0PMEVVu8rrfeqgUg7RQ5OtZDM9M9UOuTe4
	 r6pmNphK9rVQrg9wBPZqxH92hduLCcem3qhbUu91SYas7efBk9cQ2enErhAMfiJu5/
	 ht6quybDvraVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5DF406C0;
	Tue,  3 Mar 2026 15:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2381EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3E9D80BB3
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lO9T2xPbaRn for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BB0380BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB0380BA9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB0380BA9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so53452655e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551008; x=1773155808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rcB1K++v4foEFj5rCc8zuMwuUVFVDBkAVzjb/y6cHc4=;
 b=EoexlR8ZKmn8+3a1e8+imypoPHpjMg3MF0l+QqqDc8nrAgjdg3Y37e+xzT0Gb0wQNA
 PacAc6p+S3jYLu8oNo/WkEcdsaIaQg/fJIBCl97n5/dLWwaNqLMHGkIiMBHJIbab75cl
 IW83GovUFalXPTtDoQGgcLA/cJWtGYFuFeINZuDFgf6MHCHz9xX/Rfx8b/KwErHRaG45
 VemrIqjkW67UQfXhCAy+NFjHWqerideiW83nNWr6pSe00iaF7Bh7n5+HSk+MsY75Tpx3
 lK34mpxwq1dAIzpPh20dNCz1cbCXlLLyZRb8MfhSodhWoKaAvK4++zmXXDc5ElsQmRgu
 b4cg==
X-Gm-Message-State: AOJu0YzXPZ5Wqf/PRzASjV0OicOT72ds1xkfzX59VFTKOcQehN0gS+Jl
 GWdbhQsKNa43LrKU7ggUWtNay77sIvx982NETyA5qn3VlU1FhBaDZAso/N59q0z1RQWTUL93uwI
 t170S
X-Gm-Gg: ATEYQzz3OMkCwDO968QoZCnysE7f2DLIx/33DCd9r2r0XDg/7BVFSJVdAWDpZZpAUWR
 X5X1yseWsyk3mZjQaMAA1O/OCmwXwGfOxWerdRVY9IgnaRDzgeZN86J8FqpYikEilSAfV6ORMH9
 Yef6r5+yQ+DHF9LsfdiZaJ+hkAQcsbSPJx69J11Mqa3ZGWuFrkyOROyoLgdZkcB0rDrLG86sLSl
 89xuL+aMfKSNjclsKmuEjdQ2suK/rTgOct1f3fB+k7rSfg/bXlDB2dBeSHLtFNj/UbDTDTc4goG
 RJaj7T61TKGfe/uZjM+KeN56T8wfS/eXIeaPmuc4cdCrzIAFCr3CGjqPfT2+LdVJngGKm3F8AoK
 Rhp7yAC0MHrF5m7ojuOeEYpMqhMOUIi7DPfwTDvSGUieAoPgh3teEQAT4Eekq3GA1xVDym74NQ/
 zZ6oKmA+prlgs7Ais=
X-Received: by 2002:a05:600c:474d:b0:479:1348:c63e with SMTP id
 5b1f17b1804b1-48513a75f86mr40859715e9.9.1772551007797; 
 Tue, 03 Mar 2026 07:16:47 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:45 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:34 +0100
Message-ID: <20260303151641.382820-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551008; x=1773155808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcB1K++v4foEFj5rCc8zuMwuUVFVDBkAVzjb/y6cHc4=;
 b=LBtzwiBlg23DF7xH1PfnwcYffXV5cwXDu7uQKBIc9rSWsC5GSdexs9Yr1gZevCJbqn
 ZdUWHzSyscwmH3wBzT/nShNT2awLgtEp1eBPUT6R/SzBwoCZ+CMO1Jnp+ZQRBC3pUHra
 zdrjwJvFjZLbH7rs5noZR15hI2ra35BK3LzHwmt6oql4EOHZYXG/+qJOEvzSFdJjrcc0
 ncXygSP4LmjeeX+KiHxDDpr/Z7m60TIXTDYcn3c+vneUn2qAzQuClPDNNqJmjh2BFby8
 KhdeU/XZFKfSq9SVXmvdSUm9HYYY9/HpC4i/F6xeeFtAiZ8oGo40lavWLWF3+7aNRjv8
 9vow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LBtzwiBl
Subject: [Buildroot] [PATCH v4 2/8] utils/generate-cyclonedx: move license
 download in a function
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

Move the code that retrieve the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
In next commit, the CycloneDX spec version might not be known when the
top-level code is executed.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 49 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index eff55bf598..52fb8cc3e9 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,15 +18,14 @@ import urllib.request
 import subprocess
 import sys
 import re
+from typing import Tuple
 
 
 CYCLONEDX_VERSION = (1, 6)
-SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(*CYCLONEDX_VERSION)
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / "spdx-{}.{}.schema.json".format(*CYCLONEDX_VERSION)
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -41,20 +40,42 @@ BR2_VERSION_FULL = (
 # 'resolved_with_pedigree'.
 VULN_WITH_PEDIGREE = set()
 
+# List of supported SPDX license expression.
 SPDX_LICENSES = []
 
-if not SPDX_SCHEMA_PATH.exists():
-    # Download the CycloneDX SPDX schema JSON, and cache it locally
-    cyclonedxpath.mkdir(parents=True, exist_ok=True)
-    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
 
-try:
-    with SPDX_SCHEMA_PATH.open() as f:
-        SPDX_LICENSES = json.load(f).get("enum", [])
-except json.JSONDecodeError:
-    # In case of error the license will just not be matched to the SPDX names
-    # but the SBOM generation still work.
-    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+def br2_retrieve_spdx_licenses(version: Tuple[int, int]):
+    """Populate the list of supported SPDX licenses for a given CycloneDX
+    version. If the list is not present locally it will be downloaded
+    externally.
+
+    Args:
+        version (str): CycloneDX version
+
+    Returns:
+        None
+    """
+    SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(
+        *version
+    )
+
+    ret = []
+    path = cyclonedxpath / "spdx-{}.{}.schema.json".format(*version)
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        urllib.request.urlretrieve(SPDX_SCHEMA_URL, path)
+
+    try:
+        with path.open() as f:
+            ret = json.load(f).get("enum", [])
+    except json.JSONDecodeError:
+        # In case of error the license will just not be matched to the SPDX names
+        # but the SBOM generation still work.
+        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
+
+    return ret
 
 
 def split_top_level_comma(subj):
@@ -404,6 +425,8 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
