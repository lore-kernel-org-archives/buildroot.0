Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D022C44507
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 09:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFED140850;
	Fri, 17 Jul 2026 09:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0P7fnzc-QIQ; Fri, 17 Jul 2026 09:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F8A409DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784280778;
	bh=5dCPRlr8nN2CuccN7LyL3SfUHGwLSfST7usEcLWoz4c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VkXKH1XYz28ofS+9xq5JfpgJqZF6sQ/RtC2fn6AP/xL9DMGTludXQEyseyytUWIbb
	 AlvKgfh0XDmd3GqwhsG4O4yUac3XZtO943KGNs35JclvS7UzcyC/PQbh29CXoXK4K5
	 mRD/EgO8B02Mb3/PhZRY0CjJvGi5AfbeKv+aZ5E53PyrSG/onO3mikVMGHguFrlvYi
	 28/H0Y5M7taktN8MfFLj4hiT4HxniBY+x0PDSgEoR62VM1HFwB8ep0kXkruJ/qYsdu
	 q4J2AmBNmbHWPlaOM3w/Bjm2HKltQbYUcjyq9FrKTa9SuzaE/b4sTZilS5ogu5KNre
	 zOM5GDlHRfkeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F8A409DA;
	Fri, 17 Jul 2026 09:32:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8B836E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 09:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01BF36084B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 09:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MH2O9Jla8nCa for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 09:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 885246078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885246078C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 885246078C
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 09:32:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4954d383e64so29775e9.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 02:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784280773; x=1784885573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d0SHLnZMz0udmKMGSOnKhrCu9Cq5PHhjqrw+IQRE1W8=;
 b=gfBy4Xx98b6R+rKTp6edsaFgegPiMq4K3I5AUZxK1v31U0Zxx3iayhn8uw07U+TvhV
 e85cvxvqoHeigQYc3rEE16v9kvBT1jadnuh86S+iblGLev/m31qxv7H7WbyUZ2K3jF1a
 CJoaj5dEfIiDde47/YyQNAf1TyD3lhTNkXMnWvaQeVlKzjmbsK9uymQoxYpBvId3u6MV
 epiFvtNMxO6jysBV114mvp6ODPHfxEy2Wjk/h2BiwlakCGATvVm3H0ZLBXJW/nF7IcpY
 Dc/50Qw9bam1YnHhxgVsBDh1uSsYdhVMTq3tGCyqtvIr7MaFj5xFvuWaHPpOVycPAWXz
 XBQQ==
X-Gm-Message-State: AOJu0Yz7zvxOjqIIib62XmUYfkvJzZUwVs8xr0Lh55EvHuZ0BM8xJ184
 c7rJxgX3e6Nq42NGkXPOz0NZ9gGaQfPM7ekPZp/lDV8/+9EJ2N9XworABgGXSPIof96I9I1AI2p
 mOqIZTQM=
X-Gm-Gg: AfdE7cmqo4BGa23VAjAyMMQ9aGlyAxPwA0gNkKiLR/j/cqFFIwBJJ80mSBQHP2wshnC
 27GDPOrct1QT5lrfcIR5MNhTGM+1U9upIjyeAe1baR0LEOBlhtZfBODhBVvZ4Lrmvc+DlE0Acl9
 pcM9m7JY1XBibpVTVCryE1HI5zKoZerKhPLyg4mpVoJJub3HG09lFRD/QcUJ/rC2X7C+9IPYN8q
 nJSUIHiC7sK/93noccR4xsGf0vdAqUu5efYADI+uAoP7VjVVA6o9XX83kWgmbx16+7jOoKhDk2C
 YXJsKwoaKpj5qoWmxNj1RIlWjfvj8WoMUhRv2EwoIZCfyAEddrZUsrMwRZA8HSeoR6roMewPGjc
 LRF+Ie9CHGIhdHkztFW1Mo0tk/PH5XNqxGRM69bOQJreUNtZLtkdn1zgEBH53XfhavL0uNWHuVD
 nr3DBb0/zNqfhv3v1UGxj3UXU7Acq8J02y203MzfD0tY77npe+Ui9uSHW5Kq5LEr/nXfVbvSmJq
 BCat+ue+NlTnQtzateJy+yv0aFmWdTVLJvn2VbkJC5x2Kx4l/Q9j+/bqki4ITWHQ9U5OekTeQNZ
 Bj7nOrJvjSbCzA==
X-Received: by 2002:a05:600c:138f:b0:495:4a34:16d9 with SMTP id
 5b1f17b1804b1-4954a50ea3bmr20808155e9.31.1784280773140; 
 Fri, 17 Jul 2026 02:32:53 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.1.245]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49acesm2129679f8f.6.2026.07.17.02.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 02:32:52 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Fri, 17 Jul 2026 11:32:48 +0200
Message-ID: <20260717093249.2183039-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784280773; x=1784885573;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d0SHLnZMz0udmKMGSOnKhrCu9Cq5PHhjqrw+IQRE1W8=;
 b=EQ15N5KJoNmxCegVUEUFQu5qfksREFKQICDYkU2XL0M/4VB+dHrwgUbhMklK2YBECc
 udIFY0B1yrSvTYWetoOkxJ5lZT3ag450MzbQRa/qiVkhR70m3kTV28u1BZ8wyVq+A/kM
 tDuGetaBBDgUNprqZqWuxUpsUbe4mBGJ1HhGc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EQ15N5KJ
Subject: [Buildroot] [PATCH v2] package/libcppconnman: add new package
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

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Also add myself to DEVELOPERS for this package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - add missing libcppconnman entry in package/Config.in
  - merge the DEVELOPERS addition into this patch

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/libcppconnman/Config.in
 create mode 100644 package/libcppconnman/libcppconnman.hash
 create mode 100644 package/libcppconnman/libcppconnman.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 42418d01a2..997fd6be74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
diff --git a/package/Config.in b/package/Config.in
index 015f635ad1..fc1e57d30d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Networking"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
+	source "package/libcppconnman/Config.in"
 	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..19dc0bbd2d
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	help
+	  Compile CLI example.
+
+endif
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..70960d4a17
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5eb38232c3f9fcf2136c6508472841f6ee88d7155c384f4e6f2f3de1cd2fba62  libcppconnman-2.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..b2a445cb2c
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 2.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
