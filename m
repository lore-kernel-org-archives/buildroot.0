Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D82CFCE08D
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7DE843B9;
	Thu, 26 Feb 2026 14:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72W9LT5U8L1F; Thu, 26 Feb 2026 14:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004DA84458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115974;
	bh=LZILNVdQsWZQ3F/pxpaxfWM8B0DDGjdhxZRPhAtyKJc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovx7eug9YppnSvkH16eJ/dqIDPgAR6PWO4FJM1/Putl2rDlQVBMtAF75Wb0rIUoSh
	 11lpdhZTgdeoDL3XVLxXe7gFunDVNhY8WH8kI9Z7JH9tQlvXLlF8uwFkIL+StLuOTA
	 RK09uUDsNqOGi2L7TvAdqAzmrTRY8NVyLSdKJC2WH9tyCae+TLFyHPsXz0L+QE+bvh
	 KuuSu4n2Wpx2wTxnOQQr01KOqvzofhoaOEySmYVW8GgT1I+6yG/fkWUlriyuu0HxBC
	 N9yY5+ZNOWpuXI+dM+u7sAzWeOYYLDgzVqFikmciPL/oSLiJIwMSVlgTmXrv1uomH3
	 VLykyYG+pM47Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004DA84458;
	Thu, 26 Feb 2026 14:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A433C23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF5ED40A4E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw601JQ0bdnR for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9470B4084B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9470B4084B
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9470B4084B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 1363D5A0005;
 Thu, 26 Feb 2026 15:20:52 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bus3pqyw_H7W; Thu, 26 Feb 2026 15:20:51 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 2D32E5A0006;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:19 +0100
Message-ID: <20260226142023.1064241-5-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=7YOlU9KbomA3A6ET+AuQqNswcXngb8q3m4NgFPwcv5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmJ3Th8CUz6gA89Gk/l7C9gB2DTmq8aNQbOmn8cdyWR7Fkyo3PJbfPRajt703o4am
 TdF1cS9O3hgCYibAv2CH9mZWAqsuqC5UDNJZ++KWUrqcOxUHe4oqDBSFttGYiswOyK
 5ctRyrHTcDEhP9MwNPazDSEzOhykzRjQwMHLbYxBUyN/D2LL976no4g9nmZWLk1gj5
 g+mzdYrP1NR/Rpb86vG/klCbcBLwQDTxYYD/k50Kc8Y6kusTQfw5L+ZaVpDmKT1nOc
 tJ1mnQ3W/91q6RDPilwy1iIVFsQuHqiAryc3sr8KviEi0jrBK9D8ZpmnCWcGrw4eRM
 15s+bBzE3vuZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=RmJ3Th8C
Subject: [Buildroot] [PATCH 4/8] utils/generate-cyclonedx: allow filtering
 host packages from SBOM
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

Including build dependencies in SBOMs can be useful, but some use cases prefer
excluding them. Add --no-host to exclude host packages from the generated
CycloneDX SBOM. Host packages are filtered via the type property from the
show-info output, with the exception of toolchain packages identified by their
prefix.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index b728e9883dec..534177bd6902 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -441,6 +441,8 @@ def main():
                         help="Patch diff mode (default:'inline')")
     parser.add_argument("--no-skeleton", default=False, action='store_true',
                         help="Excludes skeleton packages from the CycloneDX output")
+    parser.add_argument("--no-host", default=False, action='store_true',
+                        help="Excludes host packages from the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -469,6 +471,11 @@ def main():
             k: v for k, v in filtered_show_info_dict.items()
             if not k.startswith("skeleton-")
         }
+    if args.no_host:
+        filtered_show_info_dict = {
+            k: v for k, v in filtered_show_info_dict.items()
+            if v["type"] != "host" and not k.startswith("toolchain-")
+        }
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
