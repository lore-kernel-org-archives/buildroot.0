From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:40 -0000
Subject: [Buildroot] [git commit branch/next] purge-locales: fix handling of
	X11 locale.dir
Message-ID: <20150808105631.D90AA7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b791571c030f0be004bdb180013ca6650dfe6b09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The /usr/share/X11/locale/locale.dir file is needed by libX11.
Removing it breaks locale support in X11. However, make removes
not only directories but also all files, which are not listed
in the BR2_ENABLE_LOCALE_WHITELIST.

This re-creates locale.dir database file where needed.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: use a separate loop, and add some explanatory comments]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index f764ae5..8eb8c6d 100644
--- a/Makefile
+++ b/Makefile
@@ -540,6 +540,11 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
+# This piece of junk does the following:
+# First collect the whitelist in a file.
+# Then go over all the locale dirs and for each subdir, check if it exists
+# in the whitelist file. If it doesn't, kill it.
+# Finally, specifically for X11, regenerate locale.dir from the whitelist.
 define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
@@ -551,6 +556,16 @@ define PURGE_LOCALES
 			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
 		done; \
 	done
+	if [ -d $(TARGET_DIR)/usr/share/X11/locale ]; \
+	then \
+		for lang in $(LOCALE_NOPURGE); \
+		do \
+			if [ -f $(TARGET_DIR)/usr/share/X11/locale/$$lang/XLC_LOCALE ]; \
+			then \
+				echo "$$lang/XLC_LOCALE: $$lang"; \
+			fi \
+		done > $(TARGET_DIR)/usr/share/X11/locale/locale.dir; \
+	fi
 endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
