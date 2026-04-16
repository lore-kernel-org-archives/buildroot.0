Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2682F8A16C
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 12:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BE4460710;
	Thu, 16 Apr 2026 12:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8OYFjTNah_2; Thu, 16 Apr 2026 12:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976FD6070A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776341581;
	bh=DYMHbQEnJqiYNWd8orf9QkR8uGqswGh60ElZ2hG9bRs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZA3OitTUI09NFUejit791rfb+/WTGvvC1wHR7VbMoMtJ+/1eu8uOZQgatZDRxHMaf
	 /dYCiAX7dcaHBw9shs3h8W7Wk4vmPym+zczVQODRybOPMpD9CCpBdjH5f/oWcS6zIF
	 hkXD1/IucBt+nKJjmCYK80l19K7jd9DBs1Owwg9jceSI0tUiAlU9MM4l6t3ecHXxdN
	 Ji63jK80I2fdc0Us8+YGa1FlKcS6WaYJuXGuML2bwAlI/fbkCsQK0Uf8y3k2X6HN1Q
	 cA6CidcypMzgfldnl/kOdVtg137txCq+aCa+AJ8gS7HgCF8f9AaFsUHPvhxVfha5T0
	 6whr1xHCdVPXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976FD6070A;
	Thu, 16 Apr 2026 12:13:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B81775
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 12:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99A9E400D3
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 12:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2z2Zlg5eyJ7 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 12:12:58 +0000 (UTC)
X-Greylist: delayed 1796 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 16 Apr 2026 12:12:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26F7740090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F7740090
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26F7740090
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 12:12:56 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wDL7Z-00GxWm-1L; Thu, 16 Apr 2026 13:42:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 02df2df7;
 Thu, 16 Apr 2026 11:42:56 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 16 Apr 2026 14:42:54 +0300
Message-ID: <20260416114256.969634-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MU8jkfcZPrUzcFUbxsD9nVP+MMoJjmvCZ7U6AQm0OXo=; b=Wh1VCTD+lw8j7+Sk7VEtVEuGxO
 n89Of9V4bg+Gi8o3a4geIlYNeDQ2fp9CKx5kEbN3gHV4W3bDaG8CMvNRkHD9dp+YDJKi79FLzApw3
 FKiyqCvA90VJYPYOZ3HHA3ubLgHHTwhnC7fosQc4L9uokA8rUeXUxNVkmNqVvS1OR7xsRiKsj5zVO
 Zmb8P+Jxbhhkizme7pWsrEckOTbm9kRlmg5W36mSwqA7sURPLzRCltp/FqO93RB/Bl/u1veRy5+Ux
 J2va1EtYH4DyJBX+jTij3+lVqkLX2tIc21PpVhGqahsuqZyedQne+q5oGl6q0PhXou3DqkzjdditO
 Hb6DFcKQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Wh1VCTD+
Subject: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: security bump to
 version 0.1.7
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

While there is not a security advisory to go with the release,
it includes a patch to prevent message interception that may be
considered a security fix.

Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 93d4bc05ce..e5be1f0cd3 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.6
-sha256  131bf59fce7c7ee7ecbc5d9106d6750f4f597bfe609966573240f7e4952973a1  xdg-dbus-proxy-0.1.6.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
+sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 0e92946915..6c3ef5c9d4 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.6
+XDG_DBUS_PROXY_VERSION = 0.1.7
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
