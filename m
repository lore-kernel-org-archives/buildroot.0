From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 19 May 2015 21:29:00 +0300
Subject: [Buildroot] [PATCH 2/2] jasper: Disable debugging when building for
	xtensa
In-Reply-To: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
References: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1432060140-13611-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xtensa gcc is not able to generate correct code when compiling with -O0
enabled by --enable-debug. Instead of disabling package build it with
--disable-debug.

Fixes:
  http://autobuild.buildroot.net/results/5d17055027055ffd33fcd28b208130afb26343c9/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/jasper/jasper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b2da07d..db86ae8 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -14,4 +14,10 @@ JASPER_LICENSE_FILES = LICENSE
 # needed to fix rpath issue (http://autobuild.buildroot.net/results/307/307cac65287420252a5bb64715d9a1edd90e72fa/)
 JASPER_AUTORECONF = YES
 
+# Xtensa gcc is unable to generate correct code with -O0 enabled by
+# --enable-debug. Allow package build but disable debug.
+ifeq ($(BR2_xtensa)$(BR2_ENABLE_DEBUG),yy)
+JASPER_CONF_OPTS += --disable-debug
+endif
+
 $(eval $(autotools-package))
-- 
1.8.1.4
