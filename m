Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE076C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 15:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894656F4E7;
	Fri, 10 Nov 2023 15:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894656F4E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqplI5SHEwBE; Fri, 10 Nov 2023 15:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87FC6165C;
	Fri, 10 Nov 2023 15:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B87FC6165C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 113E71BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE43642244
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE43642244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxA4-eQXg8RM for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 15:58:35 +0000 (UTC)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07EF342241
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 15:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EF342241
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso1771142b3a.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631914; x=1700236714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q26Z7PcYV0bfrht4aG85dLfTPzD+OdbrhTU8qT0hsAw=;
 b=e4+R+EKekmCL2qYODU9lzjsIrpw0i2+QHmMXwbVqRsqbXbn4qAp2AJZJqT5ta0p+Cr
 FOZ4YviF7n6zohl/4xI05OwxwQabLHtqnYNKG8wMGc3GDdIE21aDebR6LSzu5DDkO6aV
 ZkKX6iFlfoXckj8Bne2MPOkZo9wgKQHRixldHy6z1zmmOLCMQBd+/UaLODlWbon68L84
 WhetP2Y4pmsWRtGd0fTkm0H97DqEcaOt+aWY3GBzYBbQywtuCQpo1Em0t1OKJ+hTSkYf
 9V86OXp/ik7eBA7cEdTsnHfomJ8a6fB4C5iKhN+2bfOOTUf3xDFSYEzP/My8KPmawqKG
 YYBg==
X-Gm-Message-State: AOJu0YxiZyTtuagpCpPSnPl0zXAb7ckQICpAW6Ra/nEBTY9TOcQKQuf8
 P3xQdMPbVHn2Wb25m1P4ig79zdAFYif52p6osBwe4jlWzGw=
X-Google-Smtp-Source: AGHT+IHYJVV40sNnBDxtkeHmBeZeR24sdgd4dsDh5UkkIxCNJFQio0jxN0ygkLHJYJ6Azc/bkihcVQ==
X-Received: by 2002:a05:6a00:1c8f:b0:6c4:d78d:498e with SMTP id
 y15-20020a056a001c8f00b006c4d78d498emr4317477pfw.2.1699631912686; 
 Fri, 10 Nov 2023 07:58:32 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p55-20020a056a0026f700b006c2d53e0b5fsm12796153pfw.57.2023.11.10.07.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:58:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 08:58:21 -0700
Message-ID: <20231110155826.10416-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
References: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699631914; x=1700236714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q26Z7PcYV0bfrht4aG85dLfTPzD+OdbrhTU8qT0hsAw=;
 b=S+KUHiW/xavNzXarBO3DL/zVy9ZGIXuTikuEJf68YtGysgslw0nbl0XIB5ZVpmjxn5
 1IdFmJt0cZaAPs2MYIfGvoAcEO2ZF2ePnuhU7sTsPFcTpyO0RghPSpKkMzCqZpXy2a4H
 VRJdOoMDrwNnpwD5dUZnr5SNaubGibi3XS1hQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=S+KUHiW/
Subject: [Buildroot] [PATCH v3 2/7] package/python-versioneer: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Used with the latest version of python-constantly. It is only needed as a
host package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add this package

 DEVELOPERS                                       |  1 +
 package/python-versioneer/python-versioneer.hash |  5 +++++
 package/python-versioneer/python-versioneer.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-versioneer/python-versioneer.hash
 create mode 100644 package/python-versioneer/python-versioneer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d80931e84a..359714bdb5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
+F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/python-versioneer/python-versioneer.hash b/package/python-versioneer/python-versioneer.hash
new file mode 100644
index 0000000000..44cbeb1593
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/versioneer/json
+md5  1703d6ced3656553066fa71e42c5eee6  versioneer-0.29.tar.gz
+sha256  5ab283b9857211d61b53318b7c792cf68e798e765ee17c27ade9f6c924235731  versioneer-0.29.tar.gz
+# Locally computed sha256 checksums
+sha256  b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c  LICENSE
diff --git a/package/python-versioneer/python-versioneer.mk b/package/python-versioneer/python-versioneer.mk
new file mode 100644
index 0000000000..5dbf0dd1c2
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-versioneer
+#
+################################################################################
+
+PYTHON_VERSIONEER_VERSION = 0.29
+PYTHON_VERSIONEER_SOURCE = versioneer-$(PYTHON_VERSIONEER_VERSION).tar.gz
+PYTHON_VERSIONEER_SITE = https://files.pythonhosted.org/packages/32/d7/854e45d2b03e1a8ee2aa6429dd396d002ce71e5d88b77551b2fb249cb382
+PYTHON_VERSIONEER_SETUP_TYPE = setuptools
+PYTHON_VERSIONEER_LICENSE = Unlicense
+PYTHON_VERSIONEER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
