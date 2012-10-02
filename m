From: Valentine Barshak <gvaxon@gmail.com>
Date: Tue,  2 Oct 2012 23:03:50 +0400
Subject: [Buildroot] [PATCH 1/2] Makefile: Fix target-purgelocales
In-Reply-To: <1349204631-21077-1-git-send-email-gvaxon@gmail.com>
References: <1349204631-21077-1-git-send-email-gvaxon@gmail.com>
Message-ID: <1349204631-21077-2-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The /usr/share/X11/locale/locale.dir file is needed by libX11.
Removing it breaks locale support in X11. However, make removes
not only directories but also all files, which are not listed
in the BR2_ENABLE_LOCALE_WHITELIST.

This re-creates locale.dir database file where needed.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 0128839..009debe 100644
--- a/Makefile
+++ b/Makefile
@@ -478,11 +478,13 @@ target-purgelocales:
 
 	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man)); \
 	do \
-		for lang in $$(cd $$dir; ls .|grep -v man); \
+		(cd $$dir && rm -f locale.dir && \
+		for lang in $$(ls .|grep -v "man\|locale\.dir"); \
 		do \
-			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
-		done; \
-	done
+			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$lang; \
+			[ ! -f $$lang/XLC_LOCALE ] || echo "$$lang/XLC_LOCALE: $$lang" >> locale.dir; \
+		done) \
+	done;
 endif
 
 ifneq ($(GENERATE_LOCALE),)
-- 
1.7.11.4
