Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EA3CD80A3
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65427415CE;
	Tue, 10 Oct 2023 10:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65427415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAH28AcG1NXR; Tue, 10 Oct 2023 10:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E07415DA;
	Tue, 10 Oct 2023 10:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E07415DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55E461BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C037605BA
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C037605BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJxwIfALY0Uu for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:47:46 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8799B605B7
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8799B605B7
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so688320966b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696934864; x=1697539664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PpJQVyZ+4U3X2H22texk8mr/P/04C9KPKSBK/An1CdQ=;
 b=Ogm4FjDIoqeu9QVBLxEEYYfnU9AYIBH39txfCuZzFVdBrYEZQph0SJ6sTbI7UoRkfW
 KNkntfCmgbX98+YksLlG+fIC080agQaaNpbJ1G8NW0g+YrP/pe235Q49moc83QsQDfnR
 2Kidchko5qmR6+0N7TztdEaAwD3j/1XCcPRUenTbZm3Bz62HrfIrxsAWqFbcIPn60c/2
 RWHobW65V2BoDWg7MUs002J8WREBhg8X1IyBJueqqlIpXYYrUHIx/AbwzlnNMWWCge0Q
 pwgbvqhVo2Y48OrmYc0aNgUZ7EQDLDcnGzqnfDZ3Lw0I1LaqVqcyzIoWfTTYyOLhiu1D
 vhDw==
X-Gm-Message-State: AOJu0YyfTy9ghE6ikPQXaAsbmiziFYtz2fm8hzvsn7inziSkvcgkyYPL
 ROIYm8cQHwXSOMq7wfvnYmgXLBzN99NS1RvHt403nQ==
X-Google-Smtp-Source: AGHT+IFZaNg26fMwITJEb7C8xT2HsCWr/qZ21svHGzy4mMbjVEF2Ppa5Z6UEb8WfQZdOhxNxJU5CwA==
X-Received: by 2002:a17:906:23e1:b0:9ae:53a2:4289 with SMTP id
 j1-20020a17090623e100b009ae53a24289mr16895025ejg.63.1696934864086; 
 Tue, 10 Oct 2023 03:47:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a17090613d400b009b96e88759bsm8492578ejc.13.2023.10.10.03.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:47:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:47:32 +0200
Message-ID: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696934864; x=1697539664;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PpJQVyZ+4U3X2H22texk8mr/P/04C9KPKSBK/An1CdQ=;
 b=Zxl1r4TS8NTw/GGvKdMIyzqpNd+HVPFKWOk5+2xteQAe9wsGOglqjhlSmcubG3P/Vl
 bUq8JnzkNQ6FDYTHA/pNnTUsuWwgWkuvC1WovADw8MkUMrDNWkRoQDmWNL+z7fvNahDq
 3LeSXTciURbONArC57/6jnQG4amDd/XDm+3vM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Zxl1r4TS
