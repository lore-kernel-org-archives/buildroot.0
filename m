Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730101125825
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEBD422F6;
	Wed, 11 Mar 2026 14:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYAcuaj8DYac; Wed, 11 Mar 2026 14:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E12E2422E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237911;
	bh=BmZssfb++sVXWhyn0G/bZJPGybGIPLcRjOMhILa6uBs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ecKa4mHGKwmKbNv50j5mBp38d/966uT8iBBsqkU/FsI3VuQyrepjT6Ig1xBhvrfhA
	 P9XdusxwjEa1CW6QlVvUzk4SPBrz6YAmgrqfX4HVdpI+EAEIs+/1i4uzxkEgUrtY6v
	 RDEHb9vMTwLD4i3zfZmH98zYRIWYu11EI7sWrZsLVKhulvKl+QDf8WcEuHwQLNcbyN
	 Ucb9YEnvLSPJu7EWmdow8r2tlsjK0GaXqER3VrxZS4/vBfq77Ghzmk3AqJ8wOFQ86g
	 Xq/jD+8DDgROdP7ZmLySdssu+3Y4ieAdZ8fJ2iLuXl8Bm419lrc7yeApC5XRMh9Dfc
	 mUjiTAH+HRt4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12E2422E0;
	Wed, 11 Mar 2026 14:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8A69228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA50B41F2A
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrTrhNB9Kw87 for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB75C40B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB75C40B3E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB75C40B3E
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439f5abc829so1584694f8f.3
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237902; x=1773842702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zFQaF1PWvIeacy2jc0gveo8ycgxeFQyyPNisALatJZs=;
 b=UNZRvQcsvydD7Bqur6VfZDs4DM0ik9A/iO/voV1OhrUaD55+NEOxRzwoeEnWFuiMjQ
 K3VGmAYSHyocQcADuk0WlU4RSirgEHPpsgBe/OjQnhJAp2bN/Fj+IsJTJPI9tSoyUL8I
 +uk1NBjSLbroqMe+nZ0Kh7fr7DVZhks+UvAY+3Vre++cde6BnTegz6ZJTUhRuSTY3Fh4
 bIvR4wiUkfuH8nWgIL3ViOho7GlczCfTjh5DYf+p7DCkjufqw5SPoaBlHm7NKx6rbn7U
 58F7G76QyNcAi0OIY0LMrnuhPQhVoNyHmEfcPtJlZcniznwt41KnhmvY03ehzUP9cUD8
 nuhA==
X-Gm-Message-State: AOJu0Yzt1DKvlX6FX+pZH1OSuRpsFIkr0E+c+6hm+Zr4lTRGxDp0o/By
 ij6nr+hyZoQeUubsSvxItg6FnDOhxeEgo66mm2/u3iAOWVfjTBeW4FXQFHvZofXwIleMojGI1kC
 MLsgZ
X-Gm-Gg: ATEYQzzzA8MQAPraIcQeAxcrst/rigcKI02WT7QFKh4aDolpheLQ1hwjpBmGAiuwxav
 KLA1UTZ53HHoWYfJiCPPjfROrZRTefp9uZplRgw0NeqQvwUPpYjNPILJgEaB2Plml9PrYUPz0Zg
 35voR762sWG1IPTkNtaQWSggZmlwnYWmfAX55EYZkyU9SLyDvjAIivTYlCkfx8mKR7U9kqCRN2m
 CrjgxUo0ye5vCAV1u2Or5vZx3bOJTFiAXFcW7Y8uoLDGXcvgvMhKadk7nhqen3HZGnczYHiqr/C
 ULBz2KxP5Kznn6mGfqDEslwI5HwtaKqSe+b+DecE2cvFs76vmGLPSZYuLIJjTD7U5+UZOH+s11s
 Bh/aOKevVh8Z1tRJamfj3v8z8kKG7m6Nw0ynmgM2l/NwbHn+E2G3XY5gn/5LIb+U1KdjxUWHGd4
 qSqd8aIYd4iPqgccQ=
X-Received: by 2002:a05:6000:26ca:b0:439:b486:ba71 with SMTP id
 ffacd0b85a97d-439f842f50bmr5218712f8f.56.1773237902392; 
 Wed, 11 Mar 2026 07:05:02 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:05:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:54 +0100
Message-ID: <20260311140457.140041-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237902; x=1773842702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFQaF1PWvIeacy2jc0gveo8ycgxeFQyyPNisALatJZs=;
 b=FcYCPRwpyrIvsScQ+ivZTJu153O7U/qGrAAw8ozqYqqYKY/tSbFlQ8eXe3ijXlZMPE
 bWNe7UOMJ0y9wdmtk673S+xKA7yBgZ8/Rc5WfgTWRRdF24Z/nBEmUgkd+lalH/bbV62X
 8zyHCmk5VAIWLZdUckRaS6gEOojbjj9sm9WMTZLeU/lbkuQzg1rGbC1UxVUtaqDriVTz
 TKPnvbPQUwvxqTx0sfYnKTQRQhkQIJc/73I0LXSzUw+atNTQOQjbdPI/wLMI+CkNJ01/
 5CThxyaQGjR0OeqvsBQHFa20wGUJkDvTS6A9G2Sn6V6LC1+TIJdlWFkc3GqU4qhyPQd9
 4qsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FcYCPRwp
Subject: [Buildroot] [PATCH v5 5/8] utils/generate-cyclonedx: optional bump
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
