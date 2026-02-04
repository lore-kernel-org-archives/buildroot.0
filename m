Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66882E83F11
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF60360D89;
	Wed,  4 Feb 2026 13:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNcKl6iHtaKn; Wed,  4 Feb 2026 13:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDBE60D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213250;
	bh=IwFNBR+qIuhLY1WGeRhONjvOSkWCfuX08tJpN0oeWhI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GhVTz90OxGhRCDdTybwtrdMsXnjEhb8tLNc3maQTLm0y+dr1Pswj9RwkTXfo2cG3b
	 VL4jO2irYVZzd0Gmmv3pX9qIAyrAt48unD1FgXaixEjp/WdlqpBqgUuJ0g0OedCRlS
	 UR5fUxkiShEEs/tJ9ICZSgfHGpDaF2CZK6RFyON0h/6b1d5+BchnBnM3BHtr2SsUTf
	 MRYP3T7pdcPIWZoMNiPf0GMFrHDMQBp+/8oP4KQ9SKo42Z8t7npeZyDKOO3PpTvQBm
	 TXSQV02oF0dFJtREyB8gvs8Tl+OvVSZvuB8r2SIh4QPCB8NE520DqwqrRUMz3aCFEx
	 yvi5Mwm9dbF9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDBE60D76;
	Wed,  4 Feb 2026 13:54:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0D77F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8405140646
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZrdkq4W4o5y for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18E7840644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E7840644
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18E7840644
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so8799005e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213242; x=1770818042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NQz6g+kwF6bqE4BfptUgkOYIla+6u/6ODtd6SRsaZ7M=;
 b=JSsmHTWJT9zJoQxirS7enbzzHvtRYjwbqgqIzV2onS17OC9yqhR6fz2RyoKiW7RgSn
 EREBZPGD4P6md3wDsq1Y7bpI2gBXcTl7pBepSIET7ZegfFIVht/K+mNlgjLBfF0kW4Pa
 1FSs8BVDrJQJY1qI3As4Nqv/vo4/byf5IhlnU01SfqgMGx/Pv1ZTau3zgjjBaWAo8jCP
 Ca34li/Zqyx42abSouu+KZ3MjHU7sVTeRrOrm1oZt2J0d+cKW87sd85aKtNswjPgHSjN
 Sx/zCfRjH4Ka3WPFVEvhR6sBidhWO3liHSAR9p20dWHz4ye95rFodUJETaQypsQ44R4x
 qyDQ==
X-Gm-Message-State: AOJu0YyS2+ETL2+/6bdSgGu/H22CIi58yu56R0QfKMzkS6UPQLS4cxz/
 E0iX0kPwP9YQ9/7j+h3QhcxJP2DPiViLQGI3TVTvaYifRDGyChox+/DQD0L2G3Hy9bQ7B/AOI7D
 +RnYm
X-Gm-Gg: AZuq6aJ+fDQUxypFAMtPCqbpZZM/Bwm6qjDyAZZqeued+sYkuOmLA9qjiMHVYm1aYnh
 NMQU+Ykj/JEwwLmC7Wmtqbt4wFI81lY6AQLlE8plccLt5naNPh2rD4gDQNZyIYmhbdjvLNrjywX
 Xlv4noHU0z9rvB5SPXjnPkijTFbiYss00dN5B7aCgP0Ibk6/u4lVQPCaruosmtrAcFcbRm1SaWt
 PL/4I3I2xUMJ7Em1nxVsWaL/2w1CxNYhsVDlZwS4+zH083fV2kF+lTtp3SXq4G/KPDF0kfDWcmx
 2fvGAXHUrX7eOQ4GrckxnMmM5Vrmc+HzT7RIWWIsi6398JARJTQB1n6vid+8yr+drArAHmIT9cU
 GZrBXsPUsAU276o1vwVgG8K/Vr/z+2thTrlIo67FOFq8I7CGIkh8Le+hlYE+bzx6NzJ+T9Xpuhu
 oG76gHGMFbH1N//duXr9jI2p5xgFY06JAJE3TOLV9VVxE=
X-Received: by 2002:a05:600c:c3ce:10b0:477:3fcf:368c with SMTP id
 5b1f17b1804b1-48305165048mr64576945e9.9.1770213242447; 
 Wed, 04 Feb 2026 05:54:02 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:02 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:53:57 +0100
Message-ID: <20260204135400.307638-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135400.307638-1-thomas.perale@mind.be>
References: <20260204135400.307638-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213242; x=1770818042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQz6g+kwF6bqE4BfptUgkOYIla+6u/6ODtd6SRsaZ7M=;
 b=F1ZMwHl1+TjybMLu4d6evFMG1IBwvipgaLb2ufhmzsnLybaPmgolOrV9/Ig6LWWtBV
 dhVf4Tcj1PmehR8iB4s4UMAC+hJ5lDKUgTADxwE7GcTjxTu6CVvK+NnFSsq4mEKYboq6
 4CN6hm8ende1cEqrEuYW730RNcMnq8v2SbOa020SoCrtTAVrn0i31iCfV/J5Ive5F4b+
 sWf9qbtSLXGi4jE5ryvy3rAeBDK0kf+FyUpW6w8o6l80eNN2q3VVAJIsJ3NlLR5r4QS/
 3IW1lYBwvb00LBMCIrYUaGSvQ0weE14GBYN2wlZxUqABt3TXXZUswF3wGdGxMlzgKBTT
 EKWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F1ZMwHl1
Subject: [Buildroot] [PATCH v3 3/6] utils/generate-cyclonedx: move utility
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
