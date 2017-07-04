From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:14 +0200
Subject: [Buildroot] [git commit] iputils: remove libintl static linking
	handling
Message-ID: <20170704233520.239DF7FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0af286a6da20fa36eda5cd0a7a06c76f17ea6c1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/iputils.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 57dc660..b20cd12 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -36,13 +36,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 IPUTILS_MAKE_OPTS += USE_GCRYPT=yes
 IPUTILS_DEPENDENCIES += libgcrypt
-# When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides libintl
-# (BR2_NEEDS_GETTEXT=y), libgpg-error will link with libintl, and libgpg-error
-# is pulled in by libgcrypt. Since iputils doesn't use libtool, we have to link
-# with libintl explicitly for static linking.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yyy)
-IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
-endif
 else
 IPUTILS_MAKE_OPTS += USE_GCRYPT=no
 endif
