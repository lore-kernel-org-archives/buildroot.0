Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7135DC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEC281028;
	Thu, 17 Sep 2026 15:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRdJcsGan5pM; Thu, 17 Sep 2026 15:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E643A81010
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789657858;
	b=PS0PRXVSFxlVBGZSYjoDo466bsVm+dinl0rNnyKugBQ0d4ph75pXjyqyM2NktcY0sAdv
	 ojq7LZGk8Nxs0AWpq/M/O5j0a+EksEm9izZPgxMkYZ3PfztJZ22G6XZCploVQ/utEmpvC
	 qOWfc7+UDsP5myHn7Ouizb3A9RyT+aY6kfQ2rYTxpxK2dXs4D4+TX88Tjj+JDgua86mSI
	 QebFx3OiGnUg6LIy7o36Kis0Nf4Kqycaef4G8OW8yYJFkJLxgAiokv/VopkpkSS/iSZbd
	 XR4XOC9U1fXwfe5BE/ZI3K2zPQVOkwWysUp1VVq3uPX/uxcwL8S3M/4WUaRT0D/tNag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789657858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oe3dEYHOdDfKnIHqtdM7kiPif+cNA6f8d2DfrRIly4E=;
	b=qUM00E537EJLIod5/N3J1kV8puYrI3hJW/p85/fqPcSg0O6Iun4LsY6/KvZI6chGURDf
	 p6AKHtVcaBqiI9dHrAIvYiYVxwdMtdkn6k693OaH8ZXpSWXhsx5hmlFpMX87vC5PQ7IYt
	 4gdu5LiwZnJ7UZ24eGZLZBz4zPAe+4B7djrbvSq/TIxTjL8HxtR5RFkpcEDrsNQQdJ/8K
	 SmrIs7DzC3mjbiB9h5XcWE6ydm9NetjpBxZx6p90unLBJvI9163VbDx6+dIYyu0H5IrPS
	 67mtLvdkHdtU68KY6nOj/EsQl0x/DeKsgs/8klrr4VZOH6Mx5e94MyZHx9Zk/vNqhNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789657858;
	bh=oe3dEYHOdDfKnIHqtdM7kiPif+cNA6f8d2DfrRIly4E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KqNkXmxdwH4jxuVTfioCtsUK4BMHGUX8wBw8qlSJmIql1bSHTWT6PlQmxycfQ+5nw
	 jjVmy8M521Xa+KuClBza9XpLAUvIVi8a2i33A902qGGlxvZfVb3XTYQvtBwqrla+xo
	 YY8XwstgSKfs9cQUhl0G6Jf4InayxUc9r5nUK7YjSCQtQMzutmxlfejtTGoyVcb08e
	 HDbK1j1316eYm+xPPaQIGx7TbNFZk14Ag0CrExVW4iD2/wZMEqSGe7YS7iHSGDDIuv
	 FY8475g/r20Zbow72qAoYul5QPfSocfdkIfbMfUGFJ25yxog4WyZSOINwq7ErffJQ7
	 2zB5UFf42yX0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E643A81010;
	Thu, 17 Sep 2026 15:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D8E37A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26824077F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4CNcwwRxvQg for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 15:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1193D4035C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789657855;
 b=pU3/d29bZpWBwLH4SzRRGsrDH6TouQh3DjDeGz3aNAtvt8JuOReqv3W87qsk93XwjilB
 xFBw8XSl4RZwHDL2v8SriEAWLAT0Rp+W+1ltUeui78X46eb1PaCmq/Lo9gOwdwT4VEFRT
 1QCHCUUxlrvUJ/l+QerH1vVArppTkDszL6nHxD04gqW5GkQr+wsvkZ4X/G2b034DEHRP7
 aIKRur9ordJPGYBBAuG1y81CIVoucYcRFkAOkewR2BqHPTPEb/BeUWXyf5+m5hCIFJS1G
 aWfcEvOHXVKsvf48I6w88UsZ7OTsaM1g5gjkOj9PROvzg/0w44Ohr2DsZF51KKMYIZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789657855;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wtv8c41uBFr0fiJ+ZwhJJ2tcgP6XWF8pXdUdVRAycJY=;
 b=PNAjNUn+VN0Pc4bbAeWULF6AHLwoY9TF8DUtV8kgq9cBx+i/h+/wMdofZJcp7Eb3UTES
 fg4UJq1T/BIjfaqCOgEayt4VsF69mcSFXVmUPDDeDbZQuJZ0vbm33M7MuZ8Td2RlyqiKw
 89PGv2JDFUxyG284JQ0TsloFKkoGIHmDWO4+8W/QWRc50A6slZ3iori0SAn/MHgsEqll1
 gGrX9fGR69b9gZab8khByEh7LhRU4mrixHj/D83GKvpv5SPmo2Vj8gd8VUDi6urlLNr21
 q+CiAODZsJi0vGfPh/P8C9asUEAjYsMGj/as/k6PxHIbPFNs9rgxc9ATL9OxsOx+I1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1193D4035C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:10:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 295C897134; Thu, 17 Sep 2026 15:09:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 17:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22c0ec4fcfe58ff7a292f0a69e3357923f06b349
