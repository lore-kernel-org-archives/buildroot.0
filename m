Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08289EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44EC40BC8;
	Mon, 21 Aug 2023 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44EC40BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pSAqjVQ_RrO; Mon, 21 Aug 2023 20:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B52540C03;
	Mon, 21 Aug 2023 20:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B52540C03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1521B1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB4461124
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB4461124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UR35MPxFqQe0 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D756261112
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D756261112
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C730886025; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 21:58:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a845276757085692601933541e510e1f02dae575
X-Git-Newrev: 27dc49378071a82688d44a5cc592c0200b3991b4
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.C730886025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libserial: fix
 gcc-13.x compile (add patch to add missing cstdint include)
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
Content-Type: multipart/mixed; boundary="===============2642614116205364704=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2642614116205364704==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27dc49378071a82688d44a5cc592c0200b3991b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add patch taken from upstream pull request ([1]) to fix gcc-13.x compile
failure because of a missing csdtint include.

Fixes:

  In file included from libserial/SerialStreamBuf.h:36,
                   from SerialStreamBuf.cpp:34:
  ./libserial/SerialPortConstants.h:93:37: error: ‘uint8_t’ was not declared in this scope
     93 |     using DataBuffer =  std::vector<uint8_t> ;
        |                                     ^~~~~~~

[1] https://github.com/crayzeewulf/libserial/pull/186

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-missing-cstdint-header-for-uint8_t-type.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/libserial/0003-Add-missing-cstdint-header-for-uint8_t-type.patch b/package/libserial/0003-Add-missing-cstdint-header-for-uint8_t-type.patch
new file mode 100644
index 0000000000..caf02d84f7
--- /dev/null
+++ b/package/libserial/0003-Add-missing-cstdint-header-for-uint8_t-type.patch
@@ -0,0 +1,28 @@
+From b4ae3313fb313b6acb7f701d898f834133f5bd53 Mon Sep 17 00:00:00 2001
+From: Jussi <jussi.hietanen@iki.fi>
+Date: Mon, 3 Jul 2023 15:59:07 +0300
+Subject: [PATCH] Add missing cstdint header for uint8_t type
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+Upstream: https://github.com/crayzeewulf/libserial/commit/3b50bc2b7464ed527d1709b5c7ba86688e6aa3ec
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/libserial/SerialPortConstants.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libserial/SerialPortConstants.h b/src/libserial/SerialPortConstants.h
+index 4f05bd5..88dca0b 100644
+--- a/src/libserial/SerialPortConstants.h
++++ b/src/libserial/SerialPortConstants.h
+@@ -33,6 +33,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <limits>
+ #include <stdexcept>
+ #include <string>
+-- 
+2.41.0
+

--===============2642614116205364704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2642614116205364704==--
