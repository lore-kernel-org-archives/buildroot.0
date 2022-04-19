Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9281C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 18:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 674A04056C;
	Tue, 19 Apr 2022 18:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xW8ZMwuPMQWy; Tue, 19 Apr 2022 18:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68AAB40522;
	Tue, 19 Apr 2022 18:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A11661BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C76640522
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivG_E7emF0Ut for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 18:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4BD840502
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 18:48:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (30)
Received: from bartekk-pc.lan (dynamic-78-10-107-45.ssp.dialog.net.pl
 [78.10.107.45])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2C1131BCC8C;
 Tue, 19 Apr 2022 20:47:58 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 20:47:56 +0200
Message-Id: <20220419184756.255846-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] packages/libwebsockets: add patch that removes
 duplicate LwsCheckRequirements
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bartosz Bilas <bartosz.bilas@hotmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  CMake Error at /home/buildroot/autobuild/run/instance-2/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/libwebsockets/libwebsockets-config.cmake:35 (include):
  include could not find load file:

      LwsCheckRequirements
  Call Stack (most recent call first):
    CMakeLists.txt:54 (find_package)

Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...emove-duplicate-LwsCheckRequirements.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch

diff --git a/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
new file mode 100644
index 0000000000..fc76a2b610
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
@@ -0,0 +1,26 @@
+From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Mon, 7 Feb 2022 14:48:55 +0000
+Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
+
+Signed-off-by: Andy Green <andy@warmcat.com>
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ cmake/libwebsockets-config.cmake.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
+index 6247b2cb..8ba97e6f 100644
+--- a/cmake/libwebsockets-config.cmake.in
++++ b/cmake/libwebsockets-config.cmake.in
+@@ -32,6 +32,5 @@ endforeach()
+ 
+ include(CheckIncludeFile)
+ include(CheckCSourceCompiles)
+-include(LwsCheckRequirements)
+ set(requirements 1)
+ 
+-- 
+2.35.3
+
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
