From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 11:13:39 +0100
Subject: [Buildroot] [git commit] pixman: unbreak on nios codesourcery
	2014.05
Message-ID: <20141031101500.35A96B2066@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b4833e6f6f70244a44c25f0bd833f18038a35ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/ec3/ec31257a66583ca69bbad5ecfedb4c25b85268ee/
http://autobuild.buildroot.net/results/b24/b241ef7b7283efd92028d98355f268d93a12ffdd/
http://autobuild.buildroot.net/results/36c/36cc9386747854b632ec4e22bed8f32a0e2eec32/
http://autobuild.buildroot.net/results/b8a/b8a2de871eec249d03744fcd4ea6b5d3d1b01bd5/

And many others.

The toolchain gets confused about TLS access through the GOT (PIC), so
disable TLS support in pixman.

The error from the assembler is:
movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
{standard input}:172: Error: bad expression

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 87a2c66..a244ea8 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -22,5 +22,12 @@ ifneq ($(BR2_iwmmxt),y)
 PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
 endif
 
+# toolchain gets confused about TLS access through GOT (PIC), so disable TLS
+# movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
+# {standard input}:172: Error: bad expression
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
+PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
