From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  1 Nov 2017 01:36:27 -0200
Subject: [Buildroot] [PATCH] pkg-autotools: explicitly use /usr/{bin, sbin,
	lib}, with merged usr
Message-ID: <20171101033627.26253-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prevent packages from using /bin, /sbin or /lib when those paths are
symlinks to their /usr counterparts.

This is useful for util-linux, whose installation attempts to move
shared libraries from ${usrlib_execdir} to ${libdir} if both paths are
not the same, leading to error messages like this:

  mv: '$(TARGET_DIR)/usr/lib/libfoo.so.1' and '$(TARGET_DIR)/lib/libfoo.so.1' are the same file

Fortunalely that error is not fatal but other packages may do similar
things with bad results, so let's avoid possible problems.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/pkg-autotools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de99356f..32e76b54c2 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -189,6 +189,7 @@ define $(2)_CONFIGURE_CMDS
 		--build=$$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
+		$$(if $$(BR2_ROOTFS_MERGED_USR),--bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib,) \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix="" \
-- 
2.13.6