Subject: [Buildroot] [PATCH v3 1/4] package/openrc: bump version to 0.50
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenRC has not been updated for quite some time, and much has changed.

  - Convert to a meson package.

  - Update the license hash as the year has changed from 2015 to 2023.

  - Introduce two new patches:

    - 0007-Force-symlinking-of-openrc-init-to-init.patch: Prevents rebuillds
      of the package from failing by forcing symlinking openrc-init to
      openrc-init. (Upstream: https://github.com/OpenRC/openrc/pull/660)

    - 0008-allow-setting-rc_libexecdir-path.patch: Introduces the previous
      behavior of setting the rc directory to /usr/libexec/rc.
      (Upstream: Upstream: https://github.com/OpenRC/openrc/pull/443)

  - Install the sysv-rcs script in the new OPENRC_INSTALL_SYSV_RCS_SCRIPT
    post install hook as the OPENRC_BUILD_CMDS define no longer exists.

Tested with tests.init.test_openrc all tests pass.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ....in-change-run-lock-from-root-uucp-t.patch |  2 +-
 ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 35 ++++++++-------
 ...lso-create-run-lock-subsys-directory.patch |  2 +-
 ...ce-symlinking-of-openrc-init-to-init.patch | 31 +++++++++++++
 ...008-allow-setting-rc_libexecdir-path.patch | 44 +++++++++++++++++++
 package/openrc/openrc.hash                    |  4 +-
 package/openrc/openrc.mk                      | 39 ++++++----------
 7 files changed, 110 insertions(+), 47 deletions(-)
 create mode 100644 package/openrc/0007-Force-symlinking-of-openrc-init-to-init.patch
 create mode 100644 package/openrc/0008-allow-setting-rc_libexecdir-path.patch

diff --git a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
index 457fbacb5b..2f0a81bbd3 100644
--- a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
+++ b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
@@ -22,7 +22,7 @@ diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
 index 222bbd3b..7f1a88db 100644
 --- a/sh/init.sh.Linux.in
 +++ b/sh/init.sh.Linux.in
-@@ -85,7 +85,7 @@ fi
+@@ -83,7 +83,7 @@ fi
  fi
  
  checkpath -d "$RC_SVCDIR"
diff --git a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
index 733506ada9..42f77ffdea 100644
--- a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
+++ b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
@@ -8,27 +8,28 @@ Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
 only).
 
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
+[Adam: update for 0.50]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- runlevels/Makefile | 6 ------
+ tools/meson_runlevels.sh | 6 ------
  1 file changed, 6 deletions(-)
 
-diff --git a/runlevels/Makefile b/runlevels/Makefile
-index 73843d8b..dbfb59ca 100644
---- a/runlevels/Makefile
-+++ b/runlevels/Makefile
-@@ -90,12 +90,6 @@ install:
- 			fi; \
- 			ln -snf ${INITDIR}/"$$x" ${SHUTDOWNDIR}/"$$x" || exit $$?; done \
- 	fi
--	if test "${MKSYSVINIT}" = yes && test "${OS}" = Linux; then \
--		for x in tty1 tty2 tty3 tty4 tty5 tty6; do \
--			ln -snf ${INITDIR}/agetty ${DESTDIR}/${INITDIR}/"agetty.$$x" || exit $$?; \
--			ln -snf ${INITDIR}/agetty.$$x ${DEFAULTDIR}/"agetty.$$x" || exit $$?; \
--		done; \
--	fi
- 
- check test::
+diff --git a/tools/meson_runlevels.sh b/tools/meson_runlevels.sh
+index 1473d4e..eee256b 100755
+--- a/tools/meson_runlevels.sh
++++ b/tools/meson_runlevels.sh
+@@ -91,11 +91,5 @@ if ! test -d "${DESTDIR}${shutdowndir}"; then
+ 		ln -snf "${init_d_dir}/$x" "${DESTDIR}${shutdowndir}/$x"
+ 	done
+ fi
+-if test "${sysvinit}" = yes && test "${os}" = Linux; then \
+-	for x in tty1 tty2 tty3 tty4 tty5 tty6; do
+-		ln -snf "${init_d_dir}/agetty" "${DESTDIR}/${init_d_dir}/agetty.$x"
+-		ln -snf "${init_d_dir}/agetty.$x" "${DESTDIR}/${defaultdir}/agetty.$x"
+-	done;
+-fi
  
+ ln -snf "${rc_libexecdir}"/sh/functions.sh "${DESTDIR}/${init_d_dir}"
 -- 
 2.18.2
 
diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
index cf592a88b0..ad78a4b8f7 100644
--- a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
+++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
@@ -15,7 +15,7 @@ diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
 index e8afc1fb..662ab223 100644
 --- a/sh/init.sh.Linux.in
 +++ b/sh/init.sh.Linux.in
-@@ -82,7 +82,7 @@ elif ! mountinfo -q /run; then
+@@ -83,7 +83,7 @@ elif ! mountinfo -q /run; then
  fi
  
  checkpath -d "$RC_SVCDIR"
diff --git a/package/openrc/0007-Force-symlinking-of-openrc-init-to-init.patch b/package/openrc/0007-Force-symlinking-of-openrc-init-to-init.patch
new file mode 100644
index 0000000000..4f5aef6b94
--- /dev/null
+++ b/package/openrc/0007-Force-symlinking-of-openrc-init-to-init.patch
@@ -0,0 +1,31 @@
+From 14f883b672470e526f2576a5d11a75e2023e2ded Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 10 Oct 2023 10:00:24 +0200
+Subject: [PATCH] Force symlinking of openrc-init to init
+
+When building on embedded SDKs such as Buildroot or Yocto, if OpenRC has a
+previous installation, the package will fail the installation step as the
+openrc-init is already a symlink to "${DESTDIR}/${sbindir}"/init. Force
+symlinking to prevent errors when reinstalling the package.
+
+Upstream: https://github.com/OpenRC/openrc/pull/660
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ tools/meson_final.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/meson_final.sh b/tools/meson_final.sh
+index ecec6eaa..ef91f9e3 100755
+--- a/tools/meson_final.sh
++++ b/tools/meson_final.sh
+@@ -13,5 +13,5 @@ if [ "${os}" != Linux ]; then
+ fi
+ install -m 644 "${MESON_BUILD_ROOT}/src/shared/version" "${DESTDIR}/${rc_libexecdir}"
+ if [ "${os}" = Linux ] && [ "${sysvinit}" = yes ]; then
+-	ln -s openrc-init "${DESTDIR}/${sbindir}"/init
++	ln -sf openrc-init "${DESTDIR}/${sbindir}"/init
+ fi
+-- 
+2.41.0
+
diff --git a/package/openrc/0008-allow-setting-rc_libexecdir-path.patch b/package/openrc/0008-allow-setting-rc_libexecdir-path.patch
new file mode 100644
index 0000000000..a11c789275
--- /dev/null
+++ b/package/openrc/0008-allow-setting-rc_libexecdir-path.patch
@@ -0,0 +1,44 @@
+From 89c42e7e0d8d5913789a76b007ed6a0c43078c63 Mon Sep 17 00:00:00 2001
+From: artoo <artoo@artixlinux.org>
+Date: Wed, 8 Sep 2021 22:41:58 +0200
+Subject: [PATCH] allow setting rc_libexecdir path
+
+  - Allow to change the rc dir name of the rc_libexecdir path
+  - Introduce a librcdir option for override with value 'rc'
+
+Upstream: https://github.com/OpenRC/openrc/pull/443
+
+Signed-off-by: artoo <artoo@artixlinux.org>
+[Adam: update for 0.50]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5b3f8fa..40d4be1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -102,7 +102,7 @@ if os == 'Linux' and libexecdir == 'libexec'
+   libexecdir = 'lib'
+ endif
+ libexecdir = rootprefix / libexecdir
+-rc_libexecdir = libexecdir / 'rc'
++rc_libexecdir = libexecdir / get_option('librcdir')
+ rc_bindir = rc_libexecdir / 'bin'
+ rc_sbindir = rc_libexecdir / 'sbin'
+ rc_shdir = rc_libexecdir / 'sh'
+diff --git a/meson_options.txt b/meson_options.txt
+index 2c74152..d2f67e4 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -37,3 +37,5 @@ option('termcap', type : 'combo',
+   description : 'the termcap library to use')
+ option('zsh-completions', type : 'boolean',
+   description : 'install zsh completions')
++option('librcdir', type : 'string', value : 'rc',
++  description : 'default location of rc libexec dir')
+-- 
+2.41.0
+
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 4fcfa9132f..24a6878911 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  968e81743a1de7a2348590b3b3286d6af5baf96da28fa1e6364e24f8203fc3b6  openrc-0.43.3.tar.gz
-sha256  96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624  LICENSE
+sha256  8d9bb3a68a491d5d4e0f0af1515e00f27e4463acc0c256930aded26c7c8a834b  openrc-0.50.tar.gz
+sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 1d4e70f712..234fa6de2f 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.43.3
+OPENRC_VERSION = 0.50
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
@@ -12,39 +12,26 @@ OPENRC_CPE_ID_VENDOR = openrc_project
 
 OPENRC_DEPENDENCIES = ncurses
 
-# set LIBNAME so openrc puts files in proper directories and sets proper
-# paths in installed files. Since in buildroot /lib64 and /lib32 always
-# points to /lib, it's safe to hardcode it to "lib"
-OPENRC_MAKE_OPTS = \
-	LIBNAME=lib \
-	LIBEXECDIR=/usr/libexec/rc \
-	MKPKGCONFIG=no \
-	MKSYSVINIT=yes \
-	BRANDING="Buildroot $(BR2_VERSION_FULL)" \
-	CC=$(TARGET_CC)
-
-ifeq ($(BR2_SHARED_LIBS),y)
-OPENRC_MAKE_OPTS += MKSTATICLIBS=no
-else
-OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
-endif
+OPENRC_CONF_OPTS = \
+	-Dos=Linux \
+	-Dlibrcdir=/usr/libexec/rc \
+	-Dpkgconfig=false \
+	-Dsysvinit=true \
+	-Drootprefix=/ \
+	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-OPENRC_MAKE_OPTS += MKSELINUX=yes
+OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
 else
-OPENRC_MAKE_OPTS += MKSELINUX=no
+OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
-define OPENRC_BUILD_CMDS
-	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
-endef
-
-define OPENRC_INSTALL_TARGET_CMDS
-	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
+define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
 endef
+OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_INSTALL_SYSV_RCS_SCRIPT
 
 ifeq ($(BR2_PACKAGE_KBD),)
 # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
@@ -90,4 +77,4 @@ endef
 OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
 endif # BR2_TARGET_GENERIC_GETTY
 
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
