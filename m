Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE69C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F3560F4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F3560F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2920D400DE;
	Sun, 10 Oct 2021 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8K1KFiVIuKZk; Sun, 10 Oct 2021 17:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8E4B400EE;
	Sun, 10 Oct 2021 17:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457271BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412C0400EE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMJJ9VFiE428 for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E04DD400DE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:09:09 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id e63so703571oif.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLON1O8etHiYXfOSWlCoIj1ujhgsPZO7IWzTt+axNXU=;
 b=EOTYEk0i7mmLKvfvU4jQrdhuS7NI+Qp29Taiq/f/bU8sCpzqmj+/eCcRxQVcgeGJER
 /JlUkuK2T7juQ7PPTbEkX3OjJ6iZTVgC+trYAfVy5JYw02rh7LOXtEi9MEyaPb5JVtoX
 U5UIaSBbTTQZp9tmC/CFKM5RTcS6USM2wxPV3m8ZBOmmEZMoMSAMiCFTPmqe0IBBq6Fz
 Clq57D3p+/PEsaHIFzScEx3Moin9wBfVDUwz9Dqcz6vsgVmuRppWgeYNaYyzlQ4w+/0Z
 yjQYOKyR1nuXt/9AnUQc99PsYdSGEeeEAI1htHNMe1la/gXE94g/vzMHZ1t0LLTMGPAd
 ezrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLON1O8etHiYXfOSWlCoIj1ujhgsPZO7IWzTt+axNXU=;
 b=MTWA3jnJQtTge4mA9JMVAkRpIWfZdbCSbDPVsX3beaZ+7eT3uGpMhE+54huzM7n+Os
 uaxoN/0yWMUhWW7wiOc7Mi+aPNoaPk2y0H84irY76RqfuC+LZAWlb5zqUlT6OA3NOce+
 /YMTOKqQG0vE93dxe/JY5FrwkyOyR6SYji5SSU9iu8PYbh5DDo4XP98CFg/Do0FKcc/9
 LwuMi6Gg1uCr0Y1m9nmJ+K8Y9pqq4Yvop23bpJVghYixxlCXIqvuYMBuhafrSB/ZeBRJ
 ZKtpqK8gWjlQ0NP4kbc/1zenuVktsQWXWbQ6TmjpH/ANhOMjRsHcEGIbm3e0fxE1if+3
 itNw==
X-Gm-Message-State: AOAM533Kcvce5y3p5dfUMDfkNqTaiNGw5tXgIIl2RIBgkanWz9OQWWvZ
 CH3W7MRu0Srs+XxytxPtI6cPZ9JsGIgsVCr/
X-Google-Smtp-Source: ABdhPJzbf3AC374fgXiEDT667bB2mJPdmMoW15d/pSN/Toklu3F3u7sONKSdVdLEp56Yv9CJf1DCnA==
X-Received: by 2002:aca:a94c:: with SMTP id s73mr17163594oie.93.1633885748601; 
 Sun, 10 Oct 2021 10:09:08 -0700 (PDT)
Received: from localhost ([189.174.209.191])
 by smtp.gmail.com with UTF8SMTPSA id y9sm1239394ote.39.2021.10.10.10.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 10:09:08 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 18:09:05 +0100
Message-Id: <20211010170906.388594-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package: add smpq and stormlib
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SMPQ is a utility for working with Blizzard MPQ archives and StormLib is
the library for doing this that it depends on.

SMPQ/StormLib is a runtime and/or build-time dependency of several
source ports / reimplementations of Blizzard games, such as DevilutionX.

These packages are already available in other distros, such as Debian.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/Config.in              |  2 ++
 package/smpq/Config.in         | 11 ++++++++++
 package/smpq/smpq.hash         |  3 +++
 package/smpq/smpq.mk           | 37 ++++++++++++++++++++++++++++++++++
 package/stormlib/Config.in     |  8 ++++++++
 package/stormlib/stormlib.hash |  3 +++
 package/stormlib/stormlib.mk   | 16 +++++++++++++++
 7 files changed, 80 insertions(+)
 create mode 100644 package/smpq/Config.in
 create mode 100644 package/smpq/smpq.hash
 create mode 100644 package/smpq/smpq.mk
 create mode 100644 package/stormlib/Config.in
 create mode 100644 package/stormlib/stormlib.hash
 create mode 100644 package/stormlib/stormlib.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..890a6be135 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -74,6 +74,7 @@ menu "Compressors and decompressors"
 	source "package/p7zip/Config.in"
 	source "package/pigz/Config.in"
 	source "package/pixz/Config.in"
