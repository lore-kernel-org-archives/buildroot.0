From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:36:01 +0200
Subject: [Buildroot] [git commit] package/ltris: fix linking with intl
Message-ID: <20140821133606.964799D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d572607579553ac1c400cb4cf6e284cefbd0124
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltris doen't build with (e)glibc toolchain since commit 454a41016f2f074b69e2c677f4749c213c653e86
when gettext package is selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is set.

Fixes:
http://autobuild.buildroot.net/results/821/82128cb9f5cd6ae2595a8302462f1b5719dad9f7/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltris/ltris.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 75b6ad0..c9fe5c7 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -21,7 +21,7 @@ else
 LTRIS_CONF_OPT += --disable-audio
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LTRIS_DEPENDENCIES += gettext
 LTRIS_CONF_ENV += LIBS=-lintl
 endif
