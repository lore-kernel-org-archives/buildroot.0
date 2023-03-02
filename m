Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D892C6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 13:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67CD6121B;
	Thu,  2 Mar 2023 13:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67CD6121B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5lSRRQadxI0; Thu,  2 Mar 2023 13:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5FF61062;
	Thu,  2 Mar 2023 13:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5FF61062
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DAF01BF290
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56B7761062
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B7761062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j15m0lUSTH1P for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 13:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D491E60BAD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D491E60BAD
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 13:47:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1526687wmi.3
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 05:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ZcyGcTe5rQeLPOBPe2JXKp5NKszf4bJvkXVdFziMPM=;
 b=vLNfqjvuyH3dlycAZ1aAnaV8B3UhJAYGr2A04eccI42nZ4IKxikQEJBRSQ/GPdENxm
 89JK7lNP8BaAfgEv7Q4OlhZeVD9XpBe0gnuIAF/z7lAkq+jcbgloyC4sMnRpZ3mn0dya
 o4Gfw1MUEl6uhpQm2PH/T1FHr4aHXP6hnbNELSyJfSek6yaLBaae8Ykr11nQkFs4x8fg
 xbvjO4PX5j6ftRpbZByqqjlUlqelhUdbgBuJO7k+lcPbNcs3AThkPFsaqwKNGrn/urkx
 ywpw/C/J9DDqqWESR6nDoJNY1nCq7bOGoVsapm0w8CSqdQpVWNbjOo8HwlD81sNA8juo
 j2bQ==
X-Gm-Message-State: AO0yUKXqHbz7Qcsquhuc2ny6JMz8on6LKZpdP+Zz7OooI/CtEyBm0U0h
 HHR6p8Fb+PFQ+oZaoAA7KxBhgEpwUe5N6FPD
X-Google-Smtp-Source: AK7set8Qz4A40GnsrQBuaA7Cznk2VBsPW0VrPmChXDt1yDglpJUidWeQoi6mdZz4Joxg22/+OYZ+OA==
X-Received: by 2002:a05:600c:4a9f:b0:3eb:2da5:e19 with SMTP id
 b31-20020a05600c4a9f00b003eb2da50e19mr7961503wmp.27.1677764819603; 
 Thu, 02 Mar 2023 05:46:59 -0800 (PST)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c5694aef92sm15258205wrx.21.2023.03.02.05.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:46:59 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 14:46:53 +0100
Message-Id: <20230302134656.1780843-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZcyGcTe5rQeLPOBPe2JXKp5NKszf4bJvkXVdFziMPM=;
 b=y6bQoSfqJ31Tacb/aVGflhs3jY3JUAQY8iCCENZNVCotZKmxF7FWeoDu+QsTBk5sf8
 XIn70iunfdo07k+V1TFkhLKc59qF+om9iX0ML22YcrBtpM5YY2OkY7obGs+pI6fIb6xK
 Upl7/no4Jp+cmy2XKRjfRLZxLRZPF0ozQxLpXGDYkffvrn+bLxaCMn2fIJtNi0uKMGJi
 zbt3MQX30sqa4+ZXhrD9pz4H7dAJ7bP9Sja8VHbiDLbKfiuZt5TgoDnLG/90McOB/d+e
 dfDvKBiVUiLhBJZSBf0MjxTWkm2HWiioHSDVKCG8iUF5vheAq3jg5IvYa/OmV9YCc5D1
 cy5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=y6bQoSfq
Subject: [Buildroot] [PATCH v2 1/2] package/nushell: new package
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
Content-Type: multipart/mixed; boundary="===============0246311875246350721=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0246311875246350721==
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
 package/nushell/nushell.mk   | 20 ++++++++++++++++++++
 5 files changed, 35 insertions(+)
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
index 0000000000..f666f44e47
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A new type of shell.
+
+	  https://github.com/nushell/nushell
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
new file mode 100644
index 0000000000..a77e711a5d
--- /dev/null
+++ b/package/nushell/nushell.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
new file mode 100644
index 0000000000..f1b691ada4
--- /dev/null
+++ b/package/nushell/nushell.mk
@@ -0,0 +1,20 @@
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
+# Add /bin/nu to /etc/shells as in package/bash/bash.mk
+define NUSHELL_ADD_MKSH_TO_SHELLS
+	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/nu" >> $(TARGET_DIR)/etc/shells
+endef
+NUSHELL_TARGET_FINALIZE_HOOKS += NUSHELL_ADD_MKSH_TO_SHELLS
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============0246311875246350721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0246311875246350721==--
