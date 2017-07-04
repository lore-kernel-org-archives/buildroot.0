From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:08 +0200
Subject: [Buildroot] [PATCH 088/100] iputils: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-89-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
