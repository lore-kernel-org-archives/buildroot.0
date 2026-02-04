Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB696E83EF9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B682F60C05;
	Wed,  4 Feb 2026 13:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg46Tw4VjtY5; Wed,  4 Feb 2026 13:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8214760D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213254;
	bh=odz100CdTxMd9ErshXlx8ecKXcBm+QAB0zmCQNAlaVU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dc+QRHZLlnVshKfow2o/wChZz3hWDza1OV0VDRSWkoHz6aDXCunDGWjZRAFlrnA57
	 zvvImOWVGw//1GBcVq0Kddkd7lJt4CBPHdX0KKBUSasAOEFaMx1q96zFA0SOF2LxRs
	 bYeZAcDZ3W2gGQay84lcaBzUVjwirXV6bEnUHqz8RaLqxiP5swOqAuz3LZW2GFNHnm
	 xyKRDhab0HzjfXSmfTIjBN70dHMA5/MQIdvw9gVkmpCbW9LbHelADY0Cmtbuv8Gvwp
	 ZQBr0X6Qeg5eQhkL1NH2hXiB8W5grYUajL1klEhLDo8BTT2qiMZdsluZdCrBDlKXHm
	 6JrbhOepCmxAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8214760D7E;
	Wed,  4 Feb 2026 13:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15328F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB0B260D72
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwHgbNRUDNp0 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D48FF60D7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48FF60D7A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D48FF60D7A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso68549465e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213243; x=1770818043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ica1LzKRyhqQ1PyIapIwjKhopa7hJC9ILMU1knwTdo=;
 b=U80K7sbV6Qms5Qhejrq+RtMUQudEFzwe9uqpMd7qlED2ujHCE16pvkvKKIPwZkoFYZ
 0e2vHQ0oh2hNeUoSIwqvdc936B82VUFxh1iabiaOBpAqXmGzJ2eglWXpQFnpaco3eDgb
 4axkeBZ7nOgmR5kzbMBCjMwqRiQJ7zuAakpWyylfcFHSn9ncsG2Nay+SH7NRtij8POXV
 fsCqczzCUp4plBjTzZ53fRdq9QIzY26W6jJfhMm5umpNJHvvwLoX2dX/f3js08nZYehP
 kH3WkpYOiGNQ5nllY+JwLRy3QgiZNLMjnueQp+lgleSp82Tb+59jJrSCtzKWNe1hwMs2
 RzIQ==
X-Gm-Message-State: AOJu0YwNSZYcc4a67rYXkujAF91pTZyo6PzyEujzw0yzZvytmBaS9WRt
 S6pJicCiO0zktqKLox9moRYcGPw779UL53Hvh0SGn2HgEnqgZSJlUAU2wmLozWnaIf+N/tfSvnb
 k+uQj
X-Gm-Gg: AZuq6aIcuztECgF+keqalIS9HZXCJDXuPOt86S9FJ3u1IlIS3CZqiiwIFQxDEWuYv9D
 q/D0pLAQYGL+Oy8bSqKtYcQdc3iJIVUi7ArETo5fn/iiTNyOWxTbM3U+K4uRTebOmC+ParNpuvW
 X7SaP3lm4NvvXd83sIu14lHsJLgHox73LQ0P/LU9nLe1pcPmNqW6q5Susz4LCyOd24QDNCpY1uv
 szXC/UgeIp1504wGZkKp8ChiSdUNmB7hOW80Fu9iJxxvZvmbmfGs+YMC1eF0DEwU3hgoiVqZB/x
 1jt9u0i1124erc8cVFSFAdftGmbiNrQjCx8/FS3G/8Y1ShnR0Ckm1OqwNFf3HwA6xRigoz1+/dk
 1F04bjVSOxbferLClLt2E9rH2Dm6Lcro32YiWpdzgV0j/pX7KI+XTuEwC9EYChYSNGxBjZ/IgS0
 dDwWQdZVZv+h/L2hl6s3GzhCxio5PdQTDIWD9/foRxQGh702xkS6MSOg==
X-Received: by 2002:a05:600c:6290:b0:483:aa2:6bce with SMTP id
 5b1f17b1804b1-4830e98629bmr40643035e9.30.1770213243559; 
 Wed, 04 Feb 2026 05:54:03 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:03 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:53:59 +0100
Message-ID: <20260204135400.307638-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135400.307638-1-thomas.perale@mind.be>
References: <20260204135400.307638-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213243; x=1770818043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ica1LzKRyhqQ1PyIapIwjKhopa7hJC9ILMU1knwTdo=;
 b=VkJXOQ2VhB/ICoi+/5aMJZCIQhneJuy6D2LNZEBY17uJ/kfa3T745NWBKVIyAguZ7t
 AId+X+i1WxDH+Igoj1xaNNH/vId5Fojws7lGaj1y+TXRvewKij4ArDWDw5PUXrhP3gyR
 mPIyodVDZZGmC1ca5UJHUtK5ET55chihMhrExzA0jxg7jG5p2lJ5xAnT8zyzsC0kCz9d
 Kmmaa6+WvNPZ/Yr9SEZ+oQ3ABOiwY81plnb0+JOXigz3yoBcG3UFJIX2aILPlBDNZE+0
 IWQvlGruV9Ki8lp22esYf7ZLH3JB14JmTzw7sS2yl4jXBPhZ9coV3b7Mur8B3+EE1qDM
 PZfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VkJXOQ2V
Subject: [Buildroot] [PATCH v3 5/6] utils/generate-cyclonedx: optional bump
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
