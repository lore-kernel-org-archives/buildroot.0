Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE20DCD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D4640742;
	Thu, 11 Jun 2026 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEbc2YXD0pw4; Thu, 11 Jun 2026 19:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B41A440536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781205391;
	bh=tuBrmTA+gEJIEp04VlHMloPHVEsGYEpH1E5nJaPWXjw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3Bf54kI2lAc2CcIcg46NfwMQwhgTWpHS8KYDg/uEtbqLJ5I3EMVSmPb7gQvb0r1Y
	 JccYofaYoW/y/DJhURkbNyVY3ODioMQiQ3hQS1VyWLPZSbrC2nowFnVtCip/bLjZ21
	 e1Exz1WEnNthj3FVwJ61+X8HlBdRINkPwWeOgcz/bwS2smN1g1s5uEH0apxAIX8xKe
	 B+Jd9SODnTZ/0nMb5A2SMOo4HfKd7+QV8V16Pc9YdKMb11kdRqnDO6H9VL+Qj1OQTS
	 azRMXsyq5B1Dzo8CR4u0Y/2lPB4nn3pjg5Q3oxioCcwKU95uEKEzzJZnbt+CXL13Bo
	 KsnIUY9ko9OIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B41A440536;
	Thu, 11 Jun 2026 19:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08246237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0639F4052B
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWQ0zqR7rmGI for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6B1040441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B1040441
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6B1040441
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-490b7866869so1427955e9.2
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781205387; x=1781810187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z0ezsTvrDOCCswZuRp6H+h5dWVsdK/yitt7qWbUZJzM=;
 b=BMngo5bG696K1Wl5sRx4WEwmIxznc+RB/GwYz0MDcWyGHfZom1VzIWaYB6Hb37X4UZ
 ujNQ0dn20ad0aoIVUXrGNHp6pGPB4yFhKQ2y9GmgHfu7F9QWFlHrfKJ2kj99eZa7K0Wc
 NXYB6v7REJaV9aszpwyfZgU0uVG7p3dB+KDMnlFJ3oJFtF1liDvssWyJcjmhDCFaj18Z
 F808SXGtTxF56mIKtvNp4m7/pgXx3MWQboRRDFzLKGXL3wyDxNFRRDWm/WQ5+8DODDxL
 zDZAFowM/GkjJXq/Ha1+lCjILuSOux0pw0Ow+1A3dKcm30uO/OAF9xRLLxpdMzFE0hRF
 j1+Q==
X-Gm-Message-State: AOJu0YzFebQRSNthG68LKptkJBFOxYrvAk4oz5JaWgUP+GLATv+O1gmg
 kLfhQu4luPeKuRzHb65zFjHnhxuqEdBjehy6w9Nm63dqtvFrdrcPbRDY6zPxVyNtr58=
X-Gm-Gg: Acq92OFJgCu9vHgT67mxbvOCOH6p3Pc8lkkLjsS999t8kFJCT0WLQVSMjZy3lGWovzA
 ZX5Hbe3gupw/9GbCmC2VfHfvAP/kgjSiME06VXRgms/wTrkPvJq6BY+kUVH4tKT1r13oY6/ESIr
 QQXuee2ZOioZfmcQgDwkePco4gxizdBv8xBO+yNlzi2C+h13fLC9dk6mk1icbCmwvMntINMgzrK
 hcaD4ChRRQRipE6N3+d3eavBmNxsF85dZagoqK84ksHGIf/NsXeelAAnh6ny/YLY3sBddEtd1bU
 FhATKhKNd4y4bgwKoqcUvGjtgx519PnqYYVGhb3vzrDyKOl9wLt6w0yIHBXsWtoLAqB6mG/XMVO
 VUdV4O+6At23M/fNH1vNpqxbL7coSxPl7CHVLQVESuqCwXk3vkn30qfB14MYyS8n1GhP6u25mE3
 pDx5sMyYNLE/+YVpCItl+7DMsD3XWlR5X2
X-Received: by 2002:a05:600c:3511:b0:490:d32b:39c3 with SMTP id
 5b1f17b1804b1-490e55dc1cemr61155325e9.6.1781205387364; 
 Thu, 11 Jun 2026 12:16:27 -0700 (PDT)