X-Git-Newrev: 2ca7fb5e7bf7b416b72faf709bf1220eef0dc352
X-Patchwork-Hint: ignore
Message-Id: <20260917150948.295C897134@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: fix build with CMake 4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ca7fb5e7bf7b416b72faf709bf1220eef0dc352
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 526f8b43edb7ac1dbf9b86afc183a95b389a7bab bumped CMake
from 4.3.4 to 4.4.0 causing a configure error with this package:

CMake Error at Source/cmake/WebKitMacros.cmake:311 (if):
  if given arguments:

    "(" "NOT" "_linked_into" ")" "OR" "(" "WTF" "STREQUAL" ")" "OR" "("
 "NOT" "IN_LIST" "LLIntSettingsExtractor_FRAMEWORKS" ")"

  Unknown arguments specified
Call Stack (most recent call first):
  Source/cmake/WebKitMacros.cmake:393 (_WEBKIT_TARGET_LINK_FRAMEWORK)
  Source/JavaScriptCore/CMakeLists.txt:409 (WEBKIT_EXECUTABLE)

The error can be reproduced with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WPEWEBKIT=y
BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y

To fix the problem we add an upstream commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...PE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch b/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch
new file mode 100644
index 0000000000..b8c9c0ea44
--- /dev/null
+++ b/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch
@@ -0,0 +1,51 @@
+From 4bfeff8c67ad47b7bb0f3d78390789f6f2af5dd2 Mon Sep 17 00:00:00 2001
+From: Fujii Hironori <fujii@igalia.com>
+Date: Wed, 5 Aug 2026 07:18:26 -0700
+Subject: [PATCH] [CMake 4.4][WPE] _WEBKIT_TARGET_LINK_FRAMEWORK reports
+ "Unknown arguments specified" error
+ https://bugs.webkit.org/show_bug.cgi?id=321081
+
+Reviewed by Adrian Perez de Castro.
+
+CMake 4.4 reports the following error for WPE.
+
+> -- Using platform-specific CMakeLists: /run/build/webkitwpe/Source/JavaScriptCore/shell/PlatformWPE.cmake
+> CMake Error at Source/cmake/WebKitMacros.cmake:554 (if):
+>   if given arguments:
+>
+>     "(" "NOT" "_linked_into" ")" "OR" "(" "JavaScriptCore" "STREQUAL" ")" "OR" "(" "NOT" "IN_LIST" "jsc_FRAMEWORKS" ")"
+>
+>   Unknown arguments specified
+> Call Stack (most recent call first):
+>   Source/cmake/WebKitMacros.cmake:756 (_WEBKIT_TARGET_LINK_FRAMEWORK)
+>   Source/JavaScriptCore/shell/CMakeLists.txt:126 (WEBKIT_EXECUTABLE)
+
+Replaced `${_linked_into}` with `_linked_into`.
+
+* Source/cmake/WebKitMacros.cmake(_WEBKIT_TARGET_LINK_FRAMEWORK):
+
+Canonical link: https://commits.webkit.org/318630@main
+
+Upstream: https://github.com/WebKit/WebKit/commit/4bfeff8c67ad47b7bb0f3d78390789f6f2af5dd2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Source/cmake/WebKitMacros.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 9d79754186cb..9cbd52cc981d 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -551,7 +551,7 @@ macro(_WEBKIT_TARGET_LINK_FRAMEWORK _target)
+         get_property(_linked_into GLOBAL PROPERTY ${framework}_LINKED_INTO)
+ 
+         # See if the target is linking a framework that the specified framework is already linked into
+-        if ((NOT _linked_into) OR (${framework} STREQUAL ${_linked_into}) OR (NOT ${_linked_into} IN_LIST ${_target}_FRAMEWORKS))
++        if ((NOT _linked_into) OR (framework STREQUAL _linked_into) OR (NOT _linked_into IN_LIST ${_target}_FRAMEWORKS))
+             list(APPEND ${_target}_PRIVATE_LIBRARIES WebKit::${framework})
+ 
+             # The WebKit:: alias targets do not propagate OBJECT libraries so the
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
