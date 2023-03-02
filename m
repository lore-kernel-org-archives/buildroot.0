Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D85C6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 12:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877DA611E4;
	Thu,  2 Mar 2023 12:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877DA611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j31hDZgweOm1; Thu,  2 Mar 2023 12:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A34B61192;
	Thu,  2 Mar 2023 12:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A34B61192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B364B1BF2F3
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC6A82064
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC6A82064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgDpd2NReIzK for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 12:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F6782066
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0F6782066
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 12:21:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g3so7452616wri.6
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 04:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xzR1oqHGEg55AsQg7hUTJyrPZRid1wUFF5PsXu7S5HE=;
 b=3KcLezzC5Uediwfi3GfrdhzTpSy4lROIVToTn2eFzc2gTTqNJBU5wGaCf1jd2bUXRg
 eoRYvVod4Giv/FjJMINhyfdYN1/1uOiXUiB6Iw+39WapSrGfDcZAetBMQZCyBcO/hmhK
 TUcg8FooVx5ygNVBn0HVGYO7qyF2YoTMaxXOZw69XtKDC4Z8+l+2VU2/ATRIfRMEJb92
 TkDLzrpKlEw+v2Lng7q9LGRIny9U/sOG5CK2c45LmFoAj9LihyTnTqHGVrWG3k8hhpfH
 Rsh5P7R5+eD6iR9ORNIl5mvzgHWxoNSTbhssP08cEKLzFmpyZXPvYribGkaQCrrqb75e
 jF8g==
X-Gm-Message-State: AO0yUKWIj4bEv1Q/enMv8xpAmOPIwE/HF2u0i0dsQ+zOtcZkgFruy4dA
 4sHdxndfLUjZMMXiU0Y8SevcL4NuhfeuLdA3
X-Google-Smtp-Source: AK7set+hS30+2ibsw0oslb3ksVTAOqQHtUkPhha7OnmeanhV0jCTC3N8UwOITtbsNWyO3su62CjUCw==
X-Received: by 2002:adf:dd04:0:b0:2c7:bfe:4f60 with SMTP id
 a4-20020adfdd04000000b002c70bfe4f60mr8004915wrm.15.1677759673657; 
 Thu, 02 Mar 2023 04:21:13 -0800 (PST)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfefcc000000b002c54f4d0f71sm15089688wrp.38.2023.03.02.04.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:21:13 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 13:20:42 +0100
Message-Id: <20230302122044.1769154-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xzR1oqHGEg55AsQg7hUTJyrPZRid1wUFF5PsXu7S5HE=;
 b=DcTl6UjbN9KUOMUk58EcQN1HpF9V6jYjFPmwOID5jvGNyKbmhSZloRkJkJsZpXGeIj
 8Bffdd8sWZxJAwXa2lDnFcetBaZfuBBKn3xl4VTcJxCb8uIfgdBF9Vw40/hi7F93BUTG
 RWbTvb3ab7LBbm3YGx+YwJoRs9fagRwU8Tmk8p66Ug1dpP3h85N9Ase+ZZ+BbMN31c+G
 kj7ExcpijO3t23csnkt6IjRgRdhAl5FywDDLhLeTj7v3aTKXkKQLl3TV5ES9ImGzMhDa
 ELjGGADFo77BfhTm9nrJDBQ+pCt+7ibD5yyx/L7HAoQs+gBpsww69iFmRh55Ellnginf
 3IPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DcTl6Ujb
Subject: [Buildroot] [PATCH 1/2] package/nushell: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============0052110015093946951=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0052110015093946951==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Nushell is a shell - written in Rust - that makes use of the nushell
language to interact with the operating system

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
If you connect via a serial port and use getty (default for busybox)
nushell will be unusable. One needs to either connect via SSH or use
agetty instead.

Nushell is not POSIX compliant and therefore should not be used as login
shell since some programs might assume a POSIX-compliant shell and
therefore break the system.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/nushell/Config.in    |  9 +++++++++
 package/nushell/nushell.hash |  2 ++
 package/nushell/nushell.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/nushell/Config.in
 create mode 100644 package/nushell/nushell.hash
 create mode 100644 package/nushell/nushell.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..4577f20b22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2550,6 +2550,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:  Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/nushell/
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 3ace25c665..7fca46afb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2577,6 +2577,7 @@ comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
 	source "package/mksh/Config.in"
+	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/apg/Config.in"
diff --git a/package/nushell/Config.in b/package/nushell/Config.in
new file mode 100644
index 0000000000..d59bc79729
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	help
+		A new type of shell.
+
+		https://github.com/nushell/nushell
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
new file mode 100644
index 0000000000..c8672badf5
--- /dev/null
+++ b/package/nushell/nushell.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a nushell-0.76.0.tar.gz
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
new file mode 100644
index 0000000000..6c77077a49
--- /dev/null
+++ b/package/nushell/nushell.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nushell
+#
+################################################################################
+
+NUSHELL_VERSION = 0.76.0
+NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
+NUSHELL_LICENSE = MIT
+NUSHELL_LICENSE_FILES = LICENSE
+NUSHELL_DEPENDENCIES = openssl host-pkgconf
+
+
+# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define NUSHELL_ADD_MKSH_TO_SHELLS
+	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/nu" >> $(TARGET_DIR)/etc/shells
+endef
+NUSHELL_TARGET_FINALIZE_HOOKS += NUSHELL_ADD_MKSH_TO_SHELLS
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============0052110015093946951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0052110015093946951==--