Received: from precialexwin ([37.168.152.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea843d63sm4403475e9.12.2026.06.11.12.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 12:16:26 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Cc: buildroot@bubu1.eu, james.hilliard1@gmail.com, thomas.petazzoni@bootlin.com
Date: Thu, 11 Jun 2026 14:16:21 -0500
Message-ID: <20260611191621.441-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <20260611191552.414-1-frcomdev@gmail.com>
References: <20260611191552.414-1-frcomdev@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781205387; x=1781810187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0ezsTvrDOCCswZuRp6H+h5dWVsdK/yitt7qWbUZJzM=;
 b=P6pTxq5Ti/7Lv/1Z0hbFaIIJQ9ZKvqM0vOBxs29Jc6vcf6KK3we14hrSm60pAe33t2
 bCx3KphKZ0n9hnph9bYPTqBHD8MFBqeFvUizE1nJaOZ3v4VZ/UNAMwVTOsLJ4wmHrNbN
 jdC5vb5vvwijlLdFmGIZA+6y0pgbHu5WImuhyTzpMrnit+TJY1DrgPHRrx2LEWXVHeIh
 f84LFFFt2mZ/mJ8g4pMM7lVgyv4Z57JArPN1Uk06WPhnvsAYZgKxvSyKyP9SDDdW5cFk
 u7JgQf3NbbIvbdsHRysDp2zsUxUhcAqP8bYGS7kqIB8cr1J0ER2irNMb5V+g2sorUsGH
 IJNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=P6pTxq5T
Subject: [Buildroot] [PATCH] package/python-nmcli: fix dependencies and add
 runtime test
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

Depend on network-manager and select nmcli support so the Python wrapper can invoke the nmcli binary at runtime. Add a runtime test that boots with systemd and exercises nmcli.general.status().
---
 package/python-nmcli/Config.in                |  4 +++-
 package/python-nmcli/python-nmcli.hash        |  2 +-
 package/python-nmcli/python-nmcli.mk          |  2 +-
 .../tests/package/sample_python_nmcli.py      |  8 +++++++
 .../tests/package/test_python_nmcli.py        | 24 +++++++++++++++++++
 5 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_nmcli.py
 create mode 100644 support/testing/tests/package/test_python_nmcli.py

diff --git a/package/python-nmcli/Config.in b/package/python-nmcli/Config.in
index acdb6a1423..ad282f0584 100644
--- a/package/python-nmcli/Config.in
+++ b/package/python-nmcli/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_NMCLI
 	bool "python-nmcli"
+	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
+	select BR2_PACKAGE_NETWORK_MANAGER_CLI
 	help
 	  Python wrapper for nmcli (NetworkManager).
 
-	  https://github.com/ushiboy/nmcli
\ No newline at end of file
+	  https://github.com/ushiboy/nmcli
diff --git a/package/python-nmcli/python-nmcli.hash b/package/python-nmcli/python-nmcli.hash
index d11842e3e8..5bf087fde9 100644
--- a/package/python-nmcli/python-nmcli.hash
+++ b/package/python-nmcli/python-nmcli.hash
@@ -1,3 +1,3 @@
 # From https://pypi.org/pypi/nmcli/1.7.0/json
 sha256  4fb17b6c33d276a264a27b7109fa1d70987570536fa8852b51830f9f7732f982  nmcli-1.7.0.tar.gz
-sha256  9dbbc4debacc85f5f5f074614cd9cadd61da09eaa19f98f6bbb5463c34133820  LICENSE.txt
\ No newline at end of file
+sha256  9dbbc4debacc85f5f5f074614cd9cadd61da09eaa19f98f6bbb5463c34133820  LICENSE.txt
diff --git a/package/python-nmcli/python-nmcli.mk b/package/python-nmcli/python-nmcli.mk
index 449131974d..63f258238b 100644
--- a/package/python-nmcli/python-nmcli.mk
+++ b/package/python-nmcli/python-nmcli.mk
@@ -11,4 +11,4 @@ PYTHON_NMCLI_SETUP_TYPE = setuptools
 PYTHON_NMCLI_LICENSE = MIT
 PYTHON_NMCLI_LICENSE_FILES = LICENSE.txt
 
-$(eval $(python-package))
\ No newline at end of file
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_nmcli.py b/support/testing/tests/package/sample_python_nmcli.py
new file mode 100644
index 0000000000..5fa8dee0c4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_nmcli.py
@@ -0,0 +1,8 @@
+#!/usr/bin/env python3
+
+import nmcli
+
+general = nmcli.general.status()
+print(general)
+
+assert general.state is not None
diff --git a/support/testing/tests/package/test_python_nmcli.py b/support/testing/tests/package/test_python_nmcli.py
new file mode 100644
index 0000000000..20fffa2356
--- /dev/null
+++ b/support/testing/tests/package/test_python_nmcli.py
@@ -0,0 +1,24 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Nmcli(TestPythonPackageBase):
+    __test__ = True
+    # Can't use TestPythonPackageBase.config because we need headers
+    # >= 5.4 for network-manager, so we have to use the bleeding-edge
+    # toolchain.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_NETWORK_MANAGER=y
+        BR2_PACKAGE_PYTHON_NMCLI=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_nmcli.py"]
+
+    timeout = 30
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
