Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB72D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A22780E36;
	Mon, 12 Jan 2026 08:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY67lLUCiJ4t; Mon, 12 Jan 2026 08:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A9280DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205793;
	bh=IVEr4IKKTVKgsZNmO0PazLHIjAgKr6S0oz7Yqy8XKFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8s1fJFoyl41TBF2c/zF1qAx/lM0+AnFxJLrW0t4a4RFdLQ1AQj9MYIBp3L5Fj/vU
	 ztnYM8QAFzMsxdSVB/JzzgSJM0OE6aGPBIrtlIBWU14eOcCJdtjUn8IKfaCAJMV4OZ
	 21wIZea6XGWyBfdfnNWKjGg/4rlmp/3WWhZKcCvAmofPy4efZ+pHrefi8fIcyvVqDU
	 96JaDF05qvINWdT8WTwypjGaNb33Dr4DYBfHD4X45kLpbijRQWMJYsLazeydqytYMc
	 NOoR6rGO9Ut5KkGuAk7lsoQCgxCVJ6VhEyFuDt4P6XYyMV2xjddaSWuC0vJ8b8prQy
	 6BmHqd4K4+HNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A9280DA6;
	Mon, 12 Jan 2026 08:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E742512E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D962B4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQzl7AGMcGpF for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3C6C4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C6C4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3C6C4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9E00A4C3D34
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuS-000000003M6-0bXX
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:46 +0100
Message-ID: <20260112080419.2516889-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205137;
 bh=P/h43PUrmZO36MZo94Pt7IgJKhPX5YD+RRzC2QzF2l4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LdbeV3txz/ORNu+u4s4riVtQmkpK5HuBc2B4veGy7OpjtpZtLJ7s6MR963er+96Gm
 oi/Z/QJeS3SWWUpJdPEU9xY9XIdhLnYrPMWuxgu8GhbPC953xhwbLZzQXEFgv6eT0k
 aNBGaf69ZJstknrkOlqXA0WRhTGL7Qe4rIVeuCgnG07soHAAA1E/CdZoB0oyc7Fiyk
 qvqBnIb3tx/KXW03Ra8RueHa/vqcXLnc+C/sWWiXInctVzJaaXHEpplXEs1jdF37M2
 aQQ2j1wUrfByhyZOPVi4s7zVFRM/NEor8YIScyFcckw6lUFSoooRYXr74mYREclWE/
 4ZgR+JYdSUoJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LdbeV3tx
Subject: [Buildroot] [PATCH 011/104] package/x11r7/xlib_libXres: bump
 version to 1.2.3
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

https://lists.x.org/archives/xorg-announce/2025-September/003628.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash | 6 +++---
 package/x11r7/xlib_libXres/xlib_libXres.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
index 2e6d3d5c55..4c6b6579e3 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.hash
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003278.html
-sha256  9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f  libXres-1.2.2.tar.xz
-sha512  897f2d426ea6f41169a5a52c356d1a1cb2ffb9144ae41b9fedd06455c3d81042930fe55be269ce4b8545ee65fcfe168101192a599053d810e8810f627c94f810  libXres-1.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003628.html
+sha256  d2de8f5401d6c86a8992791654547eb8def585dfdc0c08cc16e24ef6aeeb69dc  libXres-1.2.3.tar.xz
+sha512  385dbc87bd4e0d306a1cad6b317d8431494cd2a381766bc3f9e6b7f488ff41ee1f4f25e756421f6a2b5681976d7da0108cea6305f7a34f7105d861cb6c1ae854  libXres-1.2.3.tar.xz
 # Locally calculated
 sha256  0d7300168f85833ea2564835f66a61e036ede90b33e76c06a7b4078096fedbcc  COPYING
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 25498090fe..65be80f67c 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.2.2
+XLIB_LIBXRES_VERSION = 1.2.3
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.xz
 XLIB_LIBXRES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
