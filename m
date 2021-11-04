Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86998C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:38:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3BD611C5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C3BD611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B13C403CA;
	Thu,  4 Nov 2021 00:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eupdg5ijC_CP; Thu,  4 Nov 2021 00:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23E48403A7;
	Thu,  4 Nov 2021 00:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044C71BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7FE980AF9
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HvKvghfzzOa for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 00:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8C2C80ACC
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 00:38:28 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id h17so384650qtx.9
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 17:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DKGC/MjOBIvq9jQmiKODfl5WKmmE74qdauao4dAyBc=;
 b=cx2AxFqxDWRJfi6QFpeXoN7/Fej/mkdIyS3O4fnpMQkmeUeeLE0wfdc3jMg0NocwME
 RGWA8bNaFBPR7S6GZfH5e+buXOhOiVMAf9jw1zwkFNEbWqlW9ev0vS8OxRxTNOsHX3Nk
 MB9ThXuekIzlk8YiMBZydydGYUUgM7J5br6ocpLXLD7Y1sA6oevXLHtgJySRBsi/ZQNX
 shIAuRFS/pXOndjRH9TpMQj5IW7BuWQj4J/eGN3fEyFYD9h1Pc7kI7mlXUjGQw3ZKpgI
 Mk3lImAp2yqRP9cbfS4fnsMnGTJwqGzR49KvzyV5/8Q/hXtWXrOLP0B3vrtKikKaPYTX
 60dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DKGC/MjOBIvq9jQmiKODfl5WKmmE74qdauao4dAyBc=;
 b=19zwwUrJRtL+OeZdQ9fS3d8xDo9Dq+zISQzDAcVuiqyrbHUi5PA5uzzgxPAKp3GDFa
 z2GOG9ZasBoSaOzz9vyVNFL3g/dtzMsgdUwEwl0T6mKcZS4hV3wUU3OgbxacHPQohYEN
 7XWlgI+2t6c5JadVaPIDqzl2gQRyHaTyK3Fm00RkYItFZlIc/JmwKhKC2e3s9MFDBJIh
 YE8sZpZCF8W7GRtuT36AMSqJCdcLcYntgtZY/wpgxKg9l/GXtwIpH5M1nti8+RB5NnLs
 kyHvHj2R1I9Hbg0j4oZrTPOVT8JK3Lj7h8OEPZvU7qFjfR2RDdSIMe+/lxwjy04vxUPY
 oSBQ==
X-Gm-Message-State: AOAM531v3K0/RiTERNHbeWHgXypBH98tF48/tO9puzZVA3xGU1SjsrHD
 yuRLD9pKGWQn4wlnoO6e6l8Aec5VmUQ=
X-Google-Smtp-Source: ABdhPJw7h90b0tledOZ/97NAudylutRg9Zb8SgxZIWD5Kj5J9A3nWAMlYBY84VJ08PhcEkdMa/jJmg==
X-Received: by 2002:ac8:5f8a:: with SMTP id j10mr21506363qta.144.1635986307125; 
 Wed, 03 Nov 2021 17:38:27 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id g123sm2525249qkf.108.2021.11.03.17.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:38:26 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 17:38:24 -0700
