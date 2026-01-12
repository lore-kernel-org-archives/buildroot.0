Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5826D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF9B80B30;
	Mon, 12 Jan 2026 08:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4EXRONhO56wT; Mon, 12 Jan 2026 08:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EE680B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206059;
	bh=akOesCCRWCFJft03bduAqceWhdlLy3fZd8Bs6LVo+Ts=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYNOmqiRNRLgw/8JBX39wDHAzPvyUJ4Z/Bx6VZFWxVcj5BjtUuDqngjgsC6fM9hTi
	 o4gSEaG3sd5DExj1uvFfviyBDsrquWpLfv6qPTee3IBjCxFmnbv94+FBUkSHQ+naSW
	 kXC5lKXiPZNw+eRLLwnMjF6rpamfDdz6MuLBSVdi5SLQ9z5Ewrkxv4SMRGSCL8CTV2
	 EqR3xoyOe5ClBBLv+3SQbLVM18PEZvcUMJ2AeX2H9r5LvAV6YoJt2IK2SPU7jf02vE
	 +rzLT4syE95RCYgqJ57uL36s35go0ss395sAbk5/i0qlKdwl5WNVCOZ/0GwZiNhJG7
	 qJgCTWj7QpjVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5EE680B86;
	Mon, 12 Jan 2026 08:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E16B112E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3DF7402A8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzbdBDlYi4_N for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0C2840298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C2840298
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0C2840298
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E55FA4C4180
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-2xbq
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:07 +0100
Message-ID: <20260112080419.2516889-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205146;
 bh=QpSfDwHVjKnMXkzX3iTFknRLgUQDsD+FU3QX7qe5qME=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=eBfRqsPELlKbkn7tyr664lj+nDlwbltRwiCCFq7OabYRlMzY5WKP1yLzaGnFJ1aF4
 QrwW+ZtbP2ZeMMSan47KIk1zbnrIZOFr/2qlDzzQcW9RG+cjG9DTgHOpzjDM7mqWF2
 GHAjShaecFoYKpHYe58rtjWi+pEWcqWGGU+WSttykY24RkNgcbgiszPSAQBdvCZKqG
 R4LLJ097OqCKmN1PAbCZJSkSspFpkxLOcofBvs3i5e49/++mcwhLmq+8i1Iwn7B0f/
 2qbh2f0PYXdJPcqZJ/YrE/AXWhiapNJxhFN19WcKqjrKo+BlrocakNb1pfQvzXAnMG
 7IeunbLqTWASA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eBfRqsPE
Subject: [Buildroot] [PATCH 032/104] package/x11r7/xlib_libX11: bump version
 to 1.8.12
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

https://lists.x.org/archives/xorg-announce/2025-March/003587.html
https://lists.x.org/archives/xorg-announce/2025-February/003582.html
https://lists.x.org/archives/xorg-announce/2024-July/003521.html
https://lists.x.org/archives/xorg-announce/2024-April/003501.html
https://lists.x.org/archives/xorg-announce/2024-March/003492.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 56fecee9ff..1a5913462e 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003426.html
-sha256  05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee  libX11-1.8.7.tar.xz
-sha512  d53bfc18f38d339a6a695b09835b2ae96b323881678bfe7ddca697605e3bdf4102ff49cc3078880a6c55b5977fcdd0aadaf5429086132de3a5bda302f79a2fa6  libX11-1.8.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003587.html
+sha256  fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a  libX11-1.8.12.tar.xz
+sha512  cb7a284d9081a8b67f7d8568d56dc403a4b787e46ac497b07768d236084c01f80f4ea2ebd814f950ac9738adc3baea3912932fc333858195c4f8217744b6f730  libX11-1.8.12.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 920a5d9aed..58f03427e0 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.7
+XLIB_LIBX11_VERSION = 1.8.12
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
