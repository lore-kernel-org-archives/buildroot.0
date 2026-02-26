Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE134FCE08E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB008413A;
	Thu, 26 Feb 2026 14:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUYUZgJ4f_Sw; Thu, 26 Feb 2026 14:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53678410F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115966;
	bh=nm2NnUDYyB31PF0HR0lree61G3x2O+Gv2wjnuQWTxLM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6P01H64Timeh1u4rEo3SuN7bcOg08PyDH3TXNmvM8HalJLRd3M39yrv9p6Szo4yy
	 MFcSrIQb8bA5+DsExzNGCPJSVx0UfYNlt4DY7D8k5dZrSMDKvIu3c+OwCYlDuMaAnY
	 oSuFWA9r8RshFoBJWWnqRy+JK8EqsEKC+UivT25e6ZNoj05oxNzfttOlYq01nQLoVD
	 ds8mexpl50ENTuwHsXXhOX5xnUL316fUqBC0p0QkM6W4Ymk7DGqo0f49ejo6LBmtv/
	 yx4cmj4q2Vhf0x14pL7rgenE0hpypIv9TG9Ex5OmwRVBvPLx7nMasU2WGwQ2tTsZHl
	 VwmJWXxx+UO4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53678410F;
	Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F89224E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 415A941B7E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqnZ3_krdV4t for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 162A040A71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162A040A71
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 162A040A71
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2DA765A0006;
 Thu, 26 Feb 2026 15:20:52 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZQRlD6FOGa6; Thu, 26 Feb 2026 15:20:51 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 36C275A0007;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:20 +0100
Message-ID: <20260226142023.1064241-6-martin@strongswan.org>
In-Reply-To: <20260226142023.1064241-1-martin@strongswan.org>
References: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=BFo4Gwqh2Hlq5rhL8wm3zAcoYq1OfP5FD5B7lYnobII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I8V1Qw2sJeIpZ+lhOZ48V16VrrKCgTQSNgM5tE+RTt7txhz5H6LrdJ5XHAd8VpZ0l
 z5Ew2MsBXyvsThatjHoKcqV2ouyG1hIcOkkWk22JhmtkGqRKFaZfAPxQ6QTgTN0t+W
 JTzct1jJPwDPieJbK+YvGxX9NopsxpB5TQ3qDNzr4pt1Gha2Jz7Ha6kRrKEfgisBrj
 pex6L3LlZyyqjGM195oYNyeZobicRogHApF4n9n/vnZkPPYU6av8NG+xW2YhSzuySR
 8zGUoJ/RlHgcyb/kZKx8iPzyjdlFBPUbEwRG/TWiaOyfR1nnqucMTqhDMcjE7O1AJq
 VTR7Lh7auosSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=I8V1Qw2s
Subject: [Buildroot] [PATCH 5/8] utils/generate-cyclonedx: omit BR_TYPE
 property if --no-host given
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

When using --no-host, no host dependencies are included. Keeping the BR_TYPE
property adds no value, as it will always be "target". Omit the properties
section to reduce noise.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 534177bd6902..1d8fec7a2cdf 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -305,7 +305,7 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
         },
     }
 
-def cyclonedx_component(name, comp, diff_mode: DiffMode):
+def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
     Args:
@@ -329,10 +329,10 @@ def cyclonedx_component(name, comp, diff_mode: DiffMode):
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
         **cyclonedx_patches(comp.get("patches", []), diff_mode),
-        "properties": [{
+        **({"properties": [{
             "name": "BR_TYPE",
             "value": comp["type"],
-        }],
+        }]} if props else {}),
     }
 
 
@@ -506,7 +506,7 @@ def main():
             }
         },
         "components": [
-            cyclonedx_component(name, comp, args.with_diff)
+            cyclonedx_component(name, comp, not args.no_host, args.with_diff)
             for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
