Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71360C4167B
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FA360FDA;
	Sun,  5 Nov 2023 08:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FA360FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyaisKbZx5o4; Sun,  5 Nov 2023 08:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B6160FD4;
	Sun,  5 Nov 2023 08:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B6160FD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2DE71BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0683403A2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0683403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCxJp1160amN for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:55:51 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87FB7401B7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87FB7401B7
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35961c61febso8779335ab.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699174550; x=1699779350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/T4wBNDK25UModmfUlPtktYS01IYRiJLhN8EGFFyuc=;
 b=R/PGz5RKd/vMwO1nwX9iTJ2dGTLZO1uvun/CmA6ifYFcK4rVq47Pw32wt/lPjlaHyQ
 LFG9AShpd3vh2X6i2+s2s8zYOwcSI0gTL4L1K3EpC5EhameM/y2RIudIUXbYi6/X5pD5
 kmE8ObpV/m9WjHpjavAYiu1td8hPrOMDPqdvYp2FGNlWmvAS0tJFTp0q+NAG4Xnbmluc
 xWGaU3Vf7QwbwoLSApY8EPp0ZEYVw4juAxgdFuhG9BDhb2pzLbyaO3rT9vXYy24U/rZ4
 LdzU3/FT9NHGfk7EGWDNaiC6ztUfNGh93KKtOrKhXhy4TTUU0vGchgYpG8tX07TzwTln
 X9dg==
X-Gm-Message-State: AOJu0YzGq0cX2gJ5jy3YHrrM/kC7jF4Mxe8REqoWhizebEUTnmRS9sl4
 cPeVo4pVvjOPq6mRbu5FCf+zMyRkQYnFBw==
X-Google-Smtp-Source: AGHT+IHM1x8YvIwvR+3Kwn5yYi1AGkdFQrNxZqXTqQXagLmvhLMj3wkCEyxAue3T05QFCmbdxO5+CQ==
X-Received: by 2002:a05:6e02:b49:b0:358:141:8584 with SMTP id
 f9-20020a056e020b4900b0035801418584mr34563386ilu.17.1699174549616; 
 Sun, 05 Nov 2023 01:55:49 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056e0208ad00b003576e122389sm1774216ilt.24.2023.11.05.01.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:55:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:55:44 -0700
Message-Id: <20231105085546.2919443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699174550; x=1699779350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p/T4wBNDK25UModmfUlPtktYS01IYRiJLhN8EGFFyuc=;
 b=VdKmyn1hZcj6ouvoSr4rNJg5mv/tGXjjA5lQsHAGGwZmbKHWIYmUfkCWWkMwvVnsqc
 3cI2IDxALtbAoOgd+/ituCVW/2i3M4mvIBCBcw65ve7nkJPgM2l/G1MznGplYaIzF+//
 pM7mwIueBxVCGxmnpiQWKP+xiiVMtOLyYUK4D3JWYEMG61zv1lYCZL9fiDlmc0CsIhV6
 Wgmf2hc0mRdKvUP09q0fwZ0Vu9uW9c/NN3ZPDGr04DqgaRTB1uDNT8+FDm19Q86laLkM
 tQ/QBeQw5Pz1nvqUbLTj6jBNYC1N8FziYvFxFvw4LPAmn1ak2NvWJ7/oFXf0TTq6yowy
 0Peg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VdKmyn1h
Subject: [Buildroot] [PATCH 1/3] package/python-referencing: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                               |  1 +
 package/python-referencing/Config.in            |  9 +++++++++
 .../python-referencing/python-referencing.hash  |  5 +++++
 .../python-referencing/python-referencing.mk    | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-referencing/Config.in
 create mode 100644 package/python-referencing/python-referencing.hash
 create mode 100644 package/python-referencing/python-referencing.mk

diff --git a/package/Config.in b/package/Config.in
index a0d5339b0a..6a2f1cad1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-redis/Config.in"
 	source "package/python-reedsolo/Config.in"
 	source "package/python-reentry/Config.in"
+	source "package/python-referencing/Config.in"
 	source "package/python-regex/Config.in"
 	source "package/python-remi/Config.in"
 	source "package/python-request-id/Config.in"
diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
new file mode 100644
index 0000000000..273c42543e
--- /dev/null
+++ b/package/python-referencing/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_REFERENCING
+	bool "python-referencing"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
+	help
+	  JSON Referencing + Python.
+
+	  https://github.com/python-jsonschema/referencing
diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
new file mode 100644
index 0000000000..d4f3dce5a4
--- /dev/null
+++ b/package/python-referencing/python-referencing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/referencing/json
+md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
+sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
+# Locally computed sha256 checksums
+sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
new file mode 100644
index 0000000000..4d11c99deb
--- /dev/null
+++ b/package/python-referencing/python-referencing.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-referencing
+#
+################################################################################
+
+PYTHON_REFERENCING_VERSION = 0.30.2
+PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
+PYTHON_REFERENCING_SETUP_TYPE = pep517
+PYTHON_REFERENCING_LICENSE = MIT
+PYTHON_REFERENCING_LICENSE_FILES = COPYING
+PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
