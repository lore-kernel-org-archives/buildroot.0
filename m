Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F32C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 05:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294CC827FA;
	Sun, 21 Aug 2022 05:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294CC827FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7UeuftSeQBO; Sun, 21 Aug 2022 05:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266938246F;
	Sun, 21 Aug 2022 05:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266938246F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93E7E1BF83E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D60041477
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 05:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D60041477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-btnvWv6MvN for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 05:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35227410E8
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35227410E8
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 05:02:26 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g8so3385009plq.11
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 22:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=b3aWVSKizf5qBMsnqqVxtf78a9hokXCx40kETiX9MSg=;
 b=zM8DBvzBRXw0sDbnaa+YJTBSCwIBCp060Zia3CWDb5PbOggKs522EoCU8BhEziXAPZ
 ierIbuzToncGCbNkK7o0yp6XzJBF3O7J20YDYV9eMaeXpEmS3K2fZhXECsKG+bHCRijU
 EmQBJdEajcBqxqoNx8rpveDwYie3AnUUzzGK7Erxj/kaXkg6ehwgRUTdLaoayO/wjPPf
 ldazaDCxSEKSIMfwaWqrULPF1fu6V43Es4GcjMMfnqtnLxFVYZQTqX7qBBn1xhYztKgf
 VUiJLrH3fi8MCNFVWkPYuxMVRXMjnIBKJlKnT1frcZfdAHu4ydRqshPxLy9poYYeG3Qw
 gLSg==
X-Gm-Message-State: ACgBeo3ggBNC2yZDuc4zBDDJyS5g/txfErfS9X9ldBBchFjgDr65yWYh
 K/xet9DLGgfgV5UM1UnUzzibipAJrqu0bg==
X-Google-Smtp-Source: AA6agR5is0/2sUJm7UfchggK6lCM08L0qK4bmEcCDJcO0NdbjDAlHO1QtAXBIG/aLlqIczNBJtPejw==
X-Received: by 2002:a17:903:248b:b0:172:a790:3206 with SMTP id
 p11-20020a170903248b00b00172a7903206mr14342647plw.139.1661058145966; 
 Sat, 20 Aug 2022 22:02:25 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c11-20020a17090ab28b00b001f4f76033f9sm5593925pjr.49.2022.08.20.22.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 22:02:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 22:02:22 -0700
Message-Id: <20220821050222.578600-1-christian@paral.in>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/crun: new package
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

crun is a fast and low-memory OCI Container Runtime in C.

https://github.com/containers/crun

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...am-use-.version-file-for-git-version.patch | 28 +++++++++++++++++
 package/crun/Config.in                        |  7 +++++
 package/crun/crun.hash                        |  4 +++
 package/crun/crun.mk                          | 31 +++++++++++++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 package/crun/0001-Makefile.am-use-.version-file-for-git-version.patch
 create mode 100644 package/crun/Config.in
 create mode 100644 package/crun/crun.hash
 create mode 100644 package/crun/crun.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..b92821f9c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -530,6 +530,7 @@ F:	package/python-pylibftdi/
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
 F:	package/containerd/
+F:	package/crun/
 F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-engine/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..fd591d9e52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2567,6 +2567,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
diff --git a/package/crun/0001-Makefile.am-use-.version-file-for-git-version.patch b/package/crun/0001-Makefile.am-use-.version-file-for-git-version.patch
new file mode 100644
index 0000000000..05c284b385
--- /dev/null
+++ b/package/crun/0001-Makefile.am-use-.version-file-for-git-version.patch
@@ -0,0 +1,28 @@
+From 818012b2070ba6bcd096016fd7f3fa4076f9a5cf Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sat, 20 Aug 2022 20:21:31 -0700
+Subject: [PATCH] Makefile.am: use .version file for git version
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile.am | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5800406..97aad82 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -151,9 +151,7 @@ TESTS = tests/test_capabilities.py \
+ 	$(AM_V_GEN)echo $(VERSION) > $@-t && mv $@-t $@
+ 
+ git-version.h:
+-	@if test -e $(abs_top_srcdir)/.git; then \
+-		$(AM__GEN)printf "/* autogenerated.  */\n#ifndef GIT_VERSION\n# define GIT_VERSION \"%s\"\n#endif\n" $(shell git --git-dir=$(abs_top_srcdir)/.git rev-parse HEAD) > $@-t && mv $@-t $@; \
+-	fi
++	$(AM__GEN)printf "/* autogenerated.  */\n#ifndef GIT_VERSION\n# define GIT_VERSION \"%s\"\n#endif\n" $(shell cat $(abs_top_srcdir)/.version) > $@-t && mv $@-t $@
+ 
+ nixpkgs:
+ 	@nix run -f channel:nixpkgs-unstable nix-prefetch-git -c nix-prefetch-git \
+-- 
+2.37.2
+
diff --git a/package/crun/Config.in b/package/crun/Config.in
new file mode 100644
index 0000000000..5aca10dcdb
--- /dev/null
+++ b/package/crun/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CRUN
+	bool "crun"
+	select BR2_PACKAGE_YAJL # libocispec
+	help
+	  crun is a fast and low-memory OCI Container Runtime in C.
+
+	  https://github.com/containers/crun
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
new file mode 100644
index 0000000000..a0de4b6748
--- /dev/null
+++ b/package/crun/crun.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  f7fb1f3f7ad14739389399d90e749baf732021e5c81c2886f75c860d7a8610ea  crun-1.5-br1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
new file mode 100644
index 0000000000..622042cc44
--- /dev/null
+++ b/package/crun/crun.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# crun
+#
+################################################################################
+
+CRUN_VERSION = 1.5
+CRUN_SITE = https://github.com/containers/crun
+CRUN_SITE_METHOD = git
+CRUN_GIT_SUBMODULES = YES
+CRUN_DEPENDENCIES = host-pkgconf yajl
+CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
+CRUN_LICENSE_FILES = COPYING COPYING.libcrun
+
+CRUN_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CRUN_DEPENDENCIES += libseccomp
+else
+CRUN_CONF_OPTS += --disable-seccomp
+endif
+
+CRUN_CONF_OPTS += --enable-embedded-yajl=no
+
+define CRUN_GEN_VERSION
+	echo "$(CRUN_VERSION)" > $(@D)/.version
+	$(MAKE) -C $(@D) git-version.h
+endef
+CRUN_PRE_BUILD_HOOKS += CRUN_GEN_VERSION
+
+$(eval $(autotools-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
