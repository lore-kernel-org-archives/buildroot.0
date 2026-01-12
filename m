Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D258AD2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AA760762;
	Mon, 12 Jan 2026 08:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZRdfAW-d6Hd; Mon, 12 Jan 2026 08:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C667A610D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205188;
	bh=4k9gNXqxGCSY9SeZJQ5bpaLN8ILmJS9RjravjKwFnN8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSOMsyhqifrbOsmIX7EfLbMZQa9UWOW21eXeDMJ2atE6zdh6+czLVA3OqBu7QtDyh
	 k39DoBAtveFkwJUjx4o7jTCN0Xve+i3Y9DdMSgPAMfjOgu1JoDhg/GTO0Ma8aKHQkZ
	 TROhLJQB1G07Jad6H2PG7QDAc+dnEGeaNU1XWvxhgJZpmaiGLiznWJQ13eU0GZ71ha
	 wTYALQjV432z5VwylID8kSwW//8zAVCpev0dKG8KMzSrchMcHz+2ki7cR9ZdScRAhb
	 Bu51LKOSFCa5udSAviVLU0reGfuzxdUMQXdEqF2qUNw7TWDudQQKAKViu5Oji4hlnZ
	 B8aqvQip09MJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C667A610D9;
	Mon, 12 Jan 2026 08:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC6C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E86A415C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_GHdJObmCEZ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 503FE415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 503FE415C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 503FE415C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 240BEA4C41AB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-2heI
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:34 +0100
Message-ID: <20260112080419.2516889-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205088;
 bh=Mju5b/8U++VhKzTA85JS/K/fgOY627xK5B1/3KrizBE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pcUc/r9GvtqAEVhePbkRTgV5qanyFCaC0rghQ9qoLaYsy+9e4lkAtL8j6/ckZHKvS
 zL3Ggm4vbavPBI0qHCgJSr7vmyhVqmvt6lC4AkjRFtRGpsf9kNSeXV6ag8B0WR57km
 dwIm64YESLSkLmPHtN/bQdrk/N9kajhsG/Ia4ocIjZnLkMviZ8xWWhY8fwzbwqSNDN
 I+BiEy2xVnISfGdpdfaA8cwru1nRMIlGJepCI7vaYTLgNKx0PiRePO6n3u+3gyluxr
 6DqGfOe/2d9YQI31kGVCA6dUs8dVsy1y7tFwasKc5pxHFSu3VrXV3muDnEgy1OAP+f
 8bxbKb0IMMAiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pcUc/r9G
Subject: [Buildroot] [PATCH 059/104] package/x11r7/xapp_xcmsdb: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-October/003534.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash | 6 +++---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
index 7590580d88..9625891d34 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003172.html
-sha256  3c77eec4537d5942bb0966973b787bfdaf7121f3125ffa81bb1c9708d4cf4f55  xcmsdb-1.0.6.tar.xz
-sha512  e47d9498ce496effbc44a66e70af91d9fe65c344a17916fd4990a4c84fa8879aa09b6695aeb6ef595f475c16a13c7c31d4c48449234564de7de38d7436764fae  xcmsdb-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003534.html
+sha256  5ec4068e488187b05ea92ee1362c96b78a90f19ccc7a1844c5921d70626bbc38  xcmsdb-1.0.7.tar.xz
+sha512  87bd13930385c16689bfb6eefe47860f3741ccede9ddee4a860bb763937828808aca2c2fcc56637c06c3b9f1a5ee5ffd5cadc039d93ff7b2375a004867ef9f22  xcmsdb-1.0.7.tar.xz
 # Locally computed
 sha256  c3bd4ac91beb08fee5272b17a3ddee8d2791cc5eaee5bce5271042a45fa4fa6a  COPYING
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 4af341a027..7af3ab303b 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.6
+XAPP_XCMSDB_VERSION = 1.0.7
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.xz
-XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCMSDB_LICENSE = MIT
 XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
