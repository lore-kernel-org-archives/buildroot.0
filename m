From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:57:58 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/samba4: bump
 version to 4.8.5
Message-ID: <20181203215444.6759F88D6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2614104752265a397f727d9922cab297cd2e4eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Release notes: https://www.samba.org/samba/history/samba-4.8.5.html

Rebased patches 0001 & 0004.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 934d23bec79ca58a7c61239d5c4f64d26f8f5cd1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-libreplace-disable-libbsd-support.patch      | 12 ++++++------
 ...-Disable-build-of-manpages-and-documentation.patch | 19 +++++++++++++------
 package/samba4/samba4.hash                            |  4 ++--
 package/samba4/samba4.mk                              |  2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index 4794cb02fd..ae46c447fd 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -9,17 +9,17 @@ This causes redefinition conflicts for link(2) when both standard
 unistd.h and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-(rebased for versions 4.7.3 & 4.8.0)
+[Bernd: rebased for versions 4.7.3, 4.8.0 & 4.8.5]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- lib/replace/wscript | 12 ------------
- 1 file changed, 12 deletions(-)
+ lib/replace/wscript | 15 ---------------
+ 1 file changed, 15 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 1dfd902..456be9b 100644
+index 6c7de5953f0..ac230d719f7 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -296,21 +296,6 @@
+@@ -304,21 +304,6 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -42,5 +42,5 @@ index 1dfd902..456be9b 100644
                  struct ucred cred;
                  socklen_t cred_len;
 -- 
-2.7.3
+2.18.0
 
diff --git a/package/samba4/0004-Disable-build-of-manpages-and-documentation.patch b/package/samba4/0004-Disable-build-of-manpages-and-documentation.patch
index 41a06801c7..ad8712634e 100644
--- a/package/samba4/0004-Disable-build-of-manpages-and-documentation.patch
+++ b/package/samba4/0004-Disable-build-of-manpages-and-documentation.patch
@@ -19,12 +19,13 @@ the build of manpages and documentation.
 Patch was downloaded from
 https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/network/samba/patches/samba-950-no-man.patch
 
+[Bernd: rebased for samba-4.8.5]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- buildtools/wafsamba/wafsamba.py | 10 +++++-----
- docs-xml/wscript_build          | 34 +++++++++++++++++-----------------
+ buildtools/wafsamba/wafsamba.py | 10 ++++-----
+ docs-xml/wscript_build          | 40 ++++++++++++++++-----------------
  source4/scripting/wscript_build |  4 ++--
- 3 files changed, 24 insertions(+), 24 deletions(-)
+ 3 files changed, 27 insertions(+), 27 deletions(-)
 
 diff --git a/buildtools/wafsamba/wafsamba.py b/buildtools/wafsamba/wafsamba.py
 index 4bb19d070e2..a255d841111 100644
@@ -55,10 +56,10 @@ index 4bb19d070e2..a255d841111 100644
  Build.BuildContext.SAMBA_BINARY = SAMBA_BINARY
  
 diff --git a/docs-xml/wscript_build b/docs-xml/wscript_build
-index 954c62a29bc..1169158fd57 100644
+index ec5d28fc62a..f81c125bcd4 100644
 --- a/docs-xml/wscript_build
 +++ b/docs-xml/wscript_build
-@@ -147,20 +147,20 @@ bld.SAMBA_GENERATOR(parameter_all,
+@@ -148,23 +148,23 @@ bld.SAMBA_GENERATOR(parameter_all,
                      rule=smbdotconf_generate_parameter_list,
                      dep_vars=bld.dynconfig_varnames())
  
@@ -77,6 +78,9 @@ index 954c62a29bc..1169158fd57 100644
 -    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
 -        bld.SAMBAMANPAGES(krb5_locator_manpages)
 -
+-    if bld.CONFIG_SET('HAVE_KRB5_LOCALAUTH_PLUGIN_H'):
+-        bld.SAMBAMANPAGES(krb5_localauth_manpages)
+-
 -    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
 -        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
 +#def SMBDOTCONF_MANPAGE(bld, target):
@@ -94,6 +98,9 @@ index 954c62a29bc..1169158fd57 100644
 +#    if bld.CONFIG_SET('HAVE_KRB5_LOCATE_PLUGIN_H'):
 +#        bld.SAMBAMANPAGES(krb5_locator_manpages)
 +#
++#    if bld.CONFIG_SET('HAVE_KRB5_LOCALAUTH_PLUGIN_H'):
++#        bld.SAMBAMANPAGES(krb5_localauth_manpages)
++#
 +#    if bld.SAMBA3_IS_ENABLED_MODULE('vfs_zfsacl'):
 +#        bld.SAMBAMANPAGES('manpages/vfs_zfsacl.8')
 diff --git a/source4/scripting/wscript_build b/source4/scripting/wscript_build
@@ -112,5 +119,5 @@ index 2f53cce12b7..9841ae0a116 100644
  if bld.CONFIG_SET('AD_DC_BUILD_IS_ENABLED'):
      bld.INSTALL_FILES('${BINDIR}',
 -- 
-2.14.4
+2.18.0
 
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 00c8466078..9594c7a932 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.4.tar.asc
-sha256 f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd1fd771453b9a5406  samba-4.8.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.5.tar.asc
+sha256 e58ee6b1262d4128b8932ceee59d5f0b0a9bbe00547eb3cc4c41552de1a65155  samba-4.8.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 83a02d54e6..a257af75fc 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.4
+SAMBA4_VERSION = 4.8.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
