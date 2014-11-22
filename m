From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:37:52 +0100
Subject: [Buildroot] [git commit branch/next] pkg-autotools: only apply
	libtool patch at the right moment
Message-ID: <20141122195743.5AC417FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=452c8da326a29bfbeacce7a360aa0fba3abc3108
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we apply the libtool patch at post-patch time, always. If we
need to autoreconf, we also apply it after autoreconf is done.

Obviously, in that second case, we do not need to apply it at
post-patch time. This has no impact on the result, as autoreconf will
overwrite the just patched files, and they will be patched yet again.
But it is not nice to the user that will see a double "Patching libtool"
message.

So, we apply the libtool patch at post-patch time only if we are not
autoreconfiguring the package.

[Thomas: fix minor typo s/casse/case/ in the commit log.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

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
