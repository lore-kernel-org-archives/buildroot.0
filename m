Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E411CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 17:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC883849D0;
	Thu, 11 Sep 2025 17:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LbveBQ86dHn; Thu, 11 Sep 2025 17:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D88B849DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D88B849DE;
	Thu, 11 Sep 2025 17:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A441E443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875A14129E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPnATnUZtFHK for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 17:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E993404C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E993404C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E993404C5
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:17:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b21f.dip0.t-ipconnect.de [84.161.178.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B08CA4C3942
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:17:00 +0200 (CEST)
Received: from [192.168.1.144] (port=48330 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwkuq-000000007Pi-1uCK
 for buildroot@buildroot.org; Thu, 11 Sep 2025 17:17:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 19:17:00 +0200
Message-ID: <20250911171700.594432-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757611020;
 bh=zLOI97LIMCBPzgJ/Txw5tSam+htg5y70VHS0M30f7Nc=;
 h=From:To:Subject:Date:From;
 b=gVqgLIryQwflwE1pkikFk62oDjewmopI7YXbQc9A5CE9g5Sxpb1L4gEAoAk8avfqX
 RWFO7dWGvA0itSfkhfChrGxbV+0Q8IF3VllWmHWBdamMsLGtN7w/tret22Cu12Q/iD
 wedGwh6URJUcvGlSs8T55qwCtKIjx5GTVCSuKs1B8FsmiNhP7xLxTSKDNT1MwtMxwh
 bLX59FeLIf6e1rjUCBoFa3wF5pQx+LpFat863gBglysh3KfVS7Rnrp83F9SvBolqZX
 E0RC5alrxmgvZdnjwg4o+Dex5RHEZ6Tdo99YChM3oBe2gg9MjQgAqZDSrkMnkJxe/H
 7/nnh03SpKD2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=gVqgLIry
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: remove client,
 needs libgtk2
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

The gkrellm client needs libgtk2, which we are about to drop from
Buildroot.

Even though gkrellm has a somewhat active upstream at
https://git.srcbox.net/gkrellm/gkrellm, it isn't clear whether it is
compatible with Gtk 3 or not.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy           | 15 +++++++++++++++
 package/gkrellm/Config.in  | 31 +------------------------------
 package/gkrellm/gkrellm.mk | 12 ------------
 3 files changed, 16 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 895e42fc30..69255b201c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,21 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_GKRELLM_SERVER
+	bool "gkrellm server option has been removed"
+	select BR2_LEGACY
+	help
+	  After removing the client option the gkrellm package only
+	  builds the server part so the server option is not needed
+	  anymore.
+
+config BR2_PACKAGE_GKRELLM_CLIENT
+	bool "gkrellm client has been removed"
+	select BR2_LEGACY
+	help
+	  The gkrellm client option has been removed, as it required
+	  libgtk2, which was removed from Buildroot.
+
 config BR2_LINUX_KERNEL_EXT_AUFS
 	bool "Aufs Filesystem Module patch has been removed"
 	select BR2_LEGACY
diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
index e957c058de..a572c9474d 100644
--- a/package/gkrellm/Config.in
+++ b/package/gkrellm/Config.in
@@ -3,41 +3,12 @@ config BR2_PACKAGE_GKRELLM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  GKrellM is a single process stack of system monitors which
-	  supports applying themes to match its appearance to your
-	  window manager, Gtk, or any other theme.
+	  GKrellM is a single process stack of system monitors.
 
 	  http://gkrellm.srcbox.net/
 
-if BR2_PACKAGE_GKRELLM
-
-config BR2_PACKAGE_GKRELLM_SERVER
-	bool "server"
-	help
-	  Enable gkrellm server.
-
-config BR2_PACKAGE_GKRELLM_CLIENT
-	bool "client"
-	depends on BR2_PACKAGE_XORG7 # libgtk2
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2
-	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_XLIB_LIBSM
-	help
-	  Enable gkrellm client.
-
-comment "client needs a toolchain w/ C++, gcc >= 4.8"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-endif # BR2_PACKAGE_GKRELLM
-
 comment "gkrellm needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 165b71c7c8..257ebadfc4 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -32,19 +32,7 @@ else
 GKRELLM_BUILD_OPTS += enable_nls=0
 endif
 
-ifeq ($(BR2_PACKAGE_GKRELLM_SERVER)$(BR2_PACKAGE_GKRELLM_CLIENT),yy)
-GKRELLM_BUILD_DIR = $(@D)
-else ifeq ($(BR2_PACKAGE_GKRELLM_SERVER),y)
 GKRELLM_BUILD_DIR = $(@D)/server
-else
-GKRELLM_BUILD_DIR = $(@D)/src
-endif
-
-ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
-GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
-GKRELLM_BUILD_OPTS += X11_LIBS="-lX11 -lSM -lICE"
-GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
-endif
 
 define GKRELLM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
