From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  5 Nov 2018 07:29:26 +0100
Subject: [Buildroot] [PATCH] package/libid3tag: add .pc file and install to
 staging hook
Message-ID: <20181105062926.21284-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libid3tag/id3tag.pc    | 11 +++++++++++
 package/libid3tag/libid3tag.mk |  7 +++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/libid3tag/id3tag.pc

diff --git a/package/libid3tag/id3tag.pc b/package/libid3tag/id3tag.pc
new file mode 100644
index 0000000000..845eb3276b
--- /dev/null
+++ b/package/libid3tag/id3tag.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: id3tag
+Description: ID3 tag reading library
+Version: 0.15.1b
+Requires:
+Libs: -L${libdir} -lid3tag
+Cflags: -I${includedir}
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 951ae09c77..24342186cc 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -12,4 +12,11 @@ LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
 LIBID3TAG_LIBTOOL_PATCH = NO
 
+define LIBID3TAG_INSTALL_STAGING_PC
+	$(INSTALL) -D package/libid3tag/id3tag.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/id3tag.pc
+endef
+
+LIBID3TAG_POST_INSTALL_STAGING_HOOKS += LIBID3TAG_INSTALL_STAGING_PC
+
 $(eval $(autotools-package))
-- 
2.19.1
