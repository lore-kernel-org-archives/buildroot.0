Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541B1C28D13
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 05:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC64410E7;
	Sun, 21 Aug 2022 05:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC64410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2H4WiBT-UXQl; Sun, 21 Aug 2022 05:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6E2410C0;
	Sun, 21 Aug 2022 05:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6E2410C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 840261BF83E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FE2260B34
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE2260B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRhR-US9WL3j for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 05:01:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 516E260B18
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 516E260B18
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 05:01:24 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id w29so2014157pfj.3
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 22:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bD03U7VH0yHr1hSalOrkbywZg4abOFCoOdQLI6bXQ8M=;
 b=ZaYzV++6iQb6x/D2fbrjdZrLa8rvt/VDFLRI5/1xcgFUhbHktqY6ERg+BIK+ioG6ZD
 GXxOw2FKn7mIUvsrODAPp/nw9bkqxXHMXWjAkDhKGdBL4LQqkIMzeT6qWTCcBU7f5iJC
 LeQoSikQXH5Czxk4nKfP12DZ+AabDNx0fX0w5dPNRLN3x43cUnaFJgvoRSY5xH46m3fJ
 PscpqjK6CDB9YR3QeJk1yVdZtfCxpmcP4ifsHBH7rShyyEyYzpmxlXlCb/EgXc3YCPqJ
 Uw5b4wz5Y8XIAt6mTjPW/9IxD9ZOGIY+WxnW/Yypwfx31PvQzGBOJjDg0iAKK0FWhxXA
 WrBg==
X-Gm-Message-State: ACgBeo3GkKrmbRgRKTr7l3VBwWQGlXaxK3RxBaxay4MBRTNOBfCmpDTU
 rMarxHNESv76XMuiFFvfqPjabqaE2Kc11A==
X-Google-Smtp-Source: AA6agR5jtbFO6GzqtLM7Yj1kA+MXjfNVidAYVYcPgJ6lrLBlivAkzJjJ6xOvEW2WIIQ28gLeKa7jtQ==
X-Received: by 2002:a05:6a00:1a49:b0:528:6ea0:14e2 with SMTP id
 h9-20020a056a001a4900b005286ea014e2mr15014298pfv.22.1661058083207; 
 Sat, 20 Aug 2022 22:01:23 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t196-20020a6378cd000000b0042aa381e2easm206294pgc.51.2022.08.20.22.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 22:01:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 22:01:19 -0700
Message-Id: <20220821050119.578342-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/conmon: new package
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Conmon is an OCI container runtime monitor.

https://github.com/containers/conmon

Dependency of podman.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/conmon/Config.in   | 11 +++++++++++
 package/conmon/conmon.hash |  3 +++
 package/conmon/conmon.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/conmon/Config.in
 create mode 100644 package/conmon/conmon.hash
 create mode 100644 package/conmon/conmon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..1914da041d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -529,6 +529,7 @@ F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
+F:	package/conmon/
 F:	package/containerd/
 F:	package/delve/
 F:	package/docker-cli/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..5c71fc1d57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2564,6 +2564,7 @@ menu "System tools"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
+	source "package/conmon/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
diff --git a/package/conmon/Config.in b/package/conmon/Config.in
new file mode 100644
index 0000000000..80caf46a59
--- /dev/null
+++ b/package/conmon/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CONMON
+	bool "conmon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	help
+	  Conmon is an OCI container runtime monitor.
+
+	  https://github.com/containers/conmon
+
+comment "conmon needs a glibc or musl toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
new file mode 100644
index 0000000000..70ddb2a495
--- /dev/null
+++ b/package/conmon/conmon.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  145b5aa1c5d1d9977ad0d15a53c11aad1e65e8233f7e0fd176ac85f67d6d6fbe  conmon-2.1.3.tar.gz
+sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
new file mode 100644
index 0000000000..b629b0089e
--- /dev/null
+++ b/package/conmon/conmon.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# conmon
+#
+################################################################################
+
+CONMON_VERSION = 2.1.3
+CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
+CONMON_LICENSE = Apache-2.0
+CONMON_LICENSE_FILES = LICENSE
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
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
