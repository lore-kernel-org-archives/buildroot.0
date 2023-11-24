Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1644C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 22:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C62D615B9;
	Fri, 24 Nov 2023 22:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C62D615B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uN0t4Ub-Pdn; Fri, 24 Nov 2023 22:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A970615A3;
	Fri, 24 Nov 2023 22:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A970615A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B6781BF20B
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 22:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE947400D1
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 22:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE947400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqAIq92I3Uc3 for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 22:59:52 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 781174004A
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781174004A
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35b10f45696so8023645ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 14:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700866791; x=1701471591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A6/qaZcuNMzHD90TN89agNXVaKAl9meNvsFAfLXB78M=;
 b=tt5WmDxmf3Ru4rHiaG076R3P1igkrZFDBupVMIt0y3c77oGnSbQRwf3JdgQKVbfPDZ
 8kY5/0dj9hv6bmYMjlDKkMKJlnATm8fZ6x+1w1Ui4bX30nJXsUXXqFxHKawbDlvv3AgJ
 Q7yBxqEVXHm5dMuARHFam2wfCbTKyjO7EMOHNJG/zIupT4CsAxm/FiKj3SkTu5a43mlF
 GkYWZ2l7YsLysW+rQthfvD/KsaRzTqjjDyJtpx9RCt3zc6oCCpEjstRxdRCHm6+IaM98
 zNCimkmk1SgiBYLI5JQ+jeCQEi68Y96oZmfJkohzvcgxEpI7n4Ss0pBDvy37dPYVCdYC
 qYCA==
X-Gm-Message-State: AOJu0Yw4lIkWRWESt4yK1bs2G3VD8M9UllZNU/J/BZXpFoZ6WSX4uHkc
 Lnv3NycbUgA/LEyX5lAHrnTE7rKSCc8=
X-Google-Smtp-Source: AGHT+IH3ng1dFBHPMc1HGwODjly/nxRlFVIkoWlALKHKaO/zU65X4KFvlW3VFvxOdphwEMSkNeXKMA==
X-Received: by 2002:a92:cd88:0:b0:35a:fae5:9a78 with SMTP id
 r8-20020a92cd88000000b0035afae59a78mr5486212ilb.31.1700866790979; 
 Fri, 24 Nov 2023 14:59:50 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056e020de900b0035b19b773b8sm1280412ilj.59.2023.11.24.14.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 14:59:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 15:59:44 -0700
Message-Id: <20231124225945.163643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700866791; x=1701471591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A6/qaZcuNMzHD90TN89agNXVaKAl9meNvsFAfLXB78M=;
 b=LpioTC56RE0DLergLXpAxkUbsmp9zKPLQxoCroXDouUiwyUDax8zTxGXpCzVmOf4at
 uTCOa5Cq+/mPd5inToiy0gzfpIRZNj+MXLrVr7mIztb445zbUBVwTPrHaA8goEBSeGCo
 Y07WC78i/T5YGmV6ls9mnPd6uXXp3xf5gUYlRY/nTB91XP/M0tYxCR1dIxRrlf+aXnk/
 u3L9MmVqCW8fwCzIfX8bksdUecN1zbmLyu+UwpKgvbXNwSK4NzAVf2M4mEkGKH+6jSA2
 ILyUU8rroiAW5ruEyUgaYIpNYEL0wtTJd0CKB/1ufWP2QqgjQkfiQxDjzj0a3ZiJLzUe
 S9UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LpioTC56
Subject: [Buildroot] [PATCH 1/2] package/python-aiosqlite: new package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-aiosqlite/Config.in             |  7 +++++++
 package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
 package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-aiosqlite/Config.in
 create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
 create mode 100644 package/python-aiosqlite/python-aiosqlite.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..1f7d262265 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -971,6 +971,7 @@ menu "External python modules"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
+	source "package/python-aiosqlite/Config.in"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
new file mode 100644
index 0000000000..6f2af23cef
--- /dev/null
+++ b/package/python-aiosqlite/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOSQLITE
+	bool "python-aiosqlite"
+	help
+	  aiosqlite provides a friendly, async interface to sqlite
+	  databases.
+
+	  https://aiosqlite.omnilib.dev
diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
new file mode 100644
index 0000000000..e06061346c
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
+md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
+sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
new file mode 100644
index 0000000000..e513d53c02
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiosqlite
+#
+################################################################################
+
+PYTHON_AIOSQLITE_VERSION = 0.19.0
+PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
+PYTHON_AIOSQLITE_SETUP_TYPE = flit
+PYTHON_AIOSQLITE_LICENSE = MIT
+PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
