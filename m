Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2A4EDA687
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 374C5409A9;
	Tue,  3 Mar 2026 15:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UMCkCwQnan3; Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A2A408BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551019;
	bh=BmZssfb++sVXWhyn0G/bZJPGybGIPLcRjOMhILa6uBs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eGTFgXDFDWPCiOSL4bKKpiFWnbTQE/SmR9Tbzia7cwBALCDEOq6pufYHap1o2De/r
	 O8+Qdq8NEejBtP+3BLOwDjELqbUkSXGacd/ooeqm87GKxTG6QwILfi863ny9B2X743
	 sYtBR5swImq3rVD/98/h/xs4pwqEQh9T0bq7ED7C2hw+PG2NcOS1AAQiWbrUV0n3sH
	 lhE6URUdeE1cDgof8G8xDSEhKkCRN6S1fn1Z+m93STMwjKHISwOCngX0yltlGHB+J3
	 JGsw/mAUeSKe1d4yvFwoeS7kVTM4PpXfK54v20xGteHoqpKtkcquOuK8jn1Zwgcc5W
	 X/FWxoFNoX9Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A2A408BE;
	Tue,  3 Mar 2026 15:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 675A4231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 595E680BBC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL8WPqMRokdA for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5878F80BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5878F80BA9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5878F80BA9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso76775535e9.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551014; x=1773155814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zFQaF1PWvIeacy2jc0gveo8ycgxeFQyyPNisALatJZs=;
 b=rCR9yCwuOTcQZerKJaspfdTF0n7Nw/XNYQBMp9p/67u/D5Qh7mvVssmwm3BcAl3fDS
 dThoMhTfuKIqUM+a3alCyl2EC7DHrty/bSEd8mPKm/XF9vmBPkO5utPaIH0254nqBrtL
 U5+hsQaPbwIZWWUcrrBLR9DbElaIpqAlosxw5RavlFVou/R1y0wl444U1GrnJOrf7paP
 dHmHSyIcQMafHWDgP37qPf05rTI/DlpXkMHxWbXXdtpc35aVATtvBjS9LyUi9jp1Hbt7
 dsntj4PHkix/L0WJkTK4QZ3avo6n0UF4IKuRt2pnytv9pfCLbs/Qd0iUKA+SjVRyheaM
 pvJA==
X-Gm-Message-State: AOJu0YyDVDD3XNF1gCBKoAz9m5MtDYpf9+fQ8z46JnlhUxcsUw+IM3A3
 ziuznIRG1z6ar7PiDReP0diLBYMuW0UPSJ+1/aOkLzT2mQ7+w3rIjFKMvU91FA3IW1SR8KebOmn
 vyDLv
X-Gm-Gg: ATEYQzxvCkU992OOXF4f5b9yIByTGEHB23xylhzT3TOcjzyo1ZfGQTo4o/egJweixRx
 LzDC7gJubVRHd+1u9N0NTSW+HI3GpFIWq8ywOOiSVJQ8WR355uZNNgLZJlXOXohPYM01va7JJLh
 z4yUBayml2rxlu5xtR8OjkzJAg23pPCpsAfLxfNIBvvuZ8KxUCW+1FYeEmFS2lHabhqxamGJZdP
 TWjUtQCZWG35RYgFsIm3hQ9YaYFiAtfqN8JVoddKH72q6TywhEcBrRf4dU3EqlMMIKc55eGKlbY
 KfUyc8ZO0rktVXI5LRHrk3m6hOFLT2vrXujB+MZ4nrwyMgb4jWpi8wwiw/G6GJAXTa7MfnaUsok
 bP1AtU0RHCqtqDzkwT8lGzF6vrGQextkYVA2IF4U/y+/EB0FEim1GaXgrqDi7N0Un+QN5g35nXW
 YXoAeog5kBd1gYV54=
X-Received: by 2002:a05:600c:1e2a:b0:480:4a4f:c363 with SMTP id
 5b1f17b1804b1-483c9b9e355mr277748825e9.9.1772551014076; 
 Tue, 03 Mar 2026 07:16:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:37 +0100
Message-ID: <20260303151641.382820-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551014; x=1773155814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFQaF1PWvIeacy2jc0gveo8ycgxeFQyyPNisALatJZs=;
 b=AloYx0gvG9RZqc+lZ9g2dQkRI/eGPcwWv2dCEoFnRf8RU2J3y/dJdn2gHAdVil/HQy
 EsiAenC+lvUWc6H80ARXUxK3KoS7cVrLlZnK/zs/xlwCqLdd7E8KbFHpmmf/lVbRycIc
 wWuszBAnGnGHl2S8sarK2VNfxvCJGV04pAWWIpXmyMAoRns+5sGtDq9+wDfH5zecV9UQ
 wfRqIrkfsIU1AbyPp2QMq8uGrc/EP49dYqJsmp/DmORHe1yN/6NmlJxHKich9CEVnxu3
 +ErVrc9cOd3KI0pPoK1/tprJ7vdTJepSvP3k41akdhP0eGk3B9Wy8eqXnhqkXLhLhZAs
 YdWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AloYx0gv
Subject: [Buildroot] [PATCH v4 5/8] utils/generate-cyclonedx: optional bump
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
index 24c15df94e..cbce3364de 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -21,8 +21,7 @@ import re
 from typing import Mapping, Tuple
 from dataclasses import dataclass, field
 
-
-CYCLONEDX_VERSION = (1, 6)
+DEFAULT_CYCLONEDX_VERSION = (1, 6)
 
 brpath = Path(__file__).parent.parent
 
@@ -493,6 +492,9 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--v17", dest='cdx_version', action='store_const',
+                        const=(1, 7), default=DEFAULT_CYCLONEDX_VERSION,
+                        help=f"Use CycloneDX version 1.7 (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
 
@@ -501,7 +503,7 @@ def main():
         sys.exit(1)
 
     opt = Options(
-        cyclonedx_version=CYCLONEDX_VERSION,
+        cyclonedx_version=args.cdx_version,
         project_name=args.project_name,
         project_version=args.project_version,
     )
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
