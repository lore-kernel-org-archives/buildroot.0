Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C296D2504E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1B180D5C;
	Mon, 12 Jan 2026 08:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUo6-UenoBAt; Mon, 12 Jan 2026 08:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E546180C4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206071;
	bh=G4gmoTih6tIgIQOR9WUebBoUFkyHzoUKgwB+dFipSxs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1I3oJI79TMNgVwNur/LMC2PoTdo+XnXDYdNIl7+ZkDWfS7sKflYbUd8cIx9m6xab
	 ZHPZT+kQRv96VBVkMW8OZWuVkLeYxyd3488I4i160AShdF00lVPQvgklpJwQZ2rPh/
	 rZkjDX6Vj9vzHy7h9RVXUxkzezQwTYcwdkizWmdaG7cCEGxzIIp2Az9QQ2zaj6/z5B
	 YKK2+jLrl02eOERRQfVI2YmAj6t0O99dZp8OH5q4houhB2ZPfzTJyLBdb0fuM7W21z
	 OrPjuX7fPcNNsDwfiv/zpg86VNG2pFIoywXFC6amOPXqLYCg3V5YU34oHtfLgLFFfa
	 mxhjha90fIHwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E546180C4B;
	Mon, 12 Jan 2026 08:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9DDC12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E749080C4B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIPggs4lNhew for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D427A80BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D427A80BCA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D427A80BCA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A9ABA4C419F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-3GRj
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:08 +0100
Message-ID: <20260112080419.2516889-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205146;
 bh=nyIq3wirc0qCvmcsbLNgb6oD7ulaZfWpmamgtiT4JS0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=q5IiZ1q++lYRmMakLgc0kUpPNEHz1WPI5abzkwXOSqm9ggRFxfBZ0zoMGia/9Ghj7
 ahEsgCTW9qb+NO4Ir7WvlWUFjsp1646hM2WUVjHNsTQip3hms9/lDsbp2cded6pagX
 ae2X6Rr7Kqb8HBUf4jn0e8c+uZLSXQcczUtF4+ZtFtVuXqwzuQ7zk6fgcP42fujhsz
 U4sz+y5l9X4YQYlsT+8Gzf/elXEFep7GQIWKGIEIRtQpQbb+Apcwsjgod1X7II3Deq
 1fi5AD84ZEmjXiPL69An8PFcMA9DhOx8MQLJeSnd1wCXqh9rFdpxurqnkIsZJDKR13
 lqQf3/KLQd3yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q5IiZ1q+
Subject: [Buildroot] [PATCH 033/104] package/x11r7/xapp_xhost: bump version
 to 1.0.10
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

https://lists.x.org/archives/xorg-announce/2025-February/003581.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash | 6 +++---
 package/x11r7/xapp_xhost/xapp_xhost.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
index fea2588c6d..a807e5957d 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.hash
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003301.html
-sha256  ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645  xhost-1.0.9.tar.xz
-sha512  d281a0df0a036d693ce7dbe0d1d53839110d203f42454bf4d33a49fbfddec078149969b6ad76641e40e207ddc8317ea563088c59025fc57d8245e5ed27f79818  xhost-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-February/003581.html
+sha256  a8afd70059479c712948b895e41c35a4a8bfcede3ba2d5a4b855c88bbb725be1  xhost-1.0.10.tar.xz
+sha512  65467b0a096455dae681f8397f5b8b0490a2f80db5cb9f92757cfff8d7822b43833202a275eed8467c6a6aaf3b02e0a7b1a069c5d587d32e56b1893297903051  xhost-1.0.10.tar.xz
 # Locally computed
 sha256  d3106697fb05dea4e9899b9e782ae7c3c17086d5b3dc7966494fc83fda9e468e  COPYING
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 55f7ca5cc7..80336f2955 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.9
+XAPP_XHOST_VERSION = 1.0.10
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.xz
 XAPP_XHOST_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XHOST_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
