Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AB7D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBD661545;
	Mon, 12 Jan 2026 08:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdY6Kpq2aJUJ; Mon, 12 Jan 2026 08:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD7961503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206859;
	bh=5T65uRz50bxZpXNntOUQaiOvgOJPSweLHihpF+PqWU4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWiUt/7KV9NgTrjsbZjJT9pFbyAzLDSxGVeMF2Lss8utVBKCdyF8zFUG+GZ1bMn0A
	 KIj7sIbjJhDOLvq0YBiMDRmoWz/o4njFbCtXlPQSNyf6U+lvK0B1X8U9KyU8IqrjJ0
	 dDoufToF6fsyC5+ZLnU2Yi3NNe3P12LJKWjLA+Zt8aAaQ9f7DCcg7dyqfamDoNEoJf
	 YrkBxO8QZHbtf2HVSu8n9JLbOHU5cT+zN9LptpkgA7+v5xP3N5nh8iUl2bMJY9dYVn
	 NrQsvF6rYrhQESmBHhKMZTp3U2Yg2p7FsFvRGqkQiWY8dVD5RB8zjUx6jVJhIsC5/b
	 +E+7b8cX9IXbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD7961503;
	Mon, 12 Jan 2026 08:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05ADD1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12DB4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPlwq3tXrBKs for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D677B40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D677B40052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D677B40052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46701A4C3BAA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-2EA8
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:19 +0100
Message-ID: <20260112082950.2528445-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206617;
 bh=wC5aWicik0j5fwaV649NO2eAemAljzXRSDmPST08BZA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hBkzSdxDc3AqjBhUgntbEmNCIf++H93Ft+uOEcYy7f6fb2pguLRlrhd66HV5/w9Qc
 0zZUuNGJrYRjFWyIDTlmy1cdDm4PC+VbshoMDfeVZjG0UEV+za/iCNvPHK+8eteYnk
 Hk8hMCwcFrytOteBknpT/UL1GKItNdxak3SzWtN3BPCDFa0aUaleXlNY/7wQogg996
 wePHlpxw02ySZ/0tpPo5oe9Rp3gMvDcxjVSBQ3rPy8LzkuaGvUErCWLVy8CgKiLFTS
 v/4akbIVAWCsyvYNcZ9rFy8faROCUkC0OCp66oQwBfLSnYfO4ssFuKwMbPGpmI6jKE
 84oEsj5Wxz/TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hBkzSdxD
Subject: [Buildroot] [PATCH 071/102] package/x11r7/xapp_xload: bump version
 to 1.2.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003485.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xload/-/commit/ef450fb99630a406c4638d8ba251eac45e434411

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xload/xapp_xload.hash | 8 ++++----
 package/x11r7/xapp_xload/xapp_xload.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.hash b/package/x11r7/xapp_xload/xapp_xload.hash
index 9716fe1500..29a729a70d 100644
--- a/package/x11r7/xapp_xload/xapp_xload.hash
+++ b/package/x11r7/xapp_xload/xapp_xload.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003150.html
-sha256  8346b99120db24e0f42920f7f12e23e9b1b407d3a66ce419990387b608373031  xload-1.1.4.tar.xz
-sha512  114babe4e5a60f4713f9e4627ee0a1bbb2f1f238cb46f24c38aecff67f25e6b0f58cbd554c71095ddc2b01398adbfa379550a34c23c413db52157648028554f2  xload-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003485.html
+sha256  2c0fe6d624e1a25c1707e2d56407b979d6a78d64271df9ea0a89d99b81b59a80  xload-1.2.0.tar.xz
+sha512  b6143f796f7d24bb204e29f341f59c27a0eba00ae58e42bde0d1471e3e9357a0ce5e9e23de119d2540c9f5c71d28eb1e85dd766b6b28a7f066805b5f386aa716  xload-1.2.0.tar.xz
 # Locally computed
-sha256  a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f  COPYING
+sha256  c5fa9a1ea9032b1422d423b73fac9710a3e54c2d11d9c810ea5fc5585a53977c  COPYING
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index f219359447..4ef86dbb51 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.4
+XAPP_XLOAD_VERSION = 1.2.0
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.xz
-XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOAD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw $(TARGET_NLS_DEPENDENCIES)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
