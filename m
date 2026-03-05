Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19EF30951
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFCF8820AD;
	Thu,  5 Mar 2026 11:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLRYCDTvnTVR; Thu,  5 Mar 2026 11:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFDB4820A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711677;
	bh=suvbYy5IOW5EJO3ywQYOuHhdhIYVZ/pb1LWJbeYZ+cU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYjLcMyAscMsdrmE6sGH53mTUG+Rq5ig+C+BWNNHneNCRsib6n4m6itFOUEgG0Tb/
	 Y71H+XvdM5lSCRnp/NUvPt2vzgEgQPKGrq8lwoyy+za4tzpTGgy5eN6Nf+gurBpsxL
	 n7iDYIPYyRymjJsHhSk+l3C1CNc4MSHCkH/J7VuTrfhMbmWCykgNeWKZtGWR0eApa3
	 /+cS9kfFUuSdvScGPr6oCv38dG5TeH0s1ACLTXd4vC4jQmnuaGiK64XmptpPngb232
	 yShkyLVRRsRDErd+mZVh2OlrJYyGwdViSanCNNQm2+0YkqbVBX54P/owboc8i4wf1P
	 Mwy0+FJghCnzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDB4820A9;
	Thu,  5 Mar 2026 11:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27149223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1430C40B7B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jhl-dB-2eK2G for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAB6440A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB6440A92
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAB6440A92
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 35A6D5A0005;
 Thu, 05 Mar 2026 12:54:29 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQHbBv7bzF4S; Thu,  5 Mar 2026 12:54:28 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 8AC405A000C;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:13 +0100
Message-ID: <20260305115413.1860514-8-martin@strongswan.org>
In-Reply-To: <20260305115413.1860514-1-martin@strongswan.org>
References: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=67mqmfnOUfVqUaWRcJinDoA8giqGmsXpx1UXmwA2lQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KtAzKeNEMMS1fnviC8XRSjMCW6GaQMehKGSd7QJM6KwHfIYIZim3cJpsbYzgehkRk
 N9wqxqsLdySPIYOqnozAfcZzZiVUtcFCUhM+Y1r5FVOgcWpVxV++BnKgMxE11FNdea
 t9scuwWon90rh8ns/LW8EAKjHq6TygsX0dtAlW+Vx/313SMLOLpuSdbVsFSnnPffry
 ++TCkZT/3LvlE+Ke61deAoe5UKQqzadMD40Qj79fO/uaGJoKclnd5hZ6ZcvBpvos0U
 nUJEjub1SyCfF4ugsiSpsLvaOK8pKx4Ggn9/og/rZrgDNaxCzPh1shwLSY9JLfLLxU
 ip3TIpohEvhyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=KtAzKeNE
Subject: [Buildroot] [PATCH v2 7/7] utils/generate-cyclonedx: omit BR_TYPE
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
 support/testing/tests/utils/test_generate_cyclonedx.py | 7 +++++++
 utils/generate-cyclonedx                               | 8 ++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index cf0561040fc9..6fde96d23e9b 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -185,6 +185,10 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertIn("package-bar", names)
         self.assertNotIn("skeleton-baz", names)
 
+        foo = self._find_component(result, "package-foo")
+        self.assertIn("properties", foo)
+        self.assertIn({"name": "BR_TYPE", "value": "target"}, foo["properties"])
+
         project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
         self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
 
@@ -195,3 +199,6 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertIn("package-foo", names)
         self.assertIn("package-bar", names)
         self.assertNotIn("host-tool", names)
+
+        foo = self._find_component(result, "package-foo")
+        self.assertNotIn("properties", foo)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 576580c13bad..85cc77cf44ed 100755
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
 
 
@@ -533,7 +533,7 @@ def main():
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
