Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D0FCE08E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B18786164B;
	Thu, 26 Feb 2026 14:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_F8rAO3045K; Thu, 26 Feb 2026 14:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBBA6163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115972;
	bh=ifUMY37IHNNhbgtL7iGzjfNCe7EfewhgbxlIFNu7pLo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1rVkSg/4+kiC+UJLVXbISemjIBsPGYHsKM1QTarxIKLh78anDAaqlzIf91948JXi
	 491p5euoQL0dsbVlm7bBchRpRPWAuRaxh/xr1o84fnQ3yvkBN+tDILwcN/rZtmo8AS
	 9PblxbM6Im+Pk1/MK0QppCPcMpYlqRaxy1CYo/xqzbtUMx89k8/eN8AIkZq1VjDDHJ
	 BrpqKKBV7vz+rguPKr1MTyj+/8B6Fr4TNpDRkdb+zAxnqhiujexSC/GNzW6l524lAU
	 8A/c5LDrotHbpyj+K6scFXqqEcGAC7M4GuCn3NgecaenFt5ojEHAKdx27CsZ1pe4Bm
	 ejBRfv0+7GR5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBBA6163B;
	Thu, 26 Feb 2026 14:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B14323D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B174D61600
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwnBb4VbqiMg for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4ECCA61603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECCA61603
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ECCA61603
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 11A235A0007;
 Thu, 26 Feb 2026 15:20:53 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKu_m1V682Bj; Thu, 26 Feb 2026 15:20:52 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 40BDF5A0008;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:21 +0100
Message-ID: <20260226142023.1064241-7-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=J7H5qn/Dly26hBEO2Lu7dxkmbTNZFYwXNN+UA6zKJks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLl4ZBdq6iBMT3enVvz3+sSUOmuQjk0WrBv37YUtpA7LMHe+82P5cvfm7ypgZiEpV
 +YYz2dmw5zLN3MtV84FO47Bpe7uJ5mZ1D6iP/bIHjJ6sqFWT9FHlYAKHI4VwXJZZTo
 4NkrfJIvzI8skpu2jaAyoUwv9UZw8QKRwIFCrFp+aHVNDhOfTpN55AhzIlIy8d1GtQ
 u7O6itzKu0VuUqAmSW7laPP534155VMOck1iu2Ub8xivQxbyfVlGkI7AszYMK0H+lG
 +YffMPz5nlyUgwf4n7Ut8BTNvtF6FiHnp67GVZO2LMhVU1gLigr6dK1V76PGbUEH8u
 0NIA2he3vqRVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=mLl4ZBdq
Subject: [Buildroot] [PATCH 6/8] utils/generate-cyclonedx: do not list
 filtered packages as dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Packages filtered by --no-host or --no-skeleton are not meaningful dependencies,
as their references are invalid. Filter dependencies by components that are
actually part of the SBOM.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1d8fec7a2cdf..9920000e6714 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -381,7 +381,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
+def br2_virtual_is_provided_by(ref, show_info_dict, include) -> list:
     """Retrieve the list of packages that provide a virtual package.
 
     Args:
@@ -395,11 +395,11 @@ def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
     return [
         name
         for name, comp in show_info_dict.items()
-        if "provides" in comp and ref in comp["provides"]
+        if name in include and "provides" in comp and ref in comp["provides"]
     ]
 
 
-def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
+def br2_parse_deps(ref, show_info_dict, include, virtual=False) -> list:
     """This function will collect all dependencies from the show-info output.
 
     The dependency on virtual package will collect the final dependency without
@@ -417,8 +417,10 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     deps = set()
 
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
+        if dep not in include:
+            continue
         if not virtual and show_info_dict.get(dep, {}).get("virtual"):
-            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
+            deps.update(br2_virtual_is_provided_by(dep, show_info_dict, include))
         else:
             deps.add(dep)
 
@@ -511,11 +513,13 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
-              for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
     }
+    for ref in filtered_show_info_dict:
+        include = filtered_show_info_dict.keys()
+        depends = br2_parse_deps(ref, show_info_dict, include, args.virtual)
+        cyclonedx_dict["dependencies"].append(cyclonedx_dependency(ref, depends))
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
     args.out_file.write('\n')
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
