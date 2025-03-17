Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558FEC28B28
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 19:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC81760AAC;
	Mon, 17 Mar 2025 19:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzjD0efvUi6F; Mon, 17 Mar 2025 19:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEA660AB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEA660AB3;
	Mon, 17 Mar 2025 19:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B40D16E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A9A281F57
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6LuQtyB6pdE for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 19:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6614481F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6614481F58
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6614481F58
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:08:11 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3d57143ee39so9629395ab.1
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 12:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742238490; x=1742843290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2GYmLReOOKCXNnGw/VCpemGKj0EOZPoUm28aiF1VBI=;
 b=I7JCB53c6XH9567Jw5rJSMi/O33aZOfgxZTFVNdT/9d6eoX9aMGI2DCPODGE8wrBcW
 4Y7IHS7oN8fcpuKxOPPUvTKJXAI2hXQcMVe+E8yyTq0YtA6TeUOLeOggRhMJYle3gkVl
 RxzBlDifcQZ0VA65Lfnu7iJzTJxyJSjGUzGzUznuqPv/8eRaPDBk6Y1UEOCG/G7QDiI9
 P9JyQA0L2XEkMVfrmvS9hu1b1HFUyUy9ej5zbcYrOHV8WQkGEW9Kuuby65WR6BFSrwj1
 +W57YW/qAdwPaB85X4DZABiqS9qeUd2WQFaK5NWv22V3vXcNtYGZemEADdNSNNFU5wSw
 lkZg==
X-Gm-Message-State: AOJu0Yx34jk/is5k9njqX/7FAV/lcM7SjYVNU80QDtrGwMtTHMCrItWS
 QtPBpunDFKWbQ34AJE6Kkv6+6abX44T7yjn0HNdSWXBaqNK/3wg4NOegIg==
X-Gm-Gg: ASbGnctfdUXIG2Er+KUXTddriuRg78uN/nA7LYVOzg0LXfRnuHZH0TkpfCha35UNLU3
 QsfEp/meS/A3HzDBO/Cv0YA3NQp3jmJluR3roKBXuH7ZnSwfnEfwR+x1r7+JCsVpdqm+qPYVSOe
 PBUQucxyzBMhFb0MHGXZlxoMcDmSPgC3FIRve+jAJ6pRfF+z0DXCRzJcn9o4bxnWleF0nYhftHI
 BWHMwqHN6HhweAF0+Ss5Cd6jd4HfHT279MHJRVMMMW8M9rWhEyglIvyzdWGKrI31cs+a1gEv9Nh
 rH26mIV+iM0AtXzg64adjkDwlUkwOVczcJj2YMf/je13n+JeIpU+7q3MMGlYrPvEAHJXmgOesKh
 v/4ZHe3SJEaZETmHMkzohow+pmfvH9jk=
X-Google-Smtp-Source: AGHT+IECJfL94ClmyENO11m3G6ylIuZeEhG7NgbVPTeDcyh2Lw1W7JvLg3QZ+PlKm3i1Vrpdx0mi0A==
X-Received: by 2002:a92:ca48:0:b0:3d4:3fbf:966e with SMTP id
 e9e14a558f8ab-3d483a7ffb4mr133322115ab.14.1742238490128; 
 Mon, 17 Mar 2025 12:08:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a666583sm27790445ab.16.2025.03.17.12.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:08:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 13:08:08 -0600
Message-Id: <20250317190808.2996241-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742238490; x=1742843290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B2GYmLReOOKCXNnGw/VCpemGKj0EOZPoUm28aiF1VBI=;
 b=KN4jQE3s78XxaPQds6lVxuS7l8IkCrw7mz6MSaLURbOVffGouREqqv0aeTMAorgFwn
 E0IjfsHcQOB0W40VetuOvIVG/RP89idiNB/aHhD6lqh1+8CJ2JDR90YJOZm0bCN0c3bk
 oYtT2mB7eSaZyo9wTvRyPHplrs6LudDfPtbN9CKqL51iWLzeNtRafNHeEMNLXAMIayY5
 AG9jTvHKUPOPet0qHKmgilm4VBg3ScHUlLBKu6RbDdjxaJP+gq405fCFEMJSnU4buP0Z
 2sCHk6e0hlt8yHBtOq6YiTykeVxJJEyLX+nLBTrwTRHb3bS5GLkXDyNwhfGwdNAlMm/V
 jppw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KN4jQE3s
Subject: [Buildroot] [PATCH 1/1] package/python-simple-pid: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-simple-pid/Config.in              |  6 ++++++
 package/python-simple-pid/python-simple-pid.hash |  5 +++++
 package/python-simple-pid/python-simple-pid.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-simple-pid/Config.in
 create mode 100644 package/python-simple-pid/python-simple-pid.hash
 create mode 100644 package/python-simple-pid/python-simple-pid.mk

diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..a8c306100a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1388,6 +1388,7 @@ menu "External python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
 	source "package/python-shutilwhich/Config.in"
+	source "package/python-simple-pid/Config.in"
 	source "package/python-simple-websocket/Config.in"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
diff --git a/package/python-simple-pid/Config.in b/package/python-simple-pid/Config.in
new file mode 100644
index 0000000000..d3985efe73
--- /dev/null
+++ b/package/python-simple-pid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SIMPLE_PID
+	bool "python-simple-pid"
+	help
+	  A simple, easy to use PID controller.
+
+	  https://github.com/m-lundberg/simple-pid
diff --git a/package/python-simple-pid/python-simple-pid.hash b/package/python-simple-pid/python-simple-pid.hash
new file mode 100644
index 0000000000..1e36ace439
--- /dev/null
+++ b/package/python-simple-pid/python-simple-pid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/simple-pid/json
+md5  79fc6af22bb66553674026a3e4b7cf74  simple_pid-2.0.1.tar.gz
+sha256  5771761c54541c900e597d6c2e4ea93fd2cc98f4e48cb9eca265fba2e65be99e  simple_pid-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  a065b200f76a198209b41194d4f620f50e06181d275cbd58146a9632bbcc183a  LICENSE.md
diff --git a/package/python-simple-pid/python-simple-pid.mk b/package/python-simple-pid/python-simple-pid.mk
new file mode 100644
index 0000000000..ed3bbb329f
--- /dev/null
+++ b/package/python-simple-pid/python-simple-pid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simple-pid
+#
+################################################################################
+
+PYTHON_SIMPLE_PID_VERSION = 2.0.1
+PYTHON_SIMPLE_PID_SOURCE = simple_pid-$(PYTHON_SIMPLE_PID_VERSION).tar.gz
+PYTHON_SIMPLE_PID_SITE = https://files.pythonhosted.org/packages/78/0a/c670a4f4dea4b21c0b074b193c54698e5e047479e688c8d5495d264c9921
+PYTHON_SIMPLE_PID_SETUP_TYPE = setuptools
+PYTHON_SIMPLE_PID_LICENSE = MIT
+PYTHON_SIMPLE_PID_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
