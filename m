Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AABC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 00:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E713660D64;
	Sun,  5 Nov 2023 00:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E713660D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcskmeKnUmYh; Sun,  5 Nov 2023 00:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28DC260C1A;
	Sun,  5 Nov 2023 00:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DC260C1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC3CE1BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8CC403A7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 00:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F8CC403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_dZ65F5Tri8 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 00:28:58 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1593B4037E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 00:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1593B4037E
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-359974f4c7eso2536905ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 17:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699144136; x=1699748936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RNXGwa3PVhsKK0t1bHf0TXDmp+ekQCnjq8AHD8jB5hk=;
 b=BVrhXblfmwhrMY8s0hnXtXtQLFOnEQbsOu9HsvycS1YCCSWrCT3Vev6q3ztga1wkfu
 Hli4htBUC6nhZb36xsUnVccTeXwxbO5uZtsA4osyxBq3wmyjW4azj+awKrfLRPYJYxzm
 xv4rT7UOETnkPWvYoR5FWcQ9QA1PwZtRDRJXyH8XNkNsY3nLhPXPGdtiA1N+NIUrKSIA
 DSXJ5xaBbUtaW0l8RcKzALBYugIZJ8CBMR1+51HbVxfL3+hZMUhDhGe2w55/Yn8Y6EyV
 T/uxUB7lkjj6eSKJKERY1FkpV+Y9Dqkhp8/xaWh8TrCsGxIsLh8zTowTAgp1Za1dtqB7
 pOMA==
X-Gm-Message-State: AOJu0YzIeXD5//rcAlX5XYBVi3kG4Kq+nfvdXcABJNZpwwepDaMuUI62
 cPixST8+rqm8tzc8X5WhH/KVUhYmjbs=
X-Google-Smtp-Source: AGHT+IGmsmeUTu7JX3U+oqO7Axa4ey/EnFVB3+/pBekLIWrDmWXCM4ziYtnqfxFSmMow+7fMcSA+Bg==
X-Received: by 2002:a05:6e02:1a42:b0:351:1647:5fa0 with SMTP id
 u2-20020a056e021a4200b0035116475fa0mr31690739ilv.18.1699144136617; 
 Sat, 04 Nov 2023 17:28:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056e0205c500b003580cb49ce4sm1543031ils.41.2023.11.04.17.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 17:28:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 18:28:51 -0600
Message-Id: <20231105002852.2708915-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699144136; x=1699748936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RNXGwa3PVhsKK0t1bHf0TXDmp+ekQCnjq8AHD8jB5hk=;
 b=B9nXfQIGvz1R9ad049MExSYKqknQWV6NRdeMCbDvfW6y3X/UhIk7X/Ha0zvZG1pABT
 nltpw3vtKXYs7w/etRjiCmvDJa4cIAOaAMFlR4ySodx8JmlhJGyxXNK7MjC+TD02BQ4k
 gn4ioIKDwan0txCRaYN9TrrkHKILbdZjXCns73vtZzcpfaUpMLYwLQnAdKAWFdPvjHOP
 5LTnJ6zp6+v3JA8dOYWRuy/c83lzkwVnTpj4zvjQ/xB6aAKmtKxWyQ09QhjWymhBBTRB
 ZhxmYec4e7sYc/35BiRw8dckxrysCZkcPRWryFkk3B94e1grxENrt3B9E/Ffb7JPVEy9
 lxtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B9nXfQIG
Subject: [Buildroot] [PATCH 1/2] package/python-types-python-dateutil: new
 package
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
 package/Config.in                                   |  1 +
 package/python-types-python-dateutil/Config.in      |  6 ++++++
 .../python-types-python-dateutil.hash               |  3 +++
 .../python-types-python-dateutil.mk                 | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-types-python-dateutil/Config.in
 create mode 100644 package/python-types-python-dateutil/python-types-python-dateutil.hash
 create mode 100644 package/python-types-python-dateutil/python-types-python-dateutil.mk

diff --git a/package/Config.in b/package/Config.in
index a0d5339b0a..096aa8829e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1357,6 +1357,7 @@ menu "External python modules"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
+	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
diff --git a/package/python-types-python-dateutil/Config.in b/package/python-types-python-dateutil/Config.in
new file mode 100644
index 0000000000..e2a8bb6341
--- /dev/null
+++ b/package/python-types-python-dateutil/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TYPES_PYTHON_DATEUTIL
+	bool "python-types-python-dateutil"
+	help
+	  Typing stubs for python-dateutil.
+
+	  https://github.com/python/typeshed
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
new file mode 100644
index 0000000000..ef5e9380cf
--- /dev/null
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
+md5  58072922ac0c740121e311e970f003bf  types-python-dateutil-2.8.19.14.tar.gz
+sha256  1f4f10ac98bb8b16ade9dbee3518d9ace017821d94b057a425b069f834737f4b  types-python-dateutil-2.8.19.14.tar.gz
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
new file mode 100644
index 0000000000..b230394120
--- /dev/null
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-types-python-dateutil
+#
+################################################################################
+
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.8.19.14
+PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1b/2d/f189e5c03c22700c4ce5aece4b51bb73fa8adcfd7848629de0fb78af5f6f
+PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
+PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
