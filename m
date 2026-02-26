Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E38FCE08D
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0CB841D2;
	Thu, 26 Feb 2026 14:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzVEm7mfhn69; Thu, 26 Feb 2026 14:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6172784196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115969;
	bh=lGHrPutR+ftArHOqtOVVX9qMDRX4si4EeGXdIw/QGQI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7dM8c+XOzdvZoCEPPlHXYua+Kl+avTH1sd5qLCUxZEdkSSC5wYUDmQ3TzQLLPn7B
	 S118jyG53ingOtqSs2dq6myFReRyLK0FrW/cWSBnq61kZKZ11B9AkXh1Oolwy3Bf33
	 zIf4QkN5nqhTnDzw3IL53gVkvUw/FeJmc0LVPcLlYoOVozjG6yelb8IFXrUx6cpC+l
	 Ke/1pTRdYeFiIF32iOgQSiDGeE1wnvD0hUNB0S94rqOdXMBWlgUa7nMLG4YNvcXlBB
	 0LOeQginKNQkp7QuCksKTD6TzEGDoNlNePPag6R+FZBmvRMZmZWDChJCAxhh+DvJb+
	 wnCxFcpARSvFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6172784196;
	Thu, 26 Feb 2026 14:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E77823D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991C761648
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pv7fLB2CKhb for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A7306160B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A7306160B
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A7306160B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2A5235A0004;
 Thu, 26 Feb 2026 15:20:51 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXPC4GmiJNgm; Thu, 26 Feb 2026 15:20:50 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 225B85A0005;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:18 +0100
Message-ID: <20260226142023.1064241-4-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=wr17fO+VupxpxtSh1lNKvoRm+J5dBU/GxsuwFyLbTGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ymICwi9s0JFVX+B8D95K5xRvHL5JsNhyFF79HrSxK9ACDd1nTYuzAMfolNJT5vfsh
 RJg788+geyqELSfzdnK01XbgxMPd940mTNe/chO/a2apTYwJvXm1l+FsusUfFigdUX
 yxx45qPwB8uaoDTul+jxg5vr3sR4KWOfJv4Jag3kpHBe7Wv4nHNalkrhcxelJqEJlj
 h3BBLtql/ixxvzu2ZcSVBWJpVz/rMieWqqbHRw+nQl6JFLOL5OkpGqWDLRuDW3BzXm
 BgHXTeADDoXtQ4Oe6CNSNiPWdgvRqd6RccrufVatVJjc336rbK3Qe7DPe+wkh1bu04
 Va28jSw1zPaLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=ymICwi9s
Subject: [Buildroot] [PATCH 3/8] utils/generate-cyclonedx: allow filtering
 skeleton packages from SBOM
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

Some skeleton packages do not provide software, and cluttering the SBOM with
low-value skeleton information is not desirable. Allow excluding skeleton
packages from the SBOM via --no-skeleton. Skeleton packages are identified by
the skeleton- prefix in their name.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index b3dfc9462020..b728e9883dec 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -439,6 +439,8 @@ def main():
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--with-diff", type=DiffMode, choices=list(DiffMode), default=DiffMode.INLINE,
                         help="Patch diff mode (default:'inline')")
+    parser.add_argument("--no-skeleton", default=False, action='store_true',
+                        help="Excludes skeleton packages from the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -454,8 +456,19 @@ def main():
 
     # Remove rootfs and virtual packages if not explicitly included
     # from the cli arguments
-    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
+    filtered_show_info_dict = {
+        k: v for k, v in show_info_dict.items() if "rootfs" not in v["type"]
+    }
+    if not args.virtual:
+        filtered_show_info_dict = {
+            k: v for k, v in filtered_show_info_dict.items()
+            if v["virtual"] is False
+        }
+    if args.no_skeleton:
+        filtered_show_info_dict = {
+            k: v for k, v in filtered_show_info_dict.items()
+            if not k.startswith("skeleton-")
+        }
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
