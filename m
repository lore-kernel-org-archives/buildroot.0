Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C01CC61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E1860BCB;
	Sat, 25 Nov 2023 06:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E1860BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwgdBmpdrgnP; Sat, 25 Nov 2023 06:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2956260B9D;
	Sat, 25 Nov 2023 06:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2956260B9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2AFA1BF39E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B55C60B9D
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B55C60B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8KwYWtLHAbC for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:24:13 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 454BC60B6C
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454BC60B6C
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7b373b0e9b7so60986039f.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700893452; x=1701498252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TdaAEc5SNkbxtziTlT1jo2lBLGTAa5slf2YScudiZAc=;
 b=mtiGh/K6eUiUcVJuBXpwJCg4YnyV/lod8BpcQ0FDDJ01xQbwldF548HUyQCbzqFuh5
 L3VqSoT2xTvvaT/p1cXfyRQlAOLKAcCVSvThaRJEDXduG49heRsWoSrh+SzfizngGNkM
 495Karu3SlP5QIc1ux/LbeLCeXGm4gkC4gPLe+N8YhG7GIQKxfvE/awPcLvU6IIBo3kb
 5N8gqnLQMVhkYx5If05xN2SmnP62kUf/rRJcL5RkUE5NuA/NpJYSXEHnpv0ieQz9/UOB
 d8fGa28hEFwdgzwwNU+iayXYQkF4mVzkLgv51y9CpJcbnaMgZbC8gw9mNqOuJNo848y1
 wPXw==
X-Gm-Message-State: AOJu0Yz9VtnjerKzS4RFg4TcZIfgf6sIeUt4SP/c2U3xfB2EtjfB0OGm
 /SuZrFvTMeajXoQ1EuJ1GYEdcrw8dWg=
X-Google-Smtp-Source: AGHT+IG8BCCZHbEaeIVLlioHZuatMjxqwLBZ7DRrjvKGXlo1SHEgjAudwELL0sg0Ivc912Pq30SbpQ==
X-Received: by 2002:a05:6e02:170e:b0:357:a049:91c4 with SMTP id
 u14-20020a056e02170e00b00357a04991c4mr552062ill.22.1700893451733; 
 Fri, 24 Nov 2023 22:24:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bt4-20020a056638430400b0046678de2a62sm1221118jab.165.2023.11.24.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:24:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:24:08 -0700
Message-Id: <20231125062409.708253-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700893452; x=1701498252; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TdaAEc5SNkbxtziTlT1jo2lBLGTAa5slf2YScudiZAc=;
 b=V24nthP4ziGbN6M3NVHz85xKNQI/d4lJT08e9ZalnTSUotWCGbbqwtMtxKZhYm7BCr
 7q7O/DWr6TGLyMsY+vbCbemnWyp5td8nxbxLEfN+zTaWNcwyXYNPl6cOuuIM4pin81/z
 zStEg7tFHS3/GuGsbijBO4+rP9F9/y/mk+pimWvEqQqpwtPymvieuwH1mXD3ZeWYDvJb
 dIuYqTXWdeIddDx16cxnkYQEBeJSaJ7gNNNEp7RLkdHJmi/b3KGedL0yad3nIziKLi+X
 ajvwIVamheN9cxVThojmZ87knhfRGTdts/E5I3Gc2ktFYulNJeXVOR0tOyDVrEgXVRhC
 Uj5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V24nthP4
Subject: [Buildroot] [PATCH 1/2] package/python-urwid-readline: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                   |  1 +
 package/python-urwid-readline/Config.in             |  8 ++++++++
 .../python-urwid-readline.hash                      |  3 +++
 .../python-urwid-readline/python-urwid-readline.mk  | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-urwid-readline/Config.in
 create mode 100644 package/python-urwid-readline/python-urwid-readline.hash
 create mode 100644 package/python-urwid-readline/python-urwid-readline.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..b096e52d24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1370,6 +1370,7 @@ menu "External python modules"
 	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-urwid-readline/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-urwid-readline/Config.in b/package/python-urwid-readline/Config.in
new file mode 100644
index 0000000000..a8046fc25b
--- /dev/null
+++ b/package/python-urwid-readline/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_URWID_READLINE
+	bool "python-urwid-readline"
+	select BR2_PACKAGE_PYTHON_URWID # runtime
+	help
+	  A textbox edit widget for urwid that supports readline
+	  shortcuts.
+
+	  https://github.com/rr-/urwid_readline
diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
new file mode 100644
index 0000000000..75220e937b
--- /dev/null
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/urwid_readline/json
+md5  6e0bd170f621f0ad3edab1875bdb5c5f  urwid_readline-0.13.tar.gz
+sha256  018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4  urwid_readline-0.13.tar.gz
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
new file mode 100644
index 0000000000..782c425b65
--- /dev/null
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-urwid-readline
+#
+################################################################################
+
+PYTHON_URWID_READLINE_VERSION = 0.13
+PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ab/bb/c5b3fec22268d97ad30232f5533d4a5939d4df7ed3917a8d20d447f1d0a7
+PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
