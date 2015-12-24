From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 13:22:21 +0100
Subject: [Buildroot] [git commit] libvips: fix compile error for sparc64
Message-ID: <20151224122318.66EAE826FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4486e8c947e728b663eb2ac1c0286077129445f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following build error:
http://autobuild.buildroot.net/results/1515f070c0fd410c681fc8306700244c34eb1635/

[Thomas:
 - simplify logic.
 - add reference to submitted gcc bug.]

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvips/libvips.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index d6dddc8..5f80b2d 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -12,6 +12,16 @@ LIBVIPS_LICENSE = LGPLv2.1+
 LIBVIPS_LICENSE_FILES = COPYING
 # We're patching gtk-doc.make, so need to autoreconf
 LIBVIPS_AUTORECONF = YES
+
+# Sparc64 compile fails, for all optimization levels except -O0. To
+# fix the problem, use -O0 with no optimization instead. Bug reported
+# upstream at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69038.
+ifeq ($(BR2_sparc64),y)
+LIBVIPS_CXXFLAGS += -O0
+endif
+
+LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)"
+
 LIBVIPS_CONF_OPTS = \
 	--disable-introspection \
 	--without-dmalloc \
