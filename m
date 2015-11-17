From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:02:37 +0100
Subject: [Buildroot] [git commit] package/libecore: do not build anything at
	patch time
Message-ID: <20151117160747.0FC5281EA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c0999b8cdce71c93a40dc239b609a4ac6118138
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Trying to build anything at patch time will result in a broken
legal-info, as the needed host dependencies are not yet built.

Make that hook a pre-configure hook rather than a post-extract
hook.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/libecore/libecore.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index b5016dc..28a8bae 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -97,7 +97,7 @@ define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/util makekeys.o makekeys
 endef
 
-LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+LIBECORE_PRE_CONFIGURE_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
 else
 LIBECORE_CONF_OPTS += --disable-ecore-x-xcb
 endif
