Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F4EC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 16:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FE440750;
	Tue,  1 Sep 2026 16:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iwmDo2g9ugC; Tue,  1 Sep 2026 16:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788279825;
	bh=J2rR6cCfJRGnosW1a9qme8UXEwvhsNtJGdX3SJS//Cc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=byWjo/Qkavp6Uj98thiPtbp4L+Djn2x2eiNIsOdP5uVo+tfPNRgGdlfjPqr5DuANE
	 IMOBkR/gS8pcuPqPGoEjcOpVqT4DlxoQ+CSbxvRaPnAw7QmaQJwpPDXfPCDStcj/5Z
	 eDkgwuPrtmCfjZBQp46T0/HeiyB8QyUEi2VnbYKGthjxyqgz1nAg4Njrcvm0s8o8h5
	 TCXx+lA/Rjfc+uNP17OjjdHW/zpVgxauRtXPEp+6PXi3EDfIAMgCRvHuxVSqhcLqgo
	 HxoHOC0bvx6Gx5IhQVW+CInEbjwrUuxZvhvV5mVOhwR9G/EwjTSqSO5DDMAO3bG8b1
	 DX9wJqJoqcD4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08BE4074F;
	Tue,  1 Sep 2026 16:23:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0FB2FD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 804AD80E45
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwoAnf2hTycA for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 16:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LyM5a8vs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D8BB80E30
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788279817;
 bh=QRIIT0FvKczNggr8IzAIch/AERhyK0D4TGY7f9UwIIM=;
 h=From:To:Cc:Subject:Date:From;
 b=LyM5a8vsTXmbN6vEAMy6LgPdeNsOtp6ojO50oEbEnrPDTR3gS5zE/65Y9Uw07ydTb
 LqyK3kk8x15TtDuUM/Ye6EuzaN3+w9TLTigcmsLTyo8kK2f0d8K0quhimxyrdYFR4l
 ig/S0pdKgIKAWRQP75ZV00wN1HIo/LUyQwlaOh+tGX+guWdV3qNFf03+KLrfNbeBmB
 1s/x0TqO30ScEiJkmP/YESj/TGD1aN8EeTUv5ievlC26RShDgONgHHiP8ReWDd3suA
 e9iHjtqRWyxe8BDckfhdNC8cDSSL8OrQIrNUXaJEN8MFJx+nEVFW/YR3KlCTdufTV+
 XKbMFuitjGBSQ==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB287A4C13D3;
 Tue,  1 Sep 2026 18:23:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53172)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x1RGq-000000000aC-3iqu;
 Tue, 01 Sep 2026 16:23:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Sep 2026 18:23:37 +0200
Message-ID: <20260901162337.168580-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: fix build with fmt >= 12.2.0
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

Buildroot commit cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9 bumped fmt to
version 12.2.0 causing build errors with ncmpc which are fixed by adding
an upstream patch.

Fixes:
https://autobuild.buildroot.net/results/b97/b97146ba1b4996b644c564898f5633dd8c0d4b83/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../ncmpc/0001-support-libfmt-12.2.0.patch    | 195 ++++++++++++++++++
 1 file changed, 195 insertions(+)
 create mode 100644 package/ncmpc/0001-support-libfmt-12.2.0.patch

