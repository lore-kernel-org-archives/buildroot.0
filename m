From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 23:53:05 +0100
Subject: [Buildroot] [git commit] lxc: bump to version 2.0.6
Message-ID: <20161217225322.865D88184B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be2adc1ab28a9b255068c3786b63406b482ed286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lxc/0001-configure-add-disable-werror.patch    | 49 ----------------------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  4 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/lxc/0001-configure-add-disable-werror.patch b/package/lxc/0001-configure-add-disable-werror.patch
deleted file mode 100644
index 7bd9729..0000000
--- a/package/lxc/0001-configure-add-disable-werror.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e9f34eb4e25fc18411121c4e55557530ddc1f49c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
-Date: Sun, 4 Sep 2016 09:35:44 +0200
-Subject: [PATCH] configure: add --disable-werror
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
--Werror may break builds on some scenarios with trivialities
-(especially during developments).
-
-Upstream status: accepted (https://github.com/lxc/lxc/pull/1168)
-
-Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
----
- configure.ac | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 39e313a..0103579 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -152,6 +152,11 @@ if test "x$with_systemdsystemunitdir" != "xno"; then
-   AC_SUBST([SYSTEMD_UNIT_DIR], [$with_systemdsystemunitdir])
- fi
- 
-+AC_ARG_ENABLE([werror],
-+	[AC_HELP_STRING([--disable-werror],
-+	[do not treat warnings as errors])],
-+	[], [enable_werror=yes])
-+
- # Allow enabling deprecated executables
- AC_ARG_ENABLE([deprecated],
- 	[AC_HELP_STRING([--enable-deprecated],
-@@ -630,7 +635,10 @@ AC_PROG_SED
- LXC_CHECK_TLS
- 
- if test "x$GCC" = "xyes"; then
--	CFLAGS="$CFLAGS -Wall -Werror"
-+	CFLAGS="$CFLAGS -Wall"
-+	if test "x$enable_werror" = "xyes"; then
-+		CFLAGS="$CFLAGS -Werror"
-+	fi
- fi
- 
- # Files requiring some variable expansion
--- 
-2.8.1
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 3dee7fc..7b34e88 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 82df40a0cdd44639ee677d560be95348de48afa93a10a20e959dadb4431ee8d6 lxc-2.0.3.tar.gz
+sha256	7c292cd0055dac1a0e6fbb6a7740fd12b6ffb204603c198faf37c11c9d6dcd7a	lxc-2.0.6.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 9e21fc0..589930f 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LXC_VERSION = 2.0.3
+LXC_VERSION = 2.0.6
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
-# we're patching configure.ac
-LXC_AUTORECONF = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
