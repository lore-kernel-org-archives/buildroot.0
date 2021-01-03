From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun,  3 Jan 2021 14:03:15 +0000
Subject: [Buildroot] [PATCH 1/1] Makefile: Parallelize glibc locale
 generation
Message-ID: <20210103140315.1301698-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallelizes locale generation based on `BR2_JLEVEL` setting.

Uses `-P` (`--max-procs`) GNU xargs extension
together with the standard `-n` xargs option (`--max-args`).

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 Makefile | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 4d334adcd6..574b55e203 100644
--- a/Makefile
+++ b/Makefile
@@ -673,20 +673,19 @@ PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
-		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
-		if test -z "$${charmap}" ; then \
-			charmap="UTF-8" ; \
-		fi ; \
-		echo "Generating locale $${inputfile}.$${charmap}" ; \
-		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+	$(Q)echo "Generating locales: $(GLIBC_GENERATE_LOCALES)"
+	for locale in $(GLIBC_GENERATE_LOCALES) ; do \
+		echo -i ; \
+		echo $${locale%%.*} ; \
+		echo -f ; \
+		echo $${locale} | cut -f2 -d'.' || echo UTF-8 ; \
+		echo $${locale} ; \
+	done | \
+	I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+	xargs -P $(PARALLEL_JOBS) -n 5 \
 		$(HOST_DIR)/bin/localedef \
 			--prefix=$(TARGET_DIR) \
-			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
-			-i $${inputfile} -f $${charmap} \
-			$${locale} ; \
-	done
+			--$(call LOWERCASE,$(call qstrip,$(BR2_ENDIAN)))-endian
 endef
 TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
 endif
-- 
2.27.0
