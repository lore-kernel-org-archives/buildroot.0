Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47F5F94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F1860890;
	Tue, 21 Apr 2026 19:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxJFDxh5ejjw; Tue, 21 Apr 2026 19:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CA86087D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798126;
	bh=tuQbSjypTJnnMz7aZihSq3LldAdW1CdfVsQIF5cepJo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ajp2u264IgHhiwGxuEsW7LToPsglOg7kGjttFd1Z5ABckUtCgQHzd0QOFqkITkLf3
	 xSLxZrQeBPyYYirXGMb6sOu8y/bfjoWQX+SJcOOQrJsAfk9j22kcQGVVqZr6OJmfq0
	 Yl1JL5bSpCakK/u+u4hgfY1VWFsvZr60RNrLy4VdHc6TBMEo39MoSxRoEUxJ0dxA0U
	 ieq/YNavDLzjCO6jTb7VqfKXWgrCVlZNB29MtMqPDCk+onvcGbMrF3ZTQO2JPSI77w
	 mXD58cntuET2Xs/uYBGCF894U1WNkGTUNXhkWToMZ4/Pf9kYdzGbbdnJYiTBf48ujQ
	 bnqB0DcSDYpZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CA86087D;
	Tue, 21 Apr 2026 19:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86324183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C71B83FF0
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5m3R0Sq1XBQ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB0683FED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB0683FED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB0683FED
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:02:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F001A4C0185;
 Tue, 21 Apr 2026 21:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45816)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGMD-000000003ag-3Xtu;
 Tue, 21 Apr 2026 19:02:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 21 Apr 2026 21:02:01 +0200
Message-ID: <20260421190201.2722268-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798122;
 bh=OhN9x6bVk6PPu+8HDqXiBhH/kD1n+yUL1OOpA9tCvSs=;
 h=From:To:Cc:Subject:Date:From;
 b=LkCDP3t572s4LKj0WGj6nY2GXov9LiV47x8WT3pSjWmSoX1CisHXYMAkUyBiiLiHs
 D3Sp+bdQkvNQEgkCSK6r7LHbaIobpzFHbTnqXq/mXwNBGKVR8YpU5w5WG6RrXijqr2
 GPF6WQOW8E/cUC0fgTatWMCaaxuBmTrDD0lpFfmiONQwoqQWOGpEK13mfGmO1vP9tL
 6pb1tofqKFNrRM2OuLuhZUkVaopgZ8FA0CplZmohNLFbuaikzefSJ+kfl3dJpy/qeB
 zYloGT1gRDLfnZIQnuy+LE+VyCLv/sBH/C5BaCZQVnnGJ3d8chaNv5VIE3pNd2pa6+
 i1Pdk9RDLE9zA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LkCDP3t5
Subject: [Buildroot] [PATCH 1/1] package/cog: fix build with weston 15.x
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

Buildroot commit 2e6b2b82d5301977cf2f59adfd633d8774830f69 bumped weston
to 15.0.0 causing a configure error with cog:

Run-time dependency libweston-14-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-13-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-12-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-11-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-10-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-9-protocols found: NO (tried pkgconfig)
Run-time dependency libweston-8-protocols found: NO (tried pkgconfig)

output/build/cog-0.18.5/platform/wayland/meson.build:66:8: ERROR:
 Problem encountered: No usable weston-protocols dependency found

This error was not yet found by the autobuilders and is solved by adding
an upstream patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Add-support-for-weston-15-protocols.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/cog/0001-Add-support-for-weston-15-protocols.patch

diff --git a/package/cog/0001-Add-support-for-weston-15-protocols.patch b/package/cog/0001-Add-support-for-weston-15-protocols.patch
new file mode 100644
index 0000000000..97ec65a409
--- /dev/null
+++ b/package/cog/0001-Add-support-for-weston-15-protocols.patch
@@ -0,0 +1,29 @@
+From b59d3a3c0feceecb10f0376ac2695d9466c9ecf6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 1 Oct 2024 10:24:56 -0600
+Subject: [PATCH] Add support for weston 15 protocols
+
+Weston 14 was released recently and the weston development branch is
+now using libweston-15-protocols.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+
+Upstream: https://github.com/Igalia/cog/commit/b59d3a3c0feceecb10f0376ac2695d9466c9ecf6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ platform/wayland/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index 74215f0a..dad47a6b 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
+ 
+ if wayland_platform_weston_protocols.length() > 0
+     foreach weston_dep_name : [
++            'libweston-15-protocols',
+             'libweston-14-protocols',
+             'libweston-13-protocols',
+             'libweston-12-protocols',
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
