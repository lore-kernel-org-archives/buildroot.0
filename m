Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAF6C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 04:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386B56102D;
	Tue, 17 Jan 2023 04:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386B56102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJvvppehn-93; Tue, 17 Jan 2023 04:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D40860FC8;
	Tue, 17 Jan 2023 04:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D40860FC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78AA91BF3DD
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 04:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC884173F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 04:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC884173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HG5ayQlsh75q for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 04:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2135241736
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2135241736
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 04:16:15 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id v6so5361875ilq.3
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NaXGG0Sx1UE67gSGslM0FpE8Fx/5JYgBL3y0MwLrhtk=;
 b=3T8ulFQb7VrJbGLhj+CQV/0mS3Qh6g1DXIR9S5AO6rf8piEaHPsxvh/oUBycfdfNVN
 N+jaja2unRWPQAMUtopBWrKYpEDnMzXbsBw9Pzi/j+86ZQUlJlkPAQ8RuE0Alff5nZex
 IPxsbJpS9uCi1QtQYVijKIjoRh6sTz3XT0qxv6ujwUK7tNuId5xdUjZIlDcNrRu2dcFW
 YIa22CRime80PrUMM+CEo4K+8yadr880ZUiLPYhZ1wIiKebQuobt3oKT7frdbAqeEZvN
 Z3+wasvCNBlPnR4981fxsuPIl2y3eLco3shQQrDb7wERYBYPMPjtS2nWcIkvzotBr0DA
 Q2vg==
X-Gm-Message-State: AFqh2krrx6t5DN/bzIBVn2Y1ipxFG+CVDAWQQK4A/iS1ZvORsganlQHK
 WVhdN9cyV8vLrgp4Of1I8KzFLzeOtP5PZ233
X-Google-Smtp-Source: AMrXdXsU+knsEUv5mRDQmU0kmCzMKSqU8DDPfJtMRFsQgjEa2ZMG5h9Cr98woP0aU3rzvE/9+dyvMg==
X-Received: by 2002:a92:cc52:0:b0:30c:1b36:73af with SMTP id
 t18-20020a92cc52000000b0030c1b3673afmr1423099ilq.25.1673928973910; 
 Mon, 16 Jan 2023 20:16:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 z68-20020a0293ca000000b0039e784a32b3sm8489816jah.88.2023.01.16.20.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 20:16:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:16:10 -0700
Message-Id: <20230117041610.3236462-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NaXGG0Sx1UE67gSGslM0FpE8Fx/5JYgBL3y0MwLrhtk=;
 b=PlMlj3NT18/Xp0f/0lm5gFobAfAoWVKsCitoHuQCBYSdGb5hgzPq3RHkEck5Zh32Gq
 hk3J1mzUByRVDa+ddcuU/dNSYng5gZnxhNaIT7vYVxO4KCItYHEH2VuUnLnRu3fQ5v2O
 FmHqvscinvmp0WOIKAWHgFHccGn8JA2vXupV7divT0hoxzAWEJ+c9/PA1lfPFbHxpXqW
 X7Pz5G6XOzq0tFlwRuZUVJNJwE/F871/VqWnm5rS+YblW17zbCt+08xMc9WLgO9rN/9B
 X/nGSa899OS+LKUH4s9/GldoKZOuc+GsY99ZkGAR0PnZc6p/5HgzJRmkWYqvWSKO6Pu7
 j2Ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PlMlj3NT
Subject: [Buildroot] [PATCH 1/1] package/python-uhid: new package
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

This package requires CONFIG_UHID kernel support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-uhid/Config.in        |  6 ++++++
 package/python-uhid/python-uhid.hash |  5 +++++
 package/python-uhid/python-uhid.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-uhid/Config.in
 create mode 100644 package/python-uhid/python-uhid.hash
 create mode 100644 package/python-uhid/python-uhid.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..7fab6cc924 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1395,6 +1395,7 @@ F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
+F:	package/python-uhid/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..53b07731d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1313,6 +1313,7 @@ menu "External python modules"
 	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
+	source "package/python-uhid/Config.in"
 	source "package/python-ujson/Config.in"
 	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
diff --git a/package/python-uhid/Config.in b/package/python-uhid/Config.in
new file mode 100644
index 0000000000..6fdff95144
--- /dev/null
+++ b/package/python-uhid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_UHID
+	bool "python-uhid"
+	help
+	  Pure Python typed UHID wrapper.
+
+	  https://github.com/FFY00/python-uhid
diff --git a/package/python-uhid/python-uhid.hash b/package/python-uhid/python-uhid.hash
new file mode 100644
index 0000000000..3faf6d9f23
--- /dev/null
+++ b/package/python-uhid/python-uhid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uhid/json
+md5  1c62bbefe10923545bbdf42355d9be07  uhid-0.0.1.tar.gz
+sha256  3c782489890dbf33621fb2c30d1ac81fbc1b3ef1911ae7d4c73907cdc0f59aab  uhid-0.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  106a8f7c2c26bd2acc597c79a36a2fe3979f98a14dc14c6065b7dc9c58b27f33  LICENSE
diff --git a/package/python-uhid/python-uhid.mk b/package/python-uhid/python-uhid.mk
new file mode 100644
index 0000000000..215545b60f
--- /dev/null
+++ b/package/python-uhid/python-uhid.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-uhid
+#
+################################################################################
+
+PYTHON_UHID_VERSION = 0.0.1
+PYTHON_UHID_SOURCE = uhid-$(PYTHON_UHID_VERSION).tar.gz
+PYTHON_UHID_SITE = https://files.pythonhosted.org/packages/cb/44/6ebe9dceadc028507d16603e2bb542557a4c70c6032ef8ee507c3ce51283
+PYTHON_UHID_SETUP_TYPE = setuptools
+PYTHON_UHID_LICENSE = MIT
+PYTHON_UHID_LICENSE_FILES = LICENSE
+
+define PYTHON_UHID_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HID)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UHID)
+endef
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
