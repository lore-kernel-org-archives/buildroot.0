Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7E9C433FE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 19:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D44610CE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59D44610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DB8600CD;
	Mon, 13 Sep 2021 19:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wp67vulv_wSi; Mon, 13 Sep 2021 19:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02CE2606DF;
	Mon, 13 Sep 2021 19:23:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 686551BF325
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 19:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 570BE400F2
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 19:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsdLXKnA6pBh for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 19:23:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 533AD40004
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 19:23:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:605f:5a66:ee64:c7e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B283013F8C1;
 Mon, 13 Sep 2021 21:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631561010;
 bh=mifkYtk6zXrJXutUYAQ78c6hkjB/WQcrKJ78uUp+8vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfzQh8haA2RrZ/LbVzWkfz+J0n7DJqC70RFFnStJ4uq/FuRFrb1X5j4abc63c7LBG
 pwP6iVV+mM6iOYRPqyQU4CwjuwyZLrKuSDTunLGodl4qzt5ytwd+mLtOfeng9uAib3
 J6LJSNidbFrTNHnb/vRmaSgvZeDH5raxJgBmYRxwewQjv2EwuQn86spdIQUpXstRRA
 6PlMmV9e7E1cQDu3NC+uI0FuTPTKq3mYv5I8z57wN9u3SVZs9QG//FzcV91cntwEin
 NyJgPLtV89lGG6sMvwG5EkaaRHoVZabxZ7c5/PX53nMitkDcckHSlzU5W6v7C5N2r2
 HCNQv37K+ru7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 13 Sep 2021 21:23:18 +0200
Date: Mon, 13 Sep 2021 21:23:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Message-ID: <20210913192318.GM1053080@scaer>
References: <20210912213042.3120494-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912213042.3120494-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/polkit: switch to
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 2021-09-12 23:30 +0200, Fabrice Fontaine spake thusly:
> This reverts commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb which
> raises the following build failure if systemd-polkit is enabled
> because dbus was added to POLKIT_DEPENDENCIES:
> 
> package/dbus/dbus.mk:124: *** Recursive variable 'DBUS_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

This is because dbus is a new dependency with the conversion to meson.

But on fact, upstream has already dropped that dependency:

    https://gitlab.freedesktop.org/polkit/polkit/-/commit/4bb2157adae620c8b07caf5a24b177d1f90f2fbb

So, I think we could keep a meson package [0], backport that patch from
upstream, ask Adam to update his duktape-based fork and do a new
release, perhaprs? ;-]

Fabrice, can you test and send the backport if it works?

Regards,
Yann E. MORIN.

