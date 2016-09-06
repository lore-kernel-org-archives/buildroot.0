From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:24:41 +0200
Subject: [Buildroot] [git commit] lxc: use uptream patch to handle
	--disable-werror
Message-ID: <20160906192501.9EBA88222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a08e6f33cde04c2041c34dbbadf0b268fcce458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new patch does change behavior, but it was accepted by upstream and
could be removed on next version bump.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lxc/0001-configure-add-disable-werror.patch    | 49 ++++++++++++++++++++++
 package/lxc/0001-drop-werror.patch                 | 16 -------
 package/lxc/lxc.mk                                 |  2 +-
 3 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/package/lxc/0001-configure-add-disable-werror.patch b/package/lxc/0001-configure-add-disable-werror.patch
new file mode 100644
index 0000000..7bd9729
--- /dev/null
+++ b/package/lxc/0001-configure-add-disable-werror.patch
@@ -0,0 +1,49 @@
+From e9f34eb4e25fc18411121c4e55557530ddc1f49c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
+Date: Sun, 4 Sep 2016 09:35:44 +0200
+Subject: [PATCH] configure: add --disable-werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+-Werror may break builds on some scenarios with trivialities
+(especially during developments).
+
+Upstream status: accepted (https://github.com/lxc/lxc/pull/1168)
+
+Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
+---
+ configure.ac | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 39e313a..0103579 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,6 +152,11 @@ if test "x$with_systemdsystemunitdir" != "xno"; then
+   AC_SUBST([SYSTEMD_UNIT_DIR], [$with_systemdsystemunitdir])
+ fi
+ 
++AC_ARG_ENABLE([werror],
++	[AC_HELP_STRING([--disable-werror],
++	[do not treat warnings as errors])],
++	[], [enable_werror=yes])
++
+ # Allow enabling deprecated executables
+ AC_ARG_ENABLE([deprecated],
+ 	[AC_HELP_STRING([--enable-deprecated],
+@@ -630,7 +635,10 @@ AC_PROG_SED
+ LXC_CHECK_TLS
+ 
+ if test "x$GCC" = "xyes"; then
+-	CFLAGS="$CFLAGS -Wall -Werror"
++	CFLAGS="$CFLAGS -Wall"
++	if test "x$enable_werror" = "xyes"; then
++		CFLAGS="$CFLAGS -Werror"
++	fi
+ fi
+ 
+ # Files requiring some variable expansion
+-- 
+2.8.1
+
diff --git a/package/lxc/0001-drop-werror.patch b/package/lxc/0001-drop-werror.patch
deleted file mode 100644
index d2a8673..0000000
--- a/package/lxc/0001-drop-werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Don't do -Werror it breaks builds on some scenarios with trivialities.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lxc-lxc-1.0.4/configure.ac lxc-lxc-1.0.4.orig/configure.ac
---- lxc-lxc-1.0.4.orig/configure.ac	2014-07-04 10:31:19.821029891 -0300
-+++ lxc-lxc-1.0.4/configure.ac	2014-06-13 14:07:45.000000000 -0300
-@@ -560,7 +560,7 @@
- LXC_CHECK_TLS
- 
- if test "x$GCC" = "xyes"; then
--	CFLAGS="$CFLAGS -Wall -Werror"
-+	CFLAGS="$CFLAGS -Wall"
- fi
- 
- # Files requiring some variable expansion
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index a3e24b4..9e21fc0 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -12,7 +12,7 @@ LXC_DEPENDENCIES = libcap host-pkgconf
 # we're patching configure.ac
 LXC_AUTORECONF = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
-	--disable-lua --disable-python \
+	--disable-lua --disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
