Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FD1125832
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACFE422EE;
	Wed, 11 Mar 2026 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOxXtWUJTCI6; Wed, 11 Mar 2026 14:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21DE2422DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237909;
	bh=eNBD4IXb/M+/TC8TyNsS40KX0inOW+JHlJnkPH/6uE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sQVZzpk2H7LElTEQ4/dHnYxcBjQl7CInkFs+5JX9zELN5W0QtDpz3m4PZw8D/Azrk
	 waQhkwTfJar3XtzrhQhHpaanKA1rkvr8KVbEiMiTupaweh22u44hpHgrioXIHyeBOO
	 mjM1B955i0lE+oRh32HTyiYDAn/yx/2IqDJLcYKJu5auC4MkrnOxYHdSbP/jwZTzde
	 xxBotEVC6brPBJzER/yOL1F96c9NDa29p5eJztbjzrhJ4OYIjEhj9j4ro+cBrOuZF5
	 w1mfSJrv8kqMZN2jRfU/kM+RsgElBQ9jdbSfwBMYb3Qbf7k5z6SYWnDfKKeLanp/WV
	 q+JRn2H+gTCdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21DE2422DC;
	Wed, 11 Mar 2026 14:05:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C358A33A
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12ED422D7
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBi1ynMdr35j for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADBC5422D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBC5422D0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADBC5422D0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48540355459so27531015e9.3
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237901; x=1773842701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JgkKxkVuTe0R9tSaDmW2URk+KZrSCQ0dk/h/1BdOpGA=;
 b=tD7O4Xcgp2ihQ5c0iQpxqH0FddOQwzYrjSjCtqAa6uu6+I3Y7dQ1wXnV4+SaJbcHUr
 SpeZWWV+EoPGBvTgnu1c+ZjqiD3QgqLj0NmqGNCDb3mBC32qVx8fDhOi/uS/AX3MlJ2b
 s5P1+S30FBUnl/8XTizPz+369b6SVamrquLkl2VvhDq62eoq6imoUJyPzF2NXU2VzXTs
 WBt7gymlmByFXfQzrIPaPvqyqDXix50FzxjbqGIs/jAqX2KukPO0hbTTLg8G436943A2
 twvQEKlUnQkbQYjpnCKL7D/vmqMEE/gA00kptjwKxbAczJaUiPa9CO5bOan4z26ZGfhh
 qDfw==
X-Gm-Message-State: AOJu0YwPc34CjFcS5G1uUfzrrMBIr6BZP3iKziFK6C2zIyy9hp095mzr
 GJS20kktBP46bBvT/YHsZGWFeBOh4UL7e/dRLUA+9QE19jLmiIcmzGo2bPXthlk0JajHe8EvNUj
 rtDYp
X-Gm-Gg: ATEYQzxsifZaRWpcK6CVGz/NvvFUT1R88KpkSYr2fHRLX8zO+L2NLD2mfub8hhDWXT4
 A9XnkNof0BlcuGNCdxOJ+rWHQtzJgnGJ5H99LfXJjWAqhD5XhXHQeVNIjm6TN4SatMBbkzOLKPd
 qIdrHaSMOuecEVX8pIppHMgYYMmgefFc4M81ntI+ZY+vWY47Nj4SimaS1tkmZ0YuJqVqqIBd9lM
 r8ZXj6Ixr3bYPaBrBPckiam1nUhlwboyMWKUHdNaazv6giXHP9IZuZAq6H74YkntbQfCRFbPSGF
 5WLwPaaMflWe/CqivWyLOKGtjnOu0IjTPB6GFqxeDiz1vMi7bb3IU+GsFmbBnNyuRAmF0xpYRFh
 lK/8cVOj+94NulpuksNmHFjo+74rNq/jbyHeIm6WTG29aT6V608io3FbuvoSiiQTzUjozMrtlks
 bl0tN7EWdsPZX1I7esFDRXDSoTtg==
X-Received: by 2002:a05:600c:4e43:b0:485:3fd1:992c with SMTP id
 5b1f17b1804b1-4854b0a6a05mr44111785e9.1.1773237901155; 
 Wed, 11 Mar 2026 07:05:01 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:05:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:52 +0100
Message-ID: <20260311140457.140041-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237901; x=1773842701; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgkKxkVuTe0R9tSaDmW2URk+KZrSCQ0dk/h/1BdOpGA=;
 b=OklpkUupRhOKNaQTAnza4iMgzTlHn9lrGjm6r0rmj/o5SYJV9oa9NiASorBTNRe4ZZ
 qC8C2rwtqwLaQAZLzDH4EGhoyGHi/f7pcJlNhKGB3HkClVTyxsd4M6NsHxfyOw0Z9Ml5
 MPr1YL3vLY6WbokGKYwoxhKcH53BMaZpxyag7yCBSYCe3a17cHEL+jX3NRdZWZ6GSvI2
 4voWzUNlaCSJv+dsXAkSVvqW+32VnogIU6BMl54idzUYtYe3MYa9SU1ye/rxe+SDe8Ff
 RCUquCn+TWE22aLNzF/7opcmnxn/o79IBmn7jl4dMNobMJrvNA9JaJ5j+9jZNcOnwp8w
 H8jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OklpkUup
Subject: [Buildroot] [PATCH v5 3/8] utils/generate-cyclonedx: move utility
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
