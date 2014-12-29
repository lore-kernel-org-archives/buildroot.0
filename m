From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 15:38:15 +0100
Subject: [Buildroot] [PATCH 2/2] libnftnl: add patch to fix libnftnl.pc for
	static linking
In-Reply-To: <1419863895-19319-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419863895-19319-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419863895-19319-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to libnftnl to add the Libs.private field in
the pkg-config file, which is needed for proper static linking of
applications using libnftnl.

Fixes the build of programs such as nftables on Blackfin:

  http://autobuild.buildroot.org/results/061/06166344cc8e162d3f901c70ee31ce07e481053e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...002-Add-Libs.private-field-to-libnftnl.pc.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/libnftnl/0002-Add-Libs.private-field-to-libnftnl.pc.patch

diff --git a/package/libnftnl/0002-Add-Libs.private-field-to-libnftnl.pc.patch b/package/libnftnl/0002-Add-Libs.private-field-to-libnftnl.pc.patch
new file mode 100644
index 0000000..ce3e950
--- /dev/null
+++ b/package/libnftnl/0002-Add-Libs.private-field-to-libnftnl.pc.patch
@@ -0,0 +1,49 @@
+From d89fca062ba966332b573673fdd5c4cf01c3e2f5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 15:32:08 +0100
+Subject: [PATCH 2/2] Add Libs.private field to libnftnl.pc
+
+Static linking userspace programs such as nftables against libnftnl
+currently doesn't work out of the box, because libnftnl is linked
+against libmnl, but this isn't expressed in libnftnl pkg-config
+file:
+
+  CCLD   nft
+[...]/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libnftnl.a(table.o): In function `_nft_table_nlmsg_parse':
+table.c:(.text+0x480): undefined reference to `_mnl_attr_parse'
+table.c:(.text+0x492): undefined reference to `_mnl_attr_get_str'
+table.c:(.text+0x4a8): undefined reference to `_mnl_attr_get_u32'
+table.c:(.text+0x4ca): undefined reference to `_mnl_attr_get_u32'
+[...]
+
+The Libs.private field is specifically designed for such usage:
+
+From pkg-config documentation:
+
+  Libs.private:
+
+     This line should list any private libraries in use.  Private
+     libraries are libraries which are not exposed through your
+     library, but are needed in the case of static linking.
+
+Therefore, this patch adds a reference to libmnl in the Libs.private
+field of libnftnl pkg-config file.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libnftnl.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libnftnl.pc.in b/libnftnl.pc.in
+index fd5cc6a..7fef921 100644
+--- a/libnftnl.pc.in
++++ b/libnftnl.pc.in
+@@ -12,4 +12,5 @@ Version: @VERSION@
+ Requires:
+ Conflicts:
+ Libs: -L${libdir} -lnftnl
++Libs.private: @LIBMNL_LIBS@
+ Cflags: -I${includedir}
+-- 
+2.1.0
+
-- 
2.1.0
