Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A612AE8782F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7207181EA1;
	Tue,  3 Feb 2026 13:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd6yv6yqBTRg; Tue,  3 Feb 2026 13:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77213821C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126763;
	bh=ZGpG70bV6Vg8opAMXSvS9DlNzk5aCfhIR8lk/b8tXiM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=digwcB6tTbMvKu8ILusxyp9gdPM8whXArzhjPyXmFObb+hL4OeU+dSpXGoa7S7T5c
	 n31uZMulqHSGN8LEk1xfAijYYaO03Wx72O/vAqC4gtaMp5o7VhuNXki9E7VIAyzDM7
	 TIxaAUG4QRwLvxtukXyzVvIwUuY6QVTJCKbMnDxiduD23sCQ/l65a/8yc1AEWq/B+/
	 DEnC8ZI7p4gckiIbGALqPCSvEkjyxDW6QN060ltRXSQD/yAVnML/BFo3PzzVs/zm2y
	 uOM9P/myY/vvGiBiszDb5gLrxJtRxTQIzRWYdvj6ME7XqJ+16J3SHoT/zufNplhrXG
	 SdaaYcxJx4IJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77213821C4;
	Tue,  3 Feb 2026 13:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B2B13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E52E16083E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jsw5C1jGrQGM for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6AF3606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AF3606F1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6AF3606F1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso550173f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 05:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770126758; x=1770731558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgtCTPLj6HzKryXWazxy0aKFHoSwf1H7XXm6RGm5hTM=;
 b=izglbHjVjU1LjUBLD/c44cYBMAZ45FUH5EexQ2Ve6nd0/6FNZBPMwa97bvTuxNyZuK
 mrtzYtJWLQ94iM6ijIWqCj12mAE4/JFaTddOTSGkZj+4rYofonifBa3rpBm2nz4YLuUj
 kXrLaJWKxgpzCKdAzqLWjTwBIhRuP5Q8DTD9l6LzNIr8oVXK6mmpHdr9obrsBtlgKxop
 Fis8wVNoFjvPt/ubeI5GseZ6wuWTt1gQ1lweFkS8tofyIZEHjTfxHX+L5OtsmFsiYiEQ
 RDDjL0ixZF53sNo2mNviCjSlIQmKATX07i2yZb13RssA5sCw0lqKXg+YBzuhsQhkFsL6
 zo+Q==
X-Gm-Message-State: AOJu0YxtxcCGHmfulensRHxcKEU0yhkaQQO9T8C2l1cvZ0kMvvHKsxzn
 P5fCCytOmC7aNfA0cpn0EfEKAp/be2njr/gxR2sqON5ju+zUBEzl/BHH9UrtxrN2ynyEgNTfZWx
 TsTSr
X-Gm-Gg: AZuq6aJhGAa9RijcTGTyvheD+Z6UBwOOqRPgemM8Box2TKyzLZLVgGLdsruj1iEcc6u
 xZqrRRTIVhlOpHnZ/8MROhfytooJ1U6KjZh7pMt7fNIWj7TdSL5qa0KCW5fxzuJiE7zRnJ8bMXK
 oUTZdpz0S3oAXxLkyXDupdK9KzMzP29ZFK1Jq9pewKIqtowoeJFry7TO2H8yxJnZPSWzm53vjH5
 kc688Md3DK+cEgSII68weq42y8iw0K8vawyCSk/WCaMu5HtTnjIXyvduWTjxXpAVriWpMQxRy+z
 bc6dVjq6NjGH8c4aCZym4BS3tQSfa1+MZoLsVtiGJ9wpu3zkM3pgANC2pLl13jLMcUnGJjsSFF6
 ykIGDDef6Qi+/u8tHwodlGx0Xh3uohBWWKcw6MLvbV2+Vs7Acb2fdAyQ+FzTFTw66mFwh9oUoKC
 mgGa5kOwZnmOmVlf+EtWW6u9IGaGsgswlWymW3W/Xl4HM=
X-Received: by 2002:a05:6000:603:b0:432:b953:b02b with SMTP id
 ffacd0b85a97d-4361143916cmr5331547f8f.16.1770126757719; 
 Tue, 03 Feb 2026 05:52:37 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54227388f8f.5.2026.02.03.05.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 05:52:36 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Tue,  3 Feb 2026 14:52:31 +0100
Message-ID: <20260203135235.184869-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770126758; x=1770731558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hgtCTPLj6HzKryXWazxy0aKFHoSwf1H7XXm6RGm5hTM=;
 b=C7eEm7aVtmIlCOxGNG+8N3Xh9CHFHUDUQVdk6bRkp+vfIahOVlR+icQrRHPrX35yYC
 5IgyHOj01BN5zQxjhtXYmD6UM5uxOX0yRu4/+Ih88YcmTzXjAWm6y91/7KHkn35pTiH1
 fg94j6tt155ZVdfAG2ls0CqOXq5W27cKhv3Bps8cvfwi2yZS55da5+sFE/LlfRrPQkYY
 f0ok1K2D8d9wLZRie/yHsUxK2FTGgE1Ev45x9PDZyILDp+iYQ3mLjDSaoYbiS2l9us1U
 CPFeGquX7MFSic670qIzBse4664X3xPn3QfvZeIF5tK5I02J6ucgJjX0WMVbFMP/kAtD
 mlBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C7eEm7aV
Subject: [Buildroot] [PATCH v2 1/5] utils/generate-cyclonedx: move license
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
 utils/generate-cyclonedx | 46 ++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..93b648e481 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -21,12 +21,10 @@ import re
 
 
 CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -41,20 +39,40 @@ BR2_VERSION_FULL = (
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
+def br2_retrieve_spdx_licenses(version: str):
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
+    SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}/schema/spdx.schema.json"
+
+    ret = []
+    path = cyclonedxpath / f"spdx-{version}.schema.json"
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        urllib.request.urlretrieve(SPDX_SCHEMA_URL.format(version), path)
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
@@ -404,6 +422,8 @@ def main():
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
