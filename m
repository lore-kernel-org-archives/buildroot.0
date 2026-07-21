Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5F2C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 07:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4CA540856;
	Tue, 21 Jul 2026 07:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY9kzK3KaFzn; Tue, 21 Jul 2026 07:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F8140849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784619234;
	bh=6YdlFZjGTG3U7m/qHBZdBVfU2e1QrM8w+oMvwM3XaoI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yo1LonH988PMOmAck2+E9txPmXDS4Vb5PAbXKpdkJulMiLzr5DmDw6YjuYZyEKCDT
	 3DbvNoNGbJh2paq8RF+VlSc0kA7W1+A71QcokvGiCUd6J3tthaqzCKvcubOQ3e4rJh
	 Xh51lXY3+g3RmqeHqzsJeoED+3trHAh6hwKKTPyJ2lDo7I6Mz5RlMAWBPjv6QQENAJ
	 Ubx6/5xMM8QyCyd3KPPW69WNSN/UI8LQ0y1aHYylB3Dkvwx7L5Rmlvqgh1nVggZ6l3
	 wvyEqxq5J7MZeng3FEk7d06MHAt3ns1gc4zyE18L09p/zK0WLwOWwLoOkeLJOyCJvy
	 eM+H24yUKuhbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F8140849;
	Tue, 21 Jul 2026 07:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DAE8109B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F7E080CCB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0hPTRyvGBaY for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 07:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7DAA80C68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DAA80C68
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7DAA80C68
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 07:33:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47db714766aso2580622f8f.0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 00:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784619229; x=1785224029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c1U8duZnAnEsw17Hpij7Uu/DAj3d7e9yJpWaNlJ6Jvc=;
 b=DNC+564+S1zipg9iEZiTcOGX8TLdQrGp3ek77GFVxeB9gxmMHLrixer3/EjY5/5TAb
 UcNB/jkmZ2xB9oQiUKzdsyFkGkyln6Xq5kFvAXaFR825A7YN4xi7cCC0qkGZCqi3ZeP6
 8MRdc3F6rgUEoOi/MrQqfE7RBGh3Y7jx7M1lV4Wx3H1mMKjJs5HoVk0sTPR3mv8FiSBv
 yLHhkbSQ3gmZ6KQ0WbV7v06KsvTPEEoWgKFiIqSMG4MEVZ5WVJZeGWOS1hj1eFj9qXcQ
 b8YMK1AulQS/57y3c3rvNwpxfvix7v47SdedGFQq+FFDEIbq9w6lQPyfL9s4pxZ11iNI
 kpQg==
X-Gm-Message-State: AOJu0Yzt1KpaEWZwl7rCxWTot2S0SaeC55bRrRy/66v3dOmH1kUC8dbh
 MJr7oLsY1fApmqsLZuzykQWbar92ISnhZyex/awIBLU/YgUyVcINlMuwMUMJsWM+H5A+1y4OHkf
 VNLNLj+o=
X-Gm-Gg: AR+sD123xDarsjc41L4M3jhHm3L7o+LQm6/sWOseNMrqRzb81jTtl9kagzzFo4xZAEd
 aiwykCgxAZ2z6ymwJ5WYbn7/ECuXKkMdXle8AhzlloHL9e+WynSce5+nblBZjQXE26OaUSbMjk6
 QtkJCjxgC7/lX9BiSdggVFsA7dYXSNaUaC1c2/+wBDxSzRtYBDJqc8Y7XD+MoM9lrzh1lFQN6p5
 kk7VDVxpgZlYG2/MBuJl9a7yg/F1CNoVulbmzeARy32x8LKUKIhNHALby0dLAt5ruCvTlpoB85R
 A36knvyh/iiWFCGO4twRW9CEgbwscDJwumYmTfKieAbFiCVuHEvhe0jWWr4PsLGUkxFPPTQU5hF
 +qabvehZiywBItvPWbmmAJ0pI/zdjB6jevZxrrAQnDGuOXXTvUevxHEKXb3Iv43WLGO7347GOI0
 yCKbC2rLYR4zmL9x22Wm31DT9vcN8tgNJpLNdFtPIXCn+yo//fCJEz+RHzazXQOOqTd0i2TJ2am
 NuSefa8ANrTu68NmBqtTS/+SVyl05SV5OpA9WutS7mF9qWyX0JH05ZGojgTqhC3U1Wme5420Tc3
 NSDljBvHnYgnMg==
X-Received: by 2002:a05:6000:41e4:b0:47a:b6a0:b024 with SMTP id
 ffacd0b85a97d-47f5a419835mr27217469f8f.4.1784619229431; 
 Tue, 21 Jul 2026 00:33:49 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.1.245]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e65644sm35195274f8f.16.2026.07.21.00.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 00:33:48 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Tue, 21 Jul 2026 09:33:46 +0200
Message-ID: <20260721073346.267538-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784619229; x=1785224029;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c1U8duZnAnEsw17Hpij7Uu/DAj3d7e9yJpWaNlJ6Jvc=;
 b=NtqS97jpWp4h3ATbc6U6qJzK6dOh1XVuhJvrnqSxw9kopmEUSzljfWFgbzz9yA3rJq
 U5YkzaRfBd5kxougRYWk1Df3/YYDAOOOPfNYzYVZz7VvH9dLLZE8DEz9cMqZcW1gLoJW
 Gu2sx7q8LTOWnXW2DmrKYl6lzFQJWswDRhXkE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NtqS97jp
Subject: [Buildroot] [PATCH v4] package/libcppconnman: add new package
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
Changes v3 -> v4:
  - Config.in: add BR2_TOOLCHAIN_HAS_SYNC_1 dependency on the example option,
    fixing the '__atomic_exchange_1' link failure of the connmanctl_dbus example
    on sparc and microblaze reported by the CI (its std::atomic<bool> needs
    libatomic on architectures without inline 1-byte atomics)

Changes v2 -> v3:
  - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++20 / <ranges>),
    fixing build failures on GCC < 10 toolchains reported by the autobuilders
  - Config.in, libcppconnman.mk: select and depend on readline for the example,
    fixing the missing readline library configure error when examples are enabled

Changes v1 -> v2:
  - add missing libcppconnman entry in package/Config.in
  - merge the DEVELOPERS addition into this patch

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libcppconnman/Config.in          | 29 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 25 ++++++++++++++++++++
 5 files changed, 59 insertions(+)
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
index 0000000000..9a51c8bd44
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
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
+comment "libcppconnman needs a toolchain w/ C++20, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # std::atomic<bool>
+	select BR2_PACKAGE_READLINE
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
index 0000000000..1b41db3a0c
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,25 @@
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
+LIBCPPCONNMAN_DEPENDENCIES += readline
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
