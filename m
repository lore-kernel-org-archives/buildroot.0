Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB9C87FD2
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3733184C50;
	Thu,  7 Aug 2025 06:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrT6kRwHiXao; Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429F184C56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429F184C56;
	Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 218D9D79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078916F5A8
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iF-j66H8tGG for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 06:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBB1F60595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB1F60595
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBB1F60595
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso3912055e9.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 23:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547815; x=1755152615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOafuc3tO+nkl5jTX05Jf3S1CKBWgmnwCwE0o+T8cgs=;
 b=C3UyQIWcxgo/an/7f6z4eI+uggzZlehyarG/sRJVmPtg5DgfzITtkeDCmcUD9DANzA
 18BPV8DxYRhzRUv7WQdDixTvGiLGd4qB7iHPEm3NhdgYg9lMkLOnW3Of2QW8+YWBhf23
 Z33IAfizPbnSzLbsfs/+Lrk4VBVr9GBI/XqIdWFHI7q749jAGbJDAGbLnMguo092a5zO
 V4tOsielasmeJSUg98JQfy00FUeP2mWwFpjmCdUUWYPLxz80QztlDiVb6RkT4jI5gxA+
 9YVIxc+AvEf6S9y6zMG5V8fylu3TMIuy5yYoq1ODUbJXYeMM7bWQ6KIgCXkzpjbtWBV2
 BzNw==
X-Gm-Message-State: AOJu0YxTcvDsh33RG82tHYudnOgiwQQgyl/Z3+8yg5FgfywVR8pgHn47
 FnKIwTRgaEJ2oMBNd8C6YOB7Zj9LqR877DnxEUcZ/S2Q56Ocs2G4fXaWHJm7Th+bZvS2PCOWsFY
 8JF2z6FAZBw==
X-Gm-Gg: ASbGncv9a2cFMKZtfURQe1MDbprF6SNWiBBMKJDiul8IoUXgnKikk57cTTbf6NEUCf2
 Sp8+yNfnj7kN94TBxrOybedDqVsmhOKvcUmM7vMdWisJdwkyO54n+gDeQkBUq/CQn4rILVZg3g7
 +ri07tH6xnSadUOVlBo9/M0H4+Vt2y33kWQbGSBK0ezFCukem1SlHXcg64y/1aRVQY/tmgvDq4F
 KNrliiXJHmuPzDt5z8ZUw5algOz/q+8bh+LNnigWjrwcewRQVNK+MO1aR8rvM74Ep+NKaGLPkpd
 YnJqSXXmGRF00/qmqA4nS9819QcOWV6Wzm7+dRitRitLb+Le7wnZC7WQkKGdfQIE2ncrIZX4+lk
 S30jcT4risv5cOHvrspxn4cCLMrVH5jrh/r8=
X-Google-Smtp-Source: AGHT+IE5v8C+Z+lvrMbRB5XdV9WM3PifjZOazWukqfFBHLZFwpDW8lERrSlMOxYykEIPWMl26U516Q==
X-Received: by 2002:a05:600c:4588:b0:456:27a4:50ad with SMTP id
 5b1f17b1804b1-459e74b6748mr41380985e9.33.1754547815242; 
 Wed, 06 Aug 2025 23:23:35 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:43e4:39a6:e147:9926])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm217803345e9.9.2025.08.06.23.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 23:23:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu,  7 Aug 2025 08:23:23 +0200
Message-ID: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754547815; x=1755152615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lOafuc3tO+nkl5jTX05Jf3S1CKBWgmnwCwE0o+T8cgs=;
 b=TDrw0/b95a2wL7ckuWMrsJ10SYvdHsWrK4nhQjkIM0gTE/1owhenFFo0rguS3Metv+
 LYNj5SxZHnUZ7OHHkZVWzQwk3OeDfRHoTVM9mT/ymACc/qPkYlt/t9dvieLOyG+6OjIC
 BdlGMd+xNPFn1SKqwJsejUcCsJtJSLMMyp8d8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=TDrw0/b9
Subject: [Buildroot] [PATCH v3 1/5] utils/generate-cyclonedx: update package
 filtering
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Keep only "real" packages, i.e., those for which XX_SITE is set

v1: https://lists.buildroot.org/pipermail/buildroot/2025-June/781118.html
v2: https://lists.buildroot.org/pipermail/buildroot/2025-July/782803.html

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 34e5672a43..3ff318f11a 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -178,10 +178,8 @@ def cyclonedx_component(name, comp):
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
-        **({
-            "version": comp["version"],
-            **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
-        } if not comp["virtual"] else {}),
+        "version": comp["version"],
+        **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
@@ -238,12 +236,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
+def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
     """Parse dependencies from the show-info output. This function will
     recursively collect all dependencies, and return a list where each dependency
     is stated at most once.
-    The dependency on virtual package will collect the final dependency without
-    including the virtual one.
 
     Args:
         ref (str): The identifier of the package for which the dependencies have
@@ -259,10 +255,11 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
         list: A list of dependencies of the 'ref' package.
     """
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+        # Only add "real" package dependency
+        if show_info_dict.get(dep, {}).get("real", True):
+            if dep not in deps:
                 deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+                br2_parse_deps_recursively(dep, show_info_dict, deps)
 
     return deps
 
@@ -277,8 +274,6 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
-                        help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -292,10 +287,16 @@ def main():
 
     show_info_dict = json.load(args.in_file)
 
-    # Remove rootfs and virtual packages if not explicitly included
-    # from the cli arguments
-    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
+    # add flag for "real" packages E.G. packages not bundled inside Buildroot.
+    # non-real package examples:  skeletons, rootfs-xx, virtual-packages...
+    for k, v in show_info_dict.items():
+        if v.get("downloads") and len(v["downloads"]) > 0:
+            v["real"] = True
+        else:
+            v["real"] = False
+
+    # Filter only "real" packages for SBOM generation
+    filtered_show_info_dict = {k: v for k, v in show_info_dict.items() if v["real"]}
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
@@ -330,10 +331,10 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict))
               for ref in filtered_show_info_dict],
         ],
-        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
+        "vulnerabilities": cyclonedx_vulnerabilities(filtered_show_info_dict),
     }
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
