From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  8 Nov 2017 22:05:33 -0200
Subject: [Buildroot] [PATCH] util-linux: explicitly use /usr/{bin, sbin, lib},
 with merged usr
In-Reply-To: <20171108234258.15035-1-casantos@datacom.ind.br>
References: <20171108234258.15035-1-casantos@datacom.ind.br>
Message-ID: <20171109000533.26181-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prevent the installation from attempting to move shared libraries from
${usrlib_execdir} to ${libdir} if both paths are the same, which leads
to error messages like this:

  mv: '$(TARGET_DIR)/usr/lib/libfoo.so.1' and '$(TARGET_DIR)/lib/libfoo.so.1' are the same file

That error is not fatal but let's avoid possible future problems.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  Fix commit message to remove spurious "not".
---
 package/util-linux/util-linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 8464288600..31a3fe47ab 100644
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
-- 
2.13.6
