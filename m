Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B72CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF0742B20;
	Thu, 30 Apr 2026 16:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-Vcym44GstC; Thu, 30 Apr 2026 16:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFDF42B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566240;
	bh=089XERaL5nxuK6eO9QE2QXNC1dFf3JCRsd1VghO/ks8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lC4o+jBA01eJzNCHZiPDbuGV0rf6TqtR7jG3JTltM58rgtFAWd2jh2inmtFywKUFZ
	 JuaM3AdQYW8TtxlQx9hIBflDDCbdplnzKg5wnmLj8M8/9kXKp27P+xjXkbxWmSVMzm
	 H/EHS6uDIGP1oxZeoC9in0YPs45uLWSCOkUmKZx1lhCFn0g6zQhtBFzOn+bKuq+V76
	 K6iw1KQLmJxuyIwW2Dz2DBJVhqw7QlFd/pT8OHrbiNoQg/E63a1qvhKrUTRcaMW0ZR
	 o2M7cKSYnl/IlkF62pobnzFV+R7Sw7zpPYQzVqHSH0i3krh8qgqlFzcqiXdz5HBv0F
	 /UGFcTBX3YxHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFDF42B40;
	Thu, 30 Apr 2026 16:24:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36AD618E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CCB542B41
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibopjg0f2WMu for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C5B642B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5B642B20
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C5B642B20
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1F56A4C2D47;
 Thu, 30 Apr 2026 18:22:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9F-000000004jw-1y9y;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:48 +0200
Message-ID: <20260430162156.3456640-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566124;
 bh=kNX2R5ihbiHYoUGOUghjV5O5D2PfhYAyTEotTHbQCyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PqlNw92imbsPbo7Tq9K2magQrP710o8LToT+S2FG6MNmsETucA/ZvgnRHQYM8tBI8
 xcbOqot4yTseIzBSiAMrq5C+Iu3WIvlPJ5c1dyw3bIHYD000CA/DUtblS4EWuqvJs5
 Oq07YuaD++mda+KGqJMT10SaManNxdWMhkLGRArJp1TikWOatzf8zWEJZCrro/+SoI
 Qehq+iPVoVOiP1A4n05hwhN1YftNemyLcHezHSM+FxaLY+lBwqaOEDkPEWPaw/zrkB
 DCAKM/yfhajkJ3At6twahLgxQn84JCsbMefuS87utAidzcaUvRHVMQTRwi80TwzvH/
 zVS4pUmJEmg+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PqlNw92i
Subject: [Buildroot] [PATCH 06/14] package/qt5/qt5webkit: Fix build with gcc
 16.x
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5webkit/0014-gcc16.patch | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0014-gcc16.patch

diff --git a/package/qt5/qt5webkit/0014-gcc16.patch b/package/qt5/qt5webkit/0014-gcc16.patch
new file mode 100644
index 0000000000..795baf6386
--- /dev/null
+++ b/package/qt5/qt5webkit/0014-gcc16.patch
@@ -0,0 +1,42 @@
+From a2702a610d5ce7353e751c9604307c57e89eba8e Mon Sep 17 00:00:00 2001
+From: Than Ngo <than@redhat.com>
+Date: Feb 07 2026 15:46:16 +0000
+Subject: Fix rhbz#2435048, FTBFS
+
+Fixes build error with gcc >= 16.x:
+https://bugzilla.redhat.com/show_bug.cgi?id=2435048
+
+(.data.rel.ro._ZTIN7WebCore26CachedScriptSourceProviderE[_ZTIN7WebCore26CachedScriptSourceProviderE]+0x10):
+ undefined reference to `typeinfo for JSC::SourceProvider'
+
+Patch used in Fedora:
+  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-ftbfs-gcc16.patch
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -up qtwebkit-5.212.0-alpha4/Source/cmake/OptionsCommon.cmake.me qtwebkit-5.212.0-alpha4/Source/cmake/OptionsCommon.cmake
+--- qtwebkit-5.212.0-alpha4/Source/cmake/OptionsCommon.cmake.me	2026-02-07 14:18:35.540570280 +0100
++++ qtwebkit-5.212.0-alpha4/Source/cmake/OptionsCommon.cmake	2026-02-07 14:19:38.422089625 +0100
+@@ -30,7 +30,7 @@ set_property(GLOBAL PROPERTY USE_FOLDERS
+ 
+ if (COMPILER_IS_GCC_OR_CLANG)
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-aliasing")
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-aliasing -fno-rtti")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-aliasing -frtti")
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
+ endif ()
+ 
+diff -up qtwebkit-5.212.0-alpha4/Source/JavaScriptCore/parser/SourceProvider.h.me qtwebkit-5.212.0-alpha4/Source/JavaScriptCore/parser/SourceProvider.h
+--- qtwebkit-5.212.0-alpha4/Source/JavaScriptCore/parser/SourceProvider.h.me	2026-02-07 15:12:07.758432773 +0100
++++ qtwebkit-5.212.0-alpha4/Source/JavaScriptCore/parser/SourceProvider.h	2026-02-07 15:12:26.229485643 +0100
+@@ -35,7 +35,7 @@
+ 
+ namespace JSC {
+ 
+-    class SourceProvider : public RefCounted<SourceProvider> {
++    class JS_EXPORT_PRIVATE SourceProvider : public RefCounted<SourceProvider> {
+     public:
+         static const intptr_t nullID = 1;
+         
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
