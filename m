Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE22EC87FD2
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C0984C58;
	Thu,  7 Aug 2025 06:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5Us-RiwCQhH; Thu,  7 Aug 2025 06:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F9F84C59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F9F84C59;
	Thu,  7 Aug 2025 06:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4311F233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9CC84C5A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuRwUEBBV9yM for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0891D843FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0891D843FC
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0891D843FC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so5808525e9.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 23:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547818; x=1755152618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iH08oxoya3yGx1zSMSRCg74LgNHoChvAB3V8erAZLU4=;
 b=jPBYSApXkXsIbtfPXuBNOmhsWAIwXbAYcgd5dMAMgIorJvcbr94ud9GrgC10eKvcQ/
 9OxsjBsSEytMaA6tB7oSWAHdmeKa58f0q7KbgTXSjXS2McoQrsWPSiw8f6IpnTDe2/4u
 6Sr4BCdeIYLYeXghhlWe4jU/JcFDAmmV3yC2iixgpP0NnMJmV1vF/aXEhqhp+4OtfBuA
 pMfFcjPQLng7HSm8zHXEzXmku65XcnJqyBnH+dzEqhyBIsXVlnL7NuGrv++LOCkwD4+T
 Ep6Cu2CYbHc5yW3mckFDzJeFol8KoTEbH9z1BjyU6pDvETxruBjPto+vl78vKLLsxSVD
 DVaQ==
X-Gm-Message-State: AOJu0Yy+R3f3Rz79GnVI8LtzQgIklAG2br99eyV55hxtU95FmA1CkhMG
 EvumDvvUs85IWNvGySkH3c8IlnerYeu7dBLuRJ8336ynF0FACBVDDgksWQU65l5WPyEZUA6UMwG
 WlfsPesBYHg==
X-Gm-Gg: ASbGncuHrV4bo20Xysxh8XmMznUpE6EGQgfgDVU2MKKrdAN6XZ5pf/TP1vrusA5zfOD
 A6MsBd9j3JjPSJd3EaPfw3SNDqDpNYfdgOaD3SkUpdMDsNhN84WH+pSE++7JpS1vkw77EuTiXrp
 pZkXCl3vIZ0eEo//4FM+W9l/CSMJltcgaSaYBLE5RulZBQMYJrf20iz53oEo12a9bRST6KFn5PB
 ZVlAGBImB0yG5BHHrh8YnC/2FpB1VbSaBF/3d+SyV43tKwe+rPRv2TS7avSmfYP1OmR2iZcb7Ec
 2Au+7nPgrTQ3tS+ur+cVaNDKVXbcfc32Evvn/R7zF/MiDK9TkBVgoG+a+x+kt6lk+PhJS7TsffD
 42QpQDXh+EsYw8ac/p0HhxYzLAAHyPIM7ZYc=
X-Google-Smtp-Source: AGHT+IGNRmrGwX6nEfIl79U2hm8QXSyavfZ0gv3rCiUu6DJBQ3JhrJ4sC2wioZYgFpUXHgSV3Iw+0A==
X-Received: by 2002:a05:600c:4586:b0:458:bfe1:4a81 with SMTP id
 5b1f17b1804b1-459e7490d11mr52119565e9.17.1754547817825; 
 Wed, 06 Aug 2025 23:23:37 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:43e4:39a6:e147:9926])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm217803345e9.9.2025.08.06.23.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 23:23:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu,  7 Aug 2025 08:23:27 +0200
Message-ID: <20250807062327.1637333-5-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754547818; x=1755152618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iH08oxoya3yGx1zSMSRCg74LgNHoChvAB3V8erAZLU4=;
 b=ECFwOR1UVDiXSpYMLzSqV+A9y7GwgmwkitelPsx78IU8cZuMgiF8OMBNtcYAdgxiMJ
 hg5TvI4nf8V9/MmxGYQj84vYb/HhnJRFtF8CEMWKQBbR4TvixbGCEwys4yYel0RaNbkv
 fUWstYLQ88g52jjpQZrevQECUx+Zgz29YQbKk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ECFwOR1U
Subject: [Buildroot] [PATCH v3 5/5] utils/generate-cyclonedx: add option to
 filter host packages in components and dependencies
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

Allows viewing and tracking only packages installed on the target.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1cfe0550c8..25f042431d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -236,7 +236,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps(ref, show_info_dict, deps=[]):
+def br2_parse_deps(ref, show_info_dict, no_host=False, deps=[]):
     """Parse dependencies from the show-info output. This function will
     collect all dependencies of the package and return a list.
 
@@ -245,7 +245,8 @@ def br2_parse_deps(ref, show_info_dict, deps=[]):
             to be looked up.
         show_info_dict (dict): The JSON output of the show-info
             command, parsed into a Python dictionary.
-
+        no_host (bool): Whether to exclude host packages in the dependencies list.
+            Defaults to False.
     Kwargs:
         deps (list): A list, to which dependencies will be appended. If set to None,
             a new empty list will be created. Defaults to None.
@@ -257,7 +258,11 @@ def br2_parse_deps(ref, show_info_dict, deps=[]):
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
         # Only add "real" package dependency
         if show_info_dict.get(dep, {}).get("real", True):
-            deps.append(dep)
+            # filter out host packages if requested
+            if no_host and show_info_dict.get(dep, {}).get("type") == "host":
+                continue
+            else:
+                deps.append(dep)
     return deps
 
 
@@ -271,6 +276,8 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+    parser.add_argument("--no-host-packages", default=False, action='store_true',
+                        help="This option excludes host packages from the CycloneDX output (components and dependencies)")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -293,7 +300,10 @@ def main():
             v["real"] = False
 
     # Filter only "real" packages for SBOM generation
-    filtered_show_info_dict = {k: v for k, v in show_info_dict.items() if v["real"]}
+    # and optionally host packages if requested
+    filtered_show_info_dict = {k: v for k, v in show_info_dict.items() 
+                                if v["real"] and
+                                (not args.no_host_packages or "host" not in v["type"])}
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
@@ -327,7 +337,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict))
+            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict,args.no_host_packages))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(filtered_show_info_dict),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
