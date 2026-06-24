Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF2CDB47C
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA4B281ECA;
	Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUHnUUJ0yehP; Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12C281F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296029;
	bh=eJ4iikO933htoBeNhy50bI96w8WY4oHuactlTNVhiMI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=PslHWpiUt5UrpUI9B00WzEXO82BUqxTHZyBg9rfxU0/6roMMT/T8HNfS3c1stbH9Q
	 HI6JvHbivBp3dcRuhwLNFMkRqOoPMRJ6HGz0JKklHzuNlNFPsjUGusPdnNRzLZqv8a
	 uYDxpSFHVVHSN6YLDfX+vzYSY8oZjwEjzYkqHzuft8DEaBGUa7dlcXMeCNpXJ6k9Fa
	 lusRlCzC+oFGZD/Z3JbLKvtIek8f+2i0INpfS3Qfq1LYWHDtbrIMywOfCBMbWJPuey
	 eY3XJ8YSgm1DZAfcz10srvW5Qqu9lVOr5Lj2v0FoTt0XY3srCcRG7O5Lr892Wcd0Tt
	 jEMX/rZwwXR6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A12C281F17;
	Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A4F256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C7A404C4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW1fvGUNDHqt for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBA1640331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA1640331
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBA1640331
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4633193af19so663900f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296024; x=1782900824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tm+9ps5cl3PsAEVZTN/szsD+CYSx4OfKnU0bHS6jYB4=;
 b=nr356VuH8LniXfUq82OiXvcCR5zzA4oHJmpotIi5bzh2ltLe/ZEUN3ZKZCYvQQaUDh
 /j5PhbIarBvw95/qng27JrRTmfwSbssWIRBfkaBgZD06HXBHWbadygb6p55IwkhXkcHA
 OVVOIKhTYLT+EV8C1kepM7wjkSrOPRDWsDOYGR+MMGJPd2xIh/HElj5pfMQNw3eiFIWd
 oUT83h62b3RF52vsATLjHsKM2o+tlufFPOkVWeTgNOfh5G8MLoyGSC5PZZyYW7y7YBCt
 VAbjD8SlenW8dun1LgjQqoFCkQ4rONqVcpW3ZvF1ylT4uGZzJfzs99BbEzwHtnXlzrD6
 ki4g==
X-Gm-Message-State: AOJu0YxrRi2wnScMC1cMxf1n7u9f+/yUVTPSlCbVTElyPcAujrXsJlox
 EKDUlRaI7LRAlexVLA3gLB2WdIgUEeuewYWDxDDc+bhmwpmht+UN66zSngBTaKbKboH4W0kb8dy
 AGY+L
X-Gm-Gg: AfdE7cmiRf3dP2G50XGLnjy1dAuXLNqENT5R7ezWjKA72YnLhaCtMitqnA12vW7FNtY
 S0zEIjBmnyCDNOFcD7ZmLYoQwYqPj+LOTuPTsGvsWGvsgM22bb2L/xbxHQ4wdLMvm72zL3o9bGg
 pc9QV9QU3aNut3pxTdMmLXzE3PcK2BEcgOZ6YV+1GcOjOeVW+Dfu2x2AkSz7oqY/LdOCVRmX4yN
 4hmAYOP9TBjV3HIXjXw6KK/tddFsgn0o4ihiGjIzsUwqiELOZIRNvPObiZV4EJUBM/ZEdHTcliW
 hxgEmibZ9K2J5cl1HK5fh8dewU0BUWHDT82SXftwZ7zDhT7oAigBTN2T7Nyq866eVpN3V0rzQen
 kflkG0As9tl/+M2+8iLnIq2F7p7fVeQ9zu/JJ+s2a3Kux64NCUwg2i7a8AtmmguQYBb+3NiuJyK
 LHTJch
X-Received: by 2002:a05:6000:41e6:b0:461:d369:ece6 with SMTP id
 ffacd0b85a97d-46662806a6fmr28172524f8f.30.1782296023940; 
 Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:36 +0200
Message-ID: <20260624101340.80670-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296024; x=1782900824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tm+9ps5cl3PsAEVZTN/szsD+CYSx4OfKnU0bHS6jYB4=;
 b=Wd6Mensm6AN88Gg1R4K1XzlNyqT701yJTU9DiEVOAU4gXZfEDihtJ79v0zd3Izxvm4
 eoSUEu44zyxLcTONTYmDiXyz9M/moqtFZKOLvG+lspr/TcZ+BK8kZhlPlxoAPQXTNPw2
 c4AwRsfNAKXyXhyI9komzBcMTq3MaV//yQIT6WrFfR+fs9n2IxaOsAOCOElbfyAQnhpq
 elY2qdt0FeigSe59mPAagquBzHXwIFS2aErbKAMRG+WlzuxKyPoRMdhoHzaPHYj44VYI
 Pyk25nbIDkExLDnzI9fgu6Zd6udkkJwSZG1Ta1HRRuT5eIrum3/n7PyDSk5VJqMv2nyW
 0uxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Wd6Mensm
Subject: [Buildroot] [PATCH 5/9] utils/generate-cyclonedx: move license
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the code that retrieve the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
The next commit, introduce support for different CycloneDX spec version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 60 ++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9e3bc9d4b8..9738db71d6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -23,12 +23,10 @@ import re
 
 
 CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -45,28 +43,47 @@ VULN_WITH_PEDIGREE = set()
 
 SPDX_LICENSES = []
 
-if not SPDX_SCHEMA_PATH.exists():
-    if not importlib.util.find_spec("_ssl"):
-        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
-              file=sys.stderr)
-        exit(1)
 
-    # Download the CycloneDX SPDX schema JSON, and cache it locally
-    cyclonedxpath.mkdir(parents=True, exist_ok=True)
+def br2_retrieve_spdx_licenses(version: str):
+    """Populate the list of supported SPDX licenses for a given CycloneDX
+    version. If the list is not present locally it will be downloaded
+    externally.
+
+    Args:
+        version (str): CycloneDX version
+
+    Returns:
+        The SPDX license list supported for the argument version.
+    """
+    SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{version}/schema/spdx.schema.json"
+
+    ret = []
+    path = cyclonedxpath / f"spdx-{version}.schema.json"
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        if not importlib.util.find_spec("_ssl"):
+            print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
+                  file=sys.stderr)
+            exit(1)
+
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        try:
+            urllib.request.urlretrieve(SPDX_SCHEMA_URL, path)
+        except urllib.error.URLError as e:
+            if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
+                raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
+            raise e
+
     try:
-        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
-    except urllib.error.URLError as e:
-        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
-            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
-        raise e
+        with path.open() as f:
+            ret = json.load(f).get("enum", [])
+    except json.JSONDecodeError:
+        # In case of error the license will just not be matched to the SPDX names
+        # but the SBOM generation still work.
+        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
 
-try:
-    with SPDX_SCHEMA_PATH.open() as f:
-        SPDX_LICENSES = json.load(f).get("enum", [])
-except json.JSONDecodeError:
-    # In case of error the license will just not be matched to the SPDX names
-    # but the SBOM generation still work.
-    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+    return ret
 
 
 def split_top_level_comma(subj):
@@ -528,6 +545,7 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
