Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECD0CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F04F44079C;
	Mon,  1 Apr 2024 21:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EljBGQyLy2O; Mon,  1 Apr 2024 21:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C03240773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C03240773;
	Mon,  1 Apr 2024 21:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04CA61BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A06C80F04
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayKkYmZx6P85 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AF70812BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF70812BC
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AF70812BC
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:23:57 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c7f3f66d17so148320539f.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006636; x=1712611436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tAjpF4r1tC7rf2LdAYr7T6vs24WpMl/bOiT3hwdI6rc=;
 b=OJZaWVkmFd5By4/d+hum2LhHS424sjLQHGDaYuq8HO83/jAUSnSb7ZifIiKewC3auh
 wkai+wthAPG+MXzKLTvqBmPLZYBIEfcXZlpn46/JrK60dg0/ZfdwAEvzPvANAYl/FYLx
 45nzJW8QfgwuhTqeIvlMK11c/Nny3GQVUrgjwPUwOGLdeHNlIiRhw6s9jvCWXUU0mbg6
 me1uWBc2ur/j7KExs2sgIkN0aoETpn5Nu0VGay9Wjr3ni2f2LFWs2Gkv7yDIED7vWgzq
 1YzOIgGFccGvRlA/DBY/KQ5RBkReyILbCpynfN0ILefRe6qQD++NtbRR5OjGXVXaxQtI
 nrtg==
X-Gm-Message-State: AOJu0YwZ4JrFppZFTj6lHiIRWHrdQOX6TlbFpx7+/7w9E7nZwWtcN1ST
 ROEFrS1EPdc9Um+q1KNpHkPfZ4xgTq9H/wkK2Au5PncdNebA8tnqgPGDRPSJk+oa1w==
X-Google-Smtp-Source: AGHT+IE4bV+or9hLPRX4F9jbmc5j2cHzCczU69CS7/9bJzRwyS2R2Ccbw//58GetWNKOIFCQQgQmAg==
X-Received: by 2002:a5e:a616:0:b0:7d0:9e57:750b with SMTP id
 q22-20020a5ea616000000b007d09e57750bmr11915615ioi.2.1712006636107; 
 Mon, 01 Apr 2024 14:23:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 d23-20020a02a497000000b0047708160be9sm2813844jam.147.2024.04.01.14.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:23:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 15:23:42 -0600
Message-Id: <20240401212344.1345395-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401212344.1345395-1-james.hilliard1@gmail.com>
References: <20240401212344.1345395-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006636; x=1712611436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAjpF4r1tC7rf2LdAYr7T6vs24WpMl/bOiT3hwdI6rc=;
 b=KYjn/FuSBCd9liBkKb8t42yBSBxdPbpWFrOq2rbpfNQ1609W/G752/s2NOTbhCkR/V
 0lPvyOYAn4r/jWM4lhtGax15HlRKG5J/AO4G/FpOLv7Aur/q5AW6rtHe9PeWnSUzfTc0
 LtxRqHWku/KH5a3uRDHMX2KZshSMBBfkdjDRD4XAeEw2RAFbShhzraqheknUFsJoAjCS
 dKYF4X9vDC9rlx/cO9EB/4CFK5BIkrlVqYHNZiUeAOKCgfcF5iFhwtToEVBFHlhV6Z0K
 RB7RAgwozcJVFy4j08lq4fivrS4apRGm+Yylm6hI2DHsOcy1m1Gl3eLSUCZq2OvYN4vY
 OQbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KYjn/FuS
Subject: [Buildroot] [PATCH v4 3/5] package/python-dictdiffer: new package
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

We need to set --skip-dependency-check to prevent pytest-runner from
being required to build python-dictdiffer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-dictdiffer/Config.in              |  7 +++++++
 package/python-dictdiffer/python-dictdiffer.hash |  5 +++++
 package/python-dictdiffer/python-dictdiffer.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-dictdiffer/Config.in
 create mode 100644 package/python-dictdiffer/python-dictdiffer.hash
 create mode 100644 package/python-dictdiffer/python-dictdiffer.mk

diff --git a/package/Config.in b/package/Config.in
index 5aeb5b02c6..09a81f2b6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1064,6 +1064,7 @@ menu "External python modules"
 	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
+	source "package/python-dictdiffer/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-dicttoxml2/Config.in"
 	source "package/python-distro/Config.in"
diff --git a/package/python-dictdiffer/Config.in b/package/python-dictdiffer/Config.in
new file mode 100644
index 0000000000..636b4f7c4e
--- /dev/null
+++ b/package/python-dictdiffer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DICTDIFFER
+	bool "python-dictdiffer"
+	help
+	  Dictdiffer is a library that helps you to diff and patch
+	  dictionaries.
+
+	  https://github.com/inveniosoftware/dictdiffer
diff --git a/package/python-dictdiffer/python-dictdiffer.hash b/package/python-dictdiffer/python-dictdiffer.hash
new file mode 100644
index 0000000000..4984595346
--- /dev/null
+++ b/package/python-dictdiffer/python-dictdiffer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dictdiffer/json
+md5  524b353b969300d4dc6aa6720c953657  dictdiffer-0.9.0.tar.gz
+sha256  17bacf5fbfe613ccf1b6d512bd766e6b21fb798822a133aa86098b8ac9997578  dictdiffer-0.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1f9e05b3b9a6fad24cc67455578bcdfd3e89b09a25c45369a5254203bbe2bdd3  LICENSE
diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
new file mode 100644
index 0000000000..569f923a9a
--- /dev/null
+++ b/package/python-dictdiffer/python-dictdiffer.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dictdiffer
+#
+################################################################################
+
+PYTHON_DICTDIFFER_VERSION = 0.9.0
+PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
+PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
+PYTHON_DICTDIFFER_SETUP_TYPE = setuptools
+PYTHON_DICTDIFFER_LICENSE = MIT
+PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
+PYTHON_DICTDIFFER_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_DICTDIFFER_BUILD_OPTS = --skip-dependency-check
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
