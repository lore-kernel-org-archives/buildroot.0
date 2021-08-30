Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A21C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:50:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F02860F42
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F02860F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A3240528;
	Mon, 30 Aug 2021 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lApna1C267Mn; Mon, 30 Aug 2021 21:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B637A40522;
	Mon, 30 Aug 2021 21:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2494F1BF86C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215BB60B57
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2SV_AC_0dUx for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:50:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2476F608CC
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:50:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso447955wmg.4
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hcz9toglPF9/0RL0BiC3MmoTQstl8L4p0/cWEKsjuxE=;
 b=tkD58ZytdF0Jn5oZZNTmlt80g/z4/Unl85PaaqpPfQTawxsEG3eX2fHaKC9iDLY3AK
 lDcbNoRxV2Cic6/JGqGf/DJPuvZwv4YoLH8PgFA28o/9N/dgxmcRdH3noYSsdgKnlnXC
 qEgbsobZgQUYW/qs5yJlNal10G4MJTamtNS/lLKb1FIzegrchLi9tGnocd66+vRayes+
 Y0JM41HAYcwzZG3VIGJ3ikz9gI+UmQgNDA/zWaBj4x1pKUfIk4HMeNaS+ZEDfSVimcWm
 Yp/ZmXNT+BLWs5trGgF3fkrVMYmxu/17ypyD6HzTGBKG/dfxvbMt+GaKjDJSKXetqn3c
 SWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hcz9toglPF9/0RL0BiC3MmoTQstl8L4p0/cWEKsjuxE=;
 b=deoUR/xopSrIlThTlUitgazNtF+0dE9pIXxcJ1Znij/1MUHIu0n9udWlG14+SrY/Zl
 1FQz62taQL9+UWFzWpkqv+957dI/OIWRSP2Y16OThgsLmpCjXSEEGPPr5DDk4hMl+Q9U
 QXIuG822gJ6gUYT8Fiad21zs6nIMkDiRl1NwfiD8+EqL4OAOLHqDg/iXH3qkOa683G+j
 nsZcuXA81nMRpgayM163nJFdYHcVLB4j0V7BsrWp9+NREP74qU/kAr3eLwh5PnwCwiwI
 qdwQAGbqDwAdmoM1sliZpcmpxFOSkmBMAFEOU/pXOU59dAvjZ3o9s7f4dWy4VGBHHYQm
 meXQ==
X-Gm-Message-State: AOAM5306JUhgrEtSulizaGbcBnCtzaTTuGFBQMk3n6MZuG4r0BOZHmcL
 PKoWEwGw1E4FCFw/SLEopUtwlUtIQ8s7SA==
X-Google-Smtp-Source: ABdhPJwt7ReQIjkEBeUMwdjnQC8oFd2IrmGdQCTDAaIk6rOGgUTOq42ce9BDgrD9jx+5a8CnNcj1/Q==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr1022404wmj.26.1630360241863;
 Mon, 30 Aug 2021 14:50:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id t5sm14980630wra.95.2021.08.30.14.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 14:50:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 23:50:32 +0200
Message-Id: <20210830215032.4153761-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: switch to meson-package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Switch to meson-package to fix the following build failure raised since
bump of gobject-introspection to version 1.68.0 in commit
abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:

Could not find GIR file 'Gio-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file Polkit-1.0.gir: Failed to parse included gir Gio-2.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/26bcb21900b403db690d6005dbef0a76ff494d6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-Improve-meson_post_install-script.patch | 124 ++++++++++++++++++
 package/polkit/Config.in                      |   2 +-
 package/polkit/polkit.mk                      |  27 ++--
 3 files changed, 136 insertions(+), 17 deletions(-)
 create mode 100644 package/polkit/0002-Improve-meson_post_install-script.patch

