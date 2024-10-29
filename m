Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D9D3A66D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 16:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361E8804EA;
	Tue, 29 Oct 2024 16:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxXmR63JdhUw; Tue, 29 Oct 2024 16:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30BFD8052D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BFD8052D;
	Tue, 29 Oct 2024 16:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C154969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22D1C804EA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PEpbZt5meST for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 16:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A738804E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A738804E6
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A738804E6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:10:26 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83abcfb9fd4so210958939f.3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730218225; x=1730823025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1aowzdze2kqwM3pu07XiM9jPrpXJquZFDlKgzWWS/h4=;
 b=KUPxBKwN2ixXjDUI3jmD/CWfN2mI/lKdpImT1DXNx+s2xZrSgoSy7lxETeWENc2Fn5
 xITa91qSpTHA1iTP3GXyza1Ehrd5hH0zuaNnXjMn3USRJMQ24xz1oQbbWUwRQrCiEZck
 8TaDRUz8iZXhWRloZC1j3gLTzWz1eMmXvcz5r2GWpylbyqUAm1PEkamUgYoz/YUVllu6
 pP37WE2GlHuPDXEDHf4Z5W7NK7G0elgV+naAyYszJosdzDpi5sWffYIvRcmNCebTDsj4
 vVZkRKNr0uLejH2YcPP+4CvBYFfREpDgmwyvzR1n7D04ojviygirH+5zeSaH9whY+qvf
 9pbA==
X-Gm-Message-State: AOJu0YxBQZryoh0RQTzN2u7h+AEC6DoO94zHXzsy1x5mpSx7kVvgTC67
 YEYaSvAXPpBiumwIXtbVgX/KIUXhigS0uBSS6j/ALOfqpDKTcbT2y+eXKg==
X-Google-Smtp-Source: AGHT+IFypw7vRxndInHP5COxp3AYggrahXWAQ41ydJpKrktEZaSZoT+f3cakfFSzjzxe8KGSB4MDXQ==
X-Received: by 2002:a05:6602:486:b0:83a:a82b:f861 with SMTP id
 ca18e2360f4ac-83b1c5f409bmr1360869439f.16.1730218224577; 
 Tue, 29 Oct 2024 09:10:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72789f7dsm2421023173.154.2024.10.29.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 09:10:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 10:10:22 -0600
Message-Id: <20241029161022.441227-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730218225; x=1730823025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1aowzdze2kqwM3pu07XiM9jPrpXJquZFDlKgzWWS/h4=;
 b=eIbtn3WhCVg3UqtaRMgO0Y4pjkJ72cDw7Sd2xyAj45CLjTvpjSgXDWB0ToD2mRxSTk
 /2VLipUhOZmqFSKcc53xMRTORU6NyelpJh7jJiPHjV3KikedCKiNlRPpXZqsd5AJDtiv
 X3k1dLRKRNGvSkjq5bNxhhSa38p76VON7mG9B/5cFDada6HBCrZdrWXbrNpycGftW5Tb
 FrbbHwaIndzSIgx0FwrPtS+qhUW/1WcraVho0oDDCqsvuRPqUbgZzd/rhpQjq0Eo1URN
 d0LjVkEm+L4LTU8sbMRHiMAOoWpjKbfc+L6Ym5aFRPjoL2sA0qd1+N39cv5QxYOt4PSj
 1M1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eIbtn3Wh
Subject: [Buildroot] [PATCH 1/1] package/python-pyaml: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-pyaml/Config.in         |  8 ++++++++
 package/python-pyaml/python-pyaml.hash |  5 +++++
 package/python-pyaml/python-pyaml.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pyaml/Config.in
 create mode 100644 package/python-pyaml/python-pyaml.hash
 create mode 100644 package/python-pyaml/python-pyaml.mk

diff --git a/package/Config.in b/package/Config.in
index 72b8d8bdc9..f8d4e4d24c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1281,6 +1281,7 @@ menu "External python modules"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyalsa/Config.in"
+	source "package/python-pyaml/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pyasynchat/Config.in"
diff --git a/package/python-pyaml/Config.in b/package/python-pyaml/Config.in
new file mode 100644
index 0000000000..72d00d5c4c
--- /dev/null
+++ b/package/python-pyaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYAML
+	bool "python-pyaml"
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  PyYAML-based module to produce a bit more pretty and
+	  readable YAML-serialized data.
+
+	  https://github.com/mk-fg/pretty-yaml
diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
new file mode 100644
index 0000000000..06e99448d0
--- /dev/null
+++ b/package/python-pyaml/python-pyaml.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyaml/json
+md5  1301f53ad68626ac295c2663315b1804  pyaml-24.9.0.tar.gz
+sha256  e78dee8b0d4fed56bb9fa11a8a7858e6fade1ec70a9a122cee6736efac3e69b5  pyaml-24.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
new file mode 100644
index 0000000000..e908aa089a
--- /dev/null
+++ b/package/python-pyaml/python-pyaml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyaml
+#
+################################################################################
+
+PYTHON_PYAML_VERSION = 24.9.0
+PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/fd/a6/5b51160ff7ce60b0c60ec825359c0e818b0ce4a2504fa3dd1470f42f9b10
+PYTHON_PYAML_SETUP_TYPE = setuptools
+PYTHON_PYAML_LICENSE = WTFPL
+PYTHON_PYAML_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
