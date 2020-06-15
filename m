From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:46 +0200
Subject: [Buildroot] [PATCH v2 06/14] Makefile: Handle systemd catalogs in
 PURGE_LOCALES
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-7-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

journald supports localization with Catalog files with
a naming scheme <name>.<lang>.catalog.
We want to purge them like other locales.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index ce1c08a6f6..dd4cc4c4c2 100644
--- a/Makefile
+++ b/Makefile
@@ -709,6 +709,14 @@ define PURGE_LOCALES
 			fi \
 		done; \
 	done
+	for cfile in $(wildcard $(TARGET_DIR)/usr/lib/systemd/catalog/*.catalog); \
+	do \
+		basename=$${cfile##*/}; \
+		basename=$${basename%.catalog}; \
+		langext=$${basename#*.}; \
+		[ "$$langext" != "$${basename}" ] || continue; \
+		grep -qx "$${langext}" $(LOCALE_WHITELIST) || rm -f "$$cfile"; \
+	done
 	if [ -d $(TARGET_DIR)/usr/share/X11/locale ]; \
 	then \
 		for lang in $(LOCALE_NOPURGE); \
-- 
2.27.0
