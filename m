From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 10:49:42 +0100
Subject: [Buildroot] [git commit] gpm: run autogen.sh as PRE_CONFIGURE step
Message-ID: <20140204095054.D2B729C757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15fed7179a8c7d9d82ee96751600d3b6e8b391af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the GPM_RUN_AUTOGEN to be a PRE_CONFIGURE step because this step
depends on the dependancies being built. If it is a POST_PATCH step
the dependencies won't be built and the GPM_RUN_AUTOGEN step will fail
(if the host doesn't have autotools).

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpm/gpm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 296966a..58fab00 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -28,7 +28,7 @@ GPM_CONF_OPT = --without-curses
 define GPM_RUN_AUTOGEN
 	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
 endef
-GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
+GPM_PRE_CONFIGURE_HOOKS += GPM_RUN_AUTOGEN
 
 GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
 