Message-Id: <20211104003824.2023999-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump to version 0.120
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop upstreamed patches
- change the location of polkit.its and polkit.loc to match their
  new locations.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...02-Improve-meson_post_install-script.patch | 124 ------------------
 ...t-computation-of-dbus-data-directory.patch |  35 -----
 ...Don-t-require-dbus-development-files.patch |  42 ------
 package/polkit/polkit.hash                    |   2 +-
 package/polkit/polkit.mk                      |   6 +-
 5 files changed, 4 insertions(+), 205 deletions(-)
 delete mode 100644 package/polkit/0002-Improve-meson_post_install-script.patch
 delete mode 100644 package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
 delete mode 100644 package/polkit/0004-build-Don-t-require-dbus-development-files.patch

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
diff --git a/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch b/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
deleted file mode 100644
index 7fce2e10a5..0000000000
--- a/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9fa097f4dde92a0c1675400228b4cb965ed3e123 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Thu, 3 Jun 2021 18:55:29 +0100
-Subject: [PATCH] build: Remove redundant computation of dbus data directory
-
-We were asking pkg-config "if I define ${datadir} to pk_prefix/pk_datadir,
-what would ${datadir} be?" but the answer is obviously always going to be
-pk_prefix/pk_datadir.
-
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-[Retrieved (and slightly updated for duktape fork) from:
-https://gitlab.freedesktop.org/polkit/polkit/-/commit/9fa097f4dde92a0c1675400228b4cb965ed3e123]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 6a6799e..03a7683 100644
---- a/meson.build
-+++ b/meson.build
-@@ -136,8 +136,7 @@ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t fin
- endif
- 
- dbus_dep = dependency('dbus-1')
--dbus_confdir = dbus_dep.get_pkgconfig_variable('datadir', define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from sysconfdir with respect to commit#8eada3836465838
--dbus_policydir = dbus_confdir / 'dbus-1/system.d'
-+dbus_policydir = pk_prefix / pk_datadir / 'dbus-1/system.d'
- dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
- 
- # check OS
--- 
-GitLab
-
diff --git a/package/polkit/0004-build-Don-t-require-dbus-development-files.patch b/package/polkit/0004-build-Don-t-require-dbus-development-files.patch
deleted file mode 100644
index 1b7adbf67f..0000000000
--- a/package/polkit/0004-build-Don-t-require-dbus-development-files.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4bb2157adae620c8b07caf5a24b177d1f90f2fbb Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Thu, 3 Jun 2021 18:57:00 +0100
-Subject: [PATCH] build: Don't require dbus development files
-
-We don't actually need libdbus, only the dbus-daemon's installation
-directory for system services, which in practice is always going to be
-/usr/share/dbus-1/system-services.
-
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-[Retrieved (and slightly updated for duktape fork) from:
-https://gitlab.freedesktop.org/polkit/polkit/-/commit/4bb2157adae620c8b07caf5a24b177d1f90f2fbb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 03a7683..539ec7a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -135,9 +135,14 @@ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t fin
-   js_dep = dependency('mozjs-78')
- endif
- 
--dbus_dep = dependency('dbus-1')
-+dbus_dep = dependency('dbus-1', required: false)
- dbus_policydir = pk_prefix / pk_datadir / 'dbus-1/system.d'
--dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
-+if dbus_dep.found()
-+  dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
-+else
-+  # libdbus development files not installed, assume a standard layout
-+  dbus_system_bus_services_dir = pk_prefix / pk_datadir / 'dbus-1' / 'system-services'
-+endif
- 
- # check OS
- host_system = host_machine.system()
--- 
-GitLab
-
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 9677e19bb0..f108ac19ec 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  88d078f1d1f653fd31fe42e46cc3d9b7dd468e70684075e32fe1766dc7ece517  polkit-0.119.tar.gz
+sha256  0a30dbc0ff798ff45f5bb303b4b40160f56679e81b139287cc0efb32aa5dfc1b  polkit-0.120.tar.gz
 
 # Locally calculated
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index ed6f1a5a8f..a8b91d21bc 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.119
+POLKIT_VERSION = 0.120
 POLKIT_SITE = $(call github,aduskett,polkit-duktape,v$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
@@ -39,9 +39,9 @@ endif
 # polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
 # and not $(STAGING_DIR)
 define POLKIT_INSTALL_ITS
-	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
+	$(INSTALL) -D -m 644 $(@D)/gettext/its/polkit.its \
 		$(HOST_DIR)/share/gettext/its/polkit.its
-	$(INSTALL) -D -m 644 $(@D)/data/polkit.loc \
+	$(INSTALL) -D -m 644 $(@D)/gettext/its/polkit.loc \
 		$(HOST_DIR)/share/gettext/its/polkit.loc
 endef
 POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
