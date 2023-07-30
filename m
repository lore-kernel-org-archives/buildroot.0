Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D10C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B254E60AAE;
	Sun, 30 Jul 2023 10:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B254E60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKhbSyJpJN1o; Sun, 30 Jul 2023 10:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C7B60B24;
	Sun, 30 Jul 2023 10:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C7B60B24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5871BF954
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2468E410E6
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2468E410E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIOzSexKAETJ for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E522C410D5
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E522C410D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D226B8386F; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:11:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2040c09e6160407e66fa42a90be67a1b8b2baeb
X-Git-Newrev: 90c89b29d32114f12dc8cafe095e233490286305
X-Patchwork-Hint: ignore
Message-Id: <20230730101157.D226B8386F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waylandpp: fix build with gcc-13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90c89b29d32114f12dc8cafe095e233490286305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-add-missing-cstdint-include.patch         | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
