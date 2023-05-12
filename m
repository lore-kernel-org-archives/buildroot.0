Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C628DC77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 00:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6839C41E18;
	Fri, 12 May 2023 00:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6839C41E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjD0R0BHe8kO; Fri, 12 May 2023 00:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A72E41DD3;
	Fri, 12 May 2023 00:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A72E41DD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D021A1BF25F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6AE840895
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6AE840895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEOWFgFVud4O for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 00:25:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6A240327
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B6A240327
 for <buildroot@buildroot.org>; Fri, 12 May 2023 00:25:15 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1addac3de73so4912285ad.1
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683851115; x=1686443115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RnYEwTwTv8Vk7Y/bd0HvBww0fIoDCU/NXcyCooHXjAg=;
 b=C8GyZcStQneHEAwRuu7pqv3Obpmhkw75jDVCyqoo6BzAJdhfE0oZaTseHl07D58DUB
 m/q7w8JanoSsM1acKZSFe1rKXLBzpfb5IM2tj2zZj+g6LGArkx+VPurZ9xeQ1Sw5GZPZ
 zE4mkpCnXIn6N187QbH7bd7aWuvePi24OvZdZMR35rF3ij6GJKcHD/f1b+qWr96KCTdD
 S3E/vZ7KtoGYR8+8p5B0qmbbnS26vKH49pXf47i17z0PBfbsT6N7Psb3EqYU9eLASfe/
 9rzVYMA+E/nvSvpumz6dlW2a7f+pet3WBm+suAQIgm6H9i9h0BF+pVGRx8RFhO/8vfrQ
 EpBQ==
X-Gm-Message-State: AC+VfDyhoJ6s09y7aMOdTJh/Jo/MtDXOO5ihvmdHgwLAJM680LnT9TvZ
 7oXd8mkpRyxc5A94n/8fFr/vQgY/LfAX/E+pPbDe5XDj
X-Google-Smtp-Source: ACHHUZ6gli6nplpxMjad6XLDlLIUzeMA81bzlWzWeoU5guO5C7waul1F8g2tB8yq85gAeBQZ7W0Law==
X-Received: by 2002:a17:902:dac5:b0:1a5:dfd:d167 with SMTP id
 q5-20020a170902dac500b001a50dfdd167mr28507804plx.8.1683851114885; 
 Thu, 11 May 2023 17:25:14 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170902e74400b001aafe56ea70sm6567969plf.5.2023.05.11.17.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 17:25:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 17:25:10 -0700
Message-Id: <20230512002511.1356447-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683851115; x=1686443115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RnYEwTwTv8Vk7Y/bd0HvBww0fIoDCU/NXcyCooHXjAg=;
 b=b/T8ccd3v1JiloRQ9cblCw6fmdI5/iPSdt0SEqzrBa7BsktT7AZKTbI1xLxJ9xw68i
 3KngEiK6Jax4KKSEEXU5Bppuk1nbOim1HWCiHpni+uJKxjVL4iOMpnFqRiKsY8p+h5q8
 zo6I7oNG7SbjDpZC5YmJEBUVvKlTgE81QTZRyM9FlDdFNkF7B9PuAVHoyImlK7yHzgnL
 B39tNXSlrC163adnmUrYlYz45rPUGRH8BG6JwzdlEXFON62URHEBCDQLLWPzhh8Y7/5B
 KDztfGWAe25I4q8Ok/atO39HO17CluZZuHlnx4NMjQ+rmsKN3xVWVtdU4L4Ia5OltIv6
 fiyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=b/T8ccd3
Subject: [Buildroot] [PATCH v2 1/2] package/conmon: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Conmon is an OCI container runtime monitor.

https://github.com/containers/conmon

Dependency of podman.

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - requires libglib2, host-pkgconf
 - bump version to 2.1.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/conmon/Config.in   | 15 +++++++++++++++
 package/conmon/conmon.hash |  3 +++
 package/conmon/conmon.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/conmon/Config.in
 create mode 100644 package/conmon/conmon.hash
 create mode 100644 package/conmon/conmon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c1f06ec1..1608317654 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -543,6 +543,7 @@ F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
 F:	package/cni-plugins/
+F:	package/conmon/
 F:	package/containerd/
 F:	package/crun/
 F:	package/delve/
diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..52bc10b91b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2631,6 +2631,7 @@ menu "System tools"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
+	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
diff --git a/package/conmon/Config.in b/package/conmon/Config.in
new file mode 100644
index 0000000000..c4b428a541
--- /dev/null
+++ b/package/conmon/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CONMON
+	bool "conmon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	help
+	  Conmon is an OCI container runtime monitor.
+
+	  https://github.com/containers/conmon
+
+comment "conmon needs a glibc or musl toolchain w/ threads, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
new file mode 100644
index 0000000000..82d1d14ba3
--- /dev/null
+++ b/package/conmon/conmon.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
+sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
new file mode 100644
index 0000000000..cda059042a
--- /dev/null
+++ b/package/conmon/conmon.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# conmon
+#
+################################################################################
+
+CONMON_VERSION = 2.1.7
+CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
+CONMON_LICENSE = Apache-2.0
+CONMON_LICENSE_FILES = LICENSE
+
+CONMON_DEPENDENCIES += host-pkgconf libglib2
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CONMON_ENABLE_SECCOMP = 1
+CONMON_DEPENDENCIES += libseccomp
+else
+CONMON_ENABLE_SECCOMP = 0
+endif
+
+define CONMON_CONFIGURE_CMDS
+	printf '#!/bin/bash\necho "$(CONMON_ENABLE_SECCOMP)"\n' > \
+		$(@D)/hack/seccomp-notify.sh
+	chmod +x $(@D)/hack/seccomp-notify.sh
+endef
+
+define CONMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
+endef
+
+define CONMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/bin/conmon $(TARGET_DIR)/usr/bin/conmon
+endef
+
+$(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
