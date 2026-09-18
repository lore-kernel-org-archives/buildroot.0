Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8FCC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 22:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6787F40CD1;
	Fri, 18 Sep 2026 22:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPwGFCT9tl9H; Fri, 18 Sep 2026 22:53:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7AD3E40CD4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789772004;
	b=HrXlPCTolq2U7jpIMPX4WmpaLXualB8ZWhN+yN31R/BTtQFNODRZkHHTzoT9s3tRAnkf
	 Big72HQgLPYUXqQxhqckLvPs50Tfe/Gr+pQTY3d3d12Lpb/sKY3LsIR8K/z5hAVFIOQjw
	 N3zKW0RHFGwArlLwgqMQK6+iMKrFUNd+36V7cgY1Nsy0BP1S37ye0RfT+C609CqL0v2tj
	 JnD4yE7oj9eTyuScXIqusPaoB/CwhJ3jKV19r6Sm/FaKs6Oqz3gpPPTPEc5YWoD+QNi8w
	 qJg6gk8qWBjnlND+dasLxYs39LOZgN0CvFrpKGdZtxKcnMzmVz1scqYqr4jfrm2lCEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789772004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=79N8A8sqTi3BVpuqfEgZgVP5EDitv14BCRxVP+rjEm0=;
	b=BNC2KhXz6TfXJCD3STLTlFHLD1RSoSIZTBuWrfMzgn7B/nb0aBy4w8GuS3EawFNnRu90
	 x/1/O7yX0DNE2f48HVlp/lhy1ymcUFdSYBtAOr9TZqJoNt4qxGcKi+B+45/RyYttOIivy
	 gOk2X1Z9ftMfrjfNre6S/TfAqpybjn4JUHW3WQk/5TTNFV/0BafnIBV5+kSLUR3QhZ//h
	 VPPZRvaz2cF6y9zTbPkiKBrlukgSW3OAdQxjVawGAvDiSm8LTN1EZQ9m6LwJh/fOouMS+
	 DRtTZle0Ixm+a4zIrCLd7VnQ6b5AcJf4cuCSaKB6nwgqg7UCEhK6QuSZ4r2W0E/YtYw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789772004;
	bh=79N8A8sqTi3BVpuqfEgZgVP5EDitv14BCRxVP+rjEm0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXKe+D3ZIhrRVZMlE1nEcgf2Pk/GgNBjpaAmQ+cPzmVwAjhro3Ar5WpT6ad30pbxE
	 5vLLBx30AAlntaBy1efcnXEcKpKCL++a3W5liC6KVVCwz7ue9hKmoF8+2OrvyGP/Kx
	 /JQfa7Ehj9MBwjd7S2dr6BpOgOvtpUYOmHKytx2SZLYzFO/O2CClYEVyDzv5T70+Dl
	 6DEWl0G7y1RxKR7zsscZcCyJQc5nsyThnP5kzXTV/dwqDIZ2Kz/QFHjn6LwDKjqdUL
	 3nsk+sP2J+YRvq9jS4e/NwSOxELhDm+ygGnDNpDLcPh8aaqqLKZ81+wxOfcPG4UwgV
	 t8Vt8lxvwecsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD3E40CD4;
	Fri, 18 Sep 2026 22:53:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C994329B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBBA260D5B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YBzWARf5s2S for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 22:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9004D60BCE
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=74.125.225.141
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789772002;
 b=JD2uCXmXLgKoHeuJXEdx8+XQtohoBOFTnG9II46QWY3gQ7pjWWvX70TklmxYm0Uotknq
 c73PhPQ0y3fGIU+IC09oztCafX4JbIm5cAZh60CnwWZzh0c++IArf2jrdF4zCjMMVV2rf
 VCXnqMImiMre4dftErjTuH0NzMA82LRXLER1xoDzE/uzIrdoUTaGSB4sEGlDIygBgnhRE
 dtjOTCSeL5F5NaufpWcZK/0N+gQqs3y+wMjMgXj8azI+i2TJbM/jRqX02ymUHEF4J4smf
 t2tZoAGaLpxjZ+QtTfyG6bL/GZhnN97ThuvfNKBzcxKNYV3Mu413EtuMozw4Ez501Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789772002;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=5Mm8z27pX5qYy4GqEsifvbJWWwmbKEGw0IunR0bZkpM=;
 b=nrFXglqZP/6NdOtvGwyqrMegmZVM4eIU2gDBR9y/TAuW9JY9+NSwNCU+QXpyGzM6NUJv
 JzK5wdINOcZUyabHio7dC03jY5v5pMRhUb2f4XlS4gmUE0nYHNCMiCWQKVd5BL3sb9FsV
 rBCL1mXvXFHMilGxW0tGWJU3XGKEw/nwgufKUhtJ3abhEraW03kMbP1TZHAlJrRWeKqhE
 vu4At4SS8WKfrHNSTbeU+h8YYCmHcTsnkuFSaDqAjSoj587L060ajTHK2+vJebQZXDcj1
 sLFsLK+BL5k204vPXbZbyqPV8aFULqAHkJfI4lNV1e2N8hyDuoHNCXusBtjAcXGHTaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.141
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.141;
 helo=mail-wm2-f13.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9004D60BCE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:53:21 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so8007665e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 15:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789771999; x=1790376799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5Mm8z27pX5qYy4GqEsifvbJWWwmbKEGw0IunR0bZkpM=;
 b=nH43R7oFc+XMlZ6lZEUlHKGDxanvjUZYS0ZdOVc6iVg9Nrn6ED3iJK/EHLZcnZ7qFn
 MTzhavwOTKGxEKnvvWr4M/5AMNYkoQM9SIscZzMbcU4y46K3tMeWNYUWhumZS+DcwAhy
 A0pxaJLCvbTb0m45dgb6JSdTye1rBALlugzl3S1WqnpbXueCHO+h8jJqcaGGWGI31Rv8
 xHMOGMlap70K2X8Tr8s+T2iEyG51LTC7UWGRwN6nf4kGaRQyJ53qZqAKyjKjGxDdgVGQ
 dQDJNdw+J1mBhsCtL99qZo2XuaGt3bTPZhXM79TyL0DXokGT1dYMf0Wc9/u0ECMjA4yb
 +u4g==
