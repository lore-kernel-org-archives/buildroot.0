From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Oct 2016 18:29:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libfribidi: remove optional
	dependency to libglib
Message-ID: <20161030172918.29960-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes vdr compile error:
http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/

Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
package we remove the optional libglib dependency because it does not
contain "any thing substantial" as pointed out in an pull request sent
upstream: https://github.com/behdad/fribidi/pull/14

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: instead of patching libfribidi we force glib=no (Thomas)
v2: added patch 0003 to fix fribidi.pc

 package/libfribidi/libfribidi.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 4e82a5e..86e722a 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -14,11 +14,9 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 # Run autoreconf to regenerate ltmain.sh.
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBFRIBIDI_DEPENDENCIES += libglib2
-else
-LIBFRIBIDI_CONF_OPTS += --with-glib=no
-endif
+# libglib2 dependency causes a build failure, and this optional
+# dependency is going to be removed usptream, see
+# https://github.com/behdad/fribidi/pull/14
+LIBFRIBIDI_CONF_OPTS = --with-glib=no
 
 $(eval $(autotools-package))
-- 
2.10.1
