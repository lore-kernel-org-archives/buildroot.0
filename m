From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:53:19 +0100
Subject: [Buildroot] [git commit] vlc: avoid that AUTORECONF renames
	configure's arguments
Message-ID: <20140301135330.DCF3C9B2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39a00df346624125c09bda9c49e989b7904b3b2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

VLC defines two autoconf functions which are also defined by our own
pkg.m4 from pkgconf. Unfortunately, they are defined in a different way:
VLC adds --enable- options, but pkg.m4 adds --with- options. To make
sure we use VLC's definition, rename these two functions from
PKG_WITH_MODULES to VLC_PKG_WITH_MODULES and from PKG_HAVE_WITH_MODULES
to VLC_PKG_HAVE_WITH_MODULES.

Note that the second function (PKG_HAVE_WITH_MODULES) is in fact
defined in exactly the same way by VLC and pkgconf, but this might no
longer be the case when either pkgconf or VLC is updated. Therefore,
that one is renamed as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e25f2d2..e6d0ded 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -12,6 +12,17 @@ VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
+# VLC defines two autoconf functions which are also defined by our own pkg.m4
+# from pkgconf. Unfortunately, they are defined in a different way: VLC adds
+# --enable- options, but pkg.m4 adds --with- options. To make sure we use
+# VLC's definition, rename these two functions.
+define VLC_OVERRIDE_PKG_M4
+	$(SED) 's/PKG_WITH_MODULES/VLC_PKG_WITH_MODULES/g' \
+		-e 's/PKG_HAVE_WITH_MODULES/VLC_PKG_HAVE_WITH_MODULES/g' \
+		$(@D)/configure.ac $(@D)/m4/with_pkg.m4
+endef
+VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
+
 VLC_CONF_OPT += \
 	--disable-a52 \
 	--disable-shout \
