Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4249C27C77
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 15:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE72405A6;
	Tue, 11 Jun 2024 15:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRTmhvJNGDHg; Tue, 11 Jun 2024 15:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEA0405E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACEA0405E4;
	Tue, 11 Jun 2024 15:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D015F1BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA07C405A6
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6uE1W18_Qwn for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 15:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 997C540596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997C540596
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 997C540596
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:22:08 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7eb77b1d2fcso129616439f.0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 08:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718119327; x=1718724127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDWcLd/pf0f3WbcedvX+jKIsIRApqhK9rkkWieD6uBw=;
 b=ssaUqV24BC8+uqXYfffxyltLFq3VzYe3vFSeIkrQuPGcigsR+NeUVLMwhRcagmR3ae
 havElHSCj0ZTst4KLcgFQ8SxEit7b2G1viz4kussXP7Q7H2dcc3CozmKg15fKyIlHK6h
 lbbpHfGWCkPOjVDfbem9ZERAaRHyzB/poQcaXwXVN4AKy/CPi3sibJ6QBo+HeRhooJlt
 ir4PS6JcKwuJw3keiokJl1E2SOuuiiagAmcZbrxKPlcf57HtGkpLIV/m079PInOP0sS7
 fozv7m0hFaAfsBACDcUvMjmaIlPiZb0skkIBYVvx91Q28l+e3gdkgoSKujsNgIFaZH0n
 dKmQ==
X-Gm-Message-State: AOJu0YyCqhGKDYis2zlXJT/gtPmB2sgfzrmzLpMTuefhtgiKWNlplQqq
 gXnnJoDTPB8EL2GqMJIbZf6Eoapu9toex70C6B7sK2kYQt0YOJp7z0qBI55x
X-Google-Smtp-Source: AGHT+IFHbpqTYo9ho60kTYs3H/c5waKXY1dbmFcAnyWim9M4DYlXXOaBKMAKRtLYruXIj47VeZDrpg==
X-Received: by 2002:a05:6602:1547:b0:7eb:6f43:a5d2 with SMTP id
 ca18e2360f4ac-7eb6f43aa26mr1059204939f.6.1718119326920; 
 Tue, 11 Jun 2024 08:22:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb81f14c0dsm128268939f.28.2024.06.11.08.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:22:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 09:21:59 -0600
Message-Id: <20240611152202.951202-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718119327; x=1718724127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FDWcLd/pf0f3WbcedvX+jKIsIRApqhK9rkkWieD6uBw=;
 b=b4BcHIyjpKzSDKlGQrcEH9vOz2lpJLy63aSgOICPgSunguWDg3XJRrEWFnXMQFCVzg
 yPoh0gylWGp/0bd6qKH+bXukJiQkjRW7Kf8dpEYVGK4Ge1Hzjt8ohogcRPUhvhWUDrQ3
 JYxnNbp9awA0vPTyvJl9rbXlvYsnsa7zZPFdFY+er3TA39F+MidzHKoENMXEgwKre2Pl
 bXITEkFbEXhkA/zOAriKYPTiLvGTnWNkxTseesP0uE/ub8xdRX+uLVjJHk4x6qY5AkjJ
 ZGHXr96c2fbs9Comv6IYNjdztER9iiKoCyf3UTTsCVr/C6C6KEygIHSWQyaZlj02O7w7
 8Wwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b4BcHIyj
Subject: [Buildroot] [PATCH v2 1/4] package/libjcat: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in            |  1 +
 package/libjcat/Config.in    | 15 +++++++++++++
 package/libjcat/libjcat.hash |  3 +++
 package/libjcat/libjcat.mk   | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/libjcat/Config.in
 create mode 100644 package/libjcat/libjcat.hash
 create mode 100644 package/libjcat/libjcat.mk

diff --git a/package/Config.in b/package/Config.in
index bfbec1c21d..9a948c5536 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1523,6 +1523,7 @@ endmenu
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
 	source "package/libdeflate/Config.in"
+	source "package/libjcat/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
diff --git a/package/libjcat/Config.in b/package/libjcat/Config.in
new file mode 100644
index 0000000000..cf7bc334f5
--- /dev/null
+++ b/package/libjcat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBJCAT
+	bool "libjcat"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Library for reading and writing Jcat files.
+
+	  https://github.com/hughsie/libjcat
+
+comment "fwupd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
new file mode 100644
index 0000000000..b6dc8d2f69
--- /dev/null
+++ b/package/libjcat/libjcat.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
new file mode 100644
index 0000000000..e13e5dbfb7
--- /dev/null
+++ b/package/libjcat/libjcat.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libjcat
+#
+################################################################################
+
+LIBJCAT_VERSION = 0.2.1
+LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
+LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
+LIBJCAT_LICENSE = LGPL-2.1+
+LIBJCAT_LICENSE_FILES = LICENSE
+LIBJCAT_INSTALL_STAGING = YES
+LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2
+
+LIBJCAT_CONF_OPTS = \
+	-Dgtkdoc=false \
+	-Dtests=false \
+	-Ded25519=false \
+	-Dman=false \
+	-Dcli=true
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBJCAT_DEPENDENCIES += host-vala gobject-introspection
+LIBJCAT_CONF_OPTS += -Dintrospection=true -Dvapi=true
+else
+LIBJCAT_CONF_OPTS += -Dintrospection=false -Dvapi=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPG_ERROR)$(BR2_PACKAGE_LIBGPGME),yy)
+LIBJCAT_DEPENDENCIES += libgpg-error libgpgme
+LIBJCAT_CONF_OPTS += -Dgpg=true
+else
+LIBJCAT_CONF_OPTS += -Dgpg=false
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBJCAT_DEPENDENCIES += gnutls
+LIBJCAT_CONF_OPTS += -Dpkcs7=true
+else
+LIBJCAT_CONF_OPTS += -Dpkcs7=false
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
