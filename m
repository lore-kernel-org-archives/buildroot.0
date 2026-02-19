Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BD1E9A051
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 16:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E64060E3A;
	Thu, 19 Feb 2026 16:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-8XwBP4TYCl; Thu, 19 Feb 2026 16:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D6060E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771519857;
	bh=m9FNU3487qSWfgpM3AlrQK2z9KX7mZP6N3txFlbhkkM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lJLZkeoxje34nKftbdY3tCORSs84FaMq1/Cy3NwLxwS63MO9mduzujpcz6uV3U56W
	 Y/5LdJGrDZC5lPPoib98nLnNiDND7KpHp5FEkSB/8An7QhxnxegamuvUDoboEUSaU3
	 CjqtUIhe8PzzpAXqofJPVRJhLZnGkhsqyO60RZBm+wo4ZxoDPDJQ2IFbkXcQtc5pND
	 +flHTLlD48bch/tdh0XEjEZir+dUs5zb5MIR3tnzJyv6xIkncDXHUYIr91SO2gxp90
	 VygzcM0kRrShGOXYyxMg3Z/ZX2bKLHwP5TElW8OC6xkfSxBZq7iOWYYjFPZ51EB2UF
	 lbVX33tU9XKxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D6060E45;
	Thu, 19 Feb 2026 16:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C336206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 16:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DABB40425
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 16:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX5dYLBjj5cb for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 16:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF60B4035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF60B4035F
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF60B4035F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 16:50:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso8326155ad.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 08:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771519855; x=1772124655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gt7W3fFLnoYVSTwFPlZPzW16maSOSVyMqw7zm1XRmJk=;
 b=WeB6AxVbyW9c1ZnB7LuHGZ2WsIytOptf3gg0Y4SR1VVGU32j8i8SoNKWtPAz4iSdka
 +kkx+vUvAkaLC0dbheVKJJrcVMUyhaqB/IWGuu3o3TzQrvpuAOemSbZ3hFdG6xwIVjJc
 2xQZhvJxYOqxBLSMCzgdhdCsdj0hw5VaSKVY08GxgSpIBS7NvBYktjll59KBcdR1oOOh
 zT2KLuMu/g5RtxUZr2gntOGA6DzKLvDDp/5blYDxY8Rs+mWq6Z5jmU9iAQPupBWMDx5j
 UB2wlC+JO+z47WM4sNyJaKs8sWLJwr9ApSRoD/c5qat4KfnJsZA/XStXpYqPYdyIXc7N
 Sk0g==
X-Gm-Message-State: AOJu0YzlUxTILRIOzWh/mZ+nWeHpWWP4aaP2JTCyrk7JDpX5IYj+92CB
 qZ2k186uHYgDWhTmrkBkbun6ZdfsN9tk6i9kTIXbU03phYSe8G3oacF09qgYVr+D
X-Gm-Gg: AZuq6aLpAeaAAxrV+AieKFKdF1o0Fude2sw+ooKroq/KtRcqUbJFtxgpM4TowxdagLI
 LQD8O8vEMgUbJe5R0ANGvbmVWVpwNEdhZ8ecP/47QpPKHyFpzFp2MDDupSRdQ+DRFxpOeQfgYDv
 VQTEVAodfjlBoE/u2IMDChqpr13CyPKrfIQYtmHp28gbHbxfMo4oKv9pZuXQhSYQgwq9Rwutjs0
 P0tZSW45N7DQkcy3sdwLDC0RotUfBIkez68Tj55Op6TxSPb2a/lYYkXRHa9AgCWalO9ty21veyn
 cFfSYf1fUTfVe1GoYQS+l9kSALQUejsPjrkWfJ2kQsSdlb1Omj+dhTPZrdJGpHLkOiHKIku1Bss
 J6R4tGMyiQz19XeKjybvPrJxE/Edf9+kWvQxtfUZ7EeT8GlAbJVJsXk2rcD0BGCvOiDfX3XSg39
 A+hcMkh0Wc+SqY60mFrdrjzdIReld0Or32oeo=
X-Received: by 2002:a17:902:cec7:b0:2aa:e817:1bda with SMTP id
 d9443c01a7336-2ad5f94011fmr23197835ad.12.1771519854528; 
 Thu, 19 Feb 2026 08:50:54 -0800 (PST)
