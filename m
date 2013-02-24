From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 18:27:50 +0100
Subject: [Buildroot] [PATCH 1/2] ncurses: speed up the build by not
	installing manpages
Message-ID: <1361726871-18016-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation of manpages during the installation step of
host-ncurses and ncurses is horribly slow, and useless. This commit
therefore disables the installation of those manpages, using the
--without-manpages configuration option.

It brings the combined host-ncurses+ncurses configure/build/install
time from 3 minutes and 18 seconds to 1 minute and 36 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index aa2b6bc..e77a0f1 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,7 +27,8 @@ NCURSES_CONF_OPT = \
 	--enable-echo \
 	--enable-const \
 	--enable-overwrite \
-	--enable-pc-files
+	--enable-pc-files \
+	$(if $(BR2_HAVE_DOCUMENTATION),,--without-manpages)
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
@@ -115,7 +116,8 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPT = \
-	--without-shared --without-gpm
+	--without-shared --without-gpm \
+	--without-manpages
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
