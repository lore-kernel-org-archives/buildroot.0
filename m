From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 14:58:26 +0200
Subject: [Buildroot] [git commit] gettext: remove useless ABOUT-NLS file
Message-ID: <20140701125921.C3E369CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d49b9f3d8befcd74aeb8c2c948320ff78c063ffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, gettext installs on the target a documentation file
named ABOUT-NLS in /usr/share/gettext, that is clearly not needed for
the proper execution of programs. This commit adds a post-install hook
in gettext.mk to get rid of this file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 948ab9d..cc461f7 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -50,6 +50,13 @@ endef
 GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
 HOST_GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
 
+define GETTEXT_REMOVE_UNNEEDED
+	$(RM) -rf $(TARGET_DIR)/usr/share/gettext/ABOUT-NLS
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext
+endef
+
+GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_UNNEEDED
+
 # Force build with NLS support, otherwise libintl is not built
 # This is needed because some packages (eg. libglib2) requires
 # locales, but do not properly depend on BR2_ENABLE_LOCALE, and
