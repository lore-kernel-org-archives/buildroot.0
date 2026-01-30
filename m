Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE67E6BF39
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCEE141133;
	Fri, 30 Jan 2026 20:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHMSjm4I7KVJ; Fri, 30 Jan 2026 20:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 818AE40BE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769806097;
	bh=urvczDXKp79c78LO6ST3vghWBi6AWURF2tg/IQTdnLE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jaYZlqjESwkW9G8gH82E9g4nzO5MlfbceaGjI8fhEHAPiUuVhcdDT2Pl3NCL3zV70
	 396t4dJ1T0I9Y7iBrTN9WgKYsMmJZisflbFRiuE5JIfgF3IjosWtUyOMErNks4IgM6
	 olPmNiECnRo7mnJmNDwEOgHAFoaGSZ1PsottFbqY8HJfibYIZ9NKlaQ8Z2SkVby2d+
	 2uhjeKT2+qPgNrlgSsByBkESLHGY9s+H4dZWTVjUrkOwT+L7vYKybx99ZqvH3S0J1b
	 SqDHfoANFSnt5X/52zI5hQqoFDPEfSCfTc32fiX98oH1Xwnpg9TBp2n56N/UVf63P2
	 GfZV1BYZB/fKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818AE40BE1;
	Fri, 30 Jan 2026 20:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAFD51A6
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 20:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C086360AA7
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 20:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyYEeUYXRtJw for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 20:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C32C608B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C32C608B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C32C608B6
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 20:48:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bef2.dip0.t-ipconnect.de [84.161.190.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34290A4C5466
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 21:48:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56426)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vlvPU-000000001Qf-48lV
 for buildroot@buildroot.org; Fri, 30 Jan 2026 20:48:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 30 Jan 2026 21:48:08 +0100
Message-ID: <20260130204808.132354-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769806089;
 bh=JyiA59xktkv1odJfQaj/dFhZgXUz6vJxQR0pREsvNMc=;
 h=From:To:Subject:Date:From;
 b=D8lm8rIG5rAA8iUNtsyS/WUzSlYkEKlmI3sekaoTyZoBgTjveDHltIL+0JusItWAt
 Cx0yzSDjwbxW2+UaSCDefXtyZ443qkr9QLjL0dhDGDN+UQ15nNllc8WadfzKszdGgB
 q1sB+mzVUee9Ltuo6mjAXSJQs7fKlCTSI90sirgyRxBZC8S7s6nrVMt+TsKw5XCB6g
 5Mtu+Lev+Gp9BzzbkI4tVyKiw2V6As5KcbbIwcqfs/IGgvrBqZw8fzKNbhqjvE8XCN
 QaaOSdLi8apmxNxMeWT2lhyWX1exWHopVHG9MUQTUvYndKcTpORf8T+EhEY0e/6t/O
 xNLnDD/aig1Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=D8lm8rIG
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.22
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

https://forum.torproject.org/t/release-candidate-and-stable-release-0-4-8-22-and-0-4-9-4-rc/21160

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.8.22/ReleaseNotes
"o Major bugfixes (security):
   - Avoid an out-of-bounds read error that could occur with
     V1-formatted cells. Fixes bug 41180; bugfix on 0.4.8.1-alpha.
     This is tracked as TROVE-2025-016."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ea15ddefe6..eeafd49058 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
-sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
+sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 746eacd581..c0785ef2b1 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.21
+TOR_VERSION = 0.4.8.22
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