+	source "package/smpq/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
@@ -1360,6 +1361,7 @@ menu "Compression and decompression"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
+	source "package/stormlib/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/smpq/Config.in b/package/smpq/Config.in
new file mode 100644
index 0000000000..589f5cf834
--- /dev/null
+++ b/package/smpq/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SMPQ
+	bool "smpq"
+	select BR2_PACKAGE_SMPQ
+	help
+	  StormLib MPQ archiving utility
+
+	  This utility manipulates Blizzard MPQ archives.
+	  It supports extracting, appending, renaming and deleting files
+	  in MPQ archives, and creating new MPQ archives.
+
+	  https://launchpad.net/smpq
diff --git a/package/smpq/smpq.hash b/package/smpq/smpq.hash
new file mode 100644
index 0000000000..f14eaef49b
--- /dev/null
+++ b/package/smpq/smpq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb  smpq_1.6.orig.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/smpq/smpq.mk b/package/smpq/smpq.mk
new file mode 100644
index 0000000000..6696c88f9c
--- /dev/null
+++ b/package/smpq/smpq.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# smpq
+#
+################################################################################
+
+SMPQ_VERSION = 1.6
+SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
+SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
+SMPQ_DEPENDENCIES = stormlib
+HOST_SMPQ_DEPENDENCIES = host-stormlib
+SMPQ_LICENSE = GPL-3.0+
+SMPQ_LICENSE_FILES = LICENSE
+SMPQ_INSTALL_STAGING = YES
+SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+
+# The StormLib version check in SMPQ CMake is broken. Disable it.
+define SMPQ_DISABLE_VERSION_CHECK
+	$(SED) 's/try_compile(CHECK.*/set(CHECK ON)/' $(@D)/CMakeLists.txt
+endef
+
+define SMPQ_DISABLE_MANUAL
+	$(SED) 's|if(NOT CMAKE_CROSSCOMPILING)|if(FALSE)|' $(@D)/CMakeLists.txt
+endef
+
+# StormLib is C++ and must be linked with a C++ linker (e.g. via g++ instead of gcc).
+define SMPQ_SET_LANG_TO_CXX
+	$(SED) '/^project/a file(GLOB_RECURSE CFILES "$${CMAKE_SOURCE_DIR}/*.c")\$(NEWLINE)
+SET_SOURCE_FILES_PROPERTIES($${CFILES} PROPERTIES LANGUAGE CXX)' $(@D)/CMakeLists.txt
+endef
+
+SMPQ_POST_PATCH_HOOKS += SMPQ_DISABLE_VERSION_CHECK SMPQ_DISABLE_MANUAL SMPQ_SET_LANG_TO_CXX
+HOST_SMPQ_POST_PATCH_HOOKS += SMPQ_DISABLE_VERSION_CHECK SMPQ_DISABLE_MANUAL SMPQ_SET_LANG_TO_CXX
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/stormlib/Config.in b/package/stormlib/Config.in
new file mode 100644
index 0000000000..b2e4df3c62
--- /dev/null
+++ b/package/stormlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STORMLIB
+	bool "stormlib"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	help
+	  StormLib is a library that reads and writes Blizzard MPQ archives.
+
+	  https://github.com/ladislav-zezula/StormLib
diff --git a/package/stormlib/stormlib.hash b/package/stormlib/stormlib.hash
new file mode 100644
index 0000000000..dc5370b03d
--- /dev/null
+++ b/package/stormlib/stormlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  53b8befda3855a922e57a27f78c36feba7e9a32804da4b6592a3670c4e9cec98  stormlib-5ab093b7a57b8779dff06a08fac19d46c40b3329.tar.gz
+sha256  50b128e6750ed9d887e7a5748a6021238bb2f3bf34a5dd2768c410d932069e35  LICENSE
diff --git a/package/stormlib/stormlib.mk b/package/stormlib/stormlib.mk
new file mode 100644
index 0000000000..a2e58aa983
--- /dev/null
+++ b/package/stormlib/stormlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# stormlib
+#
+################################################################################
+
+STORMLIB_VERSION = 5ab093b7a57b8779dff06a08fac19d46c40b3329
+STORMLIB_SITE = $(call github,ladislav-zezula,StormLib,$(STORMLIB_VERSION))
+STORMLIB_DEPENDENCIES = zlib bzip2
+HOST_STORMLIB_DEPENDENCIES = host-zlib host-bzip2
+STORMLIB_LICENSE = MIT
+STORMLIB_LICENSE_FILES = LICENSE
+STORMLIB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
