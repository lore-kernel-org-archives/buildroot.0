Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C7CC47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9705183E4E;
	Thu, 11 Jan 2024 02:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9705183E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqePpiD1WLS2; Thu, 11 Jan 2024 02:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9CE83E4B;
	Thu, 11 Jan 2024 02:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9CE83E4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73CEE1BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 493D9614BD
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493D9614BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qqh2NHRb48R4 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:51:30 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5938861431
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5938861431
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7bade847536so202757739f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704941489; x=1705546289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1F2ZQtwfyxQe13aA9OIiOU0LsIyhreUwzsjssG6MeA=;
 b=Pj/YgXNirdwQgDJTca45uQHUVt0apa6nopIaVeryToUxX9XdEm5wwJIT1XkHUCg1Qw
 WAsTuQMtdi2oh3I0cFTyhH/ElHNeI4cayLPtszASM98Pc4EkMiMAI15IwMIV6WW2HjYg
 WYBZwqPxeYnr07KMGMQI6nOF4nGLMKhPr6cwaCYPv6p7j7AhiDSJisZhMREGugmiETO5
 +oErCPUbDdVlw2t/khCdeiyg8f0kRoBbSAH6dixfV9P07GzWg9LwEbf9X9Qcacnlb3CX
 F9mbvhUk9iaiAXuRuwuRkrZF9o24DLC8wfQQubJI5cVtQC0WkU3VOrzHeNboxul+YMmT
 M/pQ==
X-Gm-Message-State: AOJu0Yyd5HwF4u319MEd10OqpL7p4NGHO9dozKhTKS+nYW2x7VgG4uWF
 gEOBfucu8xofZJK0CFmEofLDj7R2NeuUWw==
X-Google-Smtp-Source: AGHT+IE4tXFVXiOECPIw76xK0KyBshd/KQHOKj6U3o05s3L3f5NXgLxHfzgnYWZMwPOmBqkW0sa8XA==
X-Received: by 2002:a5e:a717:0:b0:7be:f450:328 with SMTP id
 b23-20020a5ea717000000b007bef4500328mr672650iod.37.1704941489103; 
 Wed, 10 Jan 2024 18:51:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h11-20020a6b7a0b000000b007bb3c9b3187sm20987iom.4.2024.01.10.18.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:51:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:51:26 -0700
Message-Id: <20240111025127.2671669-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704941489; x=1705546289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b1F2ZQtwfyxQe13aA9OIiOU0LsIyhreUwzsjssG6MeA=;
 b=j0JHL3lpQ96wjHP30mv2mfJ5d8r0UAXXPJ/4T7mGSJgFhZgzLdjqXvh6ReOhO6LCi4
 985HmVQRjmFJI0L6K8TL8FOB2dIoCskSvJyK5JAxjPxAftAZ/LOO4TzqyxnxKGAwow6y
 Gog8RpVR/2TsAFwbCZ/YY6W2PVbVDaQBbdyo5K5omVS+luq7wSjlzfYf9HNv3dDqvbIG
 pO+PY9QelJDLS5UiTt+CXu4j1aajUVcHmZIzOPo+ZEiSGeRZn9QdmAy3HnV72KO0DQNu
 JkN9xdPbJkXxv3Jcov8ezLJ3V2cUtDq/loUdgrlQ/00X0StmlM0j+GGCN9FXvadMXhx+
 +W+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j0JHL3lp
Subject: [Buildroot] [PATCH 1/2] package/python-path: new package
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
 package/Config.in                    |  1 +
 package/python-path/Config.in        |  6 ++++++
 package/python-path/python-path.hash |  5 +++++
 package/python-path/python-path.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-path/Config.in
 create mode 100644 package/python-path/python-path.hash
 create mode 100644 package/python-path/python-path.mk

diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..5ef72e15e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1217,6 +1217,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
+	source "package/python-path/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
diff --git a/package/python-path/Config.in b/package/python-path/Config.in
new file mode 100644
index 0000000000..df1eb81a59
--- /dev/null
+++ b/package/python-path/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATH
+	bool "python-path"
+	help
+	  A module wrapper for os.path.
+
+	  https://github.com/jaraco/path
diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
new file mode 100644
index 0000000000..73723302f3
--- /dev/null
+++ b/package/python-path/python-path.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/path/json
+md5  e4fe8dac2ad5d6e7ea539bdb26d47329  path-16.9.0.tar.gz
+sha256  dfd31c2af60e8889a13538bef302ade7adacdb5351836be22638e2349ddd5d7b  path-16.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
new file mode 100644
index 0000000000..620fc88e53
--- /dev/null
+++ b/package/python-path/python-path.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-path
+#
+################################################################################
+
+PYTHON_PATH_VERSION = 16.9.0
+PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/8d/50/2a1a3287715c87d135dd1dcbd9f7bca4200302cfcc8c28ced1a8035d7894
+PYTHON_PATH_SETUP_TYPE = setuptools
+PYTHON_PATH_LICENSE = MIT
+PYTHON_PATH_LICENSE_FILES = LICENSE
+PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
