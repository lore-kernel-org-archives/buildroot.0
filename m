Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4787FCE093
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8915D83EEF;
	Thu, 26 Feb 2026 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsfwdpFZW351; Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF8883EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116044;
	bh=3dUW1JNDghxx24dAi+cELd2C+LBm/IWlq4rhxacA7hU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/BwQvOoMBIfkGTFKlOpXL/Fy8rcHMyeBVRtclmmsWz5/Ht+u6I2SDdcN8J+jdW0G
	 snP0pyNKWIzo2rQe/YAC8wJg1Re9ObJBFpsgetI6QlclgakflU7OlYkHO7bP6zhz+z
	 JQqQ8q2XOzAR2L/vBgpi2limcLbQf1M9wwNLfReybH7II+S3t7lvtYgQ6b3BvgeGXg
	 l8ZSA6WA2yrv8Y9TzdHISxc7DTYdO4Op+sfDvY4+IeWWm7y1EhWLSOB/hrIeoZlAQM
	 J1Cf6DrpaulnoJm/wdDGmhyQQuKDDt56U8NNENJCkWh8Z+cPuKcIu+TWVVaF/aVyPn
	 wjdYUcjmVZuFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF8883EE3;
	Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD49438
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A9741379
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8Vw3WZCM1Lj for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE0DB40550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0DB40550
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE0DB40550
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2BD215A0005;
 Thu, 26 Feb 2026 15:27:16 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtXc_0I8hpuM; Thu, 26 Feb 2026 15:27:15 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 451E65A0006;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:55 +0100
Message-ID: <20260226142700.1064999-5-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=/HLal8iSKdZHAXfBg859p1/xm0hv0X/eEyU3wDE0JtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JvVT/BlCNxY7cdEtIEocdCyaU78Pv1kNU+KgHvHG+HlTi1zzvXP2pRTZZ2haUuMzy
 FbpgB9nJ90eRW9AJxig1cM4KJSB2suS/BHypQ4hDceRAPZUnSxSs+7XjcOmvEqBNLt
 uO/oVtDHhWW4W2deFi/AHGRIuDQAY6kzf+Zi15VG6+4XGs0OL1dBsRs6XsbjFyG4QR
 +1UwrDn8+ePTEgWGMK4WyRMPWJd25V9p2UGi+CxKEJFapLzXTftG46e3H4m10hccy1
 g8165/vbyyo5IHDUj8iBhvAc+MLThbBuNG8zchwGfPN2c0xDBTgXEuKnJ+BzyrLWgX
 K1vev0YayYLrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=JvVT/BlC
Subject: [Buildroot] [PATCH 4/9] utils/generate-cyclonedx: extract
 manufacturer URL from package Config.in
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

While there is no real metadata for upstream projects that could act as the
SBOM component manufacturer, the common convention in Buildroot is to add a URL
as the last line of the package's Config.in entry. BSI TR-03183-2 states that a
component manufacturer shall be identified by:

    Email address of the entity that created and, if applicable, maintains the
    respective component. If no email address is available this MUST be a
    "Uniform Resource Locator (URL)", e.g. the creator's home page or the
    project's web page.

Given the lack of upstream email addresses in Buildroot, the URL given in
Config.in is usually a very good fit. When collecting component information for
the SBOM, check for such a URL and, if found, use it as the manufacturer URL in
the component.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9d0c559aa18a..cb458ddf0315 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -306,6 +306,45 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
         },
     }
 
+
+def cyclonedx_manufacturer(pkgname, pkgdir):
+    """Create CycloneDX manufacturer info from a package's Config.in metadata.
+
+    This function reads the package's Config.in file, locates the configuration
+    entry corresponding to the package symbol, and inspects the last non-empty
+    lines in that entry. If the last lines contain a HTTP/HTTPS URL, it is
+    returned as the manufacturer URL in CycloneDX format.
+
+    Args:
+        pkgname (str): Name of the package, as given in the show-info output.
+        pkgdir (str): The directory of the package
+
+    Returns:
+        dict: Manufacturer information in CycloneDX format, or empty dict
+    """
+    if pkgname.startswith("host-"):
+        pkgname = pkgname[len("host-"):]
+    path = brpath / pkgdir / "Config.in"
+    if path.exists():
+        symbol = f"BR2_PACKAGE_{pkgname.upper().replace('-', '_')}"
+        regex = rf"^(?:menuconfig|config)\s+{symbol}\b.*?(?=^\S|\Z)"
+        pattern = re.compile(regex, re.MULTILINE | re.DOTALL)
+        with path.open() as f:
+            content = f.read()
+            match = pattern.search(content)
+            if match:
+                lines = match.group(0).strip().splitlines()
+                for line in reversed(lines):
+                    line = line.strip()
+                    if line.startswith("http://") or line.startswith("https://"):
+                        return {
+                            "manufacturer": {
+                                "url": [ line ]
+                            }
+                        }
+    return {}
+
+
 def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -322,6 +361,7 @@ def cyclonedx_component(name, comp, props, diff_mode: DiffMode):
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
+        **cyclonedx_manufacturer(comp["name"], comp["package_dir"]),
         **({
             "version": comp["version"],
             **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
