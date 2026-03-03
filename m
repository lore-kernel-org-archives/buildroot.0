Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35737EDA682
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E08406C3;
	Tue,  3 Mar 2026 15:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCpblIAmUZgB; Tue,  3 Mar 2026 15:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A52540714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551015;
	bh=eNBD4IXb/M+/TC8TyNsS40KX0inOW+JHlJnkPH/6uE4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=krQIzYPpjaFpaGKvwRSJqTG696LNdG7Kzy18V05a3knL3eeQEUnwv/JI/21whutZh
	 TLc1odw0cVVYy91H9o6173Y9qttDYhVR/0VGCFOLPubKRaaABAIeuNr/tnRu3a+Nxl
	 61zHAIQtIjjsIWpWP5S9TBzO3LK1Y9JS0/wrR2C/W2Pc7pm0v+JvByPl0UEmwsoMsm
	 ABmrpPx9t8zKNEXKKqSv72jZqdYQT0fmrThQVuwc07bAfTTPoazgbRkgDYZb8LVXIv
	 U+wtdqvyHOEjE8l8/4+JF4ox9bE1H2s/MvIolbHkIk8LuM7+YqbQUIAzcM0eMsoDn/
	 p23Onb+00b2dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A52540714;
	Tue,  3 Mar 2026 15:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B338C1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9691960EF8
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgDfmHwy6oaf for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9829760DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9829760DDD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9829760DDD
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4837907f535so50987085e9.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551010; x=1773155810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JgkKxkVuTe0R9tSaDmW2URk+KZrSCQ0dk/h/1BdOpGA=;
 b=mQC7umQlDq7J22Lc/kXnLJrPY6cENQ1h9QwIhcm0m8ZtQmvx3mBCsHWe4fdL0qdzqZ
 a9jO++u40jEuXTpRLTagsMyuC/KHODNviWOH7KcZLurxdc/KlOBdeZ7BdRQf5bNhd7E0
 U7+gTmVoFPIlIbFi5XJT1UrFxHURws079WsIwfgglgtR1rNSg+julaNoCSbSzG4D3Q28
 rIf+j/L20o8J+qnDa6FFXuCMD58MvT3wcNb1MW0VK+Ma8TsyC4cwCRPSC/dZZROvMrLK
 vd9BlkI14lbt3xf9QFtrOpgoHkV3zDNNgw8oGn0xaKn/Gxep2M5wsPq6LZFzGC/qxsI+
 GdLA==
X-Gm-Message-State: AOJu0Yyl/5jwsAMZDA/wvT3f7cqejDDSB/Y+KuBXyu5g+9ii1i6s7D7Y
 qp6lboOaKjGc0oyotdubfhHPFTi/YHNerx4bTasN20HgIOO7LUkUiRMIPxPP+yOrX/cgYmgK2B/
 B/Wmm
X-Gm-Gg: ATEYQzxK6YbiwDDfpdmp74VOLsM1/x3d+MED5edfQ6mM3ZYbPE6dEVCEMe+s3I+vV3P
 LiA++tkpwC63E3lIxjSYaMJwUa92XZi/U+JkzWhV/RnTQ5g9qzbShwDQSbLKFrkmPktMX8zJQlM
 708SY7cW/buOm/fs7BVBrCsVBK5FVSAlC/y6+sDTAChalpzGg50QG1fCuYjzcqkBBFAk63vTsed
 amyDtcS1CuUcr/Ke4z8wqONi9lpMw9Qv51rLbMVNl/HALO18wMN3x8So9ML1kuZK9H/r8y5yXYF
 fTT/bQv5a2x9piwE9ZGcjbtrQI7YI90j/Tu8/Samo29U11Eh7tMqWVZjo+FAbwxTxrMQMuAPE1g
 lOTl4siX1BhVah9nnNdkIPFJ0yR+sg5Y7ZP6yG2lKJrCDFonMzopLgnWtgNZum/4b+ICm9aXjo3
 yHtGIRyL/jRVfM1PY=
X-Received: by 2002:a05:600c:548f:b0:480:1a9a:e571 with SMTP id
 5b1f17b1804b1-483c9bbc285mr263201085e9.22.1772551009742; 
 Tue, 03 Mar 2026 07:16:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:35 +0100
Message-ID: <20260303151641.382820-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551010; x=1773155810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JgkKxkVuTe0R9tSaDmW2URk+KZrSCQ0dk/h/1BdOpGA=;
 b=ZBrCrTd4gWPUlinNxZkCkXSzZfRJ03hJWNmTtTFICBdUik51gepEXDK4BKnuInnxbL
 4RsLs6QKjYofq9uwbIRNYuIiAaIJsa+/opioIClog0V1CdpK8B2ssb/NMstL+AkWzS9l
 ejwk4X+91312dACsZB3zRQx1xXHYcVOKorPlsUmegpPxPyD07J0+hizovAaBK9bevqKC
 GMP4H/3SFFG+mbspkTipJtUMC8zGbmMyI2S5MNby/VtMtcPa3ls/bBuCzSfbAyb6dTBL
 gngGGi2UQUL4inriOppH8qX01uyVPy9ZeTSJyWb45JrjLKlr9rBdt7kSeEChnYUOMweq
 2Qew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZBrCrTd4
Subject: [Buildroot] [PATCH v4 3/8] utils/generate-cyclonedx: move utility
 function
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

