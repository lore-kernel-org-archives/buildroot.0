Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D872E95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A904460B1A;
	Mon,  9 Oct 2023 14:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A904460B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w97TNED3lG7; Mon,  9 Oct 2023 14:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A45A46104D;
	Mon,  9 Oct 2023 14:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45A46104D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3231BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23436404C3
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23436404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZp2PkiLtEGP for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:29:28 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0942A4015E
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0942A4015E
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9b2cee55056so841797066b.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861765; x=1697466565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RjrqxPf35l1LJHwoW2YR05+U5jhiAirJ8AMgPJzawfI=;
 b=f70+UX9l/MnHYFulUjNjoxUmQ2/RmapRY9/Aewt8oWb2/4J70jB02BFM9GpA3/wOr7
 0le/Y3hPT7KEWc4Huf6fu+psxhcOYe0hyUbbKbhykUEfMj2HEl9+k2DDR7vayuRTuztI
 XqCHWK/2BMdqslOGNJU6SaCjYdo1/EIB40hB9A3lXasYGeO4VIQxHduppRNBQFO4ODwx
 oTV8G/kQ0A6NFn7sDZ5xq0kbLX1Tb4vgQa9+pVASrQOkIMGgG/+80Dl7ZnJe4TjBb6v4
 +PRf5/7mLYTernBThF2TeRvCXuIgiFO6lUlkma8wufpAAA/hQu1wsV4gZaKzVOE+Zh0N
 AKaA==
X-Gm-Message-State: AOJu0YwgmzNY0P8XnG7CMua+2Yf6N1mDtHmvsuWp5d9IFoGVDT/1jESy
 pQeQh1E54hxl+EOcWZ+nKdSX6m3ojrJmY7NyTFmaIw==
X-Google-Smtp-Source: AGHT+IEVUKDn0v/8YWnZ56QoYI81aSRPMyVXTamkEbUBwhZWL3BMv+wq+J6XndDyY0T7ZrVBCsr8Fg==
X-Received: by 2002:a17:907:7712:b0:9ae:46c7:90fe with SMTP id
 kw18-20020a170907771200b009ae46c790femr14219000ejc.72.1696861765435; 
 Mon, 09 Oct 2023 07:29:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 kt13-20020a170906aacd00b009a5f1d15644sm6701412ejb.119.2023.10.09.07.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:29:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:29:12 +0200
Message-ID: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861765; x=1697466565;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RjrqxPf35l1LJHwoW2YR05+U5jhiAirJ8AMgPJzawfI=;
 b=p/QhaqaGktyTth/pSRgHkm2vSBZrfilv9BBvIRT0qUIUud1ClnayoRDREiuQun+0IC
 8bSdOh4xLOiuNuiuNzhba/JWDlQoSmhRsxPWoGEfBWks0N3I57hcizSDos3LpCTNzoj3
 3z0U5szHOgY/pMQ3+ex2f613/Ykl7IHLJl6IA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p/QhaqaG
Subject: [Buildroot] [PATCH 1/4] package/openrc: bump version to 0.50
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

  - Convert to a meson package.
  - Remove uneeded make opts and installation commands.
  - Change OPENRC_MAKE_OPTS to OPENRC_CONF_OPTS

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ....in-change-run-lock-from-root-uucp-t.patch |  2 +-
 ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 35 ++++++++---------
 ...lso-create-run-lock-subsys-directory.patch |  2 +-
 package/openrc/openrc.hash                    |  4 +-
 package/openrc/openrc.mk                      | 38 ++++---------------
 5 files changed, 30 insertions(+), 51 deletions(-)

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
index 733506ada9..41c367d953 100644
--- a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
+++ b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
@@ -8,27 +8,28 @@ Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
 only).
 
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+Refresh for 0.50
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
index 1d4e70f712..01c23a2a79 100644
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
@@ -12,40 +12,18 @@ OPENRC_CPE_ID_VENDOR = openrc_project
 
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
+	-Dpkgconfig=false \
+	-Dsysvinit=true
 
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
-	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
-		$(TARGET_DIR)/etc/init.d/sysv-rcs
-endef
-
 ifeq ($(BR2_PACKAGE_KBD),)
 # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
 # remove them if the kbd package is not selected (e.g. devices with serial
@@ -90,4 +68,4 @@ endef
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
