Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D56DD2F7D1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 10:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046CA60D5C;
	Fri,  5 Dec 2025 10:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSQsAUSaFxM1; Fri,  5 Dec 2025 10:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8325C607D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764929207;
	bh=64APAUBMWKpM4o62uWSp88QxEPMAxXe1PpxWkM8JFD8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CCe1F4Gb1PYhySYzmXi82y/z7AhCCEVnAIqFUCTSXKb65kRlndb8aWiUCZ4y7FWuI
	 xeZlAloykl2znasqV1ATMuiO+KW3dDjIzWcYlkWvYRCAspGNkZsPpvZPkzDaJWLmj1
	 RleDRzXvofpz7F7tYDdFoxZZCzFATTzMAJoiYAjBIjpr7za9485Fb/U7Zo/0Pbydqa
	 XZ8SVDN9WW3PmWqG859X0zGyX9Kip4L5ChXjEd4UpuvLqXZrBQ8BKSsB8OaVbUxdST
	 EwvmYoHJYyNc2703H6xJYDBBVzcMXIYFVxg8AoYN/Ogi5rXFpmeWQ518YgE98mi5MR
	 YXvABVYjXjm7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8325C607D5;
	Fri,  5 Dec 2025 10:06:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 798251A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE3184670
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9W64MaTgXYF9 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 10:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D80F845F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D80F845F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D80F845F4
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5FD1EB0057C;
 Fri,  5 Dec 2025 11:06:39 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Fri,  5 Dec 2025 11:06:26 +0100
Message-ID: <20251205100626.66819-3-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205100626.66819-1-vjardin@free.fr>
References: <20251205100626.66819-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764929201;
 bh=7ZkW2UiARpxz3Iwa7i4KbzOhzUxgt7nrv6l0LA4d4mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VmYfR1FbPeAo+jvnEUAqci5UVS9K+fZ4aHb4g57mWlcAePbodJNwW5b3bO3LW1ub0
 ooWsokPVmzue931+Zn4witqyYo4+KVS52UZ47B3ONdsoTJ1zpjzJJ3m3WLKt+Ihkec
 X6W5nm/6apRrvbhsh72dRVH4i0PgAXMV0BhxpNrmUsy+bVdJG9uSquP9+D4fY5gM0A
 OokFtkPXMBw76MKw9AO6uR9JdbtuR4/NLklFUJs9T7teWt2FlFFF4fp+x7sY13omSB
 bUzViJNWZmlw7PjW1HeD01H0RUflRezGuHdMwWasJeqCQ2iOL7xAW6rL0aR652dGwl
 i2hMDqlPNDEyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VmYfR1Fb
Subject: [Buildroot] [PATCH 2/2] package/sysrepo-cpp: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a Buildroot package for sysrepo-cpp, providing modern C++ RAII
bindings for the sysrepo YANG datastore library.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/sysrepo-cpp/Config.in        | 20 ++++++++++++++++++++
 package/sysrepo-cpp/sysrepo-cpp.hash |  3 +++
 package/sysrepo-cpp/sysrepo-cpp.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/sysrepo-cpp/Config.in
 create mode 100644 package/sysrepo-cpp/sysrepo-cpp.hash
 create mode 100644 package/sysrepo-cpp/sysrepo-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b5d0839bf..ef3fc769f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3346,6 +3346,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index b5892fe28b..7091249b4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2142,6 +2142,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/sscep/Config.in"
 	source "package/sysrepo/Config.in"
+	source "package/sysrepo-cpp/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
diff --git a/package/sysrepo-cpp/Config.in b/package/sysrepo-cpp/Config.in
new file mode 100644
index 0000000000..5cdfefa025
--- /dev/null
+++ b/package/sysrepo-cpp/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SYSREPO_CPP
+	bool "sysrepo-cpp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_LIBYANG_CPP
+	help
+	  C++20 RAII bindings for the sysrepo YANG datastore library.
+
+	  This library provides modern C++ object-oriented bindings on top
+	  of sysrepo, using RAII for automatic lifetime management.
+
+	  https://github.com/sysrepo/sysrepo-cpp
+
+comment "sysrepo-cpp needs a toolchain w/ C++, threads, dynamic libs, gcc >= 10"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		   BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/sysrepo-cpp/sysrepo-cpp.hash b/package/sysrepo-cpp/sysrepo-cpp.hash
new file mode 100644
index 0000000000..43a1bc439f
--- /dev/null
+++ b/package/sysrepo-cpp/sysrepo-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d7fbeaba7f2fdaf70c67cc70f438943eee636b21f08854e58967d0d97801bacc  sysrepo-cpp-6.tar.gz
+sha256  82e3758011ec44c78e98d0777799d6e12aec5b8a64b32ebb20d0fe50e32488bb  LICENSE
diff --git a/package/sysrepo-cpp/sysrepo-cpp.mk b/package/sysrepo-cpp/sysrepo-cpp.mk
new file mode 100644
index 0000000000..bbe81289b1
--- /dev/null
+++ b/package/sysrepo-cpp/sysrepo-cpp.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sysrepo-cpp
+#
+################################################################################
+
+SYSREPO_CPP_VERSION = 6
+SYSREPO_CPP_SITE    = $(call github,sysrepo,sysrepo-cpp,v$(SYSREPO_CPP_VERSION))
+
+SYSREPO_CPP_LICENSE = BSD-3-Clause
+SYSREPO_CPP_LICENSE_FILES = LICENSE
+
+SYSREPO_CPP_INSTALL_STAGING = YES
+SYSREPO_CPP_INSTALL_TARGET  = YES
+
+SYSREPO_CPP_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DBUILD_TESTING=OFF \
+	-DWITH_DOCS=OFF \
+	-DWITH_EXAMPLES=OFF
+
+SYSREPO_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+SYSREPO_CPP_DEPENDENCIES = sysrepo libyang-cpp
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
