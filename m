From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 23:52:23 +0200
Subject: [Buildroot] [PATCH 5/5] gettext: remove useless ABOUT-NLS file
In-Reply-To: <1403992343-29665-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1403992343-29665-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1403992343-29665-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, gettext installs on the target a documentation file
named ABOUT-NLS in /usr/share/gettext, that is clearly not needed for
the proper execution of programs. This commit adds a post-install hook
in gettext.mk to get rid of this file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
2.0.0
