From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  3 May 2018 13:47:00 +0200
Subject: [Buildroot] [PATCH] dropbear: Do not build static binary
In-Reply-To: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
Message-ID: <20180503114701.9452-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dropbear 2018.76 now uses the --enable-static option to indicate that a static
binary should be built. This will incorrectly pick up the generic buildroot
option intended for building static libraries, causing an unwanted static
binary build with BR2_STATIC_LIBS/BR2_SHARED_STATIC_LIBS.

Fix by appending an --disable-static configure flag, overriding the buildroot
default.
---
 package/dropbear/dropbear.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 6bfc05fb2b..f47f97d036 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -28,9 +28,10 @@ DROPBEAR_MAKE = \
 	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 	PROGRAMS="$(DROPBEAR_PROGRAMS)"
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DROPBEAR_CONF_OPTS += --enable-static
-endif
+# The generic --enable-static flags is only intended for use when building
+# libraries, but dropbear will be built as a static executeable with this
+# flag, so we overide it here
+DROPBEAR_CONF_OPTS += --disable-static
 
 # Ensure that dropbear doesn't use crypt() when it's not available
 define DROPBEAR_SVR_PASSWORD_AUTH
-- 
2.17.0
