Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860CFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33F080DEA;
	Fri,  2 Jan 2026 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSzwb6fnXZwM; Fri,  2 Jan 2026 20:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF83C80DD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767385069;
	bh=iyh8UFwN82JqbABuf4AgZ6fR42IeSuvAZeWXgM1n58k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aOLhci+DcvzEMGMG+vQ+MGfcELdOxv+evojHdSLYdURPyHBaAVp5kk65k/dcAMJRe
	 3/laiBnnglVkl8bSl888PlU+pqPvWgl2Mt5XMazRau9jRDSAjC9R4sDJmrRYxhIcoO
	 VVSoYp/fbqhDXnnu0K8KkAS0s16QVP0c2dEdahtHynDVqALE1KXn4lp6VaWbllVi/9
	 i1vToE35qU67nx4LTZ9uxV/X22z8MJl/0XeGKdKRJjrty9LoZh4ysEpc6rs7yhKPi+
	 Mz0w2bFw7TauqN+JTryLWf1LvlkGJw2DwJI852jBqYi/XIioB9jThzuTXPqlX7Z7IX
	 J2/Ii/joe6tNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF83C80DD3;
	Fri,  2 Jan 2026 20:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7B1D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D957608DB
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agkcs2mSmBzT for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12176600C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12176600C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12176600C7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:17:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6A11A4C2436;
 Fri,  2 Jan 2026 21:17:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40696)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vblah-000000005jC-1Y7R;
 Fri, 02 Jan 2026 20:17:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri,  2 Jan 2026 21:17:43 +0100
Message-ID: <20260102201743.3421271-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767385063;
 bh=SiF/fU+e7AaorhISLOEZxS8VcgVl2mOrhC3+QEQ2jrQ=;
 h=From:To:Cc:Subject:Date:From;
 b=GXBaDtxMXnaIooOWHxHxc6C5SjtPuNy700dJzfbrEE5H98LJ3QbRP0WoBZXhW35Co
 rliGcBwzKWsZxcrffhM4KgUcUhU8kp5Dulo/kvMZArHJvh6Hvk9A6Am5qIhycBlA/g
 BsWTlQxt/Am8oSB6Lxp8puBMviuTGUQu1r7p4Op1Lm/78uJeffErkYUgL9vnDdFZCI
 rFuyc6HoeD+Db8JkenvKCfwGATLL9+57c4gJyhBbXQDfAU4U5xEXZQwoPfEnFW7G43
 IBaGRsEMfe3GGvcvRPbZ56R/nWNzwbbj0UVrS/CbdP6LuZmkPALrBSS4wRKUkh+UCY
 PoynlaFhFz9BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GXBaDtxM
Subject: [Buildroot] [PATCH 1/1] package/fio: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped fio from
3.38 to 3.41. Upstream commit
https://github.com/axboe/fio/commit/4175f4dbec5d1d9e5e0490026e98b1806188e098
was added to fio 3.40 including FALLOC_FL_ZERO_RANGE which causes build
errors.

Added upstream commit which not only fixes musl builds but also uclibc.

Fixes:
musl: https://autobuild.buildroot.net/results/8e9/8e946c7104be0295a9a2b946fe4a82bba0e28db8/
uclibc: https://autobuild.buildroot.net/results/ece/ece6ff1b20fa3482a88ffb3a6167b2bba9b06101/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fio/0001-fix-musl-builds.patch | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/fio/0001-fix-musl-builds.patch

diff --git a/package/fio/0001-fix-musl-builds.patch b/package/fio/0001-fix-musl-builds.patch
new file mode 100644
index 0000000000..16c3d3836d
--- /dev/null
+++ b/package/fio/0001-fix-musl-builds.patch
@@ -0,0 +1,38 @@
+From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
+From: Arthur Gautier <arthur.gautier@arista.com>
+Date: Sat, 13 Dec 2025 20:07:11 -0800
+Subject: [PATCH] fix musl builds
+
+This commit fixes the build on musl which fails with the following
+error:
+```
+oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
+oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
+      |                                     ^~~~~~~~~~~~~~~~~~~~
+oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
+make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
+make: *** Waiting for unfinished jobs....
+```
+
+Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
+
+Upstream: https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ oslib/linux-blkzoned.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
+index 78e25fca91..c45ef623de 100644
+--- a/oslib/linux-blkzoned.c
++++ b/oslib/linux-blkzoned.c
+@@ -25,6 +25,7 @@
+ #ifndef BLKFINISHZONE
+ #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
+ #endif
++#include <linux/falloc.h>
+ 
+ /*
+  * If the uapi headers installed on the system lacks zone capacity support,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
