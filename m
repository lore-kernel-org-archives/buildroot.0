Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B855EC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759D160627;
	Wed, 16 Sep 2026 19:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNHDsRSaLifM; Wed, 16 Sep 2026 19:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6A3BB605E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789587801;
	b=WdQ4qwl0aZ0/Pbla4qJUfLwtI4GxqqBvyh6LtxaqG4MTJgKePOM8jYLEzMgdH6kvsvjx
	 uC1qYTbas7nS2Br/9r4gUTMQ2bPXPhyOhEpYH5M3Ptg0eRqiXgggO1jxkX6i0u2s5bDT9
	 b/ZvsFmwp54prNhxxI6XmYzY0ZDqyff0zFQZxyBizXEwkiMqDLydXILUpDiZg++jSYquw
	 /zS3haHJndDk1vcDHAZWFJnMHn/LtrVwgUWrFhCbbAe+k4wFfk2SU3kwJPEKlJrWBdrnf
	 amubFQy5T7cr4gSv4yWIFsRVAGZOghebk1AebkcRR6eQ73i+BhykLCOWDkVIqLMbFEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789587801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=W2icsW8THGn/4S8zFEz1t55H6Yzs6I8DS4p6H7Y5et0=;
	b=GDbo5r0TKb0icAL6F5HP7j26esPxlt9xRQ58QqrfJQvkmPeU/3eV4HE2gJmWs5qCz+Vj
	 vRx/8febRBvRV3SqgEs58xVrjfy2PuekwBMsk7uXQ3CDffvGOhivVgwLjErMLCMFjJnr+
	 5qXgWSwOaiBSNhaswdQCt6bUFjAC8UBbeQ+kkJrfLVf01fMn1BD4A3kkBpZUDNYG/Gba7
	 afLXQGEY2LIl80eW6+qRWbFggfskQFXYd7mYTHyaa7kTOUGgFKHZbHeQZdleKAZmfAWNT
	 xslIoIjPKGRlCkUvs8sSSZVdv48D+wsqRreijDk76bSb+FOqu21CRvDtkIbJs3aiwiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789587801;
	bh=W2icsW8THGn/4S8zFEz1t55H6Yzs6I8DS4p6H7Y5et0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MHW4pr3Mis542MN8eHSBJ9a6Gsou2LUZ7l2JfZaNpu9jwcnoQojcStnPi/jdJXFA/
	 wRme2Sf0d2RsAaPyKFeBembT5wBG7oFYHHCbhaoOzo/gmku/m51YeHgGGeVYyykEPH
	 fPlrGbhpFMcmpSoPpehgKeseWNjq1fITtkpwSIlwO8AZuxZ+syVAECNVA19II77w3c
	 KsSiSKJI/GfkUDwjL8Wm1yy9BxMuASbWL/+lGyoAoNBra8tfhtErKcKRo6C9l+31rs
	 Vv12JhZLyacvlrUkT9+Cs+jVFtYB8UIynsRn7u61Q6iJY6d4J62aEqe8anhySVU6Ni
	 X6GYnvfNqsYDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3BB605E6;
	Wed, 16 Sep 2026 19:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F952EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 491A4605E6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FitxwHLchmHJ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8583A605AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789587799;
 b=BaNOK3VubLkzOIzZ8QE7KPzJf/j7u6F5+IrMmQ5pRj8nAqtxR6q9DuxbVyzJN+roTsZI
 BIFlwTgtVG7GrlUm3fdKq+g5lKtT7zmSP1nNJYyq2Yq44mOGWYX1LnuRtWiWSgio4pKZF
 y2RWR74uRz7jKuHk+Gx/H9wweTvJneOa+sfZP7bG1yMBEErZYukOcZlWsPmpHqSKlFQkN
 /Q11sQhiBFxFiUYQTDNuph4FUCz4l8IVpjjBTrNvETTB94BLZEZqLom3K4bj9wJigzhR9
 +Pjyeu2+Qn1HTg8BBUa/86tQon5jdjtZoc1Zv9W8q7/n4PIRzvXDwuDLrRjLOw3klrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789587799;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WB9hNv6PirtYgcSX5oN+habQepuI7PZH3Bscc3KTMgs=;
 b=rXHJ4z+cZsgENM+V3OWlCDI1hwEG9voCWU1UII3Xpxx/oBk51EIYuLrsXVd3dx28vbUl
 EjXWoy7uAnTSD3OU+C4M/Q91msTOgVxP1nAMEyhxBWN8aqxyEoCMA5pc9LTly86SBeVfY
 0QcpYYz/LJ9kcjPqGny3obQSDaSRJzZJpZG2SFz/+wEimSvZy3YRvFIQlBZSo7Ld/0Ypp
 eFSAQVYJeVlKltV45qbwCVL1gFT+b7IoHTNtuAe5URbDtmh+kHKapS9e2nXcXLcc023bB
 hliLliYbFKo9H+Lx7UX0OZlmI8vnhiN5f+7/h9jijJYv+9DDhWhQOTl6kj929QxgapA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8583A605AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07D01969D7; Wed, 16 Sep 2026 19:42:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:26:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd6291f7c917dc75275bcf90fa851e2f741bfcee
X-Git-Newrev: 60dc97fceef21b8cc1271ef7eca61e7bbee28513
X-Patchwork-Hint: ignore
Message-Id: <20260916194213.07D01969D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 build with glibc >= 2.43
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
Content-Type: multipart/mixed; boundary="===============8890941958250896528=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8890941958250896528==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60dc97fceef21b8cc1271ef7eca61e7bbee28513
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No autobuilder errors were recorded, the build error can be reproduced
with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0010-Fix-build-with-glibc-2.43-and-above.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch b/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch
new file mode 100644
index 0000000000..3c3a202ad1
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch
@@ -0,0 +1,41 @@
+From bf8bd5512920b28468d99b9ce550f0617e57d7f4 Mon Sep 17 00:00:00 2001
+From: Peter Varga <pvarga@inf.u-szeged.hu>
+Date: Mon, 16 Feb 2026 16:12:58 +0100
+Subject: [PATCH] [sandbox] Fix build with glibc-2.43 and above
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes error:
+//sandbox/linux/system_headers/linux_seccomp.h:218:39: error: expected identifier before numeric constant
+  218 | #define SYS_SECCOMP                   1
+      |                                       ^
+error: expected ‘}’ before numeric constant
+
+See https://crbug.com/456218403
+
+Pick-to: 134-based 130-based 122-based
+Change-Id: I5f2ea6826650b9eff6b4defff694f24e301f7663
+Reviewed-on: https://codereview.qt-project.org/c/qt/qtwebengine-chromium/+/713181
+Reviewed-by: Moss Heim <moss.heim@qt.io>
+
+Upstream: https://github.com/qt/qtwebengine-chromium/commit/bf8bd5512920b28468d99b9ce550f0617e57d7f4
+
+[Bernd: backported patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ chromium/sandbox/linux/system_headers/linux_seccomp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/chromium/sandbox/linux/system_headers/linux_seccomp.h b/chromium/sandbox/linux/system_headers/linux_seccomp.h
+index 8690a96eb01b..8988836508c7 100644
+--- a/chromium/sandbox/linux/system_headers/linux_seccomp.h
++++ b/chromium/sandbox/linux/system_headers/linux_seccomp.h
+@@ -6,6 +6,7 @@
+ #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
+ 
+ #include <stdint.h>
++#include <signal.h>
+ 
+ #include "build/build_config.h"
+ 

--===============8890941958250896528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8890941958250896528==--