> This commit can be safely reverted as commit
> 8dda79970661090f202e1f20e5982ba53fdaeb95 will fix the autotools build
> failure with gobject-introspection
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e038fae0f5fc2db3e85be05db4612e4f2395e35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...02-Improve-meson_post_install-script.patch | 124 ------------------
>  package/polkit/Config.in                      |   2 +-
>  package/polkit/polkit.mk                      |  27 ++--
>  3 files changed, 17 insertions(+), 136 deletions(-)
>  delete mode 100644 package/polkit/0002-Improve-meson_post_install-script.patch
> 
> diff --git a/package/polkit/0002-Improve-meson_post_install-script.patch b/package/polkit/0002-Improve-meson_post_install-script.patch
> deleted file mode 100644
> index 932bf88f59..0000000000
> --- a/package/polkit/0002-Improve-meson_post_install-script.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 6c8022392713955c5ae0061e22b50a16a1c2252a Mon Sep 17 00:00:00 2001
> -From: Simon McVittie <smcv@collabora.com>
> -Date: Thu, 15 Jul 2021 12:36:05 +0000
> -Subject: [PATCH] Improve meson_post_install script
> -
> -[Retrieved from:
> -https://gitlab.freedesktop.org/polkit/polkit/-/commit/6c8022392713955c5ae0061e22b50a16a1c2252a]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - .gitlab-ci.yml        |  3 +--
> - meson_post_install.py | 58 +++++++++++++++++++++++++++++++++++--------
> - 2 files changed, 49 insertions(+), 12 deletions(-)
> -
> -diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> -index 8ac3e9f..6d0abb4 100644
> ---- a/.gitlab-ci.yml
> -+++ b/.gitlab-ci.yml
> -@@ -26,8 +26,6 @@ build_stable:
> -   before_script:
> -     - dnf upgrade -y --nogpgcheck fedora-release fedora-repos*
> -     - dnf update -y && dnf install -y $DEPENDENCIES
> --    - getent group polkitd >/dev/null || groupadd -r polkitd
> --    - getent passwd polkitd >/dev/null || useradd -r -g polkitd -d / -s /sbin/nologin -c "User for polkitd" polkitd
> - 
> -   script:
> -     - meson setup 
> -@@ -43,6 +41,7 @@ build_stable:
> -     - meson compile -C builddir
> -     - meson test    -C builddir
> -     - meson install -C builddir
> -+    - DESTDIR=$(pwd)/DESTDIR meson install -C builddir
> -   artifacts:
> -     name: 'test logs'
> -     when: 'always'
> -diff --git a/meson_post_install.py b/meson_post_install.py
> -index 0a0fccf..0ab7469 100644
> ---- a/meson_post_install.py
> -+++ b/meson_post_install.py
> -@@ -1,20 +1,44 @@
> - #!/usr/bin/env python3
> - 
> --import getpass
> - import os
> - import pwd
> - import sys
> - 
> -+destdir = os.environ.get('DESTDIR')
> - prefix = os.environ['MESON_INSTALL_DESTDIR_PREFIX']
> - 
> --bindir = os.path.join(prefix, sys.argv[1])
> --pkgdatadir = os.path.join(prefix, sys.argv[2])
> --pkglibdir = os.path.join(prefix, sys.argv[3])
> --pkgsysconfdir = os.path.join(prefix, sys.argv[4])
> -+def destdir_path(p):
> -+    if os.path.isabs(p):
> -+        if destdir is None:
> -+            return p
> -+        else:
> -+            return os.path.join(destdir, os.path.relpath(p, '/'))
> -+    else:
> -+        return os.path.join(prefix, p)
> - 
> --polkitd_uid = pwd.getpwnam(sys.argv[5]).pw_uid
> -+bindir = destdir_path(sys.argv[1])
> -+pkgdatadir = destdir_path(sys.argv[2])
> -+pkglibdir = destdir_path(sys.argv[3])
> -+pkgsysconfdir = destdir_path(sys.argv[4])
> -+polkitd_user = sys.argv[5]
> - 
> --os.chmod(os.path.join(bindir, 'pkexec'), 0o4775)
> -+try:
> -+    polkitd_uid = pwd.getpwnam(polkitd_user).pw_uid
> -+except KeyError:
> -+    polkitd_uid = None
> -+
> -+dst = os.path.join(bindir, 'pkexec')
> -+
> -+if os.geteuid() == 0:
> -+    os.chmod(dst, 0o4755)
> -+    os.chown(dst, 0, -1)
> -+else:
> -+    print(
> -+        'Owner and mode of {} need to be setuid root (04755) after '
> -+        'installation'.format(
> -+            dst,
> -+        )
> -+    )
> - 
> - dst_dirs = [
> -     os.path.join(pkgsysconfdir, 'rules.d'),
> -@@ -24,13 +48,27 @@ dst_dirs = [
> - for dst in dst_dirs:
> -     if not os.path.exists(dst):
> -         os.makedirs(dst, mode=0o700)
> --        if getpass.getuser() == "root":
> -+        if os.geteuid() == 0 and polkitd_uid is not None:
> -             os.chown(dst, polkitd_uid, -1)
> -+        else:
> -+            print(
> -+                'Owner of {} needs to be set to {} after installation'.format(
> -+                    dst, polkitd_user,
> -+                )
> -+            )
> - 
> - # polkit-agent-helper-1 need to be setuid root because it's used to
> - # authenticate not only the invoking user, but possibly also root
> - # and/or other users.
> - dst = os.path.join(pkglibdir, 'polkit-agent-helper-1')
> --os.chmod(dst, 0o4755)
> --if getpass.getuser() == "root":
> -+
> -+if os.geteuid() == 0:
> -+    os.chmod(dst, 0o4755)
> -     os.chown(dst, 0, -1)
> -+else:
> -+    print(
> -+        'Owner and mode of {} need to be setuid root (04755) after '
> -+        'installation'.format(
> -+            dst,
> -+        )
> -+    )
> --- 
> -GitLab
> -
> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
> index a968ee52d7..622cbbb90b 100644
> --- a/package/polkit/Config.in
> +++ b/package/polkit/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_POLKIT
>  	depends on BR2_USE_MMU # libglib2, dbus
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on !BR2_STATIC_LIBS # duktape
> -	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_DBUS # runtime
>  	select BR2_PACKAGE_DUKTAPE
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_LIBGLIB2
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index 7d75d66ffb..3a8c442dbb 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -9,31 +9,36 @@ POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
>  POLKIT_LICENSE = GPL-2.0
>  POLKIT_LICENSE_FILES = COPYING
>  POLKIT_CPE_ID_VENDOR = polkit_project
> +POLKIT_AUTORECONF = YES
>  POLKIT_INSTALL_STAGING = YES
>  
>  POLKIT_DEPENDENCIES = \
> -	dbus duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
> +	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
>  
> -POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
> +POLKIT_CONF_ENV = \
> +	CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +	LIBS=$(TARGET_NLS_LIBS)
>  
>  POLKIT_CONF_OPTS = \
> -	-Dman=false \
> -	-Dexamples=false \
> -	-Dsession_tracking=ConsoleKit \
> -	-Djs_engine=duktape
> +	--with-os-type=unknown \
> +	--disable-man-pages \
> +	--disable-examples \
> +	--disable-libelogind \
> +	--disable-libsystemd-login \
> +	--with-duktape
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -POLKIT_CONF_OPTS += -Dintrospection=true
> +POLKIT_CONF_OPTS += --enable-introspection
>  POLKIT_DEPENDENCIES += gobject-introspection
>  else
> -POLKIT_CONF_OPTS += -Dintrospection=false
> +POLKIT_CONF_OPTS += --disable-introspection
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  POLKIT_DEPENDENCIES += linux-pam
> -POLKIT_CONF_OPTS += -Dauthfw=pam
> +POLKIT_CONF_OPTS += --with-authfw=pam
>  else
> -POLKIT_CONF_OPTS += -Dauthfw=shadow
> +POLKIT_CONF_OPTS += --with-authfw=shadow
>  endif
>  
>  # polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
> @@ -67,4 +72,4 @@ define POLKIT_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S50polkit
>  endef
>  
> -$(eval $(meson-package))
> +$(eval $(autotools-package))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
