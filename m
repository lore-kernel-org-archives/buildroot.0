Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B89AC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A32F606B3;
	Fri,  3 Jul 2026 19:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFlhcE2PBJLj; Fri,  3 Jul 2026 19:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ECD607DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783107194;
	bh=WlseFQ0OZH2BtYP9A/puVzHMq4J7cq0RazSCKWg+NIo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EYIU0xdNS9jTqyB20tlG5ZPWzJfoZzwk2XNzeZlnlyCbqjW4HI6N3pYsBZZv2qdie
	 lmNbaWVV7jYy+Rz5P47AnjOCzM8gppdh/kwMFRu235tu83oZQxSz1wDZUSaGES7OjN
	 qFwlSf0VhHWVZHjxNT4Q5W+mT0HZtKFptiQKqOX64cVN5rWYOW47dnuPuSrRf1AQzI
	 9ZifB549NlR85xTMiqBSQfkH0LEdwd1Ds6Yu/Xfnvi3AfuAQWXmqWdVnAw9x0EtwY8
	 rGuz54O9N56RDrLUY7Vbul2ox5IOoI+mPs/0XqKpZf80VF/rUG2zeQUmv+i+fzlHwl
	 P6vUwqH2rrT1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30ECD607DC;
	Fri,  3 Jul 2026 19:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C7C316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70F781C11
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEUw8F7XWJFj for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8A29814C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A29814C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8A29814C4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:33:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 533AAA4C0569;
 Fri,  3 Jul 2026 21:33:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47088)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjdM-000000004G9-3zbb;
 Fri, 03 Jul 2026 19:33:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri,  3 Jul 2026 21:33:08 +0200
Message-ID: <20260703193308.3694911-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783107189;
 bh=uY6eae/0itJlVHdM5/OLtjpOm5SrGmE3DzSLAP5qRHs=;
 h=From:To:Cc:Subject:Date:From;
 b=ayx5kz83SNGCy0Cr+6oFYoB2KfwkbkFH9xY9tvrXV5Qoem6Q4zQg3oSaXt09nRYbB
 C5M/NrDYy4Z26c080cFn6rNGvJBx8VDGPyv7pyywu/pqtU96fK7iTptPzORvA7grKn
 f2f/nzdUNAbfuSoiCxlvWzlFcoa14ATo7N9FIddK1LsztpCYu6IHCPW0yLRG91mHis
 ISacPBGqwc+f1ur97rtxrC0ZNBPF3t+rrzaIzbOrQ+WqCifPh2tIKU8npDMiuyoK0C
 drIh4Ogr7Lv0NuBUwphxpDXl+gbC2gaW6t1Ql1fvz72+hP0GCI9dZ3GaEn2l45GxvX
 EfDDdWF0oSlUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ayx5kz83
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.4
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

https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a59ef79ca3b87b3eef77362e8217c017a3752bd0

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9781a1357c..324d4e1708 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.3
+MESA3D_HEADERS_VERSION = 26.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index abc0527907..6e77b17b0d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html
-sha256  7725004e724b34c6d4fbaf5c48fc6c6223aa9f2741d6d7782c699b049356fc45  mesa-26.1.3.tar.xz
-sha512  6dd452e8c7f2e7e9a26733f53dd0daf4df824f82de3d37c171581854dd419f519e104212aacdf8bdf94042a845d9ba5c45a1605d7cba1dc491570a9e72a91f83  mesa-26.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html
+sha256  072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6  mesa-26.1.4.tar.xz
+sha512  39d15574e876005fd1a483d1cb3c801b08297ec73820a89cbf368d0f2a922cc770d0e623e99acc66b71791332cdadc6cc3095f059f713b09128921ff2d0197a8  mesa-26.1.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e7a5240c7..8e6c2ee5b8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.3
+MESA3D_VERSION = 26.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
