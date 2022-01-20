Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56D0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 19:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B65141637;
	Thu, 20 Jan 2022 19:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmxE7zl-SyJF; Thu, 20 Jan 2022 19:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D923400B4;
	Thu, 20 Jan 2022 19:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 356B61BF2B6
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 304A84016B
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb6x7PqA7Ai8 for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 19:27:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCD1440108
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642706858;
 bh=oZiJ5sHwYGBRwh3RSc2UiXNZ4S0pbcZ1+gPEMcrq8Pw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=TEIM+q48w+n7DBIQBc3gOhOdyz8egPWaCI/DLgNWXSuwXf0z514wGRW6PDV6CUG8R
 6DPcYaiKLZ1/57h1D4ybJijU5b3y8UZRuCkIDoPp5UlYcL5S29CooGjNIqOtuZOh0a
 gSDc+V1cAbBl8tVQZe6On+JBL9P7g5dof3dr2ss8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MVvPD-1ml5Lz2vy9-00RrIh; Thu, 20 Jan 2022 20:27:38 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 20:27:38 +0100
Message-Id: <20220120192738.11310-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:OjDYc53lN5ZqQVJpagpMuh09DBpsRg5CoKym8pOCmylz4YIJF4p
 g+6e2DQ2dUeseh2RkwfZXtoqUEx8x2KXELeMwTvI2fndbgDAvDKfxg7GT5gkRsr4OX+n42o
 e4EOlylCACt2HYdkfS409ft646PE+f3Umn9FwJIELh+BwCGBkBmhIPWBcMdn2aglrT5q1Fw
 8XEWAgnvzuDGTorA1XeZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ntd5dHM67sk=:0Nyf26OglFkQ6FEuviWaXY
 G+/sMElfBOXUIdlNJSYTQRcbr8Dj+vcm6ewOSwm2DdnpK5Xj+MqRPTk2bzYIl0+LKKLvJjDsa
 H9ANvKyULqtWwaFjM2XoGFq8bTHyRBhq4UqE8huemylZZ0SOo7Bd0Uoxp2fwcYflPee61CyUl
 ISvMr3fhzJq+QCPqF9iiHgbLfZDVyiWw6tHlz3YcL0OSq+oxNUz1J597RySNDxB9U4O7JJR4J
 aF5WlebB0dTKBrNZA/zqQT2nbXtRzuCm8+7XdY4XPvmums+3zqhXulnMxEyzqmREh4QdMQe+Z
 XZmANkaxNXzLqzK4ERe6L3O27ZLR/3UtPrKbIUB/asCh5bXWP918c0u7czimyzngv+4FsGMrv
 aBI2/i3IvTOl/tQuZ9gDUY2gNv2xbfSW4lemg2v6e0/AJgsJWrtsDB6yoZrHvT+BMyf21gG3N
 bf2m1wcD0kPTmh0QcCwK1MvuKoaf2mduHm+0Nz2z673YQB+pYsTgOELTAsXrSitQ0fiQKy+P8
 xL+tbAgwcIvr2Om0rkp5CRTZHVG1TQcAyhOAC2J3l6jieaDYpJExRoYvmkerOHDlcOkCuS9Xc
 0gxLDnlMHts5l0V2kQy23eyHanbFeT7sybV99+iRiopraQCRiB2mhoPZY6X/g51HiOVLYtj+z
 C8YA3TuOVGyDUt6cmJsdgQPc1a8Rv45038IbS/V8JeUjDlPPfs+KpEswBfrXs+34XRqYNSOyi
 QOGWSJgmtww4qmYYPe8Dk98EwgK0XmP5YXPxx00vHognsSPaI1A8+3Cb/hn71Q9t0eL3sD9HZ
 1nrsMZpRu4bMV9ZdNS7d3roWdV8IIs+/d743P8KoSZpjTCXluGrYwWvMqRbUzEivXeyTxdREh
 aPH/yPJdcvNVHReJRo5JLorwCiXlL24xsM7QLMSsNbyMbVC9iMErUOpd3t0N1p7pe6MORTD5R
 Cd0YRfSSqSOGpVxPyoB6e10iRNjDP4jRVtT8MIESFMjteEj4ATIBcyAcpneIxFIySiMHaqIA2
 nk8n9oxPdtgg1ZxAzVUeMo+tJTI/BWgj4ukF1DGWPiklvbfbnnvwO95xLrRmB47LZzTxLcd8I
 P9uEzdK34MOrrw=
Subject: [Buildroot] [PATCH v1] package/hdparm: bump version to 9.63
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://sourceforge.net/p/hdparm/news/2022/01/hdparm-963-is-released-

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hdparm/hdparm.hash | 2 +-
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index b37826caf2..c039481f77 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/hdparm/files/hdparm/
-sha1  100b9a5551b71d87b446b415d56c5d45ac41d131  hdparm-9.62.tar.gz
+sha1  c8e24233b4d29506907ad2bf0725f793106c3a78  hdparm-9.63.tar.gz
 # Locally computed
 sha256  2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f  hdparm-9.62.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 6a71c14fa7..2c3b372deb 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.62
+HDPARM_VERSION = 9.63
 HDPARM_SITE = https://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