Move all the utility functions that are not generating CycloneDX
structure to the top of the script and group the CycloneDX generation
function together.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 178 +++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 89 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 52fb8cc3e9..facbd6c78f 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -78,65 +78,48 @@ def br2_retrieve_spdx_licenses(version: Tuple[int, int]):
     return ret
 
 
-def split_top_level_comma(subj):
-    """Split a string at comma's, but do not split at comma's in between parentheses.
+def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
+    """Retrieve the list of packages that provide a virtual package.
 
     Args:
-        subj (str): String to be split.
+        ref (str): The identifier of the virtual package.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
 
     Returns:
-        list: A list of substrings
+        list: package list that provides the virtual package.
     """
-    counter = 0
-    substring = ""
-
-    for char in subj:
-        if char == "," and counter == 0:
-            yield substring
-            substring = ""
-        else:
-            if char == "(":
-                counter += 1
-            elif char == ")":
-                counter -= 1
-            substring += char
+    return [
+        name
+        for name, comp in show_info_dict.items()
+        if "provides" in comp and ref in comp["provides"]
+    ]
 
-    yield substring
 
+def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
+    """This function will collect all dependencies from the show-info output.
 
-def cyclonedx_license(lic):
-    """Given the name of a license, create an individual entry in
-    CycloneDX format. In CycloneDX, the 'id' keyword is used for
-    names that are recognized as SPDX License abbreviations. All other
-    license names are placed under the 'name' keyword.
+    The dependency on virtual package will collect the final dependency without
+    including the virtual one.
 
     Args:
-        lic (str): Name of the license
+        ref (str): The identifier of the package for which the dependencies have
+            to be looked up.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
 
     Returns:
-        dict: An entry for the license in CycloneDX format.
+        list: A list of dependencies of the 'ref' package.
     """
-    key = "id" if lic in SPDX_LICENSES else "name"
-    return {
-        key: lic,
-    }
-
-
-def cyclonedx_licenses(lic_list):
-    """Create a licenses list formatted for a CycloneDX component
+    deps = set()
 
-    Args:
-        lic_list (str): A comma separated list of license names.
+    for dep in show_info_dict.get(ref, {}).get("dependencies", []):
+        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
+            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
+        else:
+            deps.add(dep)
 
-    Returns:
-        dict: A dictionary with license information for the component,
-        in CycloneDX format.
-    """
-    return {
-        "licenses": [
-            {"license": cyclonedx_license(lic.strip())} for lic in split_top_level_comma(lic_list)
-        ]
-    }
+    return list(deps)
 
 
 def extract_cves_from_header(header: str) -> list[str]:
@@ -169,7 +152,7 @@ def patch_retrieve_header(content: str) -> str:
     DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
     INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
 
-    lines = content.split('\n')
+    lines = content.split("\n")
 
     header = []
     for i, line in enumerate(lines):
@@ -218,6 +201,67 @@ def read_patch_file(patch_path: Path) -> str:
     return content
 
 
+def split_top_level_comma(subj):
+    """Split a string at comma's, but do not split at comma's in between parentheses.
+
+    Args:
+        subj (str): String to be split.
+
+    Returns:
+        list: A list of substrings
+    """
+    counter = 0
+    substring = ""
+
+    for char in subj:
+        if char == "," and counter == 0:
+            yield substring
+            substring = ""
+        else:
+            if char == "(":
+                counter += 1
+            elif char == ")":
+                counter -= 1
+            substring += char
+
+    yield substring
+
+
+def cyclonedx_license(lic):
+    """Given the name of a license, create an individual entry in
+    CycloneDX format. In CycloneDX, the 'id' keyword is used for
+    names that are recognized as SPDX License abbreviations. All other
+    license names are placed under the 'name' keyword.
+
+    Args:
+        lic (str): Name of the license
+
+    Returns:
+        dict: An entry for the license in CycloneDX format.
+    """
+    key = "id" if lic in SPDX_LICENSES else "name"
+    return {
+        key: lic,
+    }
+
+
+def cyclonedx_licenses(lic_list):
+    """Create a licenses list formatted for a CycloneDX component
+
+    Args:
+        lic_list (str): A comma separated list of license names.
+
+    Returns:
+        dict: A dictionary with license information for the component,
+        in CycloneDX format.
+    """
+    return {
+        "licenses": [
+            {"license": cyclonedx_license(lic.strip())} for lic in split_top_level_comma(lic_list)
+        ]
+    }
+
+
 def cyclonedx_patches(patch_list: list[str]):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
@@ -358,50 +402,6 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
-    """Retrieve the list of packages that provide a virtual package.
-
-    Args:
-        ref (str): The identifier of the virtual package.
-        show_info_dict (dict): The JSON output of the show-info
-            command, parsed into a Python dictionary.
-
-    Returns:
-        list: package list that provides the virtual package.
-    """
-    return [
-        name
-        for name, comp in show_info_dict.items()
-        if "provides" in comp and ref in comp["provides"]
-    ]
-
-
-def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
-    """This function will collect all dependencies from the show-info output.
-
-    The dependency on virtual package will collect the final dependency without
-    including the virtual one.
-
-    Args:
-        ref (str): The identifier of the package for which the dependencies have
-            to be looked up.
-        show_info_dict (dict): The JSON output of the show-info
-            command, parsed into a Python dictionary.
-
-    Returns:
-        list: A list of dependencies of the 'ref' package.
-    """
-    deps = set()
-
-    for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
-            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
-        else:
-            deps.add(dep)
-
-    return list(deps)
-
-
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
