Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D11CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621B540F2A;
	Wed,  6 May 2026 16:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3v0dwbAIjHO; Wed,  6 May 2026 16:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B5840F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085204;
	bh=089XERaL5nxuK6eO9QE2QXNC1dFf3JCRsd1VghO/ks8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DRItLH23t04Jl9r9zhEyIBMj8iPPlEy1G0OjXfRbqWaMKXWYj9GSIBAF+i/vGtRfQ
	 Em4n8hj68JdAOQeC1mWl+6wOqn/kvFpTvRCHr4Gwyv8hTd+OMSN8vVSD4r4nyHLxMS
	 Nxw33psROPa+dqASoglqgb9q6MKaKshQ9GXwkPyRQ0LMZyAPaYUwVzVnVsw3S6XFSw
	 0H6zHMykpdmC08pPycCQOa+aGgzzvLHGrbAFeHYF/wIVRbDvc2toxo7DsyrZnhXaYQ
	 FxhGm7Nnq1Y/ZEAFWeVuu2TdTC73fk6c651gF+L3fBwexJGTt6kLl2nRruft67vSEv
	 etYq4na3MndcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B5840F0C;
	Wed,  6 May 2026 16:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 915CA317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7781D812DA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbU3k9_5-WPe for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6060F812CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6060F812CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6060F812CA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB148A4C2094;
 Wed,  6 May 2026 18:31:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9u-000000002XI-25pS;
 Wed, 06 May 2026 16:31:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:18 +0200
Message-ID: <20260506163136.1330722-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085114;
 bh=kNX2R5ihbiHYoUGOUghjV5O5D2PfhYAyTEotTHbQCyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PfqG35DTH7E+q+CtecVqtQ45WF3saU+BzrV5NzmXXoGF3qXbZmkaw3XFtMPDEmn3t
 o1WRl0jXbj6AMwY4xsRPPe7W6l7mJb8aTddm3MSDTaLFCMzaH7+oGLjKxL9ZdBRTPN
 qUgjV0DhjaaRTk3d3glzXXpIVX36yX5uTiprxS7VcCyPPVl1ocFfBEiOn5yg8TUqT8
 QOZoLA1lKyt+wajfCxmYjF1PzJHNDdt+3aZ3tRDrLIw96paOkGEaYCFfaUE37MQrUl
 moLbIHF1HgQgBOOL71V8MDkORKRuTttOy9OwdYKYt4wpTssV+1FNuZPnr1pEqWPOFt
 2zwh7s3VslYmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PfqG35DT
Subject: [Buildroot] [PATCH v5 05/22] package/qt5/qt5webkit: Fix build with
 gcc 16.x
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
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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
