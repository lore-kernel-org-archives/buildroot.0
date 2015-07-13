From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 14 Jul 2015 00:15:36 +0200
Subject: [Buildroot] [PATCH v2 1/2] purge-locales: skip /usr/man and
	/usr/share/man
Message-ID: <1436825737-6264-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These directories are going to be removed anyway, so no point purging
their locales.

This also allows us to simplify the loop a bit.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2: remove the grep -v man as well, which allows us to use $dir/*
    instead of the funky ls construct.
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4b6360b..a26f87d 100644
--- a/Makefile
+++ b/Makefile
@@ -544,11 +544,11 @@ define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
 
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
 	do \
-		for lang in $$(cd $$dir; ls .|grep -v man); \
+		for langdir in $$dir/*; \
 		do \
-			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
+			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
 		done; \
 	done
 endef
-- 
2.1.4
