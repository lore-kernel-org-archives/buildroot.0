Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A9ACD128A
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 01:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE9081E37;
	Mon,  8 Apr 2024 01:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZXBQVvbXunc; Mon,  8 Apr 2024 01:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36BF281B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BF281B14;
	Mon,  8 Apr 2024 01:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 314B41BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E0764074C
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmwMs1-eARLh for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 01:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 700DA40747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700DA40747
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 700DA40747
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 01:39:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-345e1c645c4so5378f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 18:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712540361; x=1713145161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1+oYtEeMpmIAq9GWgWr6nO6i2djx0mh2kkBf7Z0+P4=;
 b=KBDF1lpPTpbKD7syhWYC8EbUsvNPsr3QqqeHAJTHDto83m0+JHciYpKHXFD32N9S+N
 ZGn94OGesFgtWqO24ohWIVvoRZUXy25sdgeBTw2CK6w77JH9/77WzC9b7wWjxFSOu5iH
 vQ/OI/cBiNLPzQXGeRycenXyxuTOMikU50q0CeWJqQMNFQh6e+SOFa1KJ3Gf0MpP4WvQ
 GcksEcVzMDKWemi23BG6RZX0z8j0pOeHjDvxIX2E/le9/jKLtwpANOraSk0nYbKqKaYr
 9JJ6u1j104uHrvA4MW/KASDyNiguaVLR69+NndznUlTNHHO5sNT2m4TOk2zvwB22nnMs
 mV5Q==
X-Gm-Message-State: AOJu0YwWOtfbg1kun1OwaDITu/8BFBmX/XVOenTiyvhLQ0QM4eE4ppoL
 p6ZTaj6eWhCXRTvIRZCmuWbP554WGjSLY58jcfpL6+hKq1pA6T6m620O2gcm84I=
X-Google-Smtp-Source: AGHT+IF/NNdXAHyXdXGzon59blWmvk+QjrGSMG0JQIX7ZY6ytf/g6twbQpYxxN9urLW5/tF+dmvg/Q==
X-Received: by 2002:a5d:6acb:0:b0:343:772d:9349 with SMTP id
 u11-20020a5d6acb000000b00343772d9349mr5389047wrw.50.1712540361238; 
 Sun, 07 Apr 2024 18:39:21 -0700 (PDT)
Received: from arch-linux-pc.home ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 m28-20020adfa3dc000000b003435e1c0b78sm7784068wrb.28.2024.04.07.18.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 18:39:20 -0700 (PDT)
From: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 02:38:45 +0100
Message-ID: <20240408013859.732937-3-matt.stav.taylor@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712540361; x=1713145161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1+oYtEeMpmIAq9GWgWr6nO6i2djx0mh2kkBf7Z0+P4=;
 b=ibgA1m29vZSTv8FgUA0yM8idt1rLABrpheYle8c86sgKh1VjXD9dzw7RZavJJ/q+e9
 N8o4kMEUULIrWV0ri1CDCRYFyCboDYDGOlf4EDftQYcK+MaV6sGmROCC5nmQkHMZP7zP
 0WS37q4hKnT+Rao0u/2KvjMI2AbyDCl66M9psnR1zNANq2EnSZDLYrNvvtaF/Gf5egyC
 botlMUlMJ5qoBy5b0CZY9IF47EhCIUmccMKmczXa/FsknT4jAQ42CeMuQuOlZXT7dWfh
 JOPwOHObHZ2UeZvW3nh6j7TkqmcQxHR7Wb6VBzH33H0UGgHPlCohBoIYWH+b+zRQh2PK
 gBGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ibgA1m29
Subject: [Buildroot] [PATCH 2/2] package/bcachefs-tools: new package
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
Cc: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the bcachefs-tools package. Note that this does not teach buildroot
how to create bcachefs filesystems.

Signed-off-by: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/bcachefs-tools/Config.in           | 26 ++++++++++++++++++++++
 package/bcachefs-tools/bcachefs-tools.hash |  2 ++
 package/bcachefs-tools/bcachefs-tools.mk   | 23 +++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/bcachefs-tools/Config.in
 create mode 100644 package/bcachefs-tools/bcachefs-tools.hash
 create mode 100644 package/bcachefs-tools/bcachefs-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d78661cd60..d523b441ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2172,6 +2172,9 @@ F:	package/ts4900-fpga/
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
+N:	Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
+F:	package/bcachefs-tools/
+
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
 F:	package/python-autobahn/
diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..92de263349 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -213,6 +213,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
+	source "package/bcachefs-tools/Config.in"
 	source "package/bmap-tools/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/bcachefs-tools/Config.in b/package/bcachefs-tools/Config.in
new file mode 100644
index 0000000000..2c7cbcf406
--- /dev/null
+++ b/package/bcachefs-tools/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_BCACHEFS_TOOLS
+	bool "bcachefs-tools"
+	depends on BR2_USE_MMU # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
+	help
+	  Bcachefs filesystem utilities
+
+	  https://bcachefs.org/
+
+comment "bcachefs-tools needs udev"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "bcachefs-tools needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bcachefs-tools/bcachefs-tools.hash b/package/bcachefs-tools/bcachefs-tools.hash
new file mode 100644
index 0000000000..def2762bea
--- /dev/null
+++ b/package/bcachefs-tools/bcachefs-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  f2125c10494e484611e77a32c301e1cbd5cf6f247808cf1c2c7987c68c7ebd8c  bcachefs-tools-vendored-1.6.4.tar.zst
diff --git a/package/bcachefs-tools/bcachefs-tools.mk b/package/bcachefs-tools/bcachefs-tools.mk
new file mode 100644
index 0000000000..1a4ca15e8d
--- /dev/null
+++ b/package/bcachefs-tools/bcachefs-tools.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# bcachefs-tools
+#
+################################################################################
+
+BCACHEFS_TOOLS_VERSION = 1.6.4
+BCACHEFS_TOOLS_SOURCE = bcachefs-tools-vendored-$(BCACHEFS_TOOLS_VERSION).tar.zst
+BCACHEFS_TOOLS_SITE = https://evilpiepirate.org/bcachefs-tools
+BCACHEFS_TOOLS_LICENSE = GPL-2.0
+BCACHEFS_TOOLS_LICENSE_FILES = COPYING
+BCACHEFS_TOOLS_DEPENDENCIES = host-rustc host-clang keyutils libaio libsodium liburcu lz4 udev util-linux zlib zstd
+
+define BCACHEFS_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define BCACHEFS_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
