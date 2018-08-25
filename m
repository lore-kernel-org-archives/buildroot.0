From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 25 Aug 2018 16:10:27 +0300
Subject: [Buildroot] [PATCH v2 1/1] git: Fix libintl linking if there is no
 full gettext support
Message-ID: <20180825131027.6048-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim.kochan@petcube.com>

Git could not resolve libntl_xxx symbols if toolchain does no provide
full gettext support but the gettext package is selected.

Steps to reproduce:
    1) make menuconfig
    2) Toolchain -> Select WCHAR
    3) System -> select NLS
    4) Target packages -> Development -> select git

In case of ulibc/musl toolchain there is no full getttext support, but
they still provides libintl stub which makes git think there is full
gettext support hence -lintl is not passed to the linker.

Added workaround which checks if NLS is enabled, if yes then -lintl will
be added to EXTLIBS variable within config.mak file.

Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
---
v2:
    - added steps to reproduce in commit message
    - use $(TARGET_NLS_LIBS) to specify -lintl

 package/git/git.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index ac7b8f2e8c..fb5889dec7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -63,8 +63,16 @@ endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 GIT_MAKE_OPTS += NO_GETTEXT=1
+else
+GIT_EXTLIBS += $(TARGET_NLS_LIBS)
 endif
 
+define GIT_GEN_EXT_CONFIG_CMDS
+	echo "EXTLIBS = $(GIT_EXTLIBS)" >> $(@D)/config.mak
+endef
+
+GIT_POST_CONFIGURE_HOOKS += GIT_GEN_EXT_CONFIG_CMDS
+
 GIT_INSTALL_TARGET_OPTS = $(GIT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 
 # assume yes for these tests, configure will bail out otherwise
-- 
2.14.1
