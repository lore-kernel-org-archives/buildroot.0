Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F938FCE08E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B4B84196;
	Thu, 26 Feb 2026 14:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBOP8INj2jWZ; Thu, 26 Feb 2026 14:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBF2841EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115975;
	bh=L7iY9AGcVRP2oThrmo7DxoTPqDEyeUhG0mnlCITzDjs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f82kj1s99tcu7TFOXsj/cQBUVfT4OU4ZKq7bge81+DfoDy16ZELCJgUWsbM+d4W1F
	 le2nbrgatr4Io8qd9uk/clTYguPoZFBpL0+7EM/0uu1PwVJYmDbI2mKoTIpKz5DF25
	 ATd6QLg6m4uapUKLeK0qKgklBwuvCGfEgJpNpi5/maAURFbjuI+cvawpWGx4NNoTjS
	 QLRlxGKxrHRTHP+WTPa+gHH5yfkiCN4cnbF9SHaAwX6W9If9etwXHtI4Zk2UD0douc
	 DnEEn9udID1trrdIzeT275IfBJoc8ct1qMeHli08V7kNUckQkBeWXys5BlkfQWRRKM
	 rqoQzpTsuKOZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBF2841EB;
	Thu, 26 Feb 2026 14:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B31CB23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3AB4084B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnXVhKaYcWsB for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94AEB40A34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94AEB40A34
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94AEB40A34
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 1257E5A0008;
 Thu, 26 Feb 2026 15:20:55 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuQjcur9rTe3; Thu, 26 Feb 2026 15:20:54 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 49EFF5A0009;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:22 +0100
Message-ID: <20260226142023.1064241-8-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=hd6o7EIAR0oAMUwBBjZBxLnlhD7Xg5DzKA7eIC9b1jM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VtBMoc/YcBu+yutioBgf5xO9zlb2g8jZWlcw/PAFT1+0jUweBIvg7R6hSBsW8HfKy
 bQjNORpBnfc7ErB+y+T2r6sRUHvReLdHDpXu3Led2hemRcZe4gzWodoKvF0Dfjf8ge
 F6KivJ6O9el8gU9FyjPBKJuRPVviV5zh9FKFWF0yHh86LhmiBEkZzMxYtjHvfRb4Ev
 x1AYzPSWTWbS9EvdEWHlI1nicyZV+p+dqTi73ye2+jb80VA8ZN0a4LCt+ekMAh0mH2
 vDrH8lfjIxOGrUEFpLOwrF7k/+I3/AUYLt28V/BGQTOogerTuE2DeMmPltstribi73
 UnfP0HWiqqCCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=VtBMoc/Y
Subject: [Buildroot] [PATCH 7/8] utils/generate-cyclonedx: allow excluding
 vulnerabilities section
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

Some standards (such as TR-03183-2) require omitting vulnerability information
in the SBOM. Add --no-vuln to allow excluding that section.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9920000e6714..48573ddf9a3b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -445,6 +445,8 @@ def main():
                         help="Excludes skeleton packages from the CycloneDX output")
     parser.add_argument("--no-host", default=False, action='store_true',
                         help="Excludes host packages from the CycloneDX output")
+    parser.add_argument("--no-vuln", default=False, action='store_true',
+                        help="Excludes vulnerabilities from the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -514,12 +516,13 @@ def main():
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
         ],
-        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
     }
     for ref in filtered_show_info_dict:
         include = filtered_show_info_dict.keys()
         depends = br2_parse_deps(ref, show_info_dict, include, args.virtual)
         cyclonedx_dict["dependencies"].append(cyclonedx_dependency(ref, depends))
+    if not args.no_vuln:
+        cyclonedx_dict["vulnerabilities"] = cyclonedx_vulnerabilities(show_info_dict)
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
     args.out_file.write('\n')
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
