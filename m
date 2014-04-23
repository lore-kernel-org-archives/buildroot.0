From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:19:27 +0200
Subject: [Buildroot] [git commit] wget: fix host-gettext build dependency
	race
Message-ID: <20140423221935.7D5FA9C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86c32446c6d1e2a3d36a61edfa4ae31368009c35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the gettextization of wget works by chance:
  - host-gettext is added as a dependency to wget;
  - gettextize is run as a post-patch hook.

But the dependencies are only guaranteed to be built and installed
for the configure step, not the patch step. Because post-patch hooks
are part of the patch step, we have no guarantee that the dependency
to host-gettext is done by the time we gettextize wget.

This happens to work by chance, since wget sorts alphabetically after
gettext, so we indeed have host-gettext built and installed by the
time we need to gettextize wget.

This is prone to fail in the parallel build case, since we can no
longer rely on alphabetical order in that case.

Instead, run gettextize in PRE_CONFIGURE_HOOKS to avoid the race.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[baruch: make the fix independent from the gettextize infra]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index f3a5274..a8d9f61 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -19,7 +19,7 @@ WGET_DEPENDENCIES += host-gettext
 define WGET_GETTEXTIZE
 	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
 endef
-WGET_POST_PATCH_HOOKS += WGET_GETTEXTIZE
+WGET_PRE_CONFIGURE_HOOKS += WGET_GETTEXTIZE
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
