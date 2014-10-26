From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 00:54:01 +0100
Subject: [Buildroot] [git commit] gd: fix pthread related static linking
	issue for utilities
Message-ID: <20141026235413.63E1DB5857@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6debc2e078d06e0ac177a882d9f4268f5b37077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gd forgets to link utilities with -pthread even though it uses pthreads,
causing linking errors with static linking.

Fixes http://autobuild.buildroot.net/results/156/1564b8de7785c1a756bead1a4160a2b6e2a2243e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 906c333..927dfb2 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -14,6 +14,12 @@ GD_LICENSE_FILES = COPYING
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPTS = --without-x --disable-rpath
 
+# gd forgets to link utilities with -pthread even though it uses
+# pthreads, causing linking errors with static linking
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+GD_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
 GD_CONF_OPTS += --with-fontconfig
