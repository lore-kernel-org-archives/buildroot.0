Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F166DC433FE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:30:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BF960F56
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78BF960F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC5C40172;
	Sun, 12 Sep 2021 21:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJZgiwlUW24I; Sun, 12 Sep 2021 21:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B1F4019B;
	Sun, 12 Sep 2021 21:30:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77DBC1BF3FD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7474B81AEA
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOgqMBug7JAy for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 21:30:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3306681AC1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 21:30:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q11so11482950wrr.9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdtXK8GLQJYPyPhb4w++6czSu8vgQ1NoDtCg60aKOqc=;
 b=eEGVGgONsOXBxQrSjzxw7npsxItBbVzb/PGIPep2y6yVtNcpFHQmjomWnYkUsQwTno
 zv1kSkWqpBlylOKB4gbjNvhQpJm0uTg7YPPsqYmTU4UaNtec6eRMzQtLX8pAyBdQZZhp
 qwPW3/rfjRG2x9IblLmg9S76YOJzNa45wbcl60n6b51NvntsnOfwUc+FKTWcCgQBStwh
 w5dEK+6p4NS4/pu32ZnidUve+k6jbPqwEc0FQ80jP96Sjf94WwOQuT+DK+22/ZeKOB2D
 UyDQiTI8PEuhYL4rqlir6DzQbwGb5C8Rp9t1ZsKpjrLchlfxKKbk5D4gJdJRDtwRNJ5b
 fTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdtXK8GLQJYPyPhb4w++6czSu8vgQ1NoDtCg60aKOqc=;
 b=WkX2fPdwtwTBIkL1kViK3EUhenXrBL9dF/ysTVGiU1tP9csiVGlm1+iGbAmQa53+TB
 VFsujKks/lVpa8tMbOmKF5XcyEcz6pYqpXIIvcZhWoaXkkb1Y2d1eDVvFGukaoBS5Mwr
 fv16Lpr1TxdG8YpGdEG3jnzFyGQsaytoaKjq15uX3uplWPzUq6oF9kBeO4eCStZgIwYp
 1N4MkhdXQKeaWICbx3mdfHAa3QOLmUR4FhUvjTWJ2XKOXD1PnCzLUH6sRVlwp5dp9ps4
 ag9mUSBam/lPuD3CbEQtK0U0aQr18kSZ++wEGRWA/OGnEFuz0gwckoLbZczc/ndvWGKi
 DF9g==
X-Gm-Message-State: AOAM533Q2NLIQ/SZcqHBWmGo9M7iY3mtQKQIYH9NKNrHzsilXrHIN/23
 HG7PW1fsnzlUylHg8Sd0poGtTeP8+Rk=
X-Google-Smtp-Source: ABdhPJxGUVfhyt0Nse9kaiyQG5EJDcsI8Gol8s3SFqyyOjVc75TKJJMgPe4M9TIYDqeTqWTVXmMTgg==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr7609623wrv.154.1631482249154; 
 Sun, 12 Sep 2021 14:30:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id y9sm3985916wmj.36.2021.09.12.14.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 14:30:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 23:30:42 +0200
Message-Id: <20210912213042.3120494-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Revert "package/polkit: switch to
 meson-package"
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This reverts commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb which
raises the following build failure if systemd-polkit is enabled
because dbus was added to POLKIT_DEPENDENCIES:

package/dbus/dbus.mk:124: *** Recursive variable 'DBUS_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

This commit can be safely reverted as commit
8dda79970661090f202e1f20e5982ba53fdaeb95 will fix the autotools build
failure with gobject-introspection

Fixes:
 - http://autobuild.buildroot.org/results/0e038fae0f5fc2db3e85be05db4612e4f2395e35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-Improve-meson_post_install-script.patch | 124 ------------------
 package/polkit/Config.in                      |   2 +-
 package/polkit/polkit.mk                      |  27 ++--
 3 files changed, 17 insertions(+), 136 deletions(-)
 delete mode 100644 package/polkit/0002-Improve-meson_post_install-script.patch

