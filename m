From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:46:06 +0100
Subject: [Buildroot] [git commit branch/next] util-linux: explicitly use
 /usr/{bin, sbin, lib}, with merged usr
Message-ID: <20171122214737.9BEE88145F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=099c2ceaa8adfcdcbbaf039000e1fe26a33a6165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Prevent the installation from attempting to move shared libraries from
${usrlib_execdir} to ${libdir} if both paths are the same, which leads
to error messages like this:

  mv: '$(TARGET_DIR)/usr/lib/libfoo.so.1' and '$(TARGET_DIR)/lib/libfoo.so.1' are the same file

That error is not fatal but let's avoid possible future problems.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 8464288..31a3fe4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,6 +41,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 UTIL_LINUX_DEPENDENCIES += busybox
 endif
 
+# Prevent the installation from attempting to move shared libraries from
+# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
+# the same when merged usr is in use.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
