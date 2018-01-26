From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Jan 2018 22:16:52 -0200
Subject: [Buildroot] [PATCH] util-linux: disable useless programs in the
 host package
In-Reply-To: <87lgglln4t.fsf@dell.be.48ers.dk>
References: <87lgglln4t.fsf@dell.be.48ers.dk>
Message-ID: <20180126001652.7235-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable all programs that depend on ncurses, as well as utilities that
are useless on the host: agetty, chfn-chsh, chmem, login, lslogins,
mesg, more, newgrp, nologin, nsenter, pg, rfkill, schedutils, setpriv,
setterm, su, sulogin, tunelp, ul, unshare, uuidd, vipw, wall, wdctl,
write, zramctl.

Also add dependency on host-zlib if host cramfs utils are to be built.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/util-linux.mk | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e368464e8d..72a6d18178 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -172,8 +172,37 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 
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
-- 
2.14.3
