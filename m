Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA374D25043
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFE9843D8;
	Mon, 12 Jan 2026 08:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNfrz9I37gIC; Mon, 12 Jan 2026 08:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF54843AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205140;
	bh=DETtahS64rn8rQ548QiRf2V31DdpvxEndkqiEhC+0Bg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ql+sILE1zxGGtmgZTBgyPpzw9V5AylNvWvhF2CTt9OvtHroIippqWPVaWtPXZcdhE
	 p+WA4fyXvSk3lHfI7Njw5a/1vwQXBMoe/0g8M43VHw5EQq9M4rRcmPNs5gRI/FU0Y7
	 AHPyozj9iba0dAperAhH+4OJIzPRGO6j6mMlz63JBULNYRhN/WCKq2Edxo2MmWZ9Vx
	 r8xF+kDrjsXGB9qhbuttO8SnhIFG7LzT7+S5r7cQlxkbkE/yXGHxYtURgZwwMpW4yj
	 Htz+ZzqFRffer/GN8Os+G4TaNi+8DypXHtR45VGS1it06u2Xceq1agOOTX62CqHs5n
	 ve7r67RaAmjDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF54843AE;
	Mon, 12 Jan 2026 08:05:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2224818D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B39415CB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyK5Envsnoxf for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EECB6415C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EECB6415C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EECB6415C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09807A4C366B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-1Up6
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:30 +0100
Message-ID: <20260112080419.2516889-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205079;
 bh=v7/3iHBPyEIby6TmbL7HyajPhxh5Iet2amTSE4Ag0mQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FDhOOqjaf7twFt/VOURAHHUNm73/WzX7b5fk9D/1qtzxHEDg5wyDHzkmz3jwzcOiM
 J2BiDFYlxuem/MnUAq+EY3MDmj9oOjtUfxy1bO0qE5HDOkDfMtDSphHeiYT6OumqVj
 vr8rU+/pjNGhesGaSdJsX5wue3O/dMIIq1+rQ7NOfIuuKjhenkIKGCSw9w9ZnEqfC2
 JuFy+q9FOPDMXu5Q+LST0cxJgVqks5N2kK0dU9X7nGOWAjrBbSt5jKQgYtotuhU47O
 49bDgA+z8fZL2udivFYmlgaMoutQZ4Ozu2GdM7E9Bo8cGouI/0gqMaNw4QUeHLNmjv
 zwrj0mICQG/QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FDhOOqja
Subject: [Buildroot] [PATCH 055/104]
 package/x11r7/xdriver_xf86-video-mach64: bump version to 6.10.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003538.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-mach64.hash                          | 6 +++---
 .../xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
index e33036f4c9..f20c6b754d 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003183.html
-sha256  50d78abffa7c8227e6f187976f23a244ae2095e97f08de275529b70fba9481ba  xf86-video-mach64-6.9.7.tar.xz
-sha512  a511525ceb8eab95d28e815f462897ead8b99ac455c548598cc061907636e1acff8cad66621feeb33558dbfdbf59ca0648422aae8edaab7d1dcd7e386348177b  xf86-video-mach64-6.9.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003538.html
+sha256  d6b96b47a27cd2dc6dea612f5dc51fcc1a8561d5ad1d48d04ec2d47751222724  xf86-video-mach64-6.10.0.tar.xz
+sha512  1f40114062e320aedaeba5e68e08fd747afc45c03cb0cc4445cdc5ba94aa65b71dd63a19741d0e3dab34cc3cd914d991fad4350fadf39192d753817ec2011cdc  xf86-video-mach64-6.10.0.tar.xz
 # Locally computed
 sha256  a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 2e41208ab4..f9ec3e66ff 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.7
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.10.0
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.xz
-XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
