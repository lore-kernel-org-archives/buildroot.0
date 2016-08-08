From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:47:12 +0200
Subject: [Buildroot] [git commit] gnuplot: fix m68k uclinux compile
Message-ID: <20160808214823.A14477FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe7235aaa6b81bdb779dd4f19a07d20afdfea8da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

Fixes:
  http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuplot/gnuplot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 4408ece..a9e1204 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -25,6 +25,11 @@ GNUPLOT_CONF_OPTS = \
 	--without-latex \
 	--without-cairo
 
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+GNUPLOT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
+endif
+
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 GNUPLOT_CONF_OPTS += --with-gd
 GNUPLOT_DEPENDENCIES += gd