X-Gm-Message-State: AFuF++ku+bij51rKI2g9v5UD6AYwwVEJzbzKC8ipDNCGUqI85TA9AfXO
 zGJDfC8Fo7Bxsuv59rwHVbv7iz12Ij2sXRO5I6YrdQVBwsaktIK62K0s
X-Gm-Gg: AYBFou1o2qTU/UFbDHTiyUmv0byj3oh3odOBZT8oj0dIf1YwHXdzDooOGCp4u0Q9Kdb
 gd9NrIamgSiYHgtRpmj2oiPss1YgEZJQyn6BJctAde0FALs9+JrgClwEaoX7OMzexTWA9NMqpWT
 /Bp7T3piwkXY/Ln3nAdlOJnnIyeMNSnnkAH5qKWcK8SAkSEypupFKr7Jrn+0aFety4wyvZcTmS4
 eN5t/Tb9D0YDSOLfKQqkCs3gn9ELO+ttxzXL3tYRqNECDXjVpynBlLZ4RLG8/e/LlqoPGh6zDzF
 Opbm3SNVh+OtqSXoCtndOVE5FmIdTGUyNWFHJt7aVv/UPtXYyQCtBF2qbZSmYkO7JeN/R4ZZf6M
 486ST4jSIER123y804O5uiGyk42Q3wM8tnihiJMb4sNLoSUcX4Gpl1xUdFMPBpdlpGJSfMeJ+rp
 Dadzmz68PdNn1MHxT7lsvYE0O/GnALR+PpQqGFFLD4l27eRGAph/p3WSDhZcFNpDW+pKbZ0A9XG
 sfq/JOg9uuHWwbIjtojrDDK06jbYH9GFnO/VJeSfsW7CVKReZjTOE3P6cQPlXgNhpWrDKbOGh47
 qN5TDY4v5OoGeJqOuQwyW4ti3yfMS95Eeg==
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id
 5b1f17b1804b1-49fc573a0damr57459185e9.25.1789771998935; 
 Fri, 18 Sep 2026 15:53:18 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7660:3f83:58b7:bd0f])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-49fcce144b1sm42724675e9.0.2026.09.18.15.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 15:53:18 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Sat, 19 Sep 2026 00:53:15 +0200
