From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Jun 2019 17:15:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/samba4: drop third patch
In-Reply-To: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
References: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
Message-ID: <20190609151516.19626-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop third patch which is not upstreamable and set XSLTPROC to False
instead to disable documentation

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-build-of-manpages-and-documentation.patch | 123 ------------------
 ...o.c-include-stdint.h-before-cmoka.h.patch} |   0
 package/samba4/samba4.mk                      |   3 +-
 3 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 package/samba4/0003-Disable-build-of-manpages-and-documentation.patch
 rename package/samba4/{0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch => 0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch} (100%)

diff --git a/package/samba4/0003-Disable-build-of-manpages-and-documentation.patch b/package/samba4/0003-Disable-build-of-manpages-and-documentation.patch
deleted file mode 100644
index ad8712634e..0000000000
--- a/package/samba4/0003-Disable-build-of-manpages-and-documentation.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 3cd608170b99492bdd5fe3b7b8e7db61af199845 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 9 Aug 2018 09:59:06 +0200
-Subject: [PATCH] Disable build of manpages and documentation
-
-This patch fixes a bug described in an upstream bug report
-https://bugzilla.samba.org/show_bug.cgi?id=9515
-which was closed as WONTFIX by disabling the build of manpages and
-documentation.
-
-If installed on the host, samba4 uses the docbook-xsl package to build
-parts of the documentation. This package is broken, on Debian for
-example the bug reported to samba4 was fixed in the docbook-xsl package:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=765567
-
-Since we do not provide a host version of docbook-xsl we need to disable
-the build of manpages and documentation.
-
-Patch was downloaded from
-https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/network/samba/patches/samba-950-no-man.patch
-
-[Bernd: rebased for samba-4.8.5]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- buildtools/wafsamba/wafsamba.py | 10 ++++-----
- docs-xml/wscript_build          | 40 ++++++++++++++++-----------------
- source4/scripting/wscript_build |  4 ++--
- 3 files changed, 27 insertions(+), 27 deletions(-)
-
-diff --git a/buildtools/wafsamba/wafsamba.py b/buildtools/wafsamba/wafsamba.py
-index 4bb19d070e2..a255d841111 100644
---- a/buildtools/wafsamba/wafsamba.py
-+++ b/buildtools/wafsamba/wafsamba.py
-@@ -335,9 +335,9 @@ def SAMBA_LIBRARY(bld, libname, source,
-         else:
-             bld.PKG_CONFIG_FILES(pc_files, vnum=vnum)
- 
--    if (manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and
--        bld.env['XSLTPROC_MANPAGES']):
--        bld.MANPAGES(manpages, install)
-+#    if (manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and
-+#        bld.env['XSLTPROC_MANPAGES']):
-+#        bld.MANPAGES(manpages, install)
- 
- 
- Build.BuildContext.SAMBA_LIBRARY = SAMBA_LIBRARY
-@@ -442,8 +442,8 @@ def SAMBA_BINARY(bld, binname, source,
-         samba_ldflags  = pie_ldflags
-         )
- 
--    if manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
--        bld.MANPAGES(manpages, install)
-+#    if manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
-+#        bld.MANPAGES(manpages, install)
- 
- Build.BuildContext.SAMBA_BINARY = SAMBA_BINARY
- 
-diff --git a/docs-xml/wscript_build b/docs-xml/wscript_build
-index ec5d28fc62a..f81c125bcd4 100644
---- a/docs-xml/wscript_build
-+++ b/docs-xml/wscript_build
-@@ -148,23 +148,23 @@ bld.SAMBA_GENERATOR(parameter_all,
-                     rule=smbdotconf_generate_parameter_list,
-                     dep_vars=bld.dynconfig_varnames())
- 
--def SMBDOTCONF_MANPAGE(bld, target):
--    ''' assemble and build smb.conf.5 manual page'''
--    bld.SAMBAMANPAGES(target, parameter_all)
--
--if ('XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']):
--
--    SMBDOTCONF_MANPAGE(bld, 'manpages/smb.conf.5')
--    bld.SAMBAMANPAGES(manpages)
--
--    if bld.CONFIG_SET('WITH_PAM_MODULES') and bld.CONFIG_SET('HAVE_PAM_START'):
--        bld.SAMBAMANPAGES(pam_winbind_manpages)
--
--    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
--        bld.SAMBAMANPAGES(krb5_locator_manpages)
--
--    if bld.CONFIG_SET('HAVE_KRB5_LOCALAUTH_PLUGIN_H'):
--        bld.SAMBAMANPAGES(krb5_localauth_manpages)
--
--    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
--        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
-+#def SMBDOTCONF_MANPAGE(bld, target):
-+#    ''' assemble and build smb.conf.5 manual page'''
-+#    bld.SAMBAMANPAGES(target, parameter_all)
-+#
-+#if ('XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']):
-+#
-+#    SMBDOTCONF_MANPAGE(bld, 'manpages/smb.conf.5')
-+#    bld.SAMBAMANPAGES(manpages)
-+#
-+#    if bld.CONFIG_SET('WITH_PAM_MODULES') and bld.CONFIG_SET('HAVE_PAM_START'):
-+#        bld.SAMBAMANPAGES(pam_winbind_manpages)
-+#
-+#    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
-+#        bld.SAMBAMANPAGES(krb5_locator_manpages)
-+#
-+#    if bld.CONFIG_SET('HAVE_KRB5_LOCALAUTH_PLUGIN_H'):
-+#        bld.SAMBAMANPAGES(krb5_localauth_manpages)
-+#
-+#    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
-+#        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
-diff --git a/source4/scripting/wscript_build b/source4/scripting/wscript_build
-index 2f53cce12b7..9841ae0a116 100644
---- a/source4/scripting/wscript_build
-+++ b/source4/scripting/wscript_build
-@@ -12,8 +12,8 @@ if sbin_files:
-     bld.INSTALL_FILES('${SBINDIR}',
-                       sbin_files,
-                       chmod=MODE_755, python_fixup=True, flat=True)
--    if 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
--        bld.MANPAGES(man_files, True)
-+#    if 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
-+#        bld.MANPAGES(man_files, True)
- 
- if bld.CONFIG_SET('AD_DC_BUILD_IS_ENABLED'):
-     bld.INSTALL_FILES('${BINDIR}',
--- 
-2.18.0
-
diff --git a/package/samba4/0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch
similarity index 100%
rename from package/samba4/0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch
rename to package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4ca3aaa615..08d627a8b6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -21,7 +21,8 @@ SAMBA4_CFLAGS = $(TARGET_CFLAGS)
 SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 SAMBA4_CONF_ENV = \
 	CFLAGS="$(SAMBA4_CFLAGS)" \
-	LDFLAGS="$(SAMBA4_LDFLAGS)"
+	LDFLAGS="$(SAMBA4_LDFLAGS)" \
+	XSLTPROC="False"
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-- 
2.20.1
