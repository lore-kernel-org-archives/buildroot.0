From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Sat,  3 Sep 2016 17:24:49 +0200
Subject: [Buildroot] [PATCH] lxc: revive "drop-werror" patch
Message-ID: <1472916289-3927-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit 5050a94ae9f448641e05ce29c931671ffdc62784 dropped patch that
remove '-Werror' from CFLAGS. However, it seems this patch is still
necessary:

  http://autobuild.buildroot.net/results/b1cbca6d0396863654b1d09ccc3163c5f6124ab8
  http://autobuild.buildroot.net/results/fcf2834ad74b95548d25dad2274704ea401f9665
  http://autobuild.buildroot.net/results/048be2fc702c9dba9ca4439ff687d71b30c10551
  http://autobuild.buildroot.net/results/939246c9a4f433dfd0dc414988f5957441b8e9b4

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/lxc/0001-drop-werror.patch | 16 ++++++++++++++++
 package/lxc/lxc.mk                 |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 package/lxc/0001-drop-werror.patch

diff --git a/package/lxc/0001-drop-werror.patch b/package/lxc/0001-drop-werror.patch
new file mode 100644
index 0000000..d2a8673
--- /dev/null
+++ b/package/lxc/0001-drop-werror.patch
@@ -0,0 +1,16 @@
+Don't do -Werror it breaks builds on some scenarios with trivialities.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lxc-lxc-1.0.4/configure.ac lxc-lxc-1.0.4.orig/configure.ac
+--- lxc-lxc-1.0.4.orig/configure.ac	2014-07-04 10:31:19.821029891 -0300
++++ lxc-lxc-1.0.4/configure.ac	2014-06-13 14:07:45.000000000 -0300
+@@ -560,7 +560,7 @@
+ LXC_CHECK_TLS
+ 
+ if test "x$GCC" = "xyes"; then
+-	CFLAGS="$CFLAGS -Wall -Werror"
++	CFLAGS="$CFLAGS -Wall"
+ fi
+ 
+ # Files requiring some variable expansion
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b1cd385..a3e24b4 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -9,6 +9,8 @@ LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
+# we're patching configure.ac
+LXC_AUTORECONF = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
-- 
1.9.1