Message-ID: <20260918225315.4008488-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827102406.3088679-1-thomas.devoogdt@barco.com>
References: <20260827102406.3088679-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v8] package/sema-linux: add new unified adlink
 sema drivers package
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

From: Devreese Jorik <jorik.devreese@barco.com>

Add the unified sema-linux package, which replaces the archived
sema-linux-ec repository from Adlink. This unified upstream repository
provides support for both BMC (Board Management Controller) and EC
(Embedded Controller) devices.

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: reworked patch
 - added user sw step
 - fixed help text
 - fixed hash and license info
v3: fixed build args
v4: fix missing util-linux dependency
v5: reworked patch
 - fix parallel build
 - add and use app_build/app_install
v6: rework to use sema-linux as sema-linux-ec was archived
v7: fix wrong hash entry
v8: bump to v4.4.5
---
 package/Config.in                  |  1 +
 package/sema-linux/Config.in       | 14 ++++++++++++
 package/sema-linux/sema-linux.hash |  5 +++++
 package/sema-linux/sema-linux.mk   | 34 ++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/sema-linux/Config.in
 create mode 100644 package/sema-linux/sema-linux.hash
 create mode 100644 package/sema-linux/sema-linux.mk

diff --git a/package/Config.in b/package/Config.in
index 9c2800781e5..fc964be7198 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -610,6 +610,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux/Config.in b/package/sema-linux/Config.in
new file mode 100644
index 00000000000..04a14484449
--- /dev/null
+++ b/package/sema-linux/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEMA_LINUX
+	bool "sema-linux"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux
+
+comment "sema-linux needs a toolchain w/ dynamic library, Linux kernel"
+	depends on BR2_STATIC_LIBS || !BR2_LINUX_KERNEL
diff --git a/package/sema-linux/sema-linux.hash b/package/sema-linux/sema-linux.hash
new file mode 100644
index 00000000000..a66c0ade050
--- /dev/null
+++ b/package/sema-linux/sema-linux.hash
@@ -0,0 +1,5 @@
+# locally computed
+sha256  510d30023e8216626bfd0fafa9bc75ad5f9f8e7c98eed3fe2a23884c6a3b361f  sema-linux-v4.4.5.tar.gz
+sha256  71be2577bc5028f0e15bb170439878b61593967460e88e0d26a889430a32db00  LICENSE.BSD3
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
+sha256  f484be998be05569aa68e5afb1d29a37cbe2cc7947aea66df83bab7bbdfd74f3  LICENSE.dual
diff --git a/package/sema-linux/sema-linux.mk b/package/sema-linux/sema-linux.mk
new file mode 100644
index 00000000000..1fd2e371675
--- /dev/null
+++ b/package/sema-linux/sema-linux.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# sema-linux
+#
+################################################################################
+
+SEMA_LINUX_VERSION = v4.4.5
+SEMA_LINUX_SITE = $(call github,ADLINK,sema-linux,$(SEMA_LINUX_VERSION))
+SEMA_LINUX_LICENSE = BSD-3-Clause or GPL-2.0
+SEMA_LINUX_LICENSE_FILES = LICENSE.BSD3 LICENSE.GPLv2 LICENSE.dual
+SEMA_LINUX_DEPENDENCIES = util-linux
+
+define SEMA_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) app_build
+endef
+
+define SEMA_LINUX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) app_install
+endef
+
+define SEMA_LINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BACKLIGHT_CLASS_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIOLIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HWMON)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C_BOARDINFO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NVMEM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG_CORE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
