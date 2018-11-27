From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2018 23:33:13 +0100
Subject: [Buildroot] [git commit] package/libid3tag: add .pc file and
 install to staging hook
Message-ID: <20181202071559.F3478803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6b68e6b6a81985ff5bcb9836d0d02c1fbed3e47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MPD project dropped autotools support in version 0.21.x in favor of
meson. While adapting the package to the meson build infrastructure, the
recognition of libid3tag failed, as only pkg-config is used to detect
the library. Note, that the version bump of the mpd package to 0.21.x is
not submitted, yet.

To help finding the build system to detect libid3tag with pkg-config
properly, add a .pc file and install it to staging.

This is exactly what Debian and Fedora do as well.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libid3tag/id3tag.pc    | 11 +++++++++++
 package/libid3tag/libid3tag.mk |  7 +++++++
 2 files changed, 18 insertions(+)

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
