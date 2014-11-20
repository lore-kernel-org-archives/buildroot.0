From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 16:09:52 +0100
Subject: [Buildroot] [git commit] omniorb: fix build for uclinux
Message-ID: <20141120154843.9F6017FDDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6480559a5059a9d081b1845b12704611985cfd33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to make configure correctly identify uclinux.

Also, disable build of shared libraries when PREFER_STATIC_LIB is set.
Otherwise, build for Blackfin fails further down the road.

Fixes:
http://autobuild.buildroot.net/results/c60/c60d880b620c47f4aa03cdf2e1bb85a526242d54/
http://autobuild.buildroot.net/results/01f/01f4e8a27831d6817b329fa23fe0bbabd7fd01c9/
http://autobuild.buildroot.net/results/a96/a96a06b825c14dc9fdf738225db50bc1de8b901a/

And many others.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/0001-uclinux-is-also-linux.patch |   19 +++++++++++++++++++
 package/omniorb/omniorb.mk                       |   10 ++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/omniorb/0001-uclinux-is-also-linux.patch b/package/omniorb/0001-uclinux-is-also-linux.patch
new file mode 100644
index 0000000..e003307
--- /dev/null
+++ b/package/omniorb/0001-uclinux-is-also-linux.patch
@@ -0,0 +1,19 @@
+uclinux is also linux
+
+Patch status: sent upstream
+(http://www.omniorb-support.com/pipermail/omniorb-list/2014-November/031628.html)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff -Nuar omniORB-4.1.6-orig/configure.ac omniORB-4.1.6/configure.ac
+--- omniORB-4.1.6-orig/configure.ac	2011-06-25 00:37:28.000000000 +0300
++++ omniORB-4.1.6/configure.ac	2014-11-20 07:05:25.072634260 +0200
+@@ -183,6 +183,7 @@
+ 
+ case "$host" in
+   *-*-linux-*)   plat_name="Linux";    plat_def="__linux__";    os_v="2";;
++  *-*-uclinux-*) plat_name="Linux";    plat_def="__linux__";    os_v="2";;
+   *-*-cygwin*)   plat_name="Cygwin";   plat_def="__cygwin__";   os_v="1";;
+   *-*-solaris*)  plat_name="SunOS";    plat_def="__sunos__";    os_v="5";;
+   *-*-osf3*)     plat_name="OSF1";     plat_def="__osf1__";     os_v="3";;
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index f336c4b..4767fb1 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -14,6 +14,9 @@ OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
 OMNIORB_INSTALL_TARGET = YES
 
+# 0001-uclinux-is-also-linux.patch touches configure.ac
+OMNIORB_AUTORECONF = YES
+
 # omniorb is not python3 friendly, so force the python interpreter
 OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
@@ -41,6 +44,13 @@ ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
 OMNIORB_POST_PATCH_HOOKS += OMNIORB_ENABLE_EXTRA_APPS
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define OMNIORB_DISABLE_SHARED
+	echo "BuildSharedLibrary =" >> $(@D)/mk/beforeauto.mk
+endef
+OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_DISABLE_SHARED
+endif
+
 # omniORB is not completely cross-compile friendly and has some
 # assumptions where a couple host tools must be built and then
 # used by the target build.  The host tools generate code from
