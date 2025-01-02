Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA640E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 13:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0899D404D8;
	Thu,  2 Jan 2025 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMGDPbfJfV0e; Thu,  2 Jan 2025 13:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0264031E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0264031E;
	Thu,  2 Jan 2025 13:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B050F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7C74046B
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW1GVEYgc2HL for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 13:35:09 +0000 (UTC)
X-Greylist: delayed 964 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 02 Jan 2025 13:35:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A042540460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A042540460
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:504::1; helo=mailrelay5-3.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
Received: from mailrelay5-3.pub.mailoutpod2-cph3.one.com
 (mailrelay5-3.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:504::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A042540460
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:35:08 +0000 (UTC)
X-HalOne-ID: 1fbeaf68-c90c-11ef-b81f-6f719e79c8e4
Received: from xps-13.fritz.box
 (dynamic-2a02-3102-8c10-00a0-daff-1abd-5602-0da0.310.pool.telefonica.de
 [2a02:3102:8c10:a0:daff:1abd:5602:da0])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 1fbeaf68-c90c-11ef-b81f-6f719e79c8e4;
 Thu, 02 Jan 2025 13:19:00 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
To: buildroot@buildroot.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Thu,  2 Jan 2025 14:18:58 +0100
Message-ID: <20250102131858.214596-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1735823940; x=1736428740; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=psdpeSJGx5ZiZx2ecz+vxht5czbV8FlOSJ1HJWgKjTQ=;
 b=KyQnydlb6IM2P1y5DVIvhTwL22y854mO6WobPqvkn7gRuhM9T4QjK/rvHUPCr8T582OIbli2qryK1
 22Hljg+OZSxtYYLHuh31p/G9CrzEZGl+VjZgUqArbwIANinZMzLBKmLApvqbEAkRKmyAD16BPm1kGw
 qIa0AlAzjrx49ChX4PokH937FRnn+Dm9YbF5YGKGPgDavi4YQXcKZ55+o93MHHRHH4OWJpacsawBHX
 MHX3wbdVZPaTnMZcs7X0kVP8KnZm23KhSGA8zfQAuKLIaPqnTSqHjSXC4A/nP/ZVOMlDsA0RWHLCtw
 D4vdOfBcnLS0aDupj6aIJXfLmkGkz7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1735823940; x=1736428740; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=psdpeSJGx5ZiZx2ecz+vxht5czbV8FlOSJ1HJWgKjTQ=;
 b=c8XnWznYgDAJ8eHA/J5hZXbTyvHlIFDhGk0PvvEvZxvbvRL3qG33RbDMPooRmqAdELsgX1GF+Tyxn
 t8+cDk6Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=KyQnydlb; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=c8XnWznY
Subject: [Buildroot] [PATCH v2] package/bmap-writer: add initial package
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

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/bmap-writer/Config.in        | 17 +++++++++++++++++
 package/bmap-writer/Config.in.host   | 10 ++++++++++
 package/bmap-writer/bmap-writer.hash |  3 +++
 package/bmap-writer/bmap-writer.mk   | 13 +++++++++++++
 6 files changed, 47 insertions(+)
 create mode 100644 package/bmap-writer/Config.in
 create mode 100644 package/bmap-writer/Config.in.host
 create mode 100644 package/bmap-writer/bmap-writer.hash
 create mode 100644 package/bmap-writer/bmap-writer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 381bc9f490..2e66e3d8a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3447,3 +3447,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Ayoub Zaki <ayoub.zaki@embetrix.com>
+F:	package/bmap-writer/
diff --git a/package/Config.in b/package/Config.in
index 17f458eee8..3b4af5f7eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/bmap-tools/Config.in"
+	source "package/bmap-writer/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
new file mode 100644
index 0000000000..d65eda918c
--- /dev/null
+++ b/package/bmap-writer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BMAP_WRITER
+	bool "bmap-writer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBXML2
+	help
+	  bmap-writer is a command-line utility designed to efficiently write
+	  disk images to storage devices using block mapping (BMAP). It serves
+	  as a lightweight alternative to the Yocto BMAP tool, specifically for
+	  embedded systems. Unlike the Yocto BMAP tool, bmap-writer is C++ based,
+	  does not require Python, and focuses solely on writing an image.
+
+	  https://github.com/embetrix/bmap-writer
+
+comment "bmap-writer needs a toolchain w/ C++, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bmap-writer/Config.in.host b/package/bmap-writer/Config.in.host
new file mode 100644
index 0000000000..d5bfd62f0a
--- /dev/null
+++ b/package/bmap-writer/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_BMAP_WRITER
+	bool "host bmap-writer"
+	help
+	  bmap-writer is a command-line utility designed to efficiently write
+	  disk images to storage devices using block mapping (BMAP). It serves
+	  as a lightweight alternative to the Yocto BMAP tool, specifically for
+	  embedded systems. Unlike the Yocto BMAP tool, bmap-writer is C++ based,
+	  does not require Python, and focuses solely on writing an image.
+
+	  https://github.com/embetrix/bmap-writer
diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
new file mode 100644
index 0000000000..c59c7a91cb
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  bmap-writer-0.0.3.tar.gz
+sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
new file mode 100644
index 0000000000..bbe4eb1078
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# bmap-writer
+#
+################################################################################
+
+BMAP_WRITER_VERSION = 0.0.3
+BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
+BMAP_WRITER_LICENSE = GPL-3.0
+BMAP_WRITER_LICENSE_FILES = LICENSE
+BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
