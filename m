Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134511073C8D
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 10:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F3F806F5;
	Wed,  8 Apr 2026 10:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssk9eJo1lleO; Wed,  8 Apr 2026 10:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02CB68073C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775643902;
	bh=216mQP27V67g8qglHmN2bu+tK43WvbCYAqmcplc/hEI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n1cr6dUWVRbSQzxA2wbqfqdIxh+bg4S4BMcVtHFPJ8DEg6cIWb93nIolhlpLGzWe3
	 0vILBgJOK8twQD7fwLBs01ARpZycN9CJde26X6P77dzsLoTVSKOySBHS9it1ksKqIM
	 5nsQ+oW/AOVN7fm/QNRludVvuwYjipsq796qOCRSURAMn+CgesAbMdwHH/6oWQPDD/
	 IeQOAYOLzGx/Y3c0weV2IVp9N2mD1blhvPf7VEo93iojA8xU8Q/LxoTaUYZxvcsso8
	 tsmlYPDtdv2GLeljJygV6b+yYQMQNA3EYGl3z/lil1NwKt90mcG4PmV+oLMBCQ3Sh2
	 vRgug/EXcGX4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CB68073C;
	Wed,  8 Apr 2026 10:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF0E4237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4A5E6085B
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zzr4D6JHzW07 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 10:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.138;
 helo=smtpout1.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 523A7605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523A7605A7
Received: from smtpout1.mo533.mail-out.ovh.net
 (smtpout1.mo533.mail-out.ovh.net [51.210.94.138])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523A7605A7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:24:55 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net [79.137.60.37])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4frJc44SFdz5vgy;
 Wed,  8 Apr 2026 10:05:56 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net. [127.0.0.1])
 by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Wed,  8 Apr 2026 10:05:56 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.113.158])
 by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4frJc43dxJz1xw9; Wed,  8 Apr 2026 10:05:56 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.11])
 (Authenticated sender: mooz@blockos.org)
 by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 076FD8E1590; 
 Wed,  8 Apr 2026 10:05:55 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Cruz <mooz@blockos.org>
Date: Wed,  8 Apr 2026 12:04:24 +0200
Message-ID: <20260408100528.468929-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 2919458461396290509
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEWZMR4XIGU9ocK2S1UIUU2vIc+WLP0duwn8kOvY+52aG+GY13idD5GZflQeLbL7ELA8N5y5WGZed/xJK0NNWmwWTq9/uGbOS2t5/XN0UJhxnavFDvEARjyZ4fUhGNHOSSNJc4kpQGktyAl0sXkolY5zyXFO+1R5K9RHq1h+uyVMZQdJiagE2rjI3v3q7Q7YNCiPiB1yag1fN0qsPZDs2YzLeS6ZTSJWiXhL0UiqELwk+sSQBMRgcSshG+oVHsl+NGhNQ9tr27ohbz+hrpwZSlk1Fx7vkAU0e1xbzHWjO3Uv7zWdh/3NAESwZ0rQ+60NFctA3cuFOgBLCscilFuB9SET6h7Zp0VmCNsUKb6I1BUH1g+wzeOTjajPBW2PSCEaSLxJeHFO8+ToVOidWOMx74HgZyksxOSlEBeAeZDro78Yi/nu43KEBLU8Af6Hht/OEIoDUsNGYEEE5mak6HhAtAVpD7L1t9tkxBFrdMwUOWDSx8Go8ON/au8vPcsOAU55rDbIF2Dki9f8dNdazPtW/PyScjkdFMqjCxh1NbVz0cXhOQFcIh7z8Twfm2dO0sHYHy4QH3BvEUleBDHnFkhz2Y8y/MATvN4RjbftlrC6j0mXe9t4PGG0AcDuQjgR/yrSmpEXbKZq8GBOttPBgmVzER5ibdrw3cRltRfPAfE7iXb5g
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-112S00647482614-97da-4c1d-a4ef-22772539d25b,
 5B82DD0164FC1DC6325A08E0C5996C36621A43D2) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH 1/2] package/rwmem: add python module.
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

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 package/rwmem/Config.in                      |  4 ++++
 package/rwmem/rwmem-python/Config.in         |  8 ++++++++
 package/rwmem/rwmem-python/rwmem-python.hash |  3 +++
 package/rwmem/rwmem-python/rwmem-python.mk   | 21 ++++++++++++++++++++
 package/rwmem/rwmem.mk                       |  2 ++
 5 files changed, 38 insertions(+)
 create mode 100644 package/rwmem/rwmem-python/Config.in
 create mode 100644 package/rwmem/rwmem-python/rwmem-python.hash
 create mode 100644 package/rwmem/rwmem-python/rwmem-python.mk

diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
index 690b034070..f20c00016e 100644
--- a/package/rwmem/Config.in
+++ b/package/rwmem/Config.in
@@ -10,6 +10,10 @@ config BR2_PACKAGE_RWMEM
 
 	  https://github.com/tomba/rwmem
 
+if BR2_PACKAGE_RWMEM
+source "package/rwmem/rwmem-python/Config.in"
+endif
+
 comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/rwmem/rwmem-python/Config.in b/package/rwmem/rwmem-python/Config.in
new file mode 100644
index 0000000000..3289102b0e
--- /dev/null
+++ b/package/rwmem/rwmem-python/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RWMEM_PYTHON
+	bool "python tools"
+	depends on BR2_PACKAGE_RWMEM
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Python bindings for rwmem
+
+	  https://github.com/tomba/rwmem
diff --git a/package/rwmem/rwmem-python/rwmem-python.hash b/package/rwmem/rwmem-python/rwmem-python.hash
new file mode 100644
index 0000000000..8b73f662ea
--- /dev/null
+++ b/package/rwmem/rwmem-python/rwmem-python.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d10639f563100c819202337c4d4df57db11c2fcd59a19b0c68e34b8eb9aa1d01  rwmem-2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem-python/rwmem-python.mk b/package/rwmem/rwmem-python/rwmem-python.mk
new file mode 100644
index 0000000000..4a6de35d6a
--- /dev/null
+++ b/package/rwmem/rwmem-python/rwmem-python.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pyrwmem
+#
+################################################################################
+
+RWMEM_PYTHON_VERSION = $(RWMEM_VERSION)
+RWMEM_PYTHON_SOURCE = $(RWMEM_SOURCE)
+RWMEM_PYTHON_SITE = $(RWMEM_SITE)
+RWMEM_PYTHON_DL_SUBDIR = rwmem
+
+RWMEM_PYTHON_LICENSE = $(RWMEM_LICENSE)
+RWMEM_PYTHON_LICENSE_FILES = $(RWMEM_LICENSE_FILES)
+
+RWMEM_PYTHON_DEPENDENCIES = rwmem
+
+RWMEM_PYTHON_INSTALL_STAGING = YES
+
+RWMEM_PYTHON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
index 1259b5503f..db05ecab86 100644
--- a/package/rwmem/rwmem.mk
+++ b/package/rwmem/rwmem.mk
@@ -11,3 +11,5 @@ RWMEM_LICENSE_FILES = LICENSE
 RWMEM_DEPENDENCIES = host-pkgconf fmt inih
 
 $(eval $(meson-package))
+
+include package/rwmem/rwmem-python/rwmem-python.mk
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
