Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBDBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9513C60FD4;
	Sun,  5 Nov 2023 08:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9513C60FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGeqiSYFoH5C; Sun,  5 Nov 2023 08:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDCC60FDF;
	Sun,  5 Nov 2023 08:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFDCC60FDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4462E1BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BDD4401B7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BDD4401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPNM7uy2uh7F for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:55:51 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C95FB4051F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C95FB4051F
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-35941fd3a60so12074605ab.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699174550; x=1699779350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0Ey27oe2aJTVb2DAV+DY3RcfxglB1vE2zVUaNJ+8qU=;
 b=rXEyBVjt/8JsOzXdT08spjlI2n4NMn2fvUJEOPo4oqWWewnXry1mQNWmBuzx2/df32
 v3lciOISGH5mwXZH/5AZZ+Bfuiajm6pFIo+22gskz88TDBMqEcSrXg9ldVb0hbX1sZH7
 8T3KPFWb7yoEaSn3AAvyAECDHvfQ3K304Zg4RaaVVgTenP9AB8pNEhTAAzCsmFNfmUeq
 QoYvUxK4LU5XkMAgkm0uVt4TJewvRXHlhvVvDfPzGi9BJ4foT1zsUAsGUMXA/0pprWEn
 8egD/BW4aesPWmRY3c2Yep4VQOtuacWwXk3+vcZ33IcgzJliF63gFy3t1WlPQ5/E1MV7
 RlVA==
X-Gm-Message-State: AOJu0YxRabzZnlOnEdltmwHntZpw7MURB57lVC+Z7sn7fqY7JhvJHO6Z
 r9e6oOPS+c0mE+4Klvl+5kyVWSmHOMx72Q==
X-Google-Smtp-Source: AGHT+IHWlJhyPCTr3BHdmaHruOL1XqbTsvZ53MpJOAPApG5zR5aASINT7DFtMkkQS8lvbdMwvX4TyA==
X-Received: by 2002:a92:dc83:0:b0:359:523d:f1f7 with SMTP id
 c3-20020a92dc83000000b00359523df1f7mr9038490iln.9.1699174550285; 
 Sun, 05 Nov 2023 01:55:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056e0208ad00b003576e122389sm1774216ilt.24.2023.11.05.01.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:55:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:55:45 -0700
Message-Id: <20231105085546.2919443-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105085546.2919443-1-james.hilliard1@gmail.com>
References: <20231105085546.2919443-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699174550; x=1699779350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0Ey27oe2aJTVb2DAV+DY3RcfxglB1vE2zVUaNJ+8qU=;
 b=ZE9mMmPo5Z9yQ0W/o4obFsJgk60rIlVdNXc7U0FX5KdY9wf45U0GtG7Rwy+IAZkId7
 TPJiUdK7Ix9fOpElW9yoK75QbVgTaJnXxKwXQ5fFv3bQmgXQVewErPNkPzBdqGPZHyVB
 rS2x2Ar+sUo5tiOXLKF1FUgga7wT7G0rTZEmHcwAwKBIgI7AbXTerDhrc/CcscHOsw2z
 nVUdqTNUD3IXzlAhZGqvB3LhnZkgzh1QZpdZt+bk0TGrXwvCSqHzwasL/o5txmrPymIq
 TI2GX/9UVLRmeOaVVm+pbUurdbmpR2ao2g1fALG4ons4EUkr34ejEvZEFdXCpY6BIDP0
 csLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZE9mMmPo
Subject: [Buildroot] [PATCH 2/3] package/python-jsonschema-specifications:
 new package
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
 package/Config.in                               |  1 +
 .../python-jsonschema-specifications/Config.in  |  9 +++++++++
 .../python-jsonschema-specifications.hash       |  5 +++++
 .../python-jsonschema-specifications.mk         | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-jsonschema-specifications/Config.in
 create mode 100644 package/python-jsonschema-specifications/python-jsonschema-specifications.hash
 create mode 100644 package/python-jsonschema-specifications/python-jsonschema-specifications.mk

diff --git a/package/Config.in b/package/Config.in
index 6a2f1cad1a..7167616189 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1133,6 +1133,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
+	source "package/python-jsonschema-specifications/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-lark/Config.in"
diff --git a/package/python-jsonschema-specifications/Config.in b/package/python-jsonschema-specifications/Config.in
new file mode 100644
index 0000000000..31453a12ea
--- /dev/null
+++ b/package/python-jsonschema-specifications/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_JSONSCHEMA_SPECIFICATIONS
+	bool "python-jsonschema-specifications"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-referencing -> python-rpds-py
+	select BR2_PACKAGE_PYTHON_REFERENCING # runtime
+	help
+	  The JSON Schema meta-schemas and vocabularies, exposed as a
+	  Registry.
+
+	  https://github.com/python-jsonschema/jsonschema-specifications
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
new file mode 100644
index 0000000000..5aaba45210
--- /dev/null
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
+md5  d37762167688d8a05024b92dc8a1e20f  jsonschema_specifications-2023.7.1.tar.gz
+sha256  c91a50404e88a1f6ba40636778e2ee08f6e24c5613fe4c53ac24578a5a7f72bb  jsonschema_specifications-2023.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
new file mode 100644
index 0000000000..7a19eee423
--- /dev/null
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-jsonschema-specifications
+#
+################################################################################
+
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.7.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/12/ce/eb5396b34c28cbac19a6a8632f0e03d309135d77285536258b82120198d8
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
+PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
+PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
+PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
