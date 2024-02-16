Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C0FC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8108F41E02;
	Fri, 16 Feb 2024 21:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QA7E853jF_hO; Fri, 16 Feb 2024 21:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972F2421AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972F2421AA;
	Fri, 16 Feb 2024 21:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFCFA1BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD076062D
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYDcm8ZxfFXx for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:13:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BAD060618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BAD060618
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BAD060618
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:13:25 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b5WMrrbOSce1vb5WMr5JJt; Fri, 16 Feb 2024 22:13:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:21 +0100
Message-Id: <20240216211321.470283-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDRbI8y9g5GiwGePeO9WIZGCTZdcHWA7dFzgtYCD/PiIzYc9sVu19+yDV3oTQlhrMHI+XZSAZcGgJc2BCi/AGbMx+pftYT+PEhHvH+msjjyLuCdARwam
 wimSVGKsL96xhosdGJFOBOt+7Lsib4M1TZyfYUIeHW0jq2hH0CEutc5W9CLdbLF6lFU8vMUDo4tQjVBgwKyNsP/CXB4ri8z7lP5fhm9wUEWov6qrwWJ1Spt9
 alKjGSk0NkboCllG6LHzNbxdDpe5nD1JIDOITzkQSno=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708118002; bh=ycbHSo/SN0Nmo96vrqaCcjJwGvhb/5PoZwDURkSu9sE=;
 h=From:To:Subject:Date:MIME-Version;
 b=lDhz+OTVL4qaX0Zh1rg2wEn2+xUBsN6NHJE6URYfGCqe+lR/zkNtYUMD16ZhqcOjP
 awDf+cblppk+8npuqjuNXWlPgUuvXhhMvPrji4/7fyffSjALofdK8c7jvOVk7gtayg
 OWMriehKcp/mZGXT7YF6bXqsfgKCegZRox1jwlMfBDbTjCmavZ6Tq0rQT9mvFA4sJD
 0NFG7i/i9Aaed6lcKfJE0jcg7a4T2YL+9G5u/j0BjJTMwYnri1d3MM0VXiLxKMSINw
 pEKge6/neaD6gxl+I7vvUKHBL/nVAjQQHr4TrFu4uKQ2qGINDTasL4L3lUvfi3r+Qp
 GlWfboMKCfoPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lDhz+OTV
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.8
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 69963578cd..469006d632 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  e9c3ad59c068788faf0f0af4296f92f8ce410d12749f0f35a541d6a21e630393  libnvme-1.7.1.tar.gz
+sha256  d59939a280eec41eb7a716e1681d0d0c612099385204ffb55d07134a6be08d75  libnvme-1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 813f7279e8..bf131d2a38 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.7.1
+LIBNVME_VERSION = 1.8
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
