Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D24AFCE093
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A3E84227;
	Thu, 26 Feb 2026 14:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OMvtnbwbHDm; Thu, 26 Feb 2026 14:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F24084151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116048;
	bh=c+l/yoy26cYd+Ydm3wK3HJfNbb4ShCv9N1372uzOMzg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXaj3UL8k1qQKoyw5WJ012WHG4UzVSE9KPNxwasboqRw2LxDxsUlItKxCqzcaXFfa
	 donAzynF+B2fmYp5e1zcGNF7pNV5ujJbeUJR8AVUAOo0viNpm7wP3oJ89oxxpEv3yh
	 vFBlioGjj/U2icI0ixwDTYmnnEdqPKIEKACfBUGNGz3iHM1AZL7jzCpdUCYmcgTgFx
	 MiMHHO6T9teOG4w6fuTVVvg8dqe4rTgcuFM6UemU6RxTfPRxf1tPyiC43AjoR2akg3
	 ktTPVNjq8vXOdEGQzk9/AUsGe098/K/TJOLdTggZvndkMgU0uRYnH+yiqRn5oOPYS/
	 qmHB+GXfWfbSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F24084151;
	Thu, 26 Feb 2026 14:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A53524E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCF3261603
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQEALQaotsns for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C50E0615FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C50E0615FE
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C50E0615FE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 31D6B5A0003;
 Thu, 26 Feb 2026 15:27:20 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLwEuhpfqpYu; Thu, 26 Feb 2026 15:27:19 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 699755A000B;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:59 +0100
Message-ID: <20260226142700.1064999-9-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=Wa51lKcbsLa3GuvLtSgWtzqrLazlp/8YO9BcO6P+GOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T1XqMtLRT2l8qQgXdwujMwWo5/JdxTlK1av+Hh2BE4CdZqj8jU2joVBfY8GzKw22Y
 e8wtwOtVy+HAnBZUbbe4qKV2uk+X8ozL3W3R04Loeio7PJ54Ju5GPD7ZUHI3WMg9mo
 n8DxvaCmxheSaD8R236lSbGoBmwG5EggFwQKtyEIGW3xNMmmJHdz5YNX2LXDDoAB08
 mwGuDElGsLKN0us7DW23XgXry9hjQ0xR45YQVIXiJOeMrHUmyTwGx0Ht2VPTExRPLG
 IZCKPL88AVcmLNQr3xQFbSqdGsZumQytWG9tlvYrhtYAnQR4zFyHCoCaqkrvS5euQj
 C4SVc9OJzIj2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=T1XqMtLR
Subject: [Buildroot] [PATCH 8/9] utils/generate-cyclonedx: use github purls
 if a package references a GitHub tag
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

If a package references a GitHub tag, usually by defining a *_SITE using
$(call github,...), form a github purl instead of a generic purl. As a github
purl references a specific tag, this is done only for download URLs referencing
an "archive"; "releases/download" URLs reference an artifact that may differ
from what is identified by a tag, hence they are not considered for github
purls.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 0b38a0317cbe..94138aa5786e 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -355,6 +355,16 @@ def cyclonedx_manufacturer(pkgname, pkgdir):
     return {}
 
 
+def github_purl(uri: str) -> dict[str, str]:
+    """ If the URI is a GitHub URL for tag, create a purl entry for it. """
+    parsed = urllib.parse.urlparse(uri)
+    if parsed.hostname == "github.com":
+        parts = parsed.path.strip("/").split("/")
+        if len(parts) >= 4 and parts[2] == "archive":
+            return { "purl": f"pkg:github/{parts[0]}/{parts[1]}@{parts[3]}" }
+    return {}
+
+
 def generic_purl(uri: str, comp: dict[str, Any], source: str) -> dict[str, str]:
     """ Create a generic purl entry for a URI and source. """
     if name := comp.get("name"):
@@ -379,6 +389,8 @@ def cyclonedx_purl(comp: dict[str, Any]) -> dict[str, str]:
         for uri in usable_download_uris(download.get("uris", [])):
             host = urllib.parse.urlparse(uri).hostname
             if host and host != "sources.buildroot.net":
+                if github := github_purl(uri):
+                    return github
                 if source := download.get("source"):
                     if generic := generic_purl(uri, comp, source):
                         return generic
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
