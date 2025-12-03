Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20895D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED41661B80;
	Wed,  3 Dec 2025 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ty6EWoLTGPwE; Wed,  3 Dec 2025 22:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF3361B72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799547;
	bh=HgABZ8QBlHTfN4240uuPVHSLNNTXLqpHiXynbwFy7gw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jbV1CDGDBiJ4HhUOLsYNKZ0eN1HqXsvDAEbcw8h4wR4wOjmcrn5Og8h/qmsA0ORZT
	 r3fT6fz5BiRPb2C3nP1jUwWFcv9XFqAduEktHt1jiNfpuX2h0m14ShaYnK/fpRoUdS
	 O443v52ghgUKOKYUzN/D3xbLj0ChWNJYoqnQPNs/z5BWV7IpZwu2W627iWZLo9ZQyf
	 k0JQb1VqH4akqMIpbqreI9zuCqAX0hW49AF1SbiKEkoGqKCLAE2D2jvT6b9rW4zO/g
	 ZX2w6d1a2RY9HE8xdVsE4v9KhNnM9F3l3zoKms9RmNeOX7ASwGzSaTjayIskDhaZbm
	 wv4bTK5xww5Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF3361B72;
	Wed,  3 Dec 2025 22:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D974BE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBD3A406B1
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnDYrmQHwTWF for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B625F4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B625F4052D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B625F4052D
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2ACDAA4C79D9;
 Wed,  3 Dec 2025 22:59:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqi-000000002OS-2EDr;
 Wed, 03 Dec 2025 21:57:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:23 +0100
Message-ID: <20251203215723.2323032-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799148;
 bh=2st27HwpiaCuDLFlI3zmMla7fZZrX2jiOX2f6+xRavI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tWjlaJeD4CE3f1Ms5bwuyKwIxLOuaCOYw8AzhFIbGG4NBoqei5E63nxg3XE3PtMHx
 eU+CmbOXMSS+R28ifcZe2HkQt+A+ggl/y8dLNUZhasaL038EOn9wub3NYH8Dhg66io
 NBgLCxDSzd+Gw1291rKuI/ubM+LdyQGqJ3Lil3gcZL/gtDggjI0T+RQrdY10oNqjUz
 LrjdiUzdfNCjqKJ85krJv3AqSOF9m/wy9afu7+WeZuLE2Hw8H6lu5xq4xOcdUgyccV
 PRmmB87HwB457QRMVpiSRrBRlQGRf4T6eLoIBltnYHOK61UN+Eg8kas99ycCiEcSQ3
 8sWKxXvKsrSHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tWjlaJeD
Subject: [Buildroot] [PATCH/next 16/16] package/waylandpp: bump version to
 1.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/NilsBrause/waylandpp/releases/tag/1.0.1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-add-missing-cstdint-include.patch    | 61 -------------------
 package/waylandpp/waylandpp.hash              |  2 +-
 package/waylandpp/waylandpp.mk                |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)
 delete mode 100644 package/waylandpp/0001-add-missing-cstdint-include.patch

diff --git a/package/waylandpp/0001-add-missing-cstdint-include.patch b/package/waylandpp/0001-add-missing-cstdint-include.patch
deleted file mode 100644
index 13b0ce49ad..0000000000
--- a/package/waylandpp/0001-add-missing-cstdint-include.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3c441910aa25f57df2a4db55f75f5d99cea86620 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 8 Jan 2023 18:24:53 +0000
-Subject: [PATCH] add missing <cstdint> include
-
-Upcoming `gcc-13` made `<string>` leaner and does not include `<cstdint>`
-implicitly anymore. As a result build fails without the change as:
-
-    [  2%] Building CXX object CMakeFiles/wayland-scanner++.dir/scanner/scanner.cpp.o
-    scanner/scanner.cpp:378:3: error: 'uint32_t' does not name a type
-      378 |   uint32_t width = 0;
-          |   ^~~~~~~~
-
-Upstream: https://github.com/NilsBrause/waylandpp/pull/71
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/wayland-client.hpp | 1 +
- scanner/scanner.cpp        | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
-index a3f782b..4598a0e 100644
---- a/include/wayland-client.hpp
-+++ b/include/wayland-client.hpp
-@@ -29,6 +29,7 @@
- /** \file */
- 
- #include <atomic>
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <string>
-diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index bebd71e..37cf7ff 100644
---- a/scanner/scanner.cpp
-+++ b/scanner/scanner.cpp
-@@ -23,6 +23,7 @@
- #include <vector>
- #include <cctype>
- #include <cmath>
-+#include <cstdint>
- #include <stdexcept>
- 
- #include "pugixml.hpp"
-@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
-   wayland_hpp << "#pragma once" << std::endl
-               << std::endl
-               << "#include <array>" << std::endl
-+              << "#include <cstdint>" << std::endl
-               << "#include <functional>" << std::endl
-               << "#include <memory>" << std::endl
-               << "#include <string>" << std::endl
-@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
-     wayland_server_hpp << "#pragma once" << std::endl
-                        << std::endl
-                        << "#include <array>" << std::endl
-+                       << "#include <cstdint>" << std::endl
-                        << "#include <functional>" << std::endl
-                        << "#include <memory>" << std::endl
-                        << "#include <string>" << std::endl
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index a3eb5379af..8513060f91 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b20b45917382c6b87e9380130c9a1a1c563da2f498de5830df12fbce326dd9f5  waylandpp-1.0.0.tar.gz
+sha256  49c362fa5db28ab5472968215b88f1fbe3a7b7f57818dde722fd7d38997d940a  waylandpp-1.0.1.tar.gz
 sha256  3eee5022ce84ead344e1c51b9d00c7f450f53003fe096fe460d66c616fe56782  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 4a0d58ba50..f177c6e5be 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 1.0.0
+WAYLANDPP_VERSION = 1.0.1
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
