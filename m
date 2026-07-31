Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D172C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 17:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0E3605F5;
	Fri, 31 Jul 2026 17:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTwwknFFFK_H; Fri, 31 Jul 2026 17:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8F060642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785518750;
	bh=nwGlCVoTslaYWBwARUF4HveoRv/rnpnlqjAXna4/F4k=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eE6WgGRfZX39VGSCglQtGI1xRX7IIUWdp/tJv1g/BIwi+Wk7DmEMuLiXozluDJWXL
	 QS+rkPOS8FJnKKAvWehkFr1Pic8jOFFXCqX+lxmYzAugHy/ZIciX6VAtK1X5M46cUr
	 l1tEd3LTDbSKGI5WIHaZbyoyEr8pbTyYhzqwwt/avB0wSNekH+7mx1wZ/AeyqWgivN
	 x0nOBOJN0gqO9wJ1ZVDrSQa6ub4V4W8LhBz2BXmHD2NVf7dg5IbWNvtnkb1OOKak8r
	 zg4XzCoKzTXaS4+2gJFeCGfTk+B3jKcwNeWEsWGrRua+uoVCbkKoXN1P29GmwbrqP2
	 WJzutKhjMVW4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8F060642;
	Fri, 31 Jul 2026 17:25:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A21627C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 17:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C95160642
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iziTDO4jmDII for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 17:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDFC0605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDFC0605F5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDFC0605F5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 17:25:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8FEC01A136B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 17:25:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5DA506039A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 17:25:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4EF5711C16BAF; 
 Fri, 31 Jul 2026 19:25:44 +0200 (CEST)
Date: Fri, 31 Jul 2026 19:25:35 +0200
MIME-Version: 1.0
Message-Id: <20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBP6o6SrRAsbx5yCCq0Iwrtnt
 fzg8W7w5Jg8tMkNjk72vC4ReZoAWrWMJFhHQ5EVddaUubCktt0pnAXqytRGGiSUEPvNkeHre3X
 9b38ME+H+DiCEBwbcMCxtAAAA
X-Change-ID: 20260731-heaptrack-cd4f6f8fcec8
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785518744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=ezE59Vs8kSt23nAoCw+7GVNMXG+znRZOHqW8ZO6f9BA=;
 b=Z+HcHnd7q8YJpeUYGItMHVeEvzqdtejJlWvGbtm36mPI13u8/LyUHKABcHduoBZ+4Ng80h
 gIyeXm6R7qdhOs/B+npKssndfHkuI4fCaXPsdy+bKNfO6+kX5YWosJUAS1DHKEyf6fiB4Z
 Mk/AkD2zMD3o2ZVaEoX5Uugq5leYyL4KwSJMnaSjg1TU2l5KxuOpWbBZL0pn3A5ZpYsBoV
 bWEsjQuXcucCHtgUsnzgsu9IdztxuZpTkD7NS87NcrvHALBpnU4tS4Wc2yiaPuIi37d+ZP
 pqOm5M8QxN+Qt0Bufi5rioY9N1wwMwfCnpnzfzE3kZFCXv+lKDskRT5vs19XQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Z+HcHnd7
Subject: [Buildroot] [PATCH] package/heaptrack: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add heaptrack, a memory allocation tracer toolkit.

This implementation builds all the command line components, not the
heaptrack_gui graphical visualization program.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/Config.in                |  1 +
 package/heaptrack/Config.in      | 26 ++++++++++++++++++++++++++
 package/heaptrack/heaptrack.hash |  1 +
 package/heaptrack/heaptrack.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fc1e57d30dd7..7caf56e6de6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -106,6 +106,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/heaptrack/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
 	source "package/k3conf/Config.in"
diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
new file mode 100644
index 000000000000..ea54195c9318
--- /dev/null
+++ b/package/heaptrack/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_HEAPTRACK
+	bool "heaptrack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_IOSTREAMS
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	# For heaptrack_print
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  Heaptrack traces all memory allocations and annotates these
+	  events with stack traces. Dedicated analysis tools then allow
+	  you to interpret the heap memory profile to find hotspots,
+	  memory leaks, allocation hotspots and temporary allocations.
+
+	  Zstandard offers better (de)compression performance compared
+	  with gzip/zlib, making heaptrack faster and datafiles smaller,
+	  so enabling BR2_PACKAGE_ZSTD is recommended.
+
+	  https://apps.kde.org/heaptrack/
+
+comment "heaptrack needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/heaptrack/heaptrack.hash b/package/heaptrack/heaptrack.hash
new file mode 100644
index 000000000000..d9eb6010ac18
--- /dev/null
+++ b/package/heaptrack/heaptrack.hash
@@ -0,0 +1 @@
+sha256  e69de2209ab0e16c8e26c1b60feeb852b3a88e46a4f16588c08254e1bd81a183  heaptrack-3e6cce3d210a6672fe6f92de0bed567c49b7a9c5-git4.tar.gz
diff --git a/package/heaptrack/heaptrack.mk b/package/heaptrack/heaptrack.mk
new file mode 100644
index 000000000000..6349e7aeb04d
--- /dev/null
+++ b/package/heaptrack/heaptrack.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# heaptrack
+#
+################################################################################
+
+HEAPTRACK_SITE_METHOD = git
+HEAPTRACK_SITE = https://invent.kde.org/sdk/heaptrack.git
+HEAPTRACK_VERSION = 3e6cce3d210a6672fe6f92de0bed567c49b7a9c5
+HEAPTRACK_LICENSE = LGPL-2.1-or-later, GPL-2.0-or-later (heaptrack_interpret)
+HEAPTRACK_LICENSE_FILES = LICENSES/LGPL-2.1-only.txt \
+			  LICENSES/GPL-2.0-or-later.txt \
+			  LICENSES/LGPL-2.1-or-later.txt \
+			  LICENSES/BSL-1.0.txt \
+			  LICENSES/MIT.txt \
+			  LICENSES/Apache-2.0.txt \
+			  LICENSES/BSD-3-Clause.txt
+HEAPTRACK_DEPENDENCIES = host-pkgconf linux boost libunwind zlib elfutils
+HEAPTRACK_CONF_OPTS += -DHEAPTRACK_BUILD_GUI=OFF -DHEAPTRACK_BUILD_PRINT=ON
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+HEAPTRACK_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))

---
base-commit: 9bc585a804b2ce7b5f82f538f6108cca27c3116a
change-id: 20260731-heaptrack-cd4f6f8fcec8

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
