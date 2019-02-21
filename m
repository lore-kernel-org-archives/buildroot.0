From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:19:33 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libid3tag: add
 .pc file and install to staging hook
Message-ID: <20190221161919.0C6D88C9A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e695a22a9ce408af400801ce0a20e9ec1f29c83a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
(cherry picked from commit d6b68e6b6a81985ff5bcb9836d0d02c1fbed3e47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 402e154ae1..3ec145725f 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -15,4 +15,11 @@ LIBID3TAG_DEPENDENCIES = zlib
 # is able to properly behave in the face of a missing C++ compiler.
 LIBID3TAG_AUTORECONF = YES
 
+define LIBID3TAG_INSTALL_STAGING_PC
+	$(INSTALL) -D package/libid3tag/id3tag.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/id3tag.pc
+endef
+
+LIBID3TAG_POST_INSTALL_STAGING_HOOKS += LIBID3TAG_INSTALL_STAGING_PC
+
 $(eval $(autotools-package))
