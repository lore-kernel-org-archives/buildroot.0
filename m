From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:30 +0100
Subject: [Buildroot] [PATCH 07/10] Makefile: Handle systemd catalogs in
 PURGE_LOCALES
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-8-nolange79@gmail.com>
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
index a52f1c75fd..e6890e13c4 100644
--- a/Makefile
+++ b/Makefile
@@ -701,6 +701,14 @@ define PURGE_LOCALES
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
2.24.1
