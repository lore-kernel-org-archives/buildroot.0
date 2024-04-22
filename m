Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8816DC4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 18:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE49606D9;
	Mon, 22 Apr 2024 18:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt0G8JC83JKa; Mon, 22 Apr 2024 18:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06B6260854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B6260854;
	Mon, 22 Apr 2024 18:39:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2491BF35C
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 18:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5657A40284
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 18:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUgiUahbO6M4 for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 18:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ADF540185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADF540185
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ADF540185
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 18:39:34 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7da3ec3e044so178236339f.2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 11:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713811173; x=1714415973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R86J6yozD9fmIEzp+Zib7dq6RcHUSnskud26qTI6VU8=;
 b=WmpFy+UhbtLaLlThV4/QBP7Bijgt/uIYsNgUaIqj+LsGnfr9tZsrj0b+jTe3xyAR5B
 Zvnl0w3JTMmvtYjxVPBtAANPcZXEOlRdgCKfB4BMbOiiGjwUz51KoSrXNJW4jy34VAsi
 TQr9KTut20WMxnMm7SGYNm+2gTAfTYmjhhk+J3g+/hsMs86rSh8783rMrUBEEp7UPGRa
 J6BVJOh5n+UvVmhLpBdf3iwQXkBeXbXROxGqqPGChy3/6ONoSUL/f2F+HKo2h5VpPIQM
 65Wff6/ax4CBMsMwKOUW/EorYJcZFbE6w6mFPFwYxqRG0I1ua5BmppkRqe/NpRE/2jHx
 07NQ==
X-Gm-Message-State: AOJu0YweW+UI/VcGjVnUkVaorDLEyUhvpmSb4ql4BQOy1R/gsy4nPRko
 t0BbxKnemZKgNXIDtHDQh54mcBLDLdo2wlKD+6bAKz3e+21IFvDvfsxbLw==
X-Google-Smtp-Source: AGHT+IEV37mDV6Ap8rPKWHZwlU51Bd+DZ5hlfxZgWacfjc5rRLvHNHTpFJ9deMHTVpI9lEnSW4AeRg==
X-Received: by 2002:a5d:8995:0:b0:7d0:d84d:9e13 with SMTP id
 m21-20020a5d8995000000b007d0d84d9e13mr12606925iol.19.1713811172815; 
 Mon, 22 Apr 2024 11:39:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-151.hlrn.qwest.net.
 [71.33.133.151]) by smtp.gmail.com with ESMTPSA id
 ba13-20020a0566383a8d00b00482b2095bb6sm3130941jab.127.2024.04.22.11.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:39:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Apr 2024 12:39:30 -0600
Message-Id: <20240422183930.2330715-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713811173; x=1714415973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R86J6yozD9fmIEzp+Zib7dq6RcHUSnskud26qTI6VU8=;
 b=IbBwel3zrkiqMjield1lsHTkdW74C+gtpGdAnIyRgzix3OWifzo5UCpmWBxdwkAh1Z
 +zTHZ2YEnIAL2BYzNi+7Ba3QTwtRk80ukHyp/1+/4lgqXo7/R3zD95PR3w3kmiMqwnVk
 xjS/qM3bwN+ooM4YUr5uqMqF/mlhMLDxmRvW4A7J+v2U7oFkneYxI6k3eozjpEwUI4a2
 CZoGE90xPe2YWGSeS2NyEcbnZqhelRlwnYgvg+qnmDsKu8vaydBd0yjgL/p60yWIIKSw
 FU9ZfBUJxCfbyKuGwHqNppcnTZa4an9LdUfu7tpAUw+rTpeHOQki4a3NP4n06EUyLeKY
 /WXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IbBwel3z
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.6.8
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year range update:
https://github.com/pymodbus-dev/pymodbus/commit/131d30391efd9c64f1fec857ae0372746374e6d2

Drop no longer required python-six runtime dependency.

Drop no longer required python-serial runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/Config.in            | 6 ++----
 package/python-pymodbus/python-pymodbus.hash | 6 +++---
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 0ba6fb88f0..dac6716b87 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
-	  Pymodbus is a full Modbus protocol implementation.
+	  A fully featured modbus protocol stack in python.
 
-	  https://github.com/riptideio/pymodbus
+	  https://github.com/pymodbus-dev/pymodbus/
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index d9337ffe84..4595246efc 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  89da6585b27b8c4b3887eb9f7d1e950b  pymodbus-3.0.2.tar.gz
-sha256  704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201  pymodbus-3.0.2.tar.gz
+md5  809260ecaaef548c7ac327755d7d2d25  pymodbus-3.6.8.tar.gz
+sha256  abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407  pymodbus-3.6.8.tar.gz
 # Locally computed sha256 checksums
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
+sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 54879d38e9..a96edecc54 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.0.2
+PYTHON_PYMODBUS_VERSION = 3.6.8
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/94/f7/6149a1b107fa54378a7adec83db7cd3679bf02216a6f5c83b37f55335897
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/62/c1/f18b090dcc45d34b6a0e3563acde71b407ef96a36fa965c508a84f755355
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
