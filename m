Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5846FC77B75
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 20:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA02641D9E;
	Mon, 22 May 2023 20:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA02641D9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poLdv1VPfnAb; Mon, 22 May 2023 20:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D92F41D75;
	Mon, 22 May 2023 20:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D92F41D75
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4100C1BF38D
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187DA40BAA
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 187DA40BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2WFwEMoyNrG for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 20:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D519640112
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D519640112
 for <buildroot@buildroot.org>; Mon, 22 May 2023 20:24:29 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so5793173a12.1
 for <buildroot@buildroot.org>; Mon, 22 May 2023 13:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684787069; x=1687379069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5Lk58Vp3R5vcxU4LFTCy481y3RVqp3t9Ebay/pZdMA=;
 b=MeJSVST6yhaACJ+tOt88axz9jHMhYrtv4CZJoMuOVBA4UvO/TdjxQ/ZydPuJ5YkH85
 592c6nIzWeZa66RL5HdsISRYP8DbVETGJU4my+TOfHSpC92xyBYNUd/r5D1QamN7/ygo
 E+YM/xAX2IQozz/lIKXTXTrUdXBt4EoaSm7rtW20g1IYlnquzc78KpSBPfS2enJ0GMuI
 MJ0kjxqxoIdb+Li1YV9B6k9oxmxnsZIkBR12uyPzJHxo4pTtB4BqDScIuYOBQof6CPL7
 0FFk2dHTByL1ZG2A4bzpV4a6Fx6HhvieqV+MwpJ6YI/nmNjX8h0TzAD23pu6SBPidmgg
 WEUQ==
X-Gm-Message-State: AC+VfDxfv8PSkmt2LcNhMdAF0w/1dFvOA04cf60WAkXmxdxqYt646h+r
 PpB+9Yn1BuLa/bDkBGWbsEE3kvfKv4arZlExZPs1WVby8rU=
X-Google-Smtp-Source: ACHHUZ7giTdjPP4RMO0WRcOBAB7lquqSDZw5V7ofCgCY3Nwrc0Y0BS6RCZT5mEqmCEhzbGmMnkEQ4A==
X-Received: by 2002:a17:902:e5ce:b0:1ac:b449:352d with SMTP id
 u14-20020a170902e5ce00b001acb449352dmr14174137plf.61.1684787069011; 
 Mon, 22 May 2023 13:24:29 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e5cd00b001ac937171e4sm5234413plf.254.2023.05.22.13.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:24:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 22 May 2023 13:23:45 -0700
Message-Id: <20230522202346.209785-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684787069; x=1687379069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U5Lk58Vp3R5vcxU4LFTCy481y3RVqp3t9Ebay/pZdMA=;
 b=wUJScAiDTXAL7jV4PM1CZYlKGK9PScjGjBDWHdPV69ukg3qW7CmtvZxBttIqNog88r
 HWtfEL3p+0LS5ehBMP9uCQwUpff/dvywekgk4rbobY6/bVuxz768ylbC+lb10Phx6svi
 X4hGEwlKbpS8xk3jGAtNNnQOfWRlJ5dBD161+TYMZDi+TohBlLBN699dvypf8kC/9SYl
 kJYheNT3nn7L8ygd8EIc5ZnGXPjPTg4tctwkM+J2JlijWVfIRgu3R//EIBF1zFk8qp13
 cWJ1B8RjVJb+w/QKeZlowwPQST8jUYMccR6t3ObSvP2qyrQ57ZieB40oyD3dbNBu7uMq
 L5yA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=wUJScAiD
Subject: [Buildroot] [PATCH v3 1/2] package/conmon: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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

v2 -> v3:

 - Added select BR2_PACKAGE_LIBGLIB2
 - Inverted CONMON_ENABLE_SECCOMP to CONMON_DISABLE_SECCOMP
 - Thanks to Joachim for the review.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/conmon/Config.in   | 16 ++++++++++++++++
 package/conmon/conmon.hash |  3 +++
 package/conmon/conmon.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/conmon/Config.in
 create mode 100644 package/conmon/conmon.hash
 create mode 100644 package/conmon/conmon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e76717e845..7b3287731a 100644
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
index 0000000000..65f693a29e
--- /dev/null
+++ b/package/conmon/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CONMON
+	bool "conmon"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_LIBGLIB2
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
index 0000000000..dfac23189f
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
+CONMON_DISABLE_SECCOMP = 0
+CONMON_DEPENDENCIES += libseccomp
+else
+CONMON_DISABLE_SECCOMP = 1
+endif
+
+define CONMON_CONFIGURE_CMDS
+	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
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