diff --git a/package/polkit/0002-Improve-meson_post_install-script.patch b/package/polkit/0002-Improve-meson_post_install-script.patch
new file mode 100644
index 0000000000..932bf88f59
--- /dev/null
+++ b/package/polkit/0002-Improve-meson_post_install-script.patch
@@ -0,0 +1,124 @@
+From 6c8022392713955c5ae0061e22b50a16a1c2252a Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 15 Jul 2021 12:36:05 +0000
+Subject: [PATCH] Improve meson_post_install script
+
+[Retrieved from:
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/6c8022392713955c5ae0061e22b50a16a1c2252a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitlab-ci.yml        |  3 +--
+ meson_post_install.py | 58 +++++++++++++++++++++++++++++++++++--------
+ 2 files changed, 49 insertions(+), 12 deletions(-)
+
+diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
+index 8ac3e9f..6d0abb4 100644
+--- a/.gitlab-ci.yml
++++ b/.gitlab-ci.yml
+@@ -26,8 +26,6 @@ build_stable:
+   before_script:
+     - dnf upgrade -y --nogpgcheck fedora-release fedora-repos*
+     - dnf update -y && dnf install -y $DEPENDENCIES
+-    - getent group polkitd >/dev/null || groupadd -r polkitd
+-    - getent passwd polkitd >/dev/null || useradd -r -g polkitd -d / -s /sbin/nologin -c "User for polkitd" polkitd
+ 
+   script:
+     - meson setup 
+@@ -43,6 +41,7 @@ build_stable:
+     - meson compile -C builddir
+     - meson test    -C builddir
+     - meson install -C builddir
++    - DESTDIR=$(pwd)/DESTDIR meson install -C builddir
+   artifacts:
+     name: 'test logs'
+     when: 'always'
+diff --git a/meson_post_install.py b/meson_post_install.py
+index 0a0fccf..0ab7469 100644
+--- a/meson_post_install.py
++++ b/meson_post_install.py
+@@ -1,20 +1,44 @@
+ #!/usr/bin/env python3
+ 
+-import getpass
+ import os
+ import pwd
+ import sys
+ 
++destdir = os.environ.get('DESTDIR')
+ prefix = os.environ['MESON_INSTALL_DESTDIR_PREFIX']
+ 
+-bindir = os.path.join(prefix, sys.argv[1])
+-pkgdatadir = os.path.join(prefix, sys.argv[2])
+-pkglibdir = os.path.join(prefix, sys.argv[3])
+-pkgsysconfdir = os.path.join(prefix, sys.argv[4])
++def destdir_path(p):
++    if os.path.isabs(p):
++        if destdir is None:
++            return p
++        else:
++            return os.path.join(destdir, os.path.relpath(p, '/'))
++    else:
++        return os.path.join(prefix, p)
+ 
+-polkitd_uid = pwd.getpwnam(sys.argv[5]).pw_uid
++bindir = destdir_path(sys.argv[1])
++pkgdatadir = destdir_path(sys.argv[2])
++pkglibdir = destdir_path(sys.argv[3])
++pkgsysconfdir = destdir_path(sys.argv[4])
++polkitd_user = sys.argv[5]
+ 
+-os.chmod(os.path.join(bindir, 'pkexec'), 0o4775)
++try:
++    polkitd_uid = pwd.getpwnam(polkitd_user).pw_uid
++except KeyError:
++    polkitd_uid = None
++
++dst = os.path.join(bindir, 'pkexec')
++
++if os.geteuid() == 0:
++    os.chmod(dst, 0o4755)
++    os.chown(dst, 0, -1)
++else:
++    print(
++        'Owner and mode of {} need to be setuid root (04755) after '
++        'installation'.format(
++            dst,
++        )
++    )
+ 
+ dst_dirs = [
+     os.path.join(pkgsysconfdir, 'rules.d'),
+@@ -24,13 +48,27 @@ dst_dirs = [
+ for dst in dst_dirs:
+     if not os.path.exists(dst):
+         os.makedirs(dst, mode=0o700)
+-        if getpass.getuser() == "root":
++        if os.geteuid() == 0 and polkitd_uid is not None:
+             os.chown(dst, polkitd_uid, -1)
++        else:
++            print(
++                'Owner of {} needs to be set to {} after installation'.format(
++                    dst, polkitd_user,
++                )
++            )
+ 
+ # polkit-agent-helper-1 need to be setuid root because it's used to
+ # authenticate not only the invoking user, but possibly also root
+ # and/or other users.
+ dst = os.path.join(pkglibdir, 'polkit-agent-helper-1')
+-os.chmod(dst, 0o4755)
+-if getpass.getuser() == "root":
++
++if os.geteuid() == 0:
++    os.chmod(dst, 0o4755)
+     os.chown(dst, 0, -1)
++else:
++    print(
++        'Owner and mode of {} need to be setuid root (04755) after '
++        'installation'.format(
++            dst,
++        )
++    )
+-- 
+GitLab
+
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index 622cbbb90b..a968ee52d7 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POLKIT
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # duktape
-	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 3a8c442dbb..7d75d66ffb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -9,36 +9,31 @@ POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
-POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = \
-	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
+	dbus duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
-POLKIT_CONF_ENV = \
-	CXXFLAGS="$(TARGET_CXXFLAGS)" \
-	LIBS=$(TARGET_NLS_LIBS)
+POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
-	--with-os-type=unknown \
-	--disable-man-pages \
-	--disable-examples \
-	--disable-libelogind \
-	--disable-libsystemd-login \
-	--with-duktape
+	-Dman=false \
+	-Dexamples=false \
+	-Dsession_tracking=ConsoleKit \
+	-Djs_engine=duktape
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-POLKIT_CONF_OPTS += --enable-introspection
+POLKIT_CONF_OPTS += -Dintrospection=true
 POLKIT_DEPENDENCIES += gobject-introspection
 else
-POLKIT_CONF_OPTS += --disable-introspection
+POLKIT_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
-POLKIT_CONF_OPTS += --with-authfw=pam
+POLKIT_CONF_OPTS += -Dauthfw=pam
 else
-POLKIT_CONF_OPTS += --with-authfw=shadow
+POLKIT_CONF_OPTS += -Dauthfw=shadow
 endif
 
 # polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
@@ -72,4 +67,4 @@ define POLKIT_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50polkit
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
