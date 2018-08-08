From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Aug 2018 20:41:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: Disable build of manpages
 and documentation
Message-ID: <20180808184155.1486-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3f2/3f214cbb1fe2dc2c2cbfb630032e13eba81c1b5a/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/0004-no-man.patch | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/samba4/0004-no-man.patch

diff --git a/package/samba4/0004-no-man.patch b/package/samba4/0004-no-man.patch
new file mode 100644
index 0000000000..ce074d2df8
--- /dev/null
+++ b/package/samba4/0004-no-man.patch
@@ -0,0 +1,101 @@
+Disable build of manpages and documentation
+
+This patch fixes a bug described in an upstream bug report
+https://bugzilla.samba.org/show_bug.cgi?id=9515
+which was closed as WONTFIX by disabling the build of manpages and
+documentation.
+
+If installed on the host, samba4 uses the docbook-xsl package to build
+parts of the documentation. This package is broken, on Debian for
+example the bug reported to samba4 was fixed in the docbook-xsl package:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=765567
+
+Since we do not provide a host version of docbook-xsl we need to disable
+the build of manpages and documentation.
+
+Patch was downloaded from
+https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/network/samba/patches/samba-950-no-man.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur samba-4.5.5/buildtools/wafsamba/wafsamba.py samba-4.5.5.patch/buildtools/wafsamba/wafsamba.py
+--- samba-4.5.5/buildtools/wafsamba/wafsamba.py	2016-08-11 09:51:04.000000000 +0200
++++ samba-4.5.5.patch/buildtools/wafsamba/wafsamba.py	2017-02-17 15:33:36.453169574 +0100
+@@ -330,9 +330,9 @@
+     if pc_files is not None and not private_library:
+         bld.PKG_CONFIG_FILES(pc_files, vnum=vnum)
+ 
+-    if (manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and
+-        bld.env['XSLTPROC_MANPAGES']):
+-        bld.MANPAGES(manpages, install)
++#    if (manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and
++#        bld.env['XSLTPROC_MANPAGES']):
++#        bld.MANPAGES(manpages, install)
+ 
+ 
+ Build.BuildContext.SAMBA_LIBRARY = SAMBA_LIBRARY
+@@ -437,8 +437,8 @@
+         samba_ldflags  = pie_ldflags
+         )
+ 
+-    if manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
+-        bld.MANPAGES(manpages, install)
++#    if manpages is not None and 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
++#        bld.MANPAGES(manpages, install)
+ 
+ Build.BuildContext.SAMBA_BINARY = SAMBA_BINARY
+ 
+diff -Naur samba-4.5.5/docs-xml/wscript_build samba-4.5.5.patch/docs-xml/wscript_build
+--- samba-4.5.5/docs-xml/wscript_build	2016-08-11 09:51:04.000000000 +0200
++++ samba-4.5.5.patch/docs-xml/wscript_build	2017-02-17 15:44:45.142392019 +0100
+@@ -127,20 +127,20 @@
+                     rule=smbdotconf_generate_parameter_list,
+                     dep_vars=bld.dynconfig_varnames())
+ 
+-def SMBDOTCONF_MANPAGE(bld, target):
+-    ''' assemble and build smb.conf.5 manual page'''
+-    bld.SAMBAMANPAGES(target, parameter_all)
+-
+-if ('XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']):
+-
+-    SMBDOTCONF_MANPAGE(bld, 'manpages/smb.conf.5')
+-    bld.SAMBAMANPAGES(manpages)
+-
+-    if bld.CONFIG_SET('WITH_PAM_MODULES') and bld.CONFIG_SET('HAVE_PAM_START'):
+-        bld.SAMBAMANPAGES(pam_winbind_manpages)
+-
+-    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
+-        bld.SAMBAMANPAGES(krb5_locator_manpages)
+-
+-    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
+-        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
++#def SMBDOTCONF_MANPAGE(bld, target):
++#    ''' assemble and build smb.conf.5 manual page'''
++#    bld.SAMBAMANPAGES(target, parameter_all)
++#
++#if ('XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']):
++#
++#    SMBDOTCONF_MANPAGE(bld, 'manpages/smb.conf.5')
++#    bld.SAMBAMANPAGES(manpages)
++#
++#    if bld.CONFIG_SET('WITH_PAM_MODULES') and bld.CONFIG_SET('HAVE_PAM_START'):
++#        bld.SAMBAMANPAGES(pam_winbind_manpages)
++#
++#    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
++#        bld.SAMBAMANPAGES(krb5_locator_manpages)
++#
++#    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
++#        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
+--- a/source4/scripting/wscript_build	2018-03-20 12:19:12.059332486 +0100
++++ b/source4/scripting/wscript_build	2018-03-20 12:19:32.087429756 +0100
+@@ -12,8 +12,8 @@
+     bld.INSTALL_FILES('${SBINDIR}',
+                       sbin_files,
+                       chmod=MODE_755, python_fixup=True, flat=True)
+-    if 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
+-        bld.MANPAGES(man_files, True)
++#    if 'XSLTPROC_MANPAGES' in bld.env and bld.env['XSLTPROC_MANPAGES']:
++#        bld.MANPAGES(man_files, True)
+ 
+ if bld.CONFIG_SET('AD_DC_BUILD_IS_ENABLED'):
+     bld.INSTALL_FILES('${BINDIR}',
-- 
2.18.0
