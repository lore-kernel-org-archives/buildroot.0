Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF8CCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 17:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA55D81831;
	Wed,  6 May 2026 17:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLi6TNbjNYNU; Wed,  6 May 2026 17:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA5381846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778087011;
	bh=he57vgR89q3V064/kANVT3KUvrc+817M2KQiVDIS2xU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JbShGmL+hv1CHW9aVj0yA5oju83MUC6epVswPVZLT89m8P8B+CTxYdCHfKfqzTZ5a
	 kiPs4bfhG3Q148UZxyzSOLfDcGTlgnbTNHnAownsj8aC0oj6SmIZ7YnktNhSnadQSb
	 /JrgodWVKP1T3t33DGgiwH0nllEqbMs7+HPmXui89/39YoU4LdmVXla6EI9hIaW3lf
	 nWK70Rt6PdNsO29ArLo63ZRcJxAbgZ+ccIDjUXP8AjLRJCg6ixIwLR0UJC6X0ruy7e
	 j/seLZaDVLNWv2GRyQ78dF91moKX4S2iO4suCdn2Gpzb4oOaEdvrPTccqFWCHHv+m/
	 6Wghr7amZ91AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA5381846;
	Wed,  6 May 2026 17:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA09317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C68060E98
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kojiUosIzg2y for <buildroot@buildroot.org>;
 Wed,  6 May 2026 17:03:28 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 May 2026 17:03:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6107660E95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6107660E95
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
Received: from kmf2.trabucayre.com (kmf2.trabucayre.com [54.37.254.54])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6107660E95
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:03:28 +0000 (UTC)
Received: from kmf3.. (localhost [127.0.0.1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id B9106161FE7;
 Wed,  6 May 2026 16:57:15 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Wed,  6 May 2026 16:57:14 +0000
Message-Id: <20260506165714.1074180-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=trabucayre.com; s=mail; t=1778086635;
 bh=JEYC2QXPWUAsRCgnUGHYMUPAI9hsHW/BwuWWPlpCC4c=;
 h=From:To:Cc:Subject:Date:From;
 b=OZyhbppc1uIXyJz9F6WuoPdRI6Nvb8z8tMSu96gu0ggF4niTCq6HqrWYNaRTIh9xu
 AfG+nReYi49XpDBt9WkNUvgKs2J9C3KtpmU2I8EYh+Sx+utGU+rqsf0SwswogOZAd+
 /NSoA5WVLhJzjqH7kbdCP718xBzBJHuFS29o5/9W+/cOjPvsdV5Nsx979W3IE5bN4q
 MzulmdQQuWcF4l5KAlbtepWZfD2TFXDm2FRFIajv/atnaEbwNCYHjjC6p+QeEr/0yF
 I7MUsnHEsMigtv2JITq/WEuDRT7u0b9I59Lc+u7Mt0iZzpHj+5PTq8CIRQ38K/gF8w
 6diT8pXBF4dtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=trabucayre.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=trabucayre.com header.i=@trabucayre.com
 header.a=rsa-sha256 header.s=mail header.b=OZyhbppc
Subject: [Buildroot] [PATCH] package/openfpgaloader: bump to version 1.1.1
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

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Bump openFPGALoader to latest version.
Also adds a patch to fix cmake configuration when the libftdi
version contains rcX.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...ses-regex-to-remove-potential-rcX-in.patch | 32 +++++++++++++++++++
 package/openfpgaloader/openfpgaloader.hash    |  2 +-
 package/openfpgaloader/openfpgaloader.mk      |  4 ++-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch

diff --git a/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch b/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch
new file mode 100644
index 0000000000..bdc9f3de72
--- /dev/null
+++ b/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch
@@ -0,0 +1,32 @@
+From ed6025645f506c8941ab245f142db701b9f9bf2a Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 6 May 2026 18:12:24 +0200
+Subject: [PATCH] CMakeLists.txt: uses regex to remove potential rcX in
+ LIBFTDI_VERSION_MINOR
+
+LIBFTDI_VERSION_XXX is used by FTDI_VERSION to adapts code according
+to libftdi version. But when rcX is present in LIBFTDI_VERSION_MINOR
+cmake fails with the math function.
+This PR adds a REGEX to only keep numeric value and drop rcX
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+[Upstream status: https://github.com/trabucayre/openFPGALoader/commit/ed6025645f506c8941ab245f142db701b9f9bf2a]
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 442327f..2bf20e1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -200,6 +200,7 @@ if (USE_PKGCONFIG)
+ 			string(REPLACE "." ";" VERSION_LIST ${LIBFTDI_VERSION})
+ 			list(GET VERSION_LIST 0 LIBFTDI_VERSION_MAJOR)
+ 			list(GET VERSION_LIST 1 LIBFTDI_VERSION_MINOR)
++			string(REGEX REPLACE "[^0-9].*" "" LIBFTDI_VERSION_MINOR "${LIBFTDI_VERSION_MINOR}")
+ 		endif()
+ 	else()
+ 		set(LIBFTDI_LIBRARY_DIRS "")
+-- 
+2.53.0
+
diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 33f798b7d4..b95402c10f 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf19b596e5dea21891b1be3cb9a04be7a1501926ee0919dcc5c9f1b6d3bd0a96  openfpgaloader-1.0.0.tar.gz
+sha256  ca965f933c52a2a9dbb318df4d4de70fac5f095a8e64523f81036ab467a4b567  openfpgaloader-1.1.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 06c8b2face..ca2ef4b97b 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 1.0.0
+OPENFPGALOADER_VERSION = 1.1.1
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
 OPENFPGALOADER_DEPENDENCIES = libftdi1 zlib
 
+OPENFPGALOADER_CONF_OPTS = "-DCMAKE_DISABLE_FIND_PACKAGE_LibFTDI1=ON"
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OPENFPGALOADER_DEPENDENCIES += udev
 OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=ON
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
