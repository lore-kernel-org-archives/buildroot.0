Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA42EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 06:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0DC981E3E;
	Sun, 30 Jul 2023 06:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0DC981E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGYsSxcClSPI; Sun, 30 Jul 2023 06:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2585281C2F;
	Sun, 30 Jul 2023 06:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2585281C2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8489D1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E49960FF1
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E49960FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8C5q5Vik3OAy for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 06:22:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C70860A98
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 06:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C70860A98
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3543DA4C036A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 08:22:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53656)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPzow-00044h-2w
 for buildroot@buildroot.org; Sun, 30 Jul 2023 08:22:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 08:22:26 +0200
Message-Id: <20230730062226.6015-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690698147;
 bh=yOS5MNj6X+Z1LxFVsQPgIUWB53gF8XwY9gi7TxqFR60=;
 h=From:To:Subject:Date:From;
 b=p0gnEa8a7pKLeTcVfBY4yt4kfn7btXpzjQygLE7Qo403Mou9OvRwgeL2A40s55wvo
 61y5LWkSyOvEACQu0404VmkjG9lk3paOA2KkdQLGLBqx/PB8IMFFPhJFv1IVATAupS
 9y8OXGyt3d/Q54SCkGsFYlSaTQk+Fi+CkEaYkV6+/nmIczuNnA+OYMW8EETvvG+uMF
 eX2SirebNzJ4/4PNXYXoWdxRrsRi8b60gJZSFMf+mfORllRTcYZyHrjU9CewhdXjr4
 M+UB/MHfjleP6s5qxNPcWfLteW2h84HSUqTAssDsy66bc+O/O2esiTugXQ995kiJH8
 m0LWnoMDnlDgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=p0gnEa8a
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: fix build with gcc-13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-add-missing-cstdint-include.patch    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/waylandpp/0001-add-missing-cstdint-include.patch

diff --git a/package/waylandpp/0001-add-missing-cstdint-include.patch b/package/waylandpp/0001-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000..13b0ce49ad
--- /dev/null
+++ b/package/waylandpp/0001-add-missing-cstdint-include.patch
@@ -0,0 +1,61 @@
+From 3c441910aa25f57df2a4db55f75f5d99cea86620 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sun, 8 Jan 2023 18:24:53 +0000
+Subject: [PATCH] add missing <cstdint> include
+
+Upcoming `gcc-13` made `<string>` leaner and does not include `<cstdint>`
+implicitly anymore. As a result build fails without the change as:
+
+    [  2%] Building CXX object CMakeFiles/wayland-scanner++.dir/scanner/scanner.cpp.o
+    scanner/scanner.cpp:378:3: error: 'uint32_t' does not name a type
+      378 |   uint32_t width = 0;
+          |   ^~~~~~~~
+
+Upstream: https://github.com/NilsBrause/waylandpp/pull/71
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/wayland-client.hpp | 1 +
+ scanner/scanner.cpp        | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
+index a3f782b..4598a0e 100644
+--- a/include/wayland-client.hpp
++++ b/include/wayland-client.hpp
+@@ -29,6 +29,7 @@
+ /** \file */
+ 
+ #include <atomic>
++#include <cstdint>
+ #include <functional>
+ #include <memory>
+ #include <string>
+diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
+index bebd71e..37cf7ff 100644
+--- a/scanner/scanner.cpp
++++ b/scanner/scanner.cpp
+@@ -23,6 +23,7 @@
+ #include <vector>
+ #include <cctype>
+ #include <cmath>
++#include <cstdint>
+ #include <stdexcept>
+ 
+ #include "pugixml.hpp"
+@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
+   wayland_hpp << "#pragma once" << std::endl
+               << std::endl
+               << "#include <array>" << std::endl
++              << "#include <cstdint>" << std::endl
+               << "#include <functional>" << std::endl
+               << "#include <memory>" << std::endl
+               << "#include <string>" << std::endl
+@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
+     wayland_server_hpp << "#pragma once" << std::endl
+                        << std::endl
+                        << "#include <array>" << std::endl
++                       << "#include <cstdint>" << std::endl
+                        << "#include <functional>" << std::endl
+                        << "#include <memory>" << std::endl
+                        << "#include <string>" << std::endl
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
