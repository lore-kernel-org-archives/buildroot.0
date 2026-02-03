Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADACEE87829
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F8A82384;
	Tue,  3 Feb 2026 13:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3jSLqGj4c9n; Tue,  3 Feb 2026 13:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564FE83D1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126772;
	bh=HLvpoN5FAK7T3b5kaGwKLSdAMjOYJVYHzdVdyrolDtI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U9GEtzY3NfdQAjwVo/SPRCmDdrDyqNXHo30pLBc1ECLlWCbuyI+hThVmd6h0tJLat
	 MbHIUDC0v3OayRgJMP42yBhT2vUj81CJl6jgHJwYZiy9mQdbAgIgn5ODvh0PvSI9DO
	 +0gc8nZbqs8qmmz8ibfVR7Zl2UD8S1ZAnL+PEIAh6fYttASWiIoPP6YrJ/ckpDytqP
	 SljPZ2EfKvCBQ9RW//OjM/SdvEDKt9xJ8qkwoS7dka/nPIELdxnT/WDyieg6vAxa7E
	 X/nfKCpihnmdK3fcyx7Vf+mHXY/nwAuuWATZgJbm1XGffrNebMb7YUljsf3uiRtrsI
	 ymmZDvzUZ1ZWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564FE83D1E;
	Tue,  3 Feb 2026 13:52:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48CB813D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2830540847
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ysaP90qVkSf for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C197740841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C197740841
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C197740841
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so4539394f8f.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 05:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770126762; x=1770731562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=33UZUyfHX/oueIvjWzJUviq3ecg00M0TjCD9exdXa9Y=;
 b=F5VcWWTlFiMs0WmCEDxQy5nmjWKhKCwqM2rOoOTXTeJ3JB1v8rTLW9K60r118JJlnG
 1u5uHeYH21/3bVaDB7LipmwIC1yLrH5dqtY+W/aFvDwHvAWzN8finJeCISPUzduviRqR
 Kfh5wlq4qx8Q3fcmOIOSbl1+nRNUjxlNSlfldQPbxsiBieBw/YF9+lDkhDUPe+xv6zaD
 EjdoCLQOk0qpKNnadngoM+3wOHu2tMCYX6Rhob9DoJOU+yJlsCGP80Ewy9AjMwAyTGy5
 NMbw1WBhSR5N3xPu2s1Fu+F1ra2AsL/PGG3MGyY6EoTlMNC7FtJoqzkT33o5k8ah3Kv0
 5lhA==
X-Gm-Message-State: AOJu0Yz1XHy6dXCqd3OIGMp6qn48FrgXgbqXJ56vc62RUTQGI9gWNCne
 cABlsVO2MdjEO32/LrUJUI8xPZqTDK9GftUZVL0kXjVsIVvHlVEBRrmdZhZd23CZJGlCzrQHic2
 bM3d9
X-Gm-Gg: AZuq6aINDe6ZBGI2TiW7QncaabG679HAO6CXbUYtp0jgDST9m+l+20sWBTArjp0lfaw
 T/tATE4QOWXFJvd0JyxbYEZDgKMt9N082Qyct5Yxk91SX3YlD2ahcxBZoJQc62bRWdcPFQfPI68
 TG1LBXFoIPIFOYpdYL1fnTH5vf3FwbFWFET4cdGWknBZ9ddDin8VMzM3bJMOL4ggjrnO90VBOEJ
 3vfsF4/+NgRviajH1NIIsiWIFR92bcz+3AWua036ycK2W6ckNjLf70hiY8x+uoWtX3vNVZfsubr
 HhgBQj7Gm97HKLhsJAmMHb5XcFU68J6jvXXHMyjazzlXcefyze2kF511T+dDzWaDBja+4lfK2Xx
 GZw7+wk2bBuky2qzxP594h39SAkWJmrN4h/xNbMZnGjHPG+3DiVSKCSfN4jPtOE4OIcJW3Dn3gU
 ZXL9u1KrqaUBnyBTNtyN0WPoX7aOXYyQCpdpFCaBlIVjI=
X-Received: by 2002:a05:6000:3104:b0:435:ae10:cf92 with SMTP id
 ffacd0b85a97d-435f3a81dbemr20583331f8f.8.1770126762086; 
 Tue, 03 Feb 2026 05:52:42 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54227388f8f.5.2026.02.03.05.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 05:52:41 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Tue,  3 Feb 2026 14:52:34 +0100
Message-ID: <20260203135235.184869-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135235.184869-1-thomas.perale@mind.be>
References: <20260203135235.184869-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770126762; x=1770731562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33UZUyfHX/oueIvjWzJUviq3ecg00M0TjCD9exdXa9Y=;
 b=DI8Pz7gqXY9qo70lhoO1w9Wd8vUF3lu3Ke1Ektrna4vg8sokzTsjN8KxRn0BgWnaUK
 4T3ez1iDLhpSGMwJdaZV0mdY/ALUNW4iSNhVgxREzLX8bhdWeTV/mpi8VskDkuzTTqDA
 elFHXvE+252FCLs/2QQImwQ3rwLPZ9JkALP5iaIbb2z6b2W8RYuHU2ezVybglIaAFq6K
 XctFmllG6NwEJ8Khe6KkdIlbnjPke94cMQ6iZ456KYlHGv3yWZaUmIUlz4xSWD8Hzu2l
 GEB0HFVXoWt88QUuugelZlPlKjbKRBTo14nbwBiY8Gi3eOrSIUXjSFTzMU6E5IJffZDX
 ZMDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DI8Pz7gq
Subject: [Buildroot] [PATCH v2 4/5] utils/generate-cyclonedx: optional bump
 to v1.7
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

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7

Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
this bump is optional and default remains v1.6.

To allow generation of CycloneDX based on the current version of the
spec we are using a 'Context' datastructure is created that reference
the CycloneDX version spec currently in use.

This Context datastructure is then passed down to functions that
generate part of the CycloneDX SBOM.

All the top level datastructure are moved into the Context
datastructure that will be generated after the arguments from the
command line are interpreted.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 805c69c92c..66eae08c01 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -22,8 +22,7 @@ from typing import Mapping
 from dataclasses import dataclass, field
 from packaging.version import Version
 
-
-CYCLONEDX_VERSION = "1.6"
+DEFAULT_CYCLONEDX_VERSION = "1.6"
 
 brpath = Path(__file__).parent.parent
 
@@ -492,6 +491,9 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--v17", dest='cdx_version', action='store_const',
+                        const='1.7', default=DEFAULT_CYCLONEDX_VERSION,
+                        help=f"Use CycloneDX version 1.7 (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
 
@@ -500,7 +502,7 @@ def main():
         sys.exit(1)
 
     opt = Options(
-        cyclonedx_version=Version(CYCLONEDX_VERSION),
+        cyclonedx_version=Version(args.cdx_version),
         project_name=args.project_name,
         project_version=args.project_version,
     )
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
