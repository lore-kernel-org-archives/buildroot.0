Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606AAD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 270BA8277E;
	Wed,  7 Jan 2026 17:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vMrSXssbpbj; Wed,  7 Jan 2026 17:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E51182751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808498;
	bh=kpz5kY82gq+ABTqP1ExGyd2lMQm0FMXJfcozVotLbvo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rQwnBGeJtKhONjFzgmbD3DNHtqjlMeKT4gdWf/KQ5Rs4sjblfFEIex6bE+5c6FJh8
	 ON/0ttB3J5KsfSvdALboliSuexSe0Uit+SR2THaOeyOTmWQg+e7cJkeLn1vQOc0FwC
	 48ukFvcKFwl2wDse99fTKLyfxboSXcCi5v9sl5IPt/xxRnPgAAab2+yOi8yR0fdFRo
	 95e/MOgNZoXOIaEe19IdYI3ouNqMt4uo9dU3p7QgpVTfxzWgjqtL+o/b8weY/3FcHG
	 KA2EbFKkCN6qVQgANqj/plx61Ctk5F1decs2ZxvX2UFtQiUTOaY3v3v+tyeFYERJL7
	 evA5RHsQe7UJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E51182751;
	Wed,  7 Jan 2026 17:54:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D60539ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C899E8222C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4rBPoXrY1Ac for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B709482281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B709482281
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B709482281
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:56 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E73E713F86E;
 Wed,  7 Jan 2026 18:54:52 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:54:46 +0100
Message-ID: <20260107175446.2470125-3-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107175446.2470125-1-vjardin@free.fr>
References: <20260107175446.2470125-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808495;
 bh=ECHko/SEUhimY8VvHch9gtNgw1TZIQpZBTMHmGm3I9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pPrYhNVE4NICIQDQtDJCbNgyJXQ+YGwHx4fNXbmiQcO06a9pKMlQJjLsYe3IaPX7g
 AzWUTce2+7T1PzSu6cuu1Mrp7/uLEeVR04AoJrSySXgRg4KJCaahUebkt/hYSZODD3
 /3Sv9ipwHc1Rl8U7BoG891V6MIKQOveTcCpy9pXC2qozTQY24CB6WXizlilUcgcUJ/
 Q1NFnmt8uHhewwg6S+OXZn0n+C0d//L0zljJdMPix9P5ULh1MNcXBH7bPtEBk/SZCI
 TBk6ZkWIyWgUeRlDps6qeFv6QysDNyoGdwzKiPzTB9vn68LYFlM7vz4Lyj/9/LQFc+
 G7ax36o3+IW0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pPrYhNVE
Subject: [Buildroot] [PATCH v1 2/2] package/python-sysrepo: new package
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

Python CFFI bindings for the sysrepo YANG datastore. This package
provides the 'sysrepo' Python module which talks to the C sysrepo
library.

Also fix sysrepo build on riscv32 where glibc doesn't define
SYS_futex (only SYS_futex_time64). Use pthread-based condition
variables instead of futex on this architecture.

Upstream: https://github.com/sysrepo/sysrepo/issues/3346

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/python-sysrepo/Config.in           | 26 ++++++++++++++++++++++
 package/python-sysrepo/python-sysrepo.hash |  5 +++++
 package/python-sysrepo/python-sysrepo.mk   | 18 +++++++++++++++
 package/sysrepo/sysrepo.mk                 |  7 ++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/python-sysrepo/Config.in
 create mode 100644 package/python-sysrepo/python-sysrepo.hash
 create mode 100644 package/python-sysrepo/python-sysrepo.mk

diff --git a/package/python-sysrepo/Config.in b/package/python-sysrepo/Config.in
new file mode 100644
index 0000000000..ce6b8611f2
--- /dev/null
+++ b/package/python-sysrepo/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_PYTHON_SYSREPO
+	bool "python-sysrepo"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_SYSREPO
+	# Python3 doesn't work with uClibc and kernel headers < 5.1
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	select BR2_PACKAGE_PYTHON_LIBYANG
+	help
+	  Python CFFI bindings for the sysrepo YANG datastore.
+
+	  This package provides the 'sysrepo' Python module which
+	  talks to the C sysrepo library packaged as
+	  BR2_PACKAGE_SYSREPO.
+
+	  Upstream project name on PyPI is 'sysrepo'.
+
+	  https://github.com/sysrepo/sysrepo-python
+
+comment "python-sysrepo needs python3, uClibc needs kernel headers >= 5.1"
+	depends on !BR2_PACKAGE_PYTHON3 || \
+		(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1)
+
+comment "python-sysrepo needs sysrepo"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	depends on !BR2_PACKAGE_SYSREPO
diff --git a/package/python-sysrepo/python-sysrepo.hash b/package/python-sysrepo/python-sysrepo.hash
new file mode 100644
index 0000000000..4b70cd12da
--- /dev/null
+++ b/package/python-sysrepo/python-sysrepo.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/sysrepo/1.7.6/json
+sha256  d257f20ed134c00676ef38ce858a4e16ca573214d9fbf03078383f0ef8d17641  sysrepo-1.7.6.tar.gz
+
+# Locally computed
+sha256  c47e5249d2dff016106bf7395df1d94c7c5d74a36d64b81d96637f1f25dff4da  LICENSE
diff --git a/package/python-sysrepo/python-sysrepo.mk b/package/python-sysrepo/python-sysrepo.mk
new file mode 100644
index 0000000000..5e9e97df25
--- /dev/null
+++ b/package/python-sysrepo/python-sysrepo.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-sysrepo
+#
+################################################################################
+
+PYTHON_SYSREPO_VERSION = 1.7.6
+PYTHON_SYSREPO_SOURCE = sysrepo-$(PYTHON_SYSREPO_VERSION).tar.gz
+PYTHON_SYSREPO_SITE = https://files.pythonhosted.org/packages/source/s/sysrepo
+PYTHON_SYSREPO_SETUP_TYPE = setuptools
+
+PYTHON_SYSREPO_LICENSE = BSD-3-Clause
+PYTHON_SYSREPO_LICENSE_FILES = LICENSE
+
+PYTHON_SYSREPO_DEPENDENCIES = sysrepo
+PYTHON_SYSREPO_DEPENDENCIES += python-libyang
+
+$(eval $(python-package))
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 59dc59a5df..329c0ee7c6 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -26,6 +26,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+# riscv32 glibc doesn't define SYS_futex (only SYS_futex_time64)
+# Use pthread-based condition variables instead of futex
+# https://github.com/sysrepo/sysrepo/issues/3346
+ifeq ($(BR2_RISCV_32),y)
+SYSREPO_CONF_OPTS += -DSR_COND_IMPL=sr_cond_pthread
+endif
+
 define SYSREPO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysrepo/S51sysrepo-plugind \
 		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