diff --git a/package/ncmpc/0001-support-libfmt-12.2.0.patch b/package/ncmpc/0001-support-libfmt-12.2.0.patch
new file mode 100644
index 0000000000..ec865f2c89
--- /dev/null
+++ b/package/ncmpc/0001-support-libfmt-12.2.0.patch
@@ -0,0 +1,195 @@
+From 0276640641f58936d0862507472b8d231ab23f42 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@musicpd.org>
+Date: Fri, 26 Jun 2026 21:26:56 +0200
+Subject: [PATCH] support libfmt 12.2.0
+
+An API change to libfmt 12.2.0 changed the meaning of the <fmt/core.h>
+header to no longer provide fmt::format().
+
+Upstream: https://github.com/MusicPlayerDaemon/ncmpc/commit/b28f4a5987615ac3074440a5ee14ba55f5a03f99
+
+[Bernd: backported to 0.52]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BasicMarquee.cxx     | 2 +-
+ src/ChatPage.cxx         | 3 +--
+ src/FileBrowserPage.cxx  | 1 +
+ src/KeyDefPage.cxx       | 2 ++
+ src/Main.cxx             | 3 +--
+ src/SearchPage.cxx       | 2 ++
+ src/TagListPage.cxx      | 2 ++
+ src/page/FindSupport.cxx | 2 +-
+ src/page/Page.cxx        | 2 ++
+ src/save_playlist.cxx    | 3 +--
+ src/screen.cxx           | 1 +
+ src/screen_client.cxx    | 2 +-
+ 12 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/src/BasicMarquee.cxx b/src/BasicMarquee.cxx
+index f25e33a6..9b887812 100644
+--- a/src/BasicMarquee.cxx
++++ b/src/BasicMarquee.cxx
+@@ -4,7 +4,7 @@
+ #include "BasicMarquee.hxx"
+ #include "util/LocaleString.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #include <assert.h>
+ #include <string.h>
+diff --git a/src/ChatPage.cxx b/src/ChatPage.cxx
+index 6b1a1587..efc403f7 100644
+--- a/src/ChatPage.cxx
++++ b/src/ChatPage.cxx
+@@ -13,10 +13,9 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringAPI.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/idle.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <string.h>
+ #include <stdlib.h>
+ 
+diff --git a/src/FileBrowserPage.cxx b/src/FileBrowserPage.cxx
+index 0f510fe4..e6231bc1 100644
+--- a/src/FileBrowserPage.cxx
++++ b/src/FileBrowserPage.cxx
+@@ -19,6 +19,7 @@
+ #include "client/mpdclient.hxx"
+ #include "util/UriUtil.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ #include <string>
+diff --git a/src/KeyDefPage.cxx b/src/KeyDefPage.cxx
+index 123b0182..b5925e9c 100644
+--- a/src/KeyDefPage.cxx
++++ b/src/KeyDefPage.cxx
+@@ -18,6 +18,8 @@
+ #include "ui/TextListRenderer.hxx"
+ #include "util/SPrintf.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <assert.h>
+ #include <errno.h>
+ #include <string.h>
+diff --git a/src/Main.cxx b/src/Main.cxx
+index 3f0c4da6..cdd8ac98 100644
+--- a/src/Main.cxx
++++ b/src/Main.cxx
+@@ -22,12 +22,11 @@
+ #include "ConfigFile.hxx"
+ #endif
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ #include <curses.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+diff --git a/src/SearchPage.cxx b/src/SearchPage.cxx
+index 483a92e8..d4de6552 100644
+--- a/src/SearchPage.cxx
++++ b/src/SearchPage.cxx
+@@ -17,6 +17,8 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringAPI.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <iterator>
+ 
+ #include <string.h>
+diff --git a/src/TagListPage.cxx b/src/TagListPage.cxx
+index bb73cd76..4b5c6fae 100644
+--- a/src/TagListPage.cxx
++++ b/src/TagListPage.cxx
+@@ -11,6 +11,8 @@
+ #include "client/mpdclient.hxx"
+ #include "util/StringUTF8.hxx"
+ 
++#include <fmt/format.h>
++
+ #include <algorithm>
+ 
+ #include <assert.h>
+diff --git a/src/page/FindSupport.cxx b/src/page/FindSupport.cxx
+index 9832dd3b..8664efb5 100644
+--- a/src/page/FindSupport.cxx
++++ b/src/page/FindSupport.cxx
+@@ -11,7 +11,7 @@
+ #include "ui/Options.hxx"
+ #include "co/InvokeTask.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ #define FIND_PROMPT  _("Find")
+ #define RFIND_PROMPT _("Find backward")
+diff --git a/src/page/Page.cxx b/src/page/Page.cxx
+index 6576e7b0..5186834c 100644
+--- a/src/page/Page.cxx
++++ b/src/page/Page.cxx
+@@ -6,6 +6,8 @@
+ #include "ui/Window.hxx"
+ #include "util/Exception.hxx"
+ 
++#include <fmt/format.h>
++
+ void
+ Page::OnClose() noexcept
+ {
+diff --git a/src/save_playlist.cxx b/src/save_playlist.cxx
+index cb248c56..b9a2278c 100644
+--- a/src/save_playlist.cxx
++++ b/src/save_playlist.cxx
+@@ -14,10 +14,9 @@
+ #include "client/mpdclient.hxx"
+ #include "co/InvokeTask.hxx"
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+-#include <fmt/core.h>
+-
+ #include <stdio.h>
+ 
+ #ifndef NCMPC_MINI
+diff --git a/src/screen.cxx b/src/screen.cxx
+index 4a50d4df..1ee0b0f9 100644
+--- a/src/screen.cxx
++++ b/src/screen.cxx
+@@ -28,6 +28,7 @@
+ #include "TabBar.hxx"
+ #endif
+ 
++#include <fmt/format.h>
+ #include <mpd/client.h>
+ 
+ ScreenManager::PageMap::iterator
+diff --git a/src/screen_client.cxx b/src/screen_client.cxx
+index 4466d476..1bbb1c74 100644
+--- a/src/screen_client.cxx
++++ b/src/screen_client.cxx
+@@ -7,7 +7,7 @@
+ #include "charset.hxx"
+ #include "Interface.hxx"
+ 
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ 
+ void
+ screen_database_update(Interface &interface, struct mpdclient &c, const char *path)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
