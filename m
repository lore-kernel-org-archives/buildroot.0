From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:55:54 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] util-linux: disable
 useless programs in the host package
Message-ID: <20180131123645.7FC2188170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59967b493387f6986e2362b5a856a186411194f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Disable all programs that depend on ncurses, as well as utilities that
are useless on the host: agetty, chfn-chsh, chmem, login, lslogins,
mesg, more, newgrp, nologin, nsenter, pg, rfkill, schedutils, setpriv,
setterm, su, sulogin, tunelp, ul, unshare, uuidd, vipw, wall, wdctl,
write, zramctl.

Also add dependency on host-zlib if host cramfs utils are to be built.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 67170b76af912bebcdab3aa88a4ac9e5b35d6273)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 05e1398937..d7358fe581 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -167,8 +167,37 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
 HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
-# disable more command because of ncurses dependency
-HOST_UTIL_LINUX_CONF_OPTS += --disable-more
+# disable commands that have ncurses dependency, as well as
+# other ones that are useless on the host
+HOST_UTIL_LINUX_CONF_OPTS += \
+	--disable-agetty \
+	--disable-chfn-chsh \
+	--disable-chmem \
+	--disable-login \
+	--disable-lslogins \
+	--disable-mesg \
+	--disable-more \
+	--disable-newgrp \
+	--disable-nologin \
+	--disable-nsenter \
+	--disable-pg \
+	--disable-rfkill \
+	--disable-schedutils \
+	--disable-setpriv \
+	--disable-setterm \
+	--disable-su \
+	--disable-sulogin \
+	--disable-tunelp \
+	--disable-ul \
+	--disable-unshare \
+	--disable-uuidd \
+	--disable-vipw \
+	--disable-wall \
+	--disable-wdctl \
+	--disable-write \
+	--disable-zramctl
+# Used by cramfs utils
+HOST_UTIL_LINUX_DEPENDENCIES += host-zlib
 else
 HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
