From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:44:32 +0100
Subject: [Buildroot] [git commit] package/libnftnl: bump version to 1.1.4
Message-ID: <20191104213734.2D4B68E753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdfcdc128284577e14c6a703bb52525db6e2d62f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch after upstream committed an updated version from Baruch:
https://git.netfilter.org/libnftnl/commit/?id=78709f7b55aa8934f42aa40548dcdf65e6bfeb2c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-Add-Libs.private-field-to-libnftnl.pc.patch | 49 ----------------------
 package/libnftnl/libnftnl.hash                     |  2 +-
 package/libnftnl/libnftnl.mk                       |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch b/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch
deleted file mode 100644
index ce3e9500ee..0000000000
--- a/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d89fca062ba966332b573673fdd5c4cf01c3e2f5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 15:32:08 +0100
-Subject: [PATCH 2/2] Add Libs.private field to libnftnl.pc
-
-Static linking userspace programs such as nftables against libnftnl
-currently doesn't work out of the box, because libnftnl is linked
-against libmnl, but this isn't expressed in libnftnl pkg-config
-file:
-
-  CCLD   nft
-[...]/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libnftnl.a(table.o): In function `_nft_table_nlmsg_parse':
-table.c:(.text+0x480): undefined reference to `_mnl_attr_parse'
-table.c:(.text+0x492): undefined reference to `_mnl_attr_get_str'
-table.c:(.text+0x4a8): undefined reference to `_mnl_attr_get_u32'
-table.c:(.text+0x4ca): undefined reference to `_mnl_attr_get_u32'
-[...]
-
-The Libs.private field is specifically designed for such usage:
-
-From pkg-config documentation:
-
-  Libs.private:
-
-     This line should list any private libraries in use.  Private
-     libraries are libraries which are not exposed through your
-     library, but are needed in the case of static linking.
-
-Therefore, this patch adds a reference to libmnl in the Libs.private
-field of libnftnl pkg-config file.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libnftnl.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libnftnl.pc.in b/libnftnl.pc.in
-index fd5cc6a..7fef921 100644
---- a/libnftnl.pc.in
-+++ b/libnftnl.pc.in
-@@ -12,4 +12,5 @@ Version: @VERSION@
- Requires:
- Conflicts:
- Libs: -L${libdir} -lnftnl
-+Libs.private: @LIBMNL_LIBS@
- Cflags: -I${includedir}
--- 
-2.1.0
-
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 64bd07a235..315e2e1522 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256	22dd97d3b06ae8c67499506e2bfd6803ce116479076ec3700e7a4c7cd9fcba0f  	libnftnl-1.1.3.tar.bz2
+sha256	c8c7988347adf261efac5bba59f8e5f995ffb65f247a88cc144e69620573ed20	libnftnl-1.1.4.tar.bz2
 sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index a3fba488c4..a4e9b4b940 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.3
+LIBNFTNL_VERSION = 1.1.4
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
