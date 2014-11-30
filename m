From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 00:12:46 +0100
Subject: [Buildroot] [git commit] package/util-linux: libuuid needs -lintl
Message-ID: <20141130232035.65F637FF9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a535a0eada223a0eb8b2421ebe4a4246bb714b74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gettext is needed (with locales), libuuid needs to be linked
against -lintl.

In dynamic link, this is solved via the DT_NEEDED ELF tag, but for
static links, it does not get pulled in automatically.

Fix that by adding a Libs.private section to uuid.pc, but only if
it needed.

First part at fixing:
    http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6ecd16d..dc10193 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -128,6 +128,14 @@ endif
 
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
+define UTIL_LINUX_TWEAK_UUID_PC
+	$(SED) '/Libs\.private: .*/d' $(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
+	printf "Libs.private: -lintl\n" >>$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
+endef
+UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_TWEAK_UUID_PC
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
