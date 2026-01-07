Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C833D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5CF83848;
	Wed,  7 Jan 2026 18:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x19beV9iZLnV; Wed,  7 Jan 2026 18:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6236983852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809025;
	bh=3iZW7wZTWavdJ1jdZWp1Er0ENXy2MILAWBXI7835wbg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HkLx+kgASZ/JaH0xQ1JMR5Hhe1Js/lIkkLv9Jwk6jKDteuDDGbSDckKNXufnP2xQE
	 sgxbtKKLkf0wfIg2hD818dKJy/dqPMjrHjRGx5Ic3WAIaLsPTTUeNcmB8Ju+CC4Sus
	 fbAseaCjSkLbDv3bzHhjkbFhoIarJ0oM/KVudnHmdaRqiz+IdLkdmfHtb8tbmTZMQq
	 JC2HejOGqKKKjHsX4V1yiipaf8GyvQEGYx/zkG2lfmVw0z+MUsZkGOA9TLmviZn5AM
	 jABgIt/q4+OCrSrZt5zf3XwaZD28Unyinz10lw5I76gbHIMj7Haj8uY+4ULtk/aAta
	 3Hc7Uk/kCzhJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6236983852;
	Wed,  7 Jan 2026 18:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE91E9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C565B8302F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63a9cFMGt5Nz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C618083022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C618083022
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C618083022
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:26 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1ED3E13F8B5;
 Wed,  7 Jan 2026 19:02:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:02:19 +0100
Message-ID: <20260107180219.2470568-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107180219.2470568-1-vjardin@free.fr>
References: <20260107180219.2470568-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808945;
 bh=nPa2FX+8aO2M+MK2iKgOt0XH7UIH+enPmihs+6uFPp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fx6KRq9/T8FUkDSyrS2FHGqSSsOWc0HUs/z1GTgkZQ/v4rY34IgOfJ7Q0gYzI1Tmg
 dhHXFmYvVmtFC57a+JgvcL2YXO8tsIAsZzvJZ7N8PwsUSm06Gxd7CNUJez2cEOKZnd
 CuZxfgMsDRFbN9K61sxIohl4RQ3Il4w4U0lp0jd7lMdzhQHLt1yPxEhhoxxH1iKOnv
 ATNifsGAzRCfyb3vSm/ZE9cFacy4i4eBa9MUq7CuBKTftAbwvayzdtIin4EMyuAasj
 rlP6TedgkD9VRDbZceIHSJl5YCv7FGGIFPD6fk3f+fUst/H5VRDkYLI0H1guF8lIIx
 HZOoewtwIxA+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fx6KRq9/
Subject: [Buildroot] [PATCH v1 1/1] package/python-sysv-ipc: new package
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

python-sysv-ipc provides Python bindings for System V IPC primitives
(semaphores, shared memory and message queues).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                   |  2 ++
 package/Config.in                            |  1 +
 package/python-sysv-ipc/Config.in            | 14 ++++++++++++++
 package/python-sysv-ipc/python-sysv-ipc.hash |  6 ++++++
 package/python-sysv-ipc/python-sysv-ipc.mk   | 16 ++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/python-sysv-ipc/Config.in
 create mode 100644 package/python-sysv-ipc/python-sysv-ipc.hash
 create mode 100644 package/python-sysv-ipc/python-sysv-ipc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..cb4ebf7f33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,8 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/python-sysv-ipc/
+F:	package/rpmsg-echo-test/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..0ad8ecc50d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1435,6 +1435,7 @@ menu "External python modules"
 	source "package/python-starlette/Config.in"
 	source "package/python-sympy/Config.in"
 	source "package/python-systemd/Config.in"
+	source "package/python-sysv-ipc/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
 	source "package/python-telnetlib3/Config.in"
diff --git a/package/python-sysv-ipc/Config.in b/package/python-sysv-ipc/Config.in
new file mode 100644
index 0000000000..6fc057f30a
--- /dev/null
+++ b/package/python-sysv-ipc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_SYSV_IPC
+	bool "python-sysv-ipc"
+	depends on BR2_PACKAGE_PYTHON3
+	# Python3 doesn't work with uClibc and kernel headers < 5.1
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	help
+	  System V IPC primitives (semaphores, shared memory and
+	  message queues) for Python.
+
+	  https://github.com/osvenskan/sysv_ipc
+
+comment "python-sysv-ipc needs python3, uClibc needs kernel headers >= 5.1"
+	depends on !BR2_PACKAGE_PYTHON3 || \
+		(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1)
diff --git a/package/python-sysv-ipc/python-sysv-ipc.hash b/package/python-sysv-ipc/python-sysv-ipc.hash
new file mode 100644
index 0000000000..03a821f811
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.hash
@@ -0,0 +1,6 @@
+# From https://pypi.org/pypi/sysv-ipc/1.1.0/json
+sha256  0f063cbd36ec232032e425769ebc871f195a7d183b9af32f9901589ea7129ac3  sysv_ipc-1.1.0.tar.gz
+
+# Locally computed
+sha256  0d92554ea62693c30787219805b7ea9b795c16526b75c762e9824e66dedc48a3  LICENSE
+sha256  ad31d46e1ec44c62b7505625408b4ac99a34e92dac2e3a8fe25693489277af0d  PKG-INFO
diff --git a/package/python-sysv-ipc/python-sysv-ipc.mk b/package/python-sysv-ipc/python-sysv-ipc.mk
new file mode 100644
index 0000000000..740a54af86
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-sysv-ipc
+#
+################################################################################
+
+PYTHON_SYSV_IPC_VERSION = 1.1.0
+PYTHON_SYSV_IPC_SOURCE = sysv_ipc-$(PYTHON_SYSV_IPC_VERSION).tar.gz
+PYTHON_SYSV_IPC_SITE = https://files.pythonhosted.org/packages/0c/d7/5d2f861155e9749f981e6c58f2a482d3ab458bf8c35ae24d4b4d5899ebf9
+
+PYTHON_SYSV_IPC_LICENSE = BSD-3-Clause
+PYTHON_SYSV_IPC_LICENSE_FILES = PKG-INFO LICENSE
+
+PYTHON_SYSV_IPC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
