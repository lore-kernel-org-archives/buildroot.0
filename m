From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 21:18:50 +0100
Subject: [Buildroot] [git commit] ncurses: speed up the build by not
	installing manpages
Message-ID: <20130304203712.D96559A4C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d8acdc937c67f2309017fbe783f8fb75f681c65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation of manpages during the installation step of
host-ncurses and ncurses is horribly slow, and useless. This commit
therefore disables the installation of those manpages, using the
--without-manpages configuration option.

It brings the combined host-ncurses+ncurses configure/build/install
time from 3 minutes and 18 seconds to 1 minute and 36 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
