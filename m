From: Peter Rosin <peda@lysator.liu.se>
Date: Tue, 17 Nov 2015 18:02:19 +0100
Subject: [Buildroot] [PATCH] pkg-generic: Strip all but leading comments
	from C files used as license.
Message-ID: <1447779739-4661-1-git-send-email-peda@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Rosin <peda@axentia.se>

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 package/pkg-utils.mk |   28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..1497eb2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -145,8 +145,30 @@ endef
 
 define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 	$(call legal-license-header,$(1),$(2) file,$(4)) && \
-	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
-	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
 	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
-	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
+	case $(3) in \
+	*.c|*.h) \
+	  sed -e '\
+x;\
+/^$$/{\
+  x;\
+  /^[ \t]*$$/b;\
+  /^[ \t]*\/\//b;\
+  /^[ \t]*\/\*.*\*\//b;\
+  /^[ \t]*\/\*/h;\
+  //b;\
+  s/.*//;\
+  q\
+};\
+x;\
+/\*\//{\
+  x;\
+  s/.*//;\
+  x\
+}' < $(3) > $(LICENSE_FILES_DIR_$(4))/$(1)/$(2) \
+	;; \
+	*) cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2);; \
+	esac && \
+	cat $(LICENSE_FILES_DIR_$(4))/$(1)/$(2) >>$(LEGAL_LICENSES_TXT_$(4)) && \
+	echo >>$(LEGAL_LICENSES_TXT_$(4))
 endef
-- 
1.7.10.4
