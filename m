Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C30EFA374F
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271E680F95;
	Fri,  2 Jan 2026 15:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQ0FGfRLhVSQ; Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506BC80FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767366485;
	bh=gs9EXS4Wo3EnCVFgTkeHdy34iX59bf+61vXzPrq4CoE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=T0FW1N5xv38xIvcvJ7QZYcLa0qsgh+C+4Pbv8DFByHXJR3dE6a3syYnnsbpHCOoL2
	 Pg8zcIIU5fa9FsH+UMnRPqM/zc3eeD/so/0NGtwwwCqdsbKE3VppzfT8oBho2lG6/x
	 VvlJFYmfUpknG6z8YDuQGOiiIUW/eduM17gwGlnvj8Gxv4Fc/V6rz5yWu5B73IFf0N
	 Y7jFxxQp5v9QUKks9qrtc0cg48GohVGTkvZFMmv2IZqnCjt1AN4dEFTDUvDXgJKkO/
	 0s+AArnQrytAYoCSDrGEgth32gEsbXjQr4F6xSbtaY9ogP2MNlB457uFo8fTCxvAkx
	 53ZEqLUZHPr8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 506BC80FA6;
	Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 648F319D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6253E400C2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFDeferhLudE for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46FD2400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46FD2400C1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46FD2400C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso36577185e9.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767366481; x=1767971281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwSlR0deMWy9uDqCL3iE6wLbKSODxvEHzN7BHU+pxfo=;
 b=WErtSB3PZeSZcgcslloem4u8xh7p7sXsBKiSkVISWoiCIXTtER/VP5saFk9wLMSRzF
 1Swl9xm2uFjHyRQ0p2E3VSssrajXR1CWhrT1NmUsIz7qJfZ3J4i9ESPJZnzV66TdE/pB
 wPsrhI1hKp5NfLPyaKbTD7tA5oVmY3PIxHpWTIoJrfAK7j+NYi7KaeEElsaSq2KijRD4
 0KUWbrSaAeSC0v0aCluZW66+8hKjZWAa0liHbrDlCi/GEFAwtsqJmg8KSzxyC2L6NZNl
 UZvhxD2S6ZcKNuERQHYr+uzRGp6gPgSg7ApqI6/CqxnrLV82cGYbDrQdIgQ89EWBFjgT
 IVow==
X-Gm-Message-State: AOJu0YxLIY+SWV0hrhXJH1fIl8NVm+1WOdnLDIRlO7fcRcgLl7dPlWZo
 x8DApxuchn6ywP6b7BCP/2JYeowKIds7ZYCP9b0LJd41Wi5FRKSzBiX/O5hspLgfV4Wf5UBRKZt
 LRVSN
X-Gm-Gg: AY/fxX4Rf3aqpm6fJLsev64kiaylQ+BT0b4hIKqNNsSDLgJ1xR2fkTxBFvII7SMALS0
 AAyT6hzVkrIFjdSfrniY7xvI2xSirmHmZARLZKQ6dKXGNnGClObQ/yBo8zbkOj7dL8Njy6nH6vQ
 z/wMHujuMszCvfeyDn7hnVXqybZ+KvWGx4TObEig6Pvs9exDj+xOZvIJhkMgrv7hUtJBAVVbbw4
 vAcRRAc5lTKMpo1ehpdnfwC++h3jS/fXVwchHD17I0K5VhCLLKdz58SanoEi7CyXLksrBCCBxVd
 +XVMxElnb0m9yL9zwcHU41lJMYGNwamx8zyn8nqB0xerVqEffJykoWwDJC6r8rOjrByQqw8TPpT
 LXMPjS+kVc4LrOtFQELVaz5hRqANgl7pt1kILpoKWduBQJSACad/iYGDiZGmMiJMw+eKCLwLSm3
 mKyoo76i/DCtLQ3J2FpaeldHGQW30vc2zLgBAdxIVt1loFwK4Ek70tPhCHzKFmk4KWkGruzotry
 F3stPGS/ZsdgocphEP0iZKRYfoT
X-Google-Smtp-Source: AGHT+IEeumgvVea3maaQBCZgSza9XTJ33RnbpUCESvW7GYRzhDvW+QA6rS63ZmRiVW0069XiFQrdQA==
X-Received: by 2002:a05:6000:2204:b0:431:a0:7dea with SMTP id
 ffacd0b85a97d-4324e4fcdd7mr49590051f8f.40.1767366480653; 
 Fri, 02 Jan 2026 07:08:00 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm84629079f8f.39.2026.01.02.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:08:00 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri,  2 Jan 2026 16:07:53 +0100
Message-ID: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767366481; x=1767971281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EwSlR0deMWy9uDqCL3iE6wLbKSODxvEHzN7BHU+pxfo=;
 b=W8XgRuTOHJSaV3sLYUH2Ob/Mdm6AG2MDCS9pmMjyCIiAR7v4DzKEdTNT6yZ31L+Ys+
 /q5qDe9uFxbayciiX9YR7I7gHYcNE+UHLcMSh4e1VWgilmWYuQDPa+sf+WNsSshlbYI0
 yRI/i1Eq3kO5bfa2LDNFnmiY0oi8f2trLBvW8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=W8XgRuTO
Subject: [Buildroot] [PATCH 1/5] utils/generate-cyclonedx: update package
 filtering for SBOM generation
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

- Filter packages to include only those with external download sources (i.e., not bundled within Buildroot).
- Remove virtual package handling from dependency analysis.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a103b7b707..29c73f3616 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -280,7 +280,7 @@ def cyclonedx_component(name, comp):
         **({
             "version": comp["version"],
             **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
-        } if not comp["virtual"] else {}),
+        } if "version" in comp else {}),
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
@@ -337,12 +337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
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
@@ -359,9 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
     """
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
         if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-                deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+            deps.append(dep)
+            br2_parse_deps_recursively(dep, show_info_dict, deps)
 
     return deps
 
@@ -376,8 +373,6 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
-                        help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -391,10 +386,10 @@ def main():
 
     show_info_dict = json.load(args.in_file)
 
-    # Remove rootfs and virtual packages if not explicitly included
-    # from the cli arguments
+    # Keep only packages with at least one download source defined
+    # (packages with _SITE variable in Buildroot makefile).
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
+                                if (len(v.get('downloads', [])) > 0)}
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
@@ -429,10 +424,10 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, filtered_show_info_dict))
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
