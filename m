Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA06E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE4E36087D;
	Fri, 27 Dec 2024 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfpOk8gQzWA8; Fri, 27 Dec 2024 20:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 190D760831
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190D760831;
	Fri, 27 Dec 2024 20:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26939E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C73402C0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dM9UVIINucK6 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 20:41:17 +0000 (UTC)
X-Greylist: delayed 965 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Dec 2024 20:41:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DA7D402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA7D402AC
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:500::1; helo=mailrelay1-3.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
Received: from mailrelay1-3.pub.mailoutpod2-cph3.one.com
 (mailrelay1-3.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DA7D402AC
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 20:41:15 +0000 (UTC)
X-HalOne-ID: a9182fac-c490-11ef-8e9d-a581d61233e4
Received: from xps-13.fritz.box
 (dynamic-2a02-3102-8c10-00a0-c1a6-0033-1c9d-f612.310.pool.telefonica.de
 [2a02:3102:8c10:a0:c1a6:33:1c9d:f612])
 by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id a9182fac-c490-11ef-8e9d-a581d61233e4;
 Fri, 27 Dec 2024 20:25:07 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
To: buildroot@buildroot.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Fri, 27 Dec 2024 21:24:58 +0100
Message-ID: <20241227202458.208386-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1735331107; x=1735935907; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=+bSnBlOffm2VMolrYko/scK2Bj5oKAQVpMdTwSCERzc=;
 b=DvQPsN78C+QzoVxSh9vjUkOZq/XfDPYY5UarU9Zz0v8akODMmv6mxRnrHQb+UF3WQlbytwGHBz6O5
 /255d4pHaPhYYsnnoSkvTut06Ch9gA1SvO3l0ThIPaenxFylOXv23uJrWY7PgqHkXsFA90/aNAM1RQ
 4P9nSfVg0sqZlaBewL2osRlXWQhGYz9ILCtEDHimbRDP8DeiToXeMY2nOYCxKusrYllzMgXyLLup68
 WVbKfmHYsLAWZkfO95HTh5rVQSFK9KRVJm7pLnPoIWybMlEMzVHa64/ulT6MDLM69xnL41g0qEMY8f
 QpiqJjvZL24y54wR08mtDq2Btk4Bl1Q==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1735331107; x=1735935907; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=+bSnBlOffm2VMolrYko/scK2Bj5oKAQVpMdTwSCERzc=;
 b=jf+JSBdCB7KdOGyMCPNA0TX8yFcct/Y5R4HibOaLMDWCm0+LirEukNkVMj2CKGZEVn/wL2ZPUaC2B
 6HEYAdWDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=DvQPsN78; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=jf+JSBdC
Subject: [Buildroot] [PATCH] package/bmap-writer: add initial package
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
 package/Config.in                    |  1 +
 package/bmap-writer/Config.in        | 12 ++++++++++++
 package/bmap-writer/bmap-writer.hash |  3 +++
 package/bmap-writer/bmap-writer.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/bmap-writer/Config.in
 create mode 100644 package/bmap-writer/bmap-writer.hash
 create mode 100644 package/bmap-writer/bmap-writer.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..66808b71e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/bmap-tools/Config.in"
+	source "package/bmap-writer/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
new file mode 100644
index 0000000000..e779aa835b
--- /dev/null
+++ b/package/bmap-writer/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BMAP_WRITER
+	bool "bmap-writer"
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
diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
new file mode 100644
index 0000000000..e97dac11b7
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  0.0.3.tar.gz
+sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
new file mode 100644
index 0000000000..b363295850
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# bmap-writer
+#
+################################################################################
+BMAP_WRITER_VERSION = 0.0.3
+BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
+BMAP_WRITER_SOURCE = $(BMAP_WRITER_VERSION).tar.gz
+BMAP_WRITER_LICENSE = GPL-3.0
+BMAP_WRITER_LICENSE_FILES = LICENSE
+BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
+
+BMAP_WRITER_CMAKE = YES
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
