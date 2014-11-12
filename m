From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:53 +0100
Subject: [Buildroot] [PATCH 07/24 v3] pkg-autotools: only apply libtool
	patch at the right moment
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <7b4b4c365245d98e15d65ee8ee8f73c683fc15fe.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we apply the libtool patch at post-patch time, always. If we
need to autoreconf, we also apply it after autoreconf is done.

Obviously, in that second casse, we do not need to apply it at
post-patch time. This has no impact on the result, as autoreconf will
overwrite the just patched files, and they will be patched yet again.
But it is not nice to the user that will see a double "Patching libtool"
message.

So, we apply the libtool patch at post-patch time only if we are not
autoreconfiguring the package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-autotools.mk | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 924816b..ad2d1a6 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -235,12 +235,8 @@ endif
 
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
-# default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
-endif
-
 ifeq ($$($(2)_AUTORECONF),YES)
+
 # This has to come before autoreconf
 ifeq ($$($(2)_GETTEXTIZE),YES)
 $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
@@ -252,6 +248,14 @@ ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+
+else # ! AUTORECONF = YES
+
+# default values are not evaluated yet, so don't rely on this defaulting to YES
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
+$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
+endif
+
 endif
 
 #
-- 
1.9.1
