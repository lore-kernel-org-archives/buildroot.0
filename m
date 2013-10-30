From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:20:12 +0200
Subject: [Buildroot] [PATCH 5/5] util-linux: Fix cross-compile for
	host-util-linux when ncurses not selected
In-Reply-To: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1383164412-20657-5-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If util-linux is being cross-compiled with Codesourcery, and ncurses is not
selected, compilation of host-util-linux stops at the configuration script,
unable to locate host-ncurses.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/util-linux/util-linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4db1e52..f6ad93f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -86,6 +86,12 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-su --disable-switch_root --disable-unshare \
 	--disable-uuidd --disable-wall
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+HOST_UTIL_LINUX_DEPENDENCIES += ncurses
+else
+HOST_UTIL_LINUX_CONF_OPT += --without-ncurses
+endif
+
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
-- 
1.8.3.2
