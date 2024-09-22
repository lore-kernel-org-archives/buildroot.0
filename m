Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61014CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE312403BB;
	Sun, 22 Sep 2024 08:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqldzeUG8Pbb; Sun, 22 Sep 2024 08:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9211A403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9211A403C4;
	Sun, 22 Sep 2024 08:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE37B1BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D22812AE
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fl4eztz9u0Dt for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B18FD80ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B18FD80ADD
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B18FD80ADD
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:44:09 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so168668739f.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726994648; x=1727599448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WvoZoyRdAe2CCP8GHRMc2y+PSqXozSp6LdC14gWY4Us=;
 b=MoGfnh2P9ncbGyhJ4c4D9LBBYFFh2OEStso81IvLF1HR1LoanHuorEalsXF2GM9o0Z
 ME3pYlHB0bkiJLOmEeg1pq2Ztvk8ROKaaay/OLh7eVhhKxmNrc8eZVNnKGNZG1gzd/PN
 KyfEFkdeigI4IwJX/NwpWbp5nRn7dut/FgLUf9vUvBpPFSEk0652u3DDi6zOdGCDdc+Y
 EGrdRElp3xyI2ryq0pWbLh82zIRhwuz0l4bmfcREOz9I5q/ZY2Hu1Rj1qOSE3oQHNTPx
 3zpYJx2fUWdy8jzCeJVdOC+J1YW18WRC55OlnG/Xn2AH3UYlOKC7yeBYFaycuGiZlyuR
 Hrsw==
X-Gm-Message-State: AOJu0YwEnS1H5zlMAY9m4lhrle5VExlS+TELuHlaOx8bOxeyFBRlN69j
 6roAOebm2P00aVfZnTFPzOiCZBHmzFfXQpYUiJUlawfvnfCnBJclBG2Z2g==
X-Google-Smtp-Source: AGHT+IG1hlZu4LW9w6XIRiIFv+6a115UGIF69XN3khBSHw6mIGDpU994G/dBmcNOA2Ev4SGuPnSWYA==
X-Received: by 2002:a05:6602:148c:b0:82b:e61e:5630 with SMTP id
 ca18e2360f4ac-83209cefd62mr725783139f.3.1726994648100; 
 Sun, 22 Sep 2024 01:44:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d4asm4466419173.90.2024.09.22.01.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:44:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:44:05 -0600
Message-Id: <20240922084406.1012789-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726994648; x=1727599448; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WvoZoyRdAe2CCP8GHRMc2y+PSqXozSp6LdC14gWY4Us=;
 b=g909+2q9h77+v8q1Fp8QNmnbHaVSuh6pmtYV28UZrp3ZJArn2RF/yp8HbtaSEQt+gZ
 QJAJyqDqX7ptdwRb0tqzCQ30ncYwj5JdZqFGdXY21i/qJbL2Px0CSdLkS43qfQ+YPhU0
 ABa+yGtukoqWo5tuKDERLxsB6WA+ZK24Yfepbo8Afr/Y2PQMN+fG26TJMGgTJssanKbV
 8M7uEj8Eq4iv5rLm7b7L6irGt+h6QAHHcbmMXRPhAkMJubORPIn1o9RsrUu5Vh1w7rfJ
 yfCmnTJDWEyYjpyp6lW1V3jBoYfb2f0ypiVciK2Av3Ambq0XBF+Yifs2svWRr0JKTEL4
 trGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g909+2q9
Subject: [Buildroot] [PATCH 1/2] package/python-argcomplete: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-argcomplete/Config.in              |  6 ++++++
 .../python-argcomplete/python-argcomplete.hash    |  5 +++++
 package/python-argcomplete/python-argcomplete.mk  | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-argcomplete/Config.in
 create mode 100644 package/python-argcomplete/python-argcomplete.hash
 create mode 100644 package/python-argcomplete/python-argcomplete.mk

diff --git a/package/Config.in b/package/Config.in
index 2200f16520..6e1ce3388a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -998,6 +998,7 @@ menu "External python modules"
 	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
+	source "package/python-argcomplete/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
 	source "package/python-argon2-cffi-bindings/Config.in"
diff --git a/package/python-argcomplete/Config.in b/package/python-argcomplete/Config.in
new file mode 100644
index 0000000000..ba9db643a7
--- /dev/null
+++ b/package/python-argcomplete/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ARGCOMPLETE
+	bool "python-argcomplete"
+	help
+	  Bash tab completion for argparse.
+
+	  https://github.com/kislyuk/argcomplete
diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
new file mode 100644
index 0000000000..88bd7c9565
--- /dev/null
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argcomplete/json
+md5  5e5bb2e193a5581cb06abae2de3dd3d8  argcomplete-3.5.0.tar.gz
+sha256  4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b  argcomplete-3.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
new file mode 100644
index 0000000000..1773f98914
--- /dev/null
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-argcomplete
+#
+################################################################################
+
+PYTHON_ARGCOMPLETE_VERSION = 3.5.0
+PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/75/33/a3d23a2e9ac78f9eaf1fce7490fee430d43ca7d42c65adabbb36a2b28ff6
+PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
+PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
+PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
+PYTHON_ARGCOMPLETE_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