diff --git a/package/polkit/0002-Improve-meson_post_install-script.patch b/package/polkit/0002-Improve-meson_post_install-script.patch
deleted file mode 100644
index 932bf88f59..0000000000
--- a/package/polkit/0002-Improve-meson_post_install-script.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 6c8022392713955c5ae0061e22b50a16a1c2252a Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Thu, 15 Jul 2021 12:36:05 +0000
-Subject: [PATCH] Improve meson_post_install script
-
-[Retrieved from:
-https://gitlab.freedesktop.org/polkit/polkit/-/commit/6c8022392713955c5ae0061e22b50a16a1c2252a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .gitlab-ci.yml        |  3 +--
- meson_post_install.py | 58 +++++++++++++++++++++++++++++++++++--------
- 2 files changed, 49 insertions(+), 12 deletions(-)
-
-diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
-index 8ac3e9f..6d0abb4 100644
---- a/.gitlab-ci.yml
-+++ b/.gitlab-ci.yml
-@@ -26,8 +26,6 @@ build_stable:
-   before_script:
-     - dnf upgrade -y --nogpgcheck fedora-release fedora-repos*
-     - dnf update -y && dnf install -y $DEPENDENCIES
--    - getent group polkitd >/dev/null || groupadd -r polkitd
--    - getent passwd polkitd >/dev/null || useradd -r -g polkitd -d / -s /sbin/nologin -c "User for polkitd" polkitd
- 
-   script:
-     - meson setup 
-@@ -43,6 +41,7 @@ build_stable:
-     - meson compile -C builddir
-     - meson test    -C builddir
-     - meson install -C builddir
-+    - DESTDIR=$(pwd)/DESTDIR meson install -C builddir
-   artifacts:
-     name: 'test logs'
-     when: 'always'
-diff --git a/meson_post_install.py b/meson_post_install.py
-index 0a0fccf..0ab7469 100644
---- a/meson_post_install.py
-+++ b/meson_post_install.py
-@@ -1,20 +1,44 @@
- #!/usr/bin/env python3
- 
--import getpass
- import os
- import pwd
- import sys
- 
-+destdir = os.environ.get('DESTDIR')
- prefix = os.environ['MESON_INSTALL_DESTDIR_PREFIX']
- 
--bindir = os.path.join(prefix, sys.argv[1])
--pkgdatadir = os.path.join(prefix, sys.argv[2])
--pkglibdir = os.path.join(prefix, sys.argv[3])
--pkgsysconfdir = os.path.join(prefix, sys.argv[4])
-+def destdir_path(p):
-+    if os.path.isabs(p):
-+        if destdir is None:
-+            return p
-+        else:
-+            return os.path.join(destdir, os.path.relpath(p, '/'))
-+    else:
-+        return os.path.join(prefix, p)
- 
--polkitd_uid = pwd.getpwnam(sys.argv[5]).pw_uid
-+bindir = destdir_path(sys.argv[1])
-+pkgdatadir = destdir_path(sys.argv[2])
-+pkglibdir = destdir_path(sys.argv[3])
-+pkgsysconfdir = destdir_path(sys.argv[4])
-+polkitd_user = sys.argv[5]
- 
--os.chmod(os.path.join(bindir, 'pkexec'), 0o4775)
-+try:
-+    polkitd_uid = pwd.getpwnam(polkitd_user).pw_uid
-+except KeyError:
-+    polkitd_uid = None
-+
-+dst = os.path.join(bindir, 'pkexec')
-+
-+if os.geteuid() == 0:
-+    os.chmod(dst, 0o4755)
-+    os.chown(dst, 0, -1)
-+else:
-+    print(
-+        'Owner and mode of {} need to be setuid root (04755) after '
-+        'installation'.format(
-+            dst,
-+        )
-+    )
- 
- dst_dirs = [
-     os.path.join(pkgsysconfdir, 'rules.d'),
-@@ -24,13 +48,27 @@ dst_dirs = [
- for dst in dst_dirs:
-     if not os.path.exists(dst):
-         os.makedirs(dst, mode=0o700)
--        if getpass.getuser() == "root":
-+        if os.geteuid() == 0 and polkitd_uid is not None:
-             os.chown(dst, polkitd_uid, -1)
-+        else:
-+            print(
-+                'Owner of {} needs to be set to {} after installation'.format(
-+                    dst, polkitd_user,
-+                )
-+            )
- 
- # polkit-agent-helper-1 need to be setuid root because it's used to
- # authenticate not only the invoking user, but possibly also root
- # and/or other users.
- dst = os.path.join(pkglibdir, 'polkit-agent-helper-1')
--os.chmod(dst, 0o4755)
--if getpass.getuser() == "root":
-+
-+if os.geteuid() == 0:
-+    os.chmod(dst, 0o4755)
-     os.chown(dst, 0, -1)
-+else:
-+    print(
-+        'Owner and mode of {} need to be setuid root (04755) after '
-+        'installation'.format(
-+            dst,
-+        )
-+    )
--- 
-GitLab
-
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index a968ee52d7..622cbbb90b 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POLKIT
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # duktape
-	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 7d75d66ffb..3a8c442dbb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -9,31 +9,36 @@ POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
+POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = \
-	dbus duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
+	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
-POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
+POLKIT_CONF_ENV = \
+	CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
-	-Dman=false \
-	-Dexamples=false \
-	-Dsession_tracking=ConsoleKit \
-	-Djs_engine=duktape
+	--with-os-type=unknown \
+	--disable-man-pages \
+	--disable-examples \
+	--disable-libelogind \
+	--disable-libsystemd-login \
+	--with-duktape
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-POLKIT_CONF_OPTS += -Dintrospection=true
+POLKIT_CONF_OPTS += --enable-introspection
 POLKIT_DEPENDENCIES += gobject-introspection
 else
-POLKIT_CONF_OPTS += -Dintrospection=false
+POLKIT_CONF_OPTS += --disable-introspection
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
-POLKIT_CONF_OPTS += -Dauthfw=pam
+POLKIT_CONF_OPTS += --with-authfw=pam
 else
-POLKIT_CONF_OPTS += -Dauthfw=shadow
+POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
 # polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
@@ -67,4 +72,4 @@ define POLKIT_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50polkit
 endef
 
-$(eval $(meson-package))
+$(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
