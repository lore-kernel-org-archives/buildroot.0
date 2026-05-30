Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E34CCD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3DF685DA3;
	Tue,  9 Jun 2026 13:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOkVhauzfmtY; Tue,  9 Jun 2026 13:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C6A85DA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010319;
	bh=Nk0vFYOCM4v+Lvw38o5DF8E2x4fdH5cdV4OIQry1T5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hV34RWWMpWuhQcYnpNOLscsVJ9HpL0YWG+NcrEMEqpqVy/g/fJ68YW9gp08Aasg3R
	 Bus8oc5V2pUOhgY5iu7whgF979ipfdPXCkuRoZfRCzi8hxS7QiWbazL7AX6dc13fVI
	 Ah19QdYRFloMQdf/ljtQENtfNFwOGrGANLe+ny4ulL7XVDxr3NlsuTpGnX9EBTw6aZ
	 iiuixIALO07/WOlzu0cb8Gxc+JYJQ62zdyWro1tafrLQj1RxRs59zB608eWgptnYOy
	 tjPjCQiN5D5BV1UGf9bGeV8P2W+R+q7MHFH6xZl1A6SToDq/xOP6Fgnuc21U1oRDWH
	 d6uTqPLW/mcaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C6A85DA2;
	Tue,  9 Jun 2026 13:05:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EECC2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF36426F9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MC3uTQrMpsj9 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158C242561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 158C242561
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 524D887E7E; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9f6b03f032e87b21c33e27b5f0e927d7bca9c77
X-Git-Newrev: 8a6162a34d28be138d05e2719632344b0bd8b9c3
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.524D887E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: Fix build with gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a6162a34d28be138d05e2719632344b0bd8b9c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt5/qt5webkit/0014-gcc16.patch | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
