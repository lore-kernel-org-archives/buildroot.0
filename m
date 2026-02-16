Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF31E63F25
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 07:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D7060AEF;
	Mon, 16 Feb 2026 07:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cXxktSiRwk1; Mon, 16 Feb 2026 07:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F1060AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771226206;
	bh=EScrXZG4ohxvCNfar/krg2h+k3/vdYeO4bwobqNOabQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RXwpHQTperKcDgfvKBF6O/nU7Yryr6rrfqob5hYwoSJj21LuHgIyt20SDB4H/7IQB
	 bmihzmBlo6wauHH2c8weUgC5is2UpdBkUI86LLDDaN8pwilB59nlRjhXtqwS3PUqYd
	 7SSMq4FqLIlyAvEMcvV8Z1HPBjbgNWyMivH/IWq0DhnkOIwEZFB+0FedKuPPMbchxy
	 sltgO7fibqkDnt2K65A1Hw1r1hunZTobJX49w9AcC0T3bwA0xKrlGGrxDJyFOUlS1d
	 qKoWZfz9oJgWSnv/XS2MB49zNNRUDHHgDHzdMEX16nCdYtwFyzqpVq4Vt6Tyqm5Ceg
	 B2EyjGXFSyZ4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F1060AD6;
	Mon, 16 Feb 2026 07:16:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA891EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 07:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F07740924
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 07:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0msutlh4Sdn for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 07:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52FF94090B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FF94090B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52FF94090B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 07:16:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b41f.dip0.t-ipconnect.de [84.161.180.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AECEBA4C0DD6
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:16:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37610)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrsqV-000000003En-0vGK
 for buildroot@buildroot.org; Mon, 16 Feb 2026 07:16:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 08:16:38 +0100
Message-ID: <20260216071638.3456062-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771226199;
 bh=q1ZqAs3qH4T3uNuL2+eJyOIBGUKQTQb4K+dJaAEBplc=;
 h=From:To:Subject:Date:From;
 b=A6ey4PpTVdm7ipqGN4icqA5DRiYRGo407yq7unIKgq80wUeAfnAOqti/s0NDhQ7A+
 qe1vlyr5SyhdqN/bBCgM2t0cOXiypeKAj3GcWI9rOYs1rv6NG2O4NU4cmFLRG/wN7Z
 OdNIOI/6eRa8QBeI7VjWDX5X8/rh9PNJ0n05U5fQo4Lk3oOSgiuhtv/ANIYi/7nNYh
 A9WyzPvt0dv026JYVYrJoefxa859MTiSsYx46vePsFBevgW/YnGLWbHR8nmhU66FIt
 +q69Okrzpd+tKxGOcWiOApFF0oyfGcOnijD3RFt6k8kFpHdHY4QD4v0iYlR634CiKh
 huH1JP5OlUFuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=A6ey4PpT
Subject: [Buildroot] [PATCH 1/1] package/libtool: bump version to 2.5.4
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

Updated license hashes due to address changes.

Disable help2man to fix build error which would be introduced by this
bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtool/libtool.hash | 6 +++---
 package/libtool/libtool.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index 8deaf4fbf6..72281eb465 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f  libtool-2.4.6.tar.xz
+sha256  f81f5860666b0bc7d84baddefa60d1cb9fa6fceb2398cc3baca6afaa60266675  libtool-2.5.4.tar.xz
 # License files, locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libltdl/COPYING.LIB
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  libltdl/COPYING.LIB
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6342e70a39..ecadc3e696 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.6
+LIBTOOL_VERSION = 2.5.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_CPE_ID_VENDOR = gnu
@@ -25,7 +25,7 @@ LIBTOOL_LICENSE_FILES = $(LIBTOOL_SUBDIR)/COPYING.LIB
 HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPL-2.1+ (libltdl)
 HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
 
-HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
+HOST_LIBTOOL_CONF_ENV = HELP2MAN=true MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
