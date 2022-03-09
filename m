Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D923C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 14:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65BC40ADD;
	Wed,  9 Mar 2022 14:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DehWjTpSmeDq; Wed,  9 Mar 2022 14:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CB0440A18;
	Wed,  9 Mar 2022 14:29:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6945F1BF82D
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 14:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6564F60BDC
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 14:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsCJcOIDxanQ for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 14:29:31 +0000 (UTC)
X-Greylist: delayed 01:56:00 by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ECE060B75
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 14:29:30 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B31C1C000E;
 Wed,  9 Mar 2022 14:29:25 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 15:29:13 +0100
Message-Id: <20220309142913.2102898-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt5/qt5base: fix CVE-2022-25255
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This fixes CVE-2022-25255[1] by using a patch provided by Qt for 5.15.

The patch fails to apply because of a conflict in copyright year so it
needed some additional handling after downloading.

The patch file was added by running the following command:
wget https://download.qt.io/archive/qt/5.15/CVE-2022-25255-qprocess5-15.diff -q -O - | sed -e 's/Copyright (C) 2021 The Qt Company Ltd./Copyright (C) 2016 The Qt Company Ltd./' > 0008-CVE-2022-25255-qprocess5-15.diff.patch

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-25255

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 ...008-CVE-2022-25255-qprocess5-15.diff.patch | 56 +++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch

diff --git a/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
new file mode 100644
index 0000000000..dfab92a9ef
--- /dev/null
+++ b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
@@ -0,0 +1,56 @@
+--- a/src/corelib/io/qprocess_unix.cpp
++++ b/src/corelib/io/qprocess_unix.cpp
+@@ -1,7 +1,7 @@
+ /****************************************************************************
+ **
+ ** Copyright (C) 2016 The Qt Company Ltd.
+-** Copyright (C) 2016 Intel Corporation.
++** Copyright (C) 2022 Intel Corporation.
+ ** Contact: https://www.qt.io/licensing/
+ **
+ ** This file is part of the QtCore module of the Qt Toolkit.
+@@ -422,14 +422,15 @@ void QProcessPrivate::startProcess()
+     // Add the program name to the argument list.
+     argv[0] = nullptr;
+     if (!program.contains(QLatin1Char('/'))) {
++        // findExecutable() returns its argument if it's an absolute path,
++        // otherwise it searches $PATH; returns empty if not found (we handle
++        // that case much later)
+         const QString &exeFilePath = QStandardPaths::findExecutable(program);
+-        if (!exeFilePath.isEmpty()) {
+-            const QByteArray &tmp = QFile::encodeName(exeFilePath);
+-            argv[0] = ::strdup(tmp.constData());
+-        }
+-    }
+-    if (!argv[0])
++        const QByteArray &tmp = QFile::encodeName(exeFilePath);
++        argv[0] = ::strdup(tmp.constData());
++    } else {
+         argv[0] = ::strdup(encodedProgramName.constData());
++    }
+
+     // Add every argument to the list
+     for (int i = 0; i < arguments.count(); ++i)
+@@ -983,15 +984,16 @@ bool QProcessPrivate::startDetached(qint64 *pid)
+                 envp = _q_dupEnvironment(environment.d.constData()->vars, &envc);
+             }
+
+-            QByteArray tmp;
+             if (!program.contains(QLatin1Char('/'))) {
++                // findExecutable() returns its argument if it's an absolute path,
++                // otherwise it searches $PATH; returns empty if not found (we handle
++                // that case much later)
+                 const QString &exeFilePath = QStandardPaths::findExecutable(program);
+-                if (!exeFilePath.isEmpty())
+-                    tmp = QFile::encodeName(exeFilePath);
++                const QByteArray &tmp = QFile::encodeName(exeFilePath);
++                argv[0] = ::strdup(tmp.constData());
++            } else {
++                argv[0] = ::strdup(QFile::encodeName(program));
+             }
+-            if (tmp.isEmpty())
+-                tmp = QFile::encodeName(program);
+-            argv[0] = tmp.data();
+
+             if (envp)
+                 qt_safe_execve(argv[0], argv, envp);
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ef38d03253..ac0781c430 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -15,6 +15,8 @@ QT5BASE_SYNC_QT_HEADERS = YES
 # 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
 # 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
 QT5BASE_IGNORE_CVES += CVE-2021-38593
+# 0008-CVE-2022-25255-qprocess5-15.diff.patch
+QT5BASE_IGNORE_CVES += CVE-2022-25255
 
 # A few comments:
 #  * -no-pch to workaround the issue described at
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
