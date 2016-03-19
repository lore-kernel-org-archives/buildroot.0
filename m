From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 19 Mar 2016 23:14:56 +0300
Subject: [Buildroot] [PATCH] binutils: disable plugins for static links
Message-ID: <1458418497-12603-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Plugins want to use dlopen even when configured with --disable-shared.
Add --disable-plugins when STATIC_LIBS is selected.
Fixes:
  http://autobuild.buildroot.net/results/a59e5858d777dcee3d8f7fb6e82ee4735b520155/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/binutils/binutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 66ee247..ca39f0b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -51,6 +51,10 @@ BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+ifeq ($(BR2_STATIC_LIBS),y)
+BINUTILS_CONF_OPTS += --disable-plugins
+endif
+
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
 BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
-- 
2.1.4
