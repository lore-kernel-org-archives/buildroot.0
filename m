From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:40:14 +0200
Subject: [Buildroot] [git commit] harfbuzz: add host variant
Message-ID: <20150419124107.6E81981915@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a14f3d2e2ed76472a4f1ec32bf64220ee001bb5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required for host-pango, which in turn is required for host-librsvg and
at last midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/harfbuzz/harfbuzz.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0a69b09..9cfd613 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -11,6 +11,20 @@ HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
+
+# freetype & glib2 support required by host-pango
+HOST_HARFBUZZ_DEPENDENCIES = \
+	host-freetype \
+	host-libglib2
+HOST_HARFBUZZ_CONF_OPTS = \
+	--without-corext \
+	--without-uniscribe \
+	--without-graphite2 \
+	--with-cairo=no \
+	--with-icu=no \
+	--with-freetype=yes \
+	--with-glib=yes
+
 # beta libtool version
 HARFBUZZ_AUTORECONF = YES
 
@@ -48,3 +62,4 @@ HARFBUZZ_CONF_OPTS += --with-icu=no
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
