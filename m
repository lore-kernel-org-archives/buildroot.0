Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE23E8782F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9397F83BD2;
	Tue,  3 Feb 2026 13:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHnFhbalqjJ6; Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6051983C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126766;
	bh=8eHKBKnDD6MsNwjozUk7BSWgLpdoMavbRcRRP8JTd3I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T7q93c7PV17+jupui/5ivjFtadhlmLp1QB+2O5cOOhKUJEWFrt12DuL4WPLZYHZr7
	 vTOyibmQE5F2js6VOJdFED6Zelyc7wzozv/R2cCf9WGvy/qMwjTjERU0tLvPR0ZwUz
	 wTgudqakOmUvuPGYrJ3ryzMwFJwc3Lwo57I8zAApRQL3gvdUOI/UMXXyiDL+YuBfxi
	 P0CD8Xr2N0TkHgS9el4LKDMn5VhZuAWHA3c5OXf5qIsZp0daemepjGA750u1nHG4nG
	 Hv7cNv9HX/MvqqgG1sn6CQtTUzYaaLX6rId0F0eeX+HApsWfgCwS2SoNSm+WDg0H3N
	 HvfuSatG3HlmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6051983C0F;
	Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95342F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA9F606F1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hnVlPCN0-ch for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5539160830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5539160830
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5539160830
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so5250461f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 05:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770126759; x=1770731559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aMYztb9N4EEQJqj4JR4FhbOlQucG4VRZCseKtTPN5c8=;
 b=qZOd/4OChvbdNuy5OoldgoAgjEUCsgBaGksdmI+6hz+6HELI1QOFjOv4q7rzzJU4PY
 vjGcM91eJc1rCPAa+jwYR0pRuDO/4jQt6tcdwuN+0VqULPTGOcAKEgHiQ9VGI0q1VxU2
 6QW2855Cd4V9br07UfTpM9CDYiOmUKsFRGjdRFbqiE8pLoZpzD42z+GeKi4Z4RS2vdoM
 I5CB64oCvRt0S9UU1gRg+zCiOc//l8YNV/QfeCUI4u7vXRAraTfO9LctRFUT8y5i8Ufp
 OjlkmtEiVzq/QqcCcuFUzK6BOy/rLTpISAVutymKXcY674Dyk49wNGv7wm8tHe7amSZl
 EpoA==
X-Gm-Message-State: AOJu0YxvSEh3qqgn1w0adJYoQp6rmIptLmk+uCfBaAlqOJL5gwOnf9nd
 pr+1x2J9PfvePU8kdQd5MTpBi7xfjLVrB8inucVaQLN6PSjdAMS58AJbmFFmjAzZRe+M+pEQPOo
 TnIo/
X-Gm-Gg: AZuq6aKOgRBUJnWf4DJk8BLyg2+84wJORJGrjzxo6VvsejoxUkorgBGOQ8Z9tcgPvnA
 kveiWS06UCWljeNpp3f9xwdQ7VX56VvXt92ez5v1D2G6aQ5ZIOjLkZzxdPGADhMLUA99lhmM/2a
 khaE9KvFp1PxGjeAUnQw27m/u/dz00iJsDLCKkqtqmZkeyOYpowSzGyAhi92ObWvNqDcqpesKVv
 q0IUjpZmTmlGBvWGyV0ONX73qNgZVI9hbqK/1q4Z4XgJiUXPq0VI/xUy34aQSb6neUn9hvXDwRq
 skOXBhAN1rCKVdcu11x6iJy9AWBCXvo9NHs4bk3D49YHO4DmVIAWm6+D4NsDuq5K/rsA7xEZbhf
 OTlNw6ief1rPm86cQlTwRfA5zvd6rNyIpVX5Azwuj1iZYj+pu18f4J2gL8yLtptT0vmFQEM4wm7
 DbKiO0iOS5d50cdmdTy839OGy5Fc7d2NdK59k1vNwqvA8=
X-Received: by 2002:a05:6000:4285:b0:430:fa52:9ea9 with SMTP id
 ffacd0b85a97d-435f3abb546mr25060167f8f.62.1770126758962; 
 Tue, 03 Feb 2026 05:52:38 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54227388f8f.5.2026.02.03.05.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 05:52:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Tue,  3 Feb 2026 14:52:32 +0100
Message-ID: <20260203135235.184869-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135235.184869-1-thomas.perale@mind.be>
References: <20260203135235.184869-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770126759; x=1770731559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMYztb9N4EEQJqj4JR4FhbOlQucG4VRZCseKtTPN5c8=;
 b=BNNv3/qF0ReQHRv5qWGqYh2th4VGjUXCoXYR4MDkV8NteG1XMRYhkflRRyGSsPywmp
 ssCzDco7AH6sWmWcK6P7xrhaduF3WEak1O8Et/jmdLtu+2BN4HIh6TnZ+4QcvR/IRh9e
 WL0IUgRD5J2owDd6le5ktft+duHuPGysTM/++2rDzhIYFYMkJudyuiDkcj9pC2CPUgrv
 3lesKdbE1Zu6LrDxKk0JUkwxat8qr3j8NciQuKZk1OsJA+8H6M+/bGLxc6DwNBy8RjEu
 ql1v04O02hkiEtiBOCMMHUk4zDXT7QXRRNMGjL1nUhZKg5OCx1+XS56ZgvFVG1yVA5aS
 wJtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BNNv3/qF
Subject: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: move utility
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
index 93b648e481..f5faec09b4 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -75,65 +75,48 @@ def br2_retrieve_spdx_licenses(version: str):
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
@@ -166,7 +149,7 @@ def patch_retrieve_header(content: str) -> str:
     DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
     INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
 
-    lines = content.split('\n')
+    lines = content.split("\n")
 
     header = []
     for i, line in enumerate(lines):
@@ -215,6 +198,67 @@ def read_patch_file(patch_path: Path) -> str:
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
@@ -355,50 +399,6 @@ def cyclonedx_vulnerabilities(show_info_dict):
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
