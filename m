Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00871EE57E0
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4781C405D8;
	Fri,  8 Sep 2023 08:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4781C405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IA-vLPqNVmj; Fri,  8 Sep 2023 08:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 801CA4058F;
	Fri,  8 Sep 2023 08:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801CA4058F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CB531BF328
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24EEB4058F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 08:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24EEB4058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svz4kRx2tAKQ for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 08:25:27 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AC2C40338
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 08:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC2C40338
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ba1e9b1fa9so31573771fa.3
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 01:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694161524; x=1694766324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klbauNNci0+RV/lZH6FLkXedy3AFJIseruzF6mU7DBY=;
 b=U46nzm57xkuxaUEdKN6a0hv197YSQ759y4LJk2X0dK7m9XcR790NnbST9cFxA1kQTU
 g+Ypc9SNstHE8UREBQKZ7DM3foPrtLHvGJ171FdJMlfrkjYtcSp0kocJQhdDCP6rE4Bh
 yEd+s8rZ6hjnK4z9fiHcpGrBVRx2tVkUCDoYkCgkVICbPUJy7Nh9em4iR4hUKWlToE1T
 0kVrNopqSbSciGVbpl9O+VYlnZmrMD9zI3kL/NQFA1jRcfz3gUbtybykySdjCotDlxkg
 kc59wda9mLm4yQFo/XQ6g+hz+1Jm86qyU/jWRaHlNi43AABD6+gFkuvykfCiyrR1iR0y
 TzeA==
X-Gm-Message-State: AOJu0YxMBO1PotzLW6k2qeei9EMhgBh/U0rsbg3t+gJOwDiBbDfbMhbK
 g6+4H41KU6G2iGMrGADocL/KmU/bq7B3Tw==
X-Google-Smtp-Source: AGHT+IHUOepDOngkaIU4Vj13IH4wwTEBGwSIvFZU+n9uErLM1nabiA5W8Stzh+0eFv6Zm6PTcW6izw==
X-Received: by 2002:a2e:9153:0:b0:2bc:fd7c:cd6d with SMTP id
 q19-20020a2e9153000000b002bcfd7ccd6dmr1348161ljg.4.1694161523214; 
 Fri, 08 Sep 2023 01:25:23 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e3517000000b002b9f0b25ff6sm217849ljz.4.2023.09.08.01.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 01:25:22 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 10:27:40 +0200
Message-ID: <20230908082741.409005-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694161524; x=1694766324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=klbauNNci0+RV/lZH6FLkXedy3AFJIseruzF6mU7DBY=;
 b=Xd2BFrjoWwrAY2NwU8fFMQ8uObSXFpA+S1yBYOHaXEHtIQ5vwH54uTambPf+PWAPW5
 0/SrHqJnWNr+y4310wJTXMbUVBkjsahG+MEAReJVqFIDhjUg3t9fiZVaUmuAKUgsGl8J
 kMrissZkTnD69C9rZ/E+zvOIH8m8iZlhgnkJZl1Lf0jOM9zXIuWGMTbi8VEB3kQDYC8/
 8F79jZHywrwJba4kmWrgNjEOSxiHEweLr4AgcdPm/LflfThKZaPDnEIqG9Bm6sVnxyHk
 roLIIFbE88a1Nv6p4N2RwvGqjW5LHAWhbiaq1S/q2eqj/1mVRerfEId9cBKq3z9tmLK4
 41RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Xd2BFrjo
Subject: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Checkpoint/Restore In Userspace (CRIU), is a software tool for the Linux operating system to make it possible to freeze a running
application and checkpoint it to persistent storage as a collection of files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/Config.in      |  1 +
 package/criu/Config.in | 28 ++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 +++
 package/criu/criu.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 package/criu/Config.in
 create mode 100644 package/criu/criu.hash
 create mode 100644 package/criu/criu.mk

diff --git a/package/Config.in b/package/Config.in
index b21a2f8c65..c6c809f59c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2665,6 +2665,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
new file mode 100644
index 0000000000..158e7ced57
--- /dev/null
+++ b/package/criu/Config.in
@@ -0,0 +1,28 @@
+menuconfig BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_STATIC_LIBS # protobuf, libbsd
+	depends on BR2_USE_WCHAR #libbsd
+	depends on BR2_USE_MMU #libcap
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PIP
+	help
+	  Checkpoint/Restore In Userspace (CRIU), is a software tool for the Linux operating system to make it possible to freeze a running 
+	  application and checkpoint it to persistent storage as a collection of files.
+
+comment "criu needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
new file mode 100644
index 0000000000..2c4a07252b
--- /dev/null
+++ b/package/criu/criu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
new file mode 100644
index 0000000000..01b07e3f3f
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz
+CRIU_SITE = https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)
+
+CRIU_LICENSE = GPL-2.0
+CRIU_LICENSE_FILES = COPYING
+CRIU_DEPENDENCIES = host-pkgconf host-protobuf-c host-python3 host-python-pip libaio libbsd libcap libnet libnl protobuf protobuf-c python3
+
+CRIU_CFLAGS = $(TARGET_CFLAGS)
+CRIU_CFLAGS += -D__WORDSIZE -D__USE_GNU -D_GNU_SOURCE
+
+CRIU_MAKE_ENV = $(TARGET_MAKE_ENV)
+CRIU_MAKE_ENV += WERROR=0
+
+#Needed as it adds strange paths to the tool otherwise. E.g.  $CROSS_COMPILE/usr/bin/gcc
+CRIU_MAKE_ENV += HOSTLD=ld
+CRIU_MAKE_ENV += HOSTCC=gcc
+
+#x86_64 is treated as x86 in criu
+ifeq ($(BR2_ARCH),x86_64)
+	CRIU_MAKE_ENV += ARCH=x86
+else
+	CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)
+endif
+
+define CRIU_BUILD_CMDS
+    rm -rf $(@D)/images/google/protobuf/descriptor.proto
+    ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(CRIU_CFLAGS)" -C $(@D)
+endef
+
+define CRIU_INSTALL_TARGET_CMDS
+	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install-criu install-lib install-compel
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
