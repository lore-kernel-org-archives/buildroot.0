Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E971D25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D34843B6;
	Mon, 12 Jan 2026 08:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT3MUpbCfXxo; Mon, 12 Jan 2026 08:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5977E84416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205383;
	bh=5ZFkZhKXKCF/8QcoKGMzt+3HasDM5zUVtV0FCJ1A4fY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ev53h6YisdJmLzNGjjqNYgdWoy2h1UMXp21z5HNVQUft+q4WJKvBteqeQG8JDcrQM
	 TVo5sdoZoVtbluHXGFUa8nmiz30b3UgPzach6QTl3AMt9HAfSNTP6qdn1fuDuTl5k0
	 yCacl2s/nVkT+5UIszq7gn8siUHs8rTpVWNPAPjY0Sw4VwZuLQXLYkbji3d7hDeQWP
	 QhZpNOZ7pFOfTFq/zcdFekbYWId/MEOCBLzer8FPFNgcJQXj0AizBjvKzNIPNEcPSq
	 wcrpjKxtVvV8LPS6/pGRgJcZn42U8E1dQ6rbitXeWu7rx5bA2mJfQhBVC4IJF10Gae
	 cOPzEnUxpSGiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5977E84416;
	Mon, 12 Jan 2026 08:09:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E472912E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2CB843B6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySYkxO9nR4-U for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7AAB84416
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7AAB84416
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7AAB84416
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F40FBA4C3B69
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-2wL3
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:49 +0100
Message-ID: <20260112080419.2516889-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205112;
 bh=HlSsB3btFFl0JSDPwfNvUninBgaZU87dK0fG0nNLdeQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Qy+OzqDqFOqc+pU3P/mIAi7kH1lg+lNgoVpvkAHNST9L7epmLyOJpHykxrkM2F+i7
 hcoAlaZOnmNni5ZB1vDSWfEk5N2hOrgXGPSdrEQOlc7vsZUlChyntiyiwqLLBxS4j1
 C0M1NZrWkRpjz1Uaq7JNCfc+7kHvc5+AaaO9ODExR8rzQ3G8FK6W1icz0mxccKIocT
 Nye6eNLJBy3Rah0/7q7t/K+Hx7TFfErKEF9xPoouyNE84mckYjFVh/5CPquV8Xhum8
 r9IUSTlhHK5CWBogLHI12sRKHvdLiTnxPTBN+8nuIERte+H0wRf5YvBI70JrIxah1k
 0gIjycVHVY+vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Qy+OzqDq
Subject: [Buildroot] [PATCH 074/104] package/x11r7/xapp_iceauth: bump
 version to 1.0.10
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

https://lists.x.org/archives/xorg-announce/2024-March/003480.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_iceauth/xapp_iceauth.hash | 6 +++---
 package/x11r7/xapp_iceauth/xapp_iceauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.hash b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
index 694b6beaa1..fca34fbcb3 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.hash
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003140.html
-sha256  2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05  iceauth-1.0.9.tar.xz
-sha512  16b2f58008587cf1544037ca8b1c76dbb75eb043b3048b3064e66ba6b147962233f1453c2cf18bfb136dd6dd21d3e27b5219e17e1ab7b81dbe93fb6aff801a72  iceauth-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003480.html
+sha256  3deefb7da26af9dc799b5628d929d91c9af68c78575639944db3b955f29aa029  iceauth-1.0.10.tar.xz
+sha512  cfadac03a3f72f3c0bb58f67984a033847c76e7e3fdd9ebce583c0554d7f9484faf5053d878f5a82a543cdcc8e2ef8acecadb8830bd3c53584d7ec950cb51cc3  iceauth-1.0.10.tar.xz
 # Locally computed
 sha256  fdd9ba8ccb92af2f31f542e7b7a18c27257e6cdce147d231bc9ba3654ad84976  COPYING
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index ba1f522911..fa65775e00 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.9
+XAPP_ICEAUTH_VERSION = 1.0.10
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.xz
-XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICEAUTH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_ICEAUTH_LICENSE = MIT
 XAPP_ICEAUTH_LICENSE_FILES = COPYING
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