Received: from fedora ([2409:40e5:11f4:5620:4e1e:6f24:6c18:dcbb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1aae9d73sm152184615ad.77.2026.02.19.08.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:50:53 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 19 Feb 2026 22:20:39 +0530
Message-ID: <20260219165039.546136-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771519855; x=1772124655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gt7W3fFLnoYVSTwFPlZPzW16maSOSVyMqw7zm1XRmJk=;
 b=gyekCRWmp5Gfzf9TRh0LHOkQnjboZ2h6v8nCA6JcCb0B9TZEfAA6yidXnRX3WVfAuU
 DhEOxRWCEHlZgmv3DXTTbEGqaWe6R6mMQnX/Z1lozkh7FG3wVsXOrf0U9KKPy5b+PlSO
 JoRApk7P/JjPzZBRln4/Dp9fW7ukKWO3xAuithEJ/VqS8djIOXg9k05g7hqtrPtl1auN
 lZmzDmGmudt9RbMGIF950FOafhyQiOZPqL6aEmX9v/DSOnH6+B6gGWiEJXgC97meVs4V
 ni9XQFDxjF15bq9eNhXdUsWQFiNvxAKGQqDReKSidjWcfx/yJTCfxrve54UaKr4HkyIG
 m8oA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gyekCRWm
Subject: [Buildroot] [PATCH v2] package/obstack-standalone: new package
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

obstack-standalone provides the GNU obstack memory allocation
functions as a standalone library, for use with systems that
do not have glibc (such as musl-based systems).

https://github.com/void-linux/obstack

Signed-off-by: Shubham Chakraborty  <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                                      |  4 ++++
 package/Config.in                               |  1 +
 package/obstack-standalone/Config.in            |  9 +++++++++
 .../obstack-standalone/obstack-standalone.hash  |  4 ++++
 .../obstack-standalone/obstack-standalone.mk    | 17 +++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/obstack-standalone/Config.in
 create mode 100644 package/obstack-standalone/obstack-standalone.hash
 create mode 100644 package/obstack-standalone/obstack-standalone.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..b7c5c9361a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3563,3 +3563,7 @@ F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
 F:	support/testing/tests/package/test_quazip.py
+
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/obstack-standalone/
+
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..310f4014c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2253,6 +2253,7 @@ endif
 	source "package/msgpack-c/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
+	source "package/obstack-standalone/Config.in"
 	source "package/neon-2-sse/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
diff --git a/package/obstack-standalone/Config.in b/package/obstack-standalone/Config.in
new file mode 100644
index 0000000000..b6f7cef600
--- /dev/null
+++ b/package/obstack-standalone/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OBSTACK_STANDALONE
+	bool "obstack-standalone"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  A standalone library implementing the GNU obstack interface,
+	  for use with musl libc or uClibc-ng, which do not provide it.
+	  glibc already provides obstack natively.
+
+	  https://github.com/void-linux/musl-obstack
diff --git a/package/obstack-standalone/obstack-standalone.hash b/package/obstack-standalone/obstack-standalone.hash
new file mode 100644
index 0000000000..f0a0454227
--- /dev/null
+++ b/package/obstack-standalone/obstack-standalone.hash
@@ -0,0 +1,4 @@
+# Checksums from https://github.com/void-linux/musl-obstack/releases/tag/v1.2.3
+sha256  9ffb3479b15df0170eba4480e51723c3961dbe0b461ec289744622db03a69395  obstack-standalone-1.2.3.tar.gz
+# Locally computed
+sha256  3b53c355562d068ee10e0eced026160e3c6e2042f01d973797c50add01b61fed  COPYING
diff --git a/package/obstack-standalone/obstack-standalone.mk b/package/obstack-standalone/obstack-standalone.mk
new file mode 100644
index 0000000000..cc9b25bb01
--- /dev/null
+++ b/package/obstack-standalone/obstack-standalone.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# obstack-standalone
+#
+################################################################################
+
+OBSTACK_STANDALONE_VERSION = 1.2.3
+OBSTACK_STANDALONE_SITE = $(call github,void-linux,musl-obstack,v$(OBSTACK_STANDALONE_VERSION))
+# obstack.c and obstack.h are taken from gcc libiberty (GPL-2.0+).
+# The COPYING file in the repository root is GPL-2.0+.
+OBSTACK_STANDALONE_LICENSE = GPL-2.0+
+OBSTACK_STANDALONE_LICENSE_FILES = COPYING
+OBSTACK_STANDALONE_INSTALL_STAGING = YES
+OBSTACK_STANDALONE_AUTORECONF = YES
+OBSTACK_STANDALONE_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
