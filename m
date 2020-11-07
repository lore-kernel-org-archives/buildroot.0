From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Nov 2020 15:27:55 +0100
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: break
 circular dependency
Message-ID: <20201117203825.A84F77FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3c86f5c9e466ed5135e824d6dcebcfd7f5ac1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build fails because of the following circular dependency:

cryptsetup -> util-linux -> udev -> systemd -> cryptsetup

which results in the following build failure:

checking uuid/uuid.h usability... no
checking uuid/uuid.h presence... no
checking for uuid/uuid.h... no
configure: error: You need the uuid library.

To break it, apply the same ugly workaround that was applied for
libglib2 until a better solution is found:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice at gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/a1a020a3e1c2383a030fcd73eae7c0fe5f82b022

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cryptsetup/cryptsetup.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index a2abf776cc..60097595b4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,8 +8,10 @@ CRYPTSETUP_VERSION_MAJOR = 2.3
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c libargon2 \
+CRYPTSETUP_DEPENDENCIES = \
+	lvm2 popt util-linux host-pkgconf json-c libargon2 \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
