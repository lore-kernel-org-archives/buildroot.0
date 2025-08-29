Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D8BCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 18:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E286846A2;
	Fri, 29 Aug 2025 18:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zhltxhcfYnr; Fri, 29 Aug 2025 18:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70950846A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70950846A3;
	Fri, 29 Aug 2025 18:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC9B1F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54690416A7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Eqz-6rR-9rL for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 18:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FD4407AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99FD4407AB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:43:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 915F387E4C; Fri, 29 Aug 2025 18:43:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 20:41:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ed636069fbdc9942bcd637f6f902c13415a9910
X-Git-Newrev: f7a5614c5da9284456db270c2a658b8be0928589
X-Patchwork-Hint: ignore
Message-Id: <20250829184323.915F387E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeglut: fix build with GCC
 15.x
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4162356573184814633=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4162356573184814633==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f7a5614c5da9284456db270c2a658b8be0928589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

/home/thomas/buildroot/buildroot/outputs/all/build/libfreeglut-3.4.0/src/x11/fg_init_x11.c:297:6: error: conflicting types for ‘fgPlatformDestroyContext’; have ‘void(SFG_PlatformDisplay,  struct __GLXcontextRec *)’ {aka ‘void(struct tagSFG_PlatformDisplay,  struct __GLXcontextRec *)’}
  297 | void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, SFG_WindowContextType MContext )

No autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gPlatformDestroyContext-prototype-for-C23.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libfreeglut/0002-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch b/package/libfreeglut/0002-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
new file mode 100644
index 0000000000..c3aadb87de
--- /dev/null
+++ b/package/libfreeglut/0002-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
@@ -0,0 +1,31 @@
+From 6d0178a1c43f94b046e4d5f3dfa7185a398706ae Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:14:26 +0000
+Subject: [PATCH] egl: fix fgPlatformDestroyContext prototype for C23
+
+C23 removes unprototyped functions, so this conflicted with the definition
+in fg_init_x11.c.
+
+Bug: https://github.com/freeglut/freeglut/issues/186
+
+Upstream: 800772e993a3ceffa01ccf3fca449d3279cde338
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/egl/fg_init_egl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
+index 592c5221..8753dc0b 100644
+--- a/src/egl/fg_init_egl.h
++++ b/src/egl/fg_init_egl.h
+@@ -28,6 +28,6 @@
+ 
+ extern void fghPlatformInitializeEGL();
+ extern void fghPlatformCloseDisplayEGL();
+-extern void fgPlatformDestroyContext();
++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, SFG_WindowContextType MContext );
+ 
+ #endif
+-- 
+2.50.1
+

--===============4162356573184814633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4162356573184814633==--
