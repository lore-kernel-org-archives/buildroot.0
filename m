Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F8FC54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 10:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DBF60B8C;
	Thu, 29 May 2025 10:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo-3LCXVZuXQ; Thu, 29 May 2025 10:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD1E61298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD1E61298;
	Thu, 29 May 2025 10:31:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 449FB236
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D9C40C76
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGfKkhvCIvQW for <buildroot@buildroot.org>;
 Thu, 29 May 2025 10:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EC2D40C3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC2D40C3C
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EC2D40C3C
 for <buildroot@buildroot.org>; Thu, 29 May 2025 10:31:34 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6055f106811so22809a12.0
 for <buildroot@buildroot.org>; Thu, 29 May 2025 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748514692; x=1749119492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fEJT5XaMdAKsoE3fuIuMKHsvkVthhgfNhMtZYLxzzGQ=;
 b=oQz6wczkNGZy5mTxQRwSrwqf8FrOiL16XMgSbBxhw8vRmwGHCSLso9Cmt3SMKPGEE6
 Nhu4lF2bhWOr4JNB46xiQxrhIwtHatwZOKpD45QYxhAfHVkAauQDKICxHF289AL5X3LN
 0ESDpw4XHl0Y41oY1Bx3YV35fk2hRp1J8TVEJE29mt14uWBGR+CoR0XDsR73bhkTttk7
 auE4/4Mc4Iwit5bjCWYlzyFlO66rxQ8TN12Cq+FycQZOKxqbZ2TbJYZWAzD8xKzLD5fj
 JKz0IpGdjmIk/KbN4GpVvzVrHutuTlEvSkTQq0CPTmq2Yla6QUQxQR+EaaM/T/lNdWj8
 K0pg==
X-Gm-Message-State: AOJu0YwrzHB42Uwhb+z/58mGmFf/clAt18fUrNMrTNIQ/kPiUfJVwRiA
 5alLGENoKgUzielNlFzYXO3eOIzLNNlbKuWJCvbPEWCMje+/WoLGt2MNg602zEB448/x7gTVM+i
 Pt3AM
X-Gm-Gg: ASbGnctEJUBans7yYQHoH4jPeMa4pTtwt/0ITUE2PFCpH/CzpKCzY/BpylneuHOhy68
 wMcoIh9RlQaOIxTcIfW/DYBEnOCDWZQOsbvVr9mXC+0AXZYPwqQ95DeCAoByNJvc8/ZwNI3Ez6C
 JLNJlcl2zOI67i882LgEgHg8+n/sHlsEyYdXp9u1MyXoIIQWMlyHViLjiAH8Kw7RDSAJFKbCqhg
 Qoq8hGT8FH6j4Y2zlbYj92RhWGreEasyIBsaNbTAsVl6lzZq7zh7nAilazrQwysCxl0HOFghR7M
 a7/yeTp8XnM6GBjJPyJp16/bFt7TcS6JB05HqYDYSckbJO2mEy7ZYLGuQnJFi6OGLb6LYucGLX/
 X1yXveFyQkATPURQw
X-Google-Smtp-Source: AGHT+IHoVlJSWt7Wqoh5GaS7j/qvINCHtXYwg+R1XRUy2J/ZPS9D68MgBSOBvneQI/vbPBCcAbmvuw==
X-Received: by 2002:a05:6402:5213:b0:605:3a3e:3d9a with SMTP id
 4fb4d7f45d1cf-6053a3e41a0mr2314829a12.14.1748514692395; 
 Thu, 29 May 2025 03:31:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6051d79ecc2sm2126105a12.72.2025.05.29.03.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 03:31:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 29 May 2025 12:31:28 +0200
Message-ID: <20250529103129.2349689-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1748514692; x=1749119492;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fEJT5XaMdAKsoE3fuIuMKHsvkVthhgfNhMtZYLxzzGQ=;
 b=T6mviRFj+gLTFoeoAY9nP9FW6x0KWq3GK5Ze7WQYB00kiG+9Fiw2KqgOtwA7NODIzN
 FCVPr09r480qbIrWnzEgVcZVKlFYHd7hmiSILVCFCyVCo3sqbhvZdykNI3LBHx6rvcUn
 x42DOLQ8ENeBSWv6bFN+IGkCGcdUsLqxDgbd8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=T6mviRFj
Subject: [Buildroot] [PATCH 1/2] package/pocketpy: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is a portable Python 3.x interpreter, written in C11. It has no
dependencies other than the C standard library, which can be easily
integrated into your C/C++ project

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pocketpy/Config.in     |  8 ++++++++
 package/pocketpy/pocketpy.hash |  3 +++
 package/pocketpy/pocketpy.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/pocketpy/Config.in
 create mode 100644 package/pocketpy/pocketpy.hash
 create mode 100644 package/pocketpy/pocketpy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d471b9ab6f90..771c5cf31322 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/ufs-utils/
diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87d5..9aad65488a6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -968,6 +968,7 @@ if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
+	source "package/pocketpy/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
diff --git a/package/pocketpy/Config.in b/package/pocketpy/Config.in
new file mode 100644
index 000000000000..70ebf79ba1f3
--- /dev/null
+++ b/package/pocketpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_POCKETPY
+	bool "pocketpy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  pocketpy is a portable Python 3.x interpreter,
+	  written in C11.
+
+	  https://github.com/pocketpy/pocketpy
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
new file mode 100644
index 000000000000..aabd5f077a2b
--- /dev/null
+++ b/package/pocketpy/pocketpy.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
+sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
new file mode 100644
index 000000000000..d81086859890
--- /dev/null
+++ b/package/pocketpy/pocketpy.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pocketpy
+#
+################################################################################
+
+POCKETPY_VERSION = 2.0.8
+POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
+POCKETPY_LICENSE = MIT
+POCKETPY_LICENSE_FILES = LICENSE
+
+POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
+
+define POCKETPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/pocketpy
+	cp -r $(@D)/include/* $(STAGING_DIR)/usr/include/pocketpy
+endef
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
