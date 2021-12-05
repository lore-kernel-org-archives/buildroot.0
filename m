Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8DBC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172036070C;
	Sun,  5 Dec 2021 15:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rd-DnQv_4onR; Sun,  5 Dec 2021 15:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FEB60709;
	Sun,  5 Dec 2021 15:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5078F1BF96B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C6F60699
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqtG9itGOYUr for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:35:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D72E960642
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F3E4C8010B; Sun,  5 Dec 2021 15:30:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:35:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e821078031e14df69e5142f23e9cb7b5a1ea0e77
X-Git-Newrev: 079528bb9c887b393ade82032761d0bef867313b
X-Patchwork-Hint: ignore
Message-Id: <20211205153023.F3E4C8010B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: bump to
 version 0.120
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=079528bb9c887b393ade82032761d0bef867313b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop upstreamed patches
- change the location of polkit.its and polkit.loc to match their
  new locations.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-Improve-meson_post_install-script.patch   | 124 ---------------------
 ...undant-computation-of-dbus-data-directory.patch |  35 ------
 ...uild-Don-t-require-dbus-development-files.patch |  42 -------
 package/polkit/polkit.hash                         |   2 +-
 package/polkit/polkit.mk                           |   6 +-
 5 files changed, 4 insertions(+), 205 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
