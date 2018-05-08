From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:09:25 +0200
Subject: [Buildroot] [git commit] dropbear: Do not build static binary
Message-ID: <20180508130913.19ABF8B8EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9922a4d2fc79e1d17f85e6f74c1e6ece9c91092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropbear 2018.76 now uses the --enable-static option to indicate that a static
binary should be built. This will incorrectly pick up the generic buildroot
option intended for building static libraries, causing an unwanted static
binary build with BR2_SHARED_STATIC_LIBS.

Fix by appending an --disable-static configure flag, overriding the buildroot
default.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/dropbear.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 1da1a559a3..fc41a84c1f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -27,8 +27,11 @@ DROPBEAR_MAKE = \
 	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 	PROGRAMS="$(DROPBEAR_PROGRAMS)"
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DROPBEAR_CONF_OPTS += --enable-static
+# With BR2_SHARED_STATIC_LIBS=y the generic infrastructure adds a
+# --enable-static flags causing dropbear to be built as a static
+# binary. Adding a --disable-static reverts this
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+DROPBEAR_CONF_OPTS += --disable-static
 endif
 
 # Ensure that dropbear doesn't use crypt() when it's not available
