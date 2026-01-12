Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E36CD25043
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B064843B1;
	Mon, 12 Jan 2026 08:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkdAz1syS6n7; Mon, 12 Jan 2026 08:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5571843AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205067;
	bh=PZ5Umi1msGJa61phT7IySeVyPisLec2HiiIbD4SCP+s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3i9fPy6cSQD4PeUjgix/NAMfEB3dFM5MqSNp1cZ+X0TLsUvB2u022mRsQTdzroH9
	 YTAKad8WZHKSfY13YfjpHw5r9dF375QU3hgXoHM27Ks57QuLvJAtg3THHkQZsDsQHd
	 ookRUUf7IaX0CugCXozTSl/FaREHgFRqwytDXGddw8FKlE8Hc7GUCqR/skzd1f8UT4
	 bOh3YjFC9YfJEkfBObXOr2DK+l1tqHmFLh5CjmWflasIATYJJ0aOxUhvzUL3qvNSIl
	 6zCcusGOsauyPwpn5IqHxq30OHcedDPvqqYwG7x+UXQxTV+fzejrSmqdxKCwbeU2rI
	 gTXkCmRqnyclg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5571843AC;
	Mon, 12 Jan 2026 08:04:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F9712E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F8DE614B4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc0QIEOFRMdA for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 767E7614B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767E7614B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 767E7614B3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7C71A4C419F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-22Lr
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:38 +0100
Message-ID: <20260112080419.2516889-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205059;
 bh=HIB5x3OSFaDsSqvwuYVHShUZHfQhc9/JNR2xDZRuPCw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=XdOunpgqo3R1T36RHUeoTusDrpSHoFa+Exe1EeZmJteR7hTk11wOJ2U6I0FE181sz
 DbiVH6S2ljWXLPaYnUtzoTWfVkOoeiPpUbZzQ2X6xIRDCFvf3+GI6riymoJmhAFc2l
 MoNGVMhW4MkG8OvD85h8KmAa6BBjBMAccN1mKbwH0rG9tVF0gtOT4pJ25X3YK1o/TP
 6eZMmlYauULUZkRUlK5m/QyYxT9klQbuAgktNfzJXWr1Ht6XuCQa+SBYn73cDV7lR7
 VtfbGAc0IYSJRekVwZU5gsG9UYz9Kjb9teJOTRtwWzF0KvRoTMRwfKMoQ64ptzz3ov
 YtlrtwyxDEpqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XdOunpgq
Subject: [Buildroot] [PATCH 003/104] package/x11r7/xapp_xauth: bump version
 to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2025-December/003653.html
https://lists.x.org/archives/xorg-announce/2025-March/003589.html
https://lists.x.org/archives/xorg-announce/2024-March/003472.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 6 +++---
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 966c3ba028..bde3c2ef9f 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003158.html
-sha256  78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200  xauth-1.1.2.tar.xz
-sha512  ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8  xauth-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003653.html
+sha256  a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0  xauth-1.1.5.tar.xz
+sha512  df94b59de49ced2490351b7ab42d56d3ef92077891b8ba7a73c53b6babb1facd250d934b82f36ee1ddc355dffefb8f52914d30893c9d578711264f82e9bf3cb9  xauth-1.1.5.tar.xz
 # Locally computed
 sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 248a66e3a0..978a20e690 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.1.2
+XAPP_XAUTH_VERSION = 1.1.5
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.xz
-XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XAUTH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XAUTH_LICENSE = MIT
 XAPP_XAUTH_LICENSE_FILES = COPYING
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
