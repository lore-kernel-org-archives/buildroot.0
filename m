From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:46:56 +0100
Subject: [Buildroot] [PATCH 01/21 RFC] package/libecore: do not build
	anything at patch time
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <5e4ec100e9c6dda1262d9b84cd5a63f75ebc3864.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying to build anything at patch time will result in a broken
legal-info, as the needed host dependencies are not yet built.

Make that hook a pre-configure hook rather than a post-extract
hook.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libecore/libecore.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
