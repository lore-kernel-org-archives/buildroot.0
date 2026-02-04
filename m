Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9341BE83F11
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E98840BCB;
	Wed,  4 Feb 2026 13:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65z24CvRyBtJ; Wed,  4 Feb 2026 13:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E58340BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213249;
	bh=7HArAcVtdvw25fUY62llcs5SYwtvK6p7bcOLTPghyqA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p2slT56kg5yH249j8ZeR3RZJRqOUTGUCPxWaXE+jDmZWBVicQCyL4ak3kzEwYiuXF
	 ip6vqwljFExkgV0a7YOwIhYRKrSHL6o98clrVPvMAmMJgCEYAhboRhpqR2QDOehMSg
	 VlZ1S0/mt8LLmwvv4ytm1shJATc7Kp6UPNQllNZtyTkwDu1gwUbUucaHuBo7Gekmrs
	 msqLOuy5jMMSk6Ig68V/dEaQBf3G+Iq89A9BL/cS7692qdarGn24XUQs8YMsqAiYRH
	 rxG8rkGEhCXXfjA2om6w6Cgp770qmTSJiVnBICa001VuaQtoHQ7ftEHeVNFosjMnM8
	 zRNneoTA3pb6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E58340BD4;
	Wed,  4 Feb 2026 13:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C03F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2AC60BD9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6Cz3LPTy_GP for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75F0660B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F0660B77
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75F0660B77
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so8798915e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213242; x=1770818042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nmY0yMz0MEkQ9dQzO02E5MOqmivDHBP+dKXBFIjUUuY=;
 b=hyK+balcEjIAuLzq4pqY+IY9kgIzcCoTj6s6u8tw4k0G1cbDLmWSjlJS5MCdfYItkM
 jKfaLLVNDkXaV8K1AKgrirf4BPFpvTVDwTv6dxvv0vOVU9aehZb6Pd8ht02Hazwv9FcD
 TFHSvsgqdD6/yAi9npkQU6+AW9usSwGOzOrWGSyDcpQUQ393MhufNVv8sazE7bZtRKgC
 hFuxMDhnIKVMAKaj+riQpdH7OkIRCrcMDSUgQLhgI6cSpJdpTHGaQ+h+bXYSBNwc/fs9
 tJ/DqJ7xnSX1lXC5tAWyVnBYYCN1KqyrSiqukhZSD5ZM+oZusJWhN4g5Zu4+BEHdaHf9
 +U/Q==
X-Gm-Message-State: AOJu0Yzw8BHxaHbyQ4yT/+EvCVIJr9Hiy6oXxxmqS2pIuvk2O7mEvbgI
 jIKF/Eo+rzTpevg0KZAh25xS6+LW2CwaHNnilrEuXtPrz/GpT5BxLSqDGE3oZreOwETwx29mfL6
 Zscbs
X-Gm-Gg: AZuq6aJkfLb4keRQolpPuJXeU+R45suiouJdNs0QHm9Nj4g65ZMqBy2MVgdTzfuDrch
 p72ofV+XT3WB6N4tax95oQ8fxmEWrO6NJ1zSpamHkEeQA2N8U+jWHJ7eFCb8nOCa/kB0njwH/RB
 JHwwsJwt/VWiWEpMAH5Ts+zFPeQ8B33EXwwYp98dHPlxK9JtbEHf8O8+51laIhK3tF9pllVJq2j
 gqb4xtGzK/BPxMvrc+AFYc+PPoWvbMcSsbWEwZ2bxEtEVsvp3Qo8JzpxxCMGcS7LKbF236B0VjB
 AuxbX8RTFwSmq/cnS/aRwsJQaVN3HGpu0QvSRfvnJG2Ya1kMECEFEHeOuET3FnavmkJCkl8xOzn
 pH1BxabR/+UcNZZKnl6rpwYpeY8OkZInEO9mON6YLh03B52ImisWLN7sUg0PTg9Y1mPbDt1Pf5N
 A3dnS8goxxTVgF5LSABcu4QmLk3+gspFWM7MpEZv+ie+s=
X-Received: by 2002:a05:600c:c84:b0:47d:87ac:73ef with SMTP id
 5b1f17b1804b1-483051716a8mr85005925e9.13.1770213241850; 
 Wed, 04 Feb 2026 05:54:01 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:53:56 +0100
Message-ID: <20260204135400.307638-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135400.307638-1-thomas.perale@mind.be>
References: <20260204135400.307638-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213242; x=1770818042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmY0yMz0MEkQ9dQzO02E5MOqmivDHBP+dKXBFIjUUuY=;
 b=aXfpKevn9iW3F039LJZECsHygtlkLFA3KIGhSFZcLFHj+sjHIOP+gHK4KceNDIVH/q
 dx4MbFJiREe1U9O+7LR1Ugxc8IP7bsr/eZf/vvx/6ON0brEKdJZKSgcSVW39LEKZkhmr
 zelxmFvadTPUzF1NGORK84d+hUnsjuI5RoCb3a4wVlnou+wKDM7qWbhIG+WrKr4kTLjb
 mynh0V8RsO439cJw7BwNVw4NQ7NEatSnSs00OdpzDEGsIO3NO2zcgNQoajgqvXC6rTEg
 5lJIicMRqfFdRDVMfMMb66h6NlHqL3/4D5Fvry45s1PyzW1YuuLokfYef048TXxK2z1q
 +gnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aXfpKevn
Subject: [Buildroot] [PATCH v3 2/6] utils/generate-cyclonedx: move license
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
