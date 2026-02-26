Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C64FCE090
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9A96120C;
	Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59jkb0SQq6jc; Thu, 26 Feb 2026 14:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49019615E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116039;
	bh=loLBQXJJsZFAs8BPzXqUcu0exPatMZzG0lgP3lcpepE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oyt6RdKyPQWfazifvwdLiwUmgdvyzTU0d40tSbd1P0e6f3jDw6ajrIAwO1tT9Bfbx
	 Xmo4I2u9HPROdNi5V+e4TS0BULEVeWa9kl/Zfe5BuhwxjBtVHHF4O93wXXKMj3pnpd
	 +ygmUskEaoCiZM56Wf1nTJqXHGLofsF8yEf/nPImCRX5J/sqEAxPkPjugXKbqCq3YE
	 mQsBbUgysZy8Wu9TN1nOqDV/7iG/tH7aZHEXySnkga78bLAxLUgkGRVLz6v/G5al4T
	 XP1oTg1jwDb1FxTmMXmRJSLDlhjx99rs/Hc71h9OgM/NTNhtJ0PZeyp8yJt7LrQ5Eq
	 0nzvGXzsW9STw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49019615E4;
	Thu, 26 Feb 2026 14:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0CE24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F7B826DE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcb8CCSnCdYT for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F096B828C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F096B828C5
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F096B828C5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5E0465A0002;
 Thu, 26 Feb 2026 15:27:14 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w46BL_I4ngy0; Thu, 26 Feb 2026 15:27:13 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 1F5265A0003;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:52 +0100
Message-ID: <20260226142700.1064999-2-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=Ju96PmV68N8GixQ7/cVKJxaXnlfjCeyxDdzfVXLzSco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GsTp6CmYxzA0O2xXJ5mCtG3wz0/kSDEjzHBk0BZR9NcoZC948JpNmjlf+BsbRwlkl
 hxYXURQoQWrQVpUcdAPAsV1qG+vQwPomOCMAVR7itiW2HLB09+L6FPCqKhb97jR33c
 y3nK365jfpahhWXDqey+Xcqr2/CCkbVYqSvakdXeEvF77Y5Ix2IruJLd6euuSybeEX
 1LdPfSZP4gtXHTqQahZUJfgmWiz+kHITw9R2D3iMM6PHTVZLPtqPRnCOQCgLHNS6Vv
 DU+/mUvVC5niG9bF1nueEY/HIT1Vp0FdFBrEr5OsqMAMwlxr1mU/wBb6MGpmqxKSwW
 oMbyQIZqvkXTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=GsTp6CmY
Subject: [Buildroot] [PATCH 1/9] utils/generate-cyclonedx: add generation
 timestamp to the SBOM metadata
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

The metadata timestamp defines the time of SBOM creation. This is typically the
current time, so always add this timestamp in UTC format to the SBOM.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 48573ddf9a3b..20ffc4a8c909 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -20,6 +20,7 @@ import urllib.request
 import subprocess
 import sys
 import re
+from datetime import datetime, timezone
 
 
 CYCLONEDX_VERSION = "1.6"
@@ -486,6 +487,7 @@ def main():
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
         "metadata": {
+            "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
             "component": {
                 "bom-ref": args.project_name,
                 "name": args.project_name,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
