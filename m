Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E863C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827D2607BD;
	Fri, 26 Jun 2026 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QFjMpCFxPer; Fri, 26 Jun 2026 21:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D4B607BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782508196;
	bh=1JDkcRWhnna7/9BMpI8twhH7/IdLbdkmN3hHiP/vRhQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hmpoOKMMkvbpw6o9BONgUXomvkkHw43+pqr9VRB/3oc6R+X8v4AO0iZHnLjsBPVeb
	 PzhfSkN2AV3LQ+/CtbqrnIzLeBZBdAPRf7YwpFXmgY5aIM6JgKT4HrsLnGvS9IZtgm
	 HwFrEotpSopOMic/gUvMeLnivLzMA0uFt6YUzuzQDTUCR0GS0LAA7+WxUWh7jijw93
	 Mxv+kXbtN0bMHpR2ODhz0hQj5OoXu3zo7eCZMBd1mrhJcAhF7YmhoWkpPXl88luoLu
	 c0/S/rwerU+i8FyBs0Kd/YKERcTF6c8H23ZB0ejvrjFMt0s203UP8VMi3O6EsCtNzF
	 3CvYPMIlTFqLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D4B607BE;
	Fri, 26 Jun 2026 21:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE8E82F3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDB582285
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4hDJetSgfME for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 21:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B1DD8227E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1DD8227E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B1DD8227E
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 21:09:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b7db.dip0.t-ipconnect.de [84.161.183.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0CE35A4C0D60
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 23:09:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53584)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wdDo5-000000006Ol-2xW4
 for buildroot@buildroot.org; Fri, 26 Jun 2026 21:09:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 23:09:49 +0200
Message-ID: <20260626210949.741890-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782508190;
 bh=ASOMxr2KtuvLrPxA2pUiokmFczhKjBcCzuY+Av9TEus=;
 h=From:To:Subject:Date:From;
 b=E8mIVR1U+XR3jxKPqcCXzbJCPRvB5q7sXAp04pnpbhXHCt5jQ/Zr/YU4+E2H5UnkN
 cWDjVuukpFhqbmTWfu6bhPhLjRXmhwhR64kwsvGP5e8SdhenCUi/A8XFJo+7+gUxiI
 MspUlbsVoUHexYIJN1lAt6XzFHqsZT/rpnyWfghKfEOAX1obxh1KLAf1fN1tgPOw50
 Dz/ukQdHWxqbLJ6yzQDAi/RIKPauru1ANK9Or1POfDE/HPSFCANKAbPF9OtYzBfXyk
 IX62p6GW16r7LuqYJwP2RXABbmt0j0PiUZY2axO1kAwwfNnGz5aGxGucWTykkF9R8n
 36WfsSdM3+fEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=E8mIVR1U
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.11
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.11/ReleaseNotes

Fixes TROVE-2026-025 & TROVE-2026-026.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6a475e9b6283e763f8af481dbe43a9f86d389ed2

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a6771b1fa1..b888270f14 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
-sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.11.tar.gz.sha256sum
+sha256  2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed  tor-0.4.9.11.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index ca5a4d026c..3e63fbacac 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.9
+TOR_VERSION = 0.4.9.11
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
